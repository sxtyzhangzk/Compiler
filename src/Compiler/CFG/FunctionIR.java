package Compiler.CFG;

import Compiler.AST.Symbol.Symbol;
import Compiler.AST.Type.FunctionType;
import Compiler.AST.Type.IntType;
import Compiler.CFG.Instruction.*;
import Compiler.CFG.Operand.AddressOperand;
import Compiler.CFG.Operand.ImmediateOperand;
import Compiler.CFG.Operand.VirtualRegister;
import Compiler.Trans.Translator;
import Compiler.Utility.Utility;

import java.util.*;

public class FunctionIR {
    private FunctionType functionType;
    private List<VirtualRegister> parameterList;
    private VirtualRegister reservedInteger;
    private List<Instruction> checkInstructionList;
    private List<Instruction> returnInstructionList;
    private VirtualRegister backupVirtualRegister;
    private static final int memorySize = 200;

    private List<Block> blockList;
    private LabelInstruction enterBlock, exitBlock;
    private RegisterManager registerManager;
    private Boolean beMemorized;
    private List<String> calleeRegisterList;
    private Map<VirtualRegister, String> registerStringMap;
    private Map<VirtualRegister, Integer> registerIntegerMap;

    public static final List<String> callerSavedRegisterList = new ArrayList<String>() {{
        add("rsi"); add("rdi"); add("r8"); add("r9"); add("r10"); add("r11");
    }};

    public static final List<String> calleeSavedRegisterList = new ArrayList<String>() {{
        add("rbx"); add("r12"); add("r13"); add("r14"); add("r15");
    }};

    private void construct() {
        beMemorized = false;
        enterBlock = new LabelInstruction("block_enter");
        exitBlock = new LabelInstruction("block_exit");
        functionType.setEnterLabel(enterBlock);
        functionType.setExitLabel(exitBlock);

        List<Instruction> instructionList = new ArrayList<>();

        instructionList.add(enterBlock);
        for (int i = 0; i < parameterList.size(); i++) {
            if (i < 6) {
                VirtualRegister t = RegisterManager.getTemporaryRegister();
                t.setSystemRegister(RegisterManager.parameterRegister.get(i));
                instructionList.add(new MoveInstruction(parameterList.get(i), t));
            } else {
                registerIntegerMap.put(parameterList.get(i), 4 - i);
            }
        }
        functionType.getBlockStatement().generateInstruction(instructionList);
        if (instructionList.isEmpty()) {
            instructionList.add(new JumpInstruction(exitBlock));
        }
        if (!(instructionList.get(instructionList.size() - 1) instanceof JumpInstruction)) {
            instructionList.add(new JumpInstruction(exitBlock));
        }
        instructionList.add(exitBlock);

        convertToMemorized(instructionList);

        for (int i = 0, j; i < instructionList.size(); i = j) {
            LabelInstruction labelInstruction = (LabelInstruction) instructionList.get(i);
            Block block = new Block(this, labelInstruction, labelInstruction.getName(), blockList.size());
            for (j = i + 1; j < instructionList.size(); j++) {
                if (instructionList.get(j) instanceof LabelInstruction) {
                    break;
                }
                block.addInstruction(instructionList.get(j));
            }
            labelInstruction.setBlock(block);
            blockList.add(block);
        }
    }

