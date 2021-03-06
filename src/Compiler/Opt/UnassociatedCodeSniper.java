package Compiler.Opt;

import Compiler.CFG.Block;
import Compiler.CFG.FunctionIR;
import Compiler.CFG.Instruction.*;
import Compiler.CFG.Operand.AddressOperand;
import Compiler.CFG.Operand.Operand;
import Compiler.CFG.Operand.VirtualRegister;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

public class UnassociatedCodeSniper {
    private static Set<Instruction> usefulInstruction;
    private static Map<Instruction, Set<VirtualRegister>> criticalOperandIn, criticalOperandOut;

    public static void uselessCodeCatch(FunctionIR functionIR) {
        if (functionIR.getBeMemorized()) return;
        usefulInstruction = new HashSet<>();
        criticalOperandIn = new HashMap<>();
        criticalOperandOut = new HashMap<>();
        usefulInstruction.add(functionIR.getEnterBlock());
        usefulInstruction.add(functionIR.getExitBlock());
        for (Block block : functionIR.getBlockList()) {
            criticalOperandIn.put(block.getLabelInstruction(), new HashSet<>());
            criticalOperandOut.put(block.getLabelInstruction(), new HashSet<>());
            for (Instruction instruction : block.getInstructionList()) {
                criticalOperandIn.put(instruction, new HashSet<>());
                criticalOperandOut.put(instruction, new HashSet<>());
                boolean useful = false;
                if (instruction instanceof FunctionCallInstruction
                        || instruction instanceof MallocInstruction
                        || instruction instanceof ReturnInstruction) {
                    useful = true;
                }
                if (instruction instanceof MoveInstruction) {
                    Operand target = ((MoveInstruction) instruction).getTarget();
                    if (isCritical(target)) {
                        useful = true;
                    }
                }
                if (instruction instanceof BinaryInstruction) {
                    Operand target = ((BinaryInstruction) instruction).getTarget();
                    if (isCritical(target)) {
                        useful = true;
                    }
                }
                if (instruction instanceof UnaryInstruction) {
                    Operand target = ((UnaryInstruction) instruction).getTarget();
                    if (isCritical(target)) {
                        useful = true;
                    }
                }
                if (useful) {
                    usefulInstruction.add(instruction);
                    issue(instruction);
                }
            }
        }
        boolean hasImprove = true;
        while (hasImprove) {
            hasImprove = false;
            for (Block block : functionIR.getBlockList()) {
                String labelName = block.getLabelInstruction().getName();
                for (int i = block.getInstructionList().size() - 1; i >= 0; i--) {
                    Instruction thisInstruction = block.getInstructionList().get(i);
                    Instruction nextInstruction = (i + 1 < block.getInstructionList().size()) ? block.getInstructionList().get(i + 1) : null;
                    hasImprove |= resolve(thisInstruction, nextInstruction, labelName.equals("loop_condition"));
                }
                Instruction nextInstruction = block.getInstructionList().isEmpty() ? null : block.getInstructionList().get(9);
                hasImprove |= resolve(block.getLabelInstruction(), nextInstruction, labelName.equals("loop_condition"));
            }
        }
        for (Block block : functionIR.getBlockList()) {
            for (int i = 0; i < block.getInstructionList().size(); i++) {
                Instruction instruction = block.getInstructionList().get(i);
                if (!usefulInstruction.contains(instruction) && !(instruction instanceof JumpInstruction)) {
                    block.getInstructionList().remove(i--);
                }
            }
        }

    }

    private static boolean isCritical(Operand operand) {
        return operand instanceof AddressOperand || operand instanceof VirtualRegister && ((VirtualRegister) operand).getSystemRegister() != null;
    }

    private static void issue(Instruction instruction) {
        for (VirtualRegister virtualRegister : instruction.getUseSet()) {
            criticalOperandIn.get(instruction).add(virtualRegister);
        }
    }

    private static boolean resolve(Instruction thisInstruction, Instruction nextInstruction, boolean isLoopCondition) {
        int inScale = criticalOperandIn.get(thisInstruction).size();
        int outScale = criticalOperandOut.get(nextInstruction).size();
        int usefulScale = usefulInstruction.size();
        if (thisInstruction instanceof JumpInstruction) {
            Instruction target = ((JumpInstruction) thisInstruction).getTarget();
            criticalOperandOut.get(thisInstruction).addAll(criticalOperandIn.get(target));
        }
        if (!(thisInstruction instanceof JumpInstruction)) {
            criticalOperandOut.get(thisInstruction).addAll(criticalOperandIn.get(nextInstruction));
        }
        if (thisInstruction instanceof LabelInstruction) {
            criticalOperandOut.get(thisInstruction).addAll(criticalOperandOut.get(thisInstruction));
            for (Instruction instruction : ((LabelInstruction) thisInstruction).getBlock().getInstructionList()) {
                if (usefulInstruction.contains(instruction)) {
                    usefulInstruction.add(thisInstruction);
                }
            }
        }
        if (thisInstruction instanceof JumpInstruction || thisInstruction instanceof CJumpInstruction) {

        }
        return false;
    }
}