    private void convertToMemorized(List<Instruction> instructionList) {
        beMemorized = canBeResolved(instructionList);
        if (!beMemorized) return;
        functionType.setIntact(false);
        backupVirtualRegister = RegisterManager.getTemporaryRegister();
        backupVirtualRegister.setSystemRegister("@" + functionType.getOriginName() + "_backup");
        backupVirtualRegister.setGlobal(true);
        reservedInteger = RegisterManager.getTemporaryRegister();
        reservedInteger.setSystemRegister("@" + functionType.getOriginName() + "_int");
        reservedInteger.setGlobal(true);
        checkInstructionList = new ArrayList<>();
        VirtualRegister n = parameterList.get(0);
        checkInstructionList.add(new MoveInstruction(new AddressOperand(backupVirtualRegister), n));
        VirtualRegister offset = RegisterManager.getTemporaryRegister();
        checkInstructionList.add(new MoveInstruction(offset, n));
        checkInstructionList.add(new BinaryInstruction(BinaryInstruction.BinaryOp.SHL, offset, new ImmediateOperand(3)));
        VirtualRegister pos = RegisterManager.getTemporaryRegister();
        checkInstructionList.add(new MoveInstruction(pos, reservedInteger));
        checkInstructionList.add(new BinaryInstruction(BinaryInstruction.BinaryOp.ADD, pos, offset));
        LabelInstruction successLabel = new LabelInstruction(functionType.getOriginName() + "_success");
        LabelInstruction escapeLabel = new LabelInstruction(functionType.getOriginName() + "_escape");
        LabelInstruction returnLabel = new LabelInstruction(functionType.getOriginName() + "_return");
        LabelInstruction startLabel = new LabelInstruction(functionType.getOriginName() + "_start");
        checkInstructionList.add(new CompareInstruction(n, new ImmediateOperand(0)));
        checkInstructionList.add(new CJumpInstruction(ProgramIR.ConditionOp.GREQ, successLabel));
        checkInstructionList.add(new JumpInstruction(startLabel));
        checkInstructionList.add(successLabel);
        checkInstructionList.add(new CompareInstruction(n, new ImmediateOperand(memorySize)));
        checkInstructionList.add(new CJumpInstruction(ProgramIR.ConditionOp.LE, escapeLabel));
        checkInstructionList.add(new JumpInstruction(startLabel));
        checkInstructionList.add(escapeLabel);
        checkInstructionList.add(new CompareInstruction(new AddressOperand(pos), new ImmediateOperand(0)));
        checkInstructionList.add(new CJumpInstruction(ProgramIR.ConditionOp.EQ, startLabel));
        checkInstructionList.add(new JumpInstruction(returnLabel));
        checkInstructionList.add(returnLabel);
        checkInstructionList.add(new ReturnInstruction(new AddressOperand(pos)));
        checkInstructionList.add(new JumpInstruction(exitBlock));
        checkInstructionList.add(startLabel);
        for (int i = 0; i < checkInstructionList.size(); i++) {
            instructionList.add(i + 1, checkInstructionList.get(i));
        }
        returnInstructionList = new ArrayList<>();
        LabelInstruction positiveLabel = new LabelInstruction(functionType.getOriginName() + "_positive");
        LabelInstruction updateLabel = new LabelInstruction(functionType.getOriginName() + "_update");
        LabelInstruction failLabel = new LabelInstruction(functionType.getOriginName() + "_fail");
        returnInstructionList.add(new CompareInstruction(new AddressOperand(backupVirtualRegister), new ImmediateOperand(0)));
        returnInstructionList.add(new CJumpInstruction(ProgramIR.ConditionOp.GREQ, positiveLabel));
        returnInstructionList.add(new JumpInstruction(failLabel));
        returnInstructionList.add(positiveLabel);
        returnInstructionList.add(new CompareInstruction(new AddressOperand(backupVirtualRegister), new ImmediateOperand(memorySize)));
        returnInstructionList.add(new CJumpInstruction(ProgramIR.ConditionOp.LE, updateLabel));
        returnInstructionList.add(new JumpInstruction(failLabel));
        returnInstructionList.add(updateLabel);
        VirtualRegister t = RegisterManager.getTemporaryRegister();
        t.setSystemRegister("rax");
        returnInstructionList.add(new MoveInstruction(new AddressOperand(pos), t));
        returnInstructionList.add(failLabel);
        int m = instructionList.size();
        for (int i = 0; i < returnInstructionList.size(); i++) {
            instructionList.add(m++, returnInstructionList.get(i));
        }
    }

    /*private void constructCheckList() {
        VirtualRegister virtualRegister = parameterList.get(0);
        checkInstructionList = new ArrayList<>();
        List<LabelInstruction> checkLabelInstructionList = new ArrayList<>();
        List<LabelInstruction> successLabelInstructionList = new ArrayList<>();
        List<LabelInstruction> returnLabelInstructionList = new ArrayList<>();
        for (int i = 0; i < memorySize; i++) {
            checkLabelInstructionList.add(new LabelInstruction(functionType.getIRName() + "_check_" + i));
            successLabelInstructionList.add(new LabelInstruction(functionType.getIRName() + "_success_" + i));
            returnLabelInstructionList.add(new LabelInstruction(functionType.getIRName() + "_escape_" + i));
        }
        checkLabelInstructionList.add(new LabelInstruction(functionType.getIRName() + "_check_" + memorySize));
        checkInstructionList.add(new MoveInstruction(new AddressOperand(backupVirtualRegister), virtualRegister));
        checkInstructionList.add(new JumpInstruction(checkLabelInstructionList.get(0)));
        for (int i = 0; i < memorySize; i++) {
            checkInstructionList.add(checkLabelInstructionList.get(i));
            checkInstructionList.add(new CompareInstruction(virtualRegister, new ImmediateOperand(i)));
            checkInstructionList.add(new CJumpInstruction(ProgramIR.ConditionOp.EQ, successLabelInstructionList.get(i)));
            checkInstructionList.add(new JumpInstruction(checkLabelInstructionList.get(i + 1)));
            checkInstructionList.add(successLabelInstructionList.get(i));
            checkInstructionList.add(new CompareInstruction(new AddressOperand(reservedBooleanList.get(i)), new ImmediateOperand(1)));
            checkInstructionList.add(new CJumpInstruction(ProgramIR.ConditionOp.EQ, returnLabelInstructionList.get(i)));
            checkInstructionList.add(new JumpInstruction(checkLabelInstructionList.get(i + 1)));
            checkInstructionList.add(returnLabelInstructionList.get(i));
            checkInstructionList.add(new ReturnInstruction(new AddressOperand(reservedIntegerList.get(i))));
            checkInstructionList.add(new JumpInstruction(exitBlock));
        }
        checkInstructionList.add(checkLabelInstructionList.get(memorySize));
    }

    private void constructReturnList() {
        returnInstructionList = new ArrayList<>();
        List<LabelInstruction> checkLabelInstructionList = new ArrayList<>();
        List<LabelInstruction> successLabelInstructionList = new ArrayList<>();
        for (int i = 0; i < memorySize; i++) {
            checkLabelInstructionList.add(new LabelInstruction(functionType.getIRName() + "_return_check_" + i));
            successLabelInstructionList.add(new LabelInstruction(functionType.getIRName() + "_return_success_" + i));
        }
        checkLabelInstructionList.add(new LabelInstruction(functionType.getIRName() + "_return_check" + memorySize));
        for (int i = 0; i < memorySize; i++) {
            returnInstructionList.add(checkLabelInstructionList.get(i));
            returnInstructionList.add(new CompareInstruction(new AddressOperand(backupVirtualRegister), new ImmediateOperand(i)));
            returnInstructionList.add(new CJumpInstruction(ProgramIR.ConditionOp.EQ, successLabelInstructionList.get(i)));
            returnInstructionList.add(new JumpInstruction(checkLabelInstructionList.get(i + 1)));
            returnInstructionList.add(successLabelInstructionList.get(i));
            returnInstructionList.add(new MoveInstruction(new AddressOperand(reservedBooleanList.get(i)), new ImmediateOperand(1)));
            VirtualRegister t = RegisterManager.getTemporaryRegister();
            t.setSystemRegister("rax");
            returnInstructionList.add(new MoveInstruction(new AddressOperand(reservedIntegerList.get(i)), t));
            returnInstructionList.add(new JumpInstruction(exitBlock));
        }
        returnInstructionList.add(checkLabelInstructionList.get(memorySize));
        returnInstructionList.add(new JumpInstruction(exitBlock));
    }
    */
    private boolean canBeResolved(List<Instruction> instructionList) {
        if (parameterList.size() != 1) return false;
        if (functionType.getParameterList().size() != 1) return false;
        if (functionType.getParameterList().get(0).getType() != IntType.getInstance()) return false;
        if (functionType.getReturnType() != IntType.getInstance()) return false;
        for (Instruction instruction : instructionList) {
            if (instruction.hasGlobalImpact()) return false;
        }
        return true;
    }

    public FunctionIR(FunctionType functionType) {
        this.functionType = functionType;
        this.parameterList = new ArrayList<>();
        this.blockList = new ArrayList<>();
        this.registerManager = new RegisterManager();
        this.registerIntegerMap = new HashMap<>();
        this.registerStringMap = new HashMap<>();
        for (Symbol symbol : functionType.getParameterList()) {
            parameterList.add((VirtualRegister) symbol.getOperand());
        }
        construct();
    }

    public String getAssembly() {
        StringBuilder str = new StringBuilder();
        str.append(functionType.getIRName() + ":\n");
        blockList.forEach(block -> block.getInstructionList().forEach(Instruction::init));
        init();

        Translator.setOffset(1);

        str.append(Translator.getInstruction("push", "rbp"));
        str.append(Translator.getInstruction("mov", "rbp", "rsp"));

        if (functionType.getIRName().equals("main")) {
            str.append(Translator.getInstruction("call", "__global_init"));
        }

        if (registerManager.getRegisterInMemory() > 0) {
            str.append(Translator.getInstruction("sub", "rsp", String.valueOf(registerManager.getRegisterInMemory() << 3)));
        }
        Translator.addOffset(registerManager.getRegisterInMemory());

        str.append(Translator.getCalleeSaved(calleeRegisterList));
        for (int i = 0; i < blockList.size(); i++) {
            Block block = blockList.get(i);
            str.append(block.toString() + ":\n");
            block.getInstructionList().forEach(instruction -> str.append(instruction.getAssembly()));
        }
        str.append(Translator.getCalleeRestored(calleeRegisterList));

        if (registerManager.getRegisterInMemory() > 0) {
            str.append(Translator.getInstruction("add", "rsp", String.valueOf(registerManager.getRegisterInMemory() << 3)));
        }

        str.append(Translator.getInstruction("pop", "rbp"));
        str.append(Translator.getInstruction("ret"));
        return str.toString();
    }

    public String getDefinedDataSection() {
        if (!beMemorized) return "";
        StringBuilder str = new StringBuilder();
        str.append(backupVirtualRegister.getSystemRegister() + ":\n");
        str.append("\t dq 0\n");
        str.append(reservedInteger.getSystemRegister() + ":\n\tdq");
        for (int i = 0; i < 200; i++) {
            str.append("\t0,");
        }
        str.append("0\n");
        return str.toString();
    }

    private void init() {
        calleeRegisterList = new ArrayList<>();
        registerManager.getUsedRegister().forEach(
                s -> {
                    if (calleeSavedRegisterList.contains(s)) {
                        calleeRegisterList.add(s);
                    }
                }
        );
    }

    public FunctionType getFunctionType() {
        return functionType;
    }

    public List<VirtualRegister> getParameterList() {
        return parameterList;
    }

    public List<Block> getBlockList() {
        return blockList;
    }

    public LabelInstruction getEnterBlock() {
        return enterBlock;
    }

    public LabelInstruction getExitBlock() {
        return exitBlock;
    }

    public RegisterManager getRegisterManager() {
        return registerManager;
    }

    public Map<VirtualRegister, String> getRegisterStringMap() {
        return registerStringMap;
    }

    public Map<VirtualRegister, Integer> getRegisterIntegerMap() {
        return registerIntegerMap;
    }

    public void setRegisterStringMap(Map<VirtualRegister, String> registerStringMap) {
        this.registerStringMap = registerStringMap;
    }

    public void setRegisterIntegerMap(Map<VirtualRegister, Integer> registerIntegerMap) {
        this.registerIntegerMap = registerIntegerMap;
    }

    public boolean isLeaf() {
        for (Block block : blockList) {
            for (Instruction instruction : block.getInstructionList()) {
                if (instruction instanceof FunctionCallInstruction) {
                    return false;
                }
            }
        }
        return true;
    }

    public String toString(int indents) {
        StringBuilder str = new StringBuilder();
        str.append(Utility.getIndent(indents) + functionType.getIRName() + " ");
        parameterList.forEach(virtualRegister -> str.append(virtualRegister.toString() + " "));
        str.append("{\n");
        blockList.forEach(block -> str.append(block.toString(indents + 1)));
        str.append("}\n");
        return str.toString();
    }

    public void initialize(VirtualRegister virtualRegister) {
        if (!registerIntegerMap.containsKey(virtualRegister) && !registerStringMap.containsKey(virtualRegister)) {
            registerManager.addRegisterInMemory();
            registerIntegerMap.put(virtualRegister, registerManager.getRegisterInMemory());
        }
        if (registerStringMap.containsKey(virtualRegister)) {
            registerManager.getUsedRegister().add(registerStringMap.get(virtualRegister));
        }
    }

    public boolean onlyContainsNaiveFunctionCall() {
        for (Block block : blockList) {
            for (Instruction instruction : block.getInstructionList()) {
                if (instruction instanceof FunctionCallInstruction) {
                    FunctionType functionType = ((FunctionCallInstruction) instruction).getFunctionType();
                    if (functionType == this.functionType || functionType.isBuiltin()) continue;
                    if (functionType.getOriginName() == null) continue;
                    if (!functionType.getFunctionIR().isLeaf()) return false;
                }
            }
        }
        return true;
    }
}
