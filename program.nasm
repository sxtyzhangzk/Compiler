global __global_init
global main
global print_Int
global println_Int
global print
global println
global getInt
global getString
global toString
global __array_size
global __string_substring
global __string_length
global __string_parseInt
global __string_ord
global __string_connection
global __string_LE
global __string_LEEQ
global __string_GR
global __string_GREQ
global __string_EQ
global __string_NEQ
extern printf, malloc, strcpy, scanf, strlen, sscanf, sprintf, memcpy, strcmp, puts
SECTION .text
__global_init:
    push                  rbp
     mov                  rbp,                  rsp
__global_init_0_block_enter:
__global_init_1_block_exit:
     pop                  rbp
     ret
main:
    push                  rbp
     mov                  rbp,                  rsp
    call        __global_init
     sub                  rsp,                   24
    push                  r12
    push                  r14
    push                  r13
    push                  rbx
main_0_block_enter:
     mov                  r14,                    0
     mov                  rdi,              1000000
main_1_loop_condition:
     cmp                  r14,                  rdi
     mov                  rsi,                    0
    setl                  sil
     cmp                  rsi,                    1
      je     main_2_loop_body
     jmp    main_10_loop_exit
main_2_loop_body:
     mov                  rsi,                  r14
     add                  rsi,                    1
     mov       qword [@A + 0],                  rsi
     mov                  rsi,                  r14
     add                  rsi,                    1
     mov       qword [@B + 0],                  rsi
     mov                  rsi,                  r14
     add                  rsi,                    1
     mov       qword [@C + 0],                  rsi
main_3_loop_condition:
     cmp       qword [@C + 0],            536870912
     mov                  rsi,                    0
    setl                  sil
     cmp                  rsi,                    1
     jne main_5_logical_false
main_4_logical_true:
     mov                  rsi,            536870912
     neg                  rsi
     cmp       qword [@C + 0],                  rsi
     mov                  rsi,                    0
    setg                  sil
     jmp  main_6_logical_exit
main_5_logical_false:
     mov                  rsi,                    0
main_6_logical_exit:
     cmp                  rsi,                    1
      je     main_7_loop_body
     jmp     main_8_loop_exit
main_7_loop_body:
     mov                  rsi,       qword [@C + 0]
     sub                  rsi,       qword [@A + 0]
     add                  rsi,       qword [@B + 0]
     mov                   r8,       qword [@A + 0]
     add                   r8,       qword [@B + 0]
     mov                  r10,                  rsi
     sub                  r10,                   r8
     mov                  rsi,       qword [@C + 0]
     sub                  rsi,       qword [@A + 0]
     add                  rsi,       qword [@B + 0]
     mov                   r8,       qword [@A + 0]
     add                   r8,       qword [@B + 0]
     mov                   r9,                  rsi
     sub                   r9,                   r8
     mov                  rsi,                  r10
     add                  rsi,                   r9
     mov                   r8,       qword [@C + 0]
     sub                   r8,       qword [@A + 0]
     mov                   r9,                   r8
     add                   r9,       qword [@B + 0]
     mov                   r8,       qword [@A + 0]
     add                   r8,       qword [@B + 0]
     sub                   r9,                   r8
     mov                   r8,       qword [@C + 0]
     sub                   r8,       qword [@A + 0]
     mov                  r10,                   r8
     add                  r10,       qword [@B + 0]
     mov                   r8,                   r9
     add                   r8,                  r10
     mov                   r9,                  rsi
     add                   r9,                   r8
     mov                   r8,       qword [@A + 0]
     add                   r8,       qword [@B + 0]
     mov                  rsi,       qword [@C + 0]
     sub                  rsi,       qword [@A + 0]
     add                  rsi,       qword [@B + 0]
     add                   r8,                  rsi
     mov                  rsi,       qword [@A + 0]
     add                  rsi,       qword [@B + 0]
     sub                   r8,                  rsi
     mov                  rsi,       qword [@C + 0]
     sub                  rsi,       qword [@A + 0]
     add                  rsi,       qword [@B + 0]
     mov                  r10,       qword [@A + 0]
     add                  r10,       qword [@B + 0]
     mov                  r11,                  rsi
     sub                  r11,                  r10
     mov                  rsi,       qword [@C + 0]
     sub                  rsi,       qword [@A + 0]
     mov                  r10,                  rsi
     add                  r10,       qword [@B + 0]
     mov                  rsi,                  r11
     add                  rsi,                  r10
     mov                  r10,                   r8
     add                  r10,                  rsi
     mov                   r8,                   r9
     sub                   r8,                  r10
     mov                  rsi,       qword [@A + 0]
     add                  rsi,       qword [@B + 0]
     mov                   r9,       qword [@C + 0]
     sub                   r9,       qword [@A + 0]
     mov                  r10,                   r9
     add                  r10,       qword [@B + 0]
     mov                   r9,                  rsi
     add                   r9,                  r10
     mov                  r11,       qword [@A + 0]
     add                  r11,       qword [@B + 0]
     mov                  rsi,       qword [@C + 0]
     sub                  rsi,       qword [@A + 0]
     mov                  r10,                  rsi
     add                  r10,       qword [@B + 0]
     mov                  rsi,                  r11
     add                  rsi,                  r10
     mov                  r11,                   r9
     sub                  r11,                  rsi
     mov                   r9,       qword [@A + 0]
     add                   r9,       qword [@B + 0]
     mov                  rsi,       qword [@C + 0]
     sub                  rsi,       qword [@A + 0]
     add                  rsi,       qword [@B + 0]
     mov                  r10,                   r9
     add                  r10,                  rsi
     mov                   r9,       qword [@A + 0]
     add                   r9,       qword [@B + 0]
     mov                  rsi,                  r10
     sub                  rsi,                   r9
     sub                  r11,                  rsi
     mov                  rsi,       qword [@C + 0]
     sub                  rsi,       qword [@A + 0]
     mov                   r9,                  rsi
     add                   r9,       qword [@B + 0]
     mov                  rsi,       qword [@A + 0]
     add                  rsi,       qword [@B + 0]
     sub                   r9,                  rsi
     mov                  rsi,       qword [@C + 0]
     sub                  rsi,       qword [@A + 0]
     add                  rsi,       qword [@B + 0]
     mov                  r10,                   r9
     add                  r10,                  rsi
     mov                  rsi,       qword [@A + 0]
     add                  rsi,       qword [@B + 0]
     mov                   r9,       qword [@C + 0]
     sub                   r9,       qword [@A + 0]
     add                   r9,       qword [@B + 0]
     add                  rsi,                   r9
     mov                   r9,       qword [@A + 0]
     add                   r9,       qword [@B + 0]
     mov                  rbx,                  rsi
     sub                  rbx,                   r9
     mov                  rsi,                  r10
     sub                  rsi,                  rbx
     mov                   r9,                  r11
     add                   r9,                  rsi
     mov                  rbx,                   r8
     sub                  rbx,                   r9
     mov                  rsi,       qword [@C + 0]
     sub                  rsi,       qword [@A + 0]
     mov                   r8,                  rsi
     add                   r8,       qword [@B + 0]
     mov                  rsi,       qword [@A + 0]
     add                  rsi,       qword [@B + 0]
     sub                   r8,                  rsi
     mov                  rsi,       qword [@C + 0]
     sub                  rsi,       qword [@A + 0]
     add                  rsi,       qword [@B + 0]
     mov                   r9,       qword [@A + 0]
     add                   r9,       qword [@B + 0]
     sub                  rsi,                   r9
     mov                   r9,                   r8
     add                   r9,                  rsi
     mov                  rsi,       qword [@C + 0]
     sub                  rsi,       qword [@A + 0]
     add                  rsi,       qword [@B + 0]
     mov                   r8,       qword [@A + 0]
     add                   r8,       qword [@B + 0]
     sub                  rsi,                   r8
     mov                   r8,       qword [@C + 0]
     sub                   r8,       qword [@A + 0]
     add                   r8,       qword [@B + 0]
     add                  rsi,                   r8
     mov                  r11,                   r9
     add                  r11,                  rsi
     mov                  rsi,       qword [@A + 0]
     add                  rsi,       qword [@B + 0]
     mov                   r8,       qword [@C + 0]
     sub                   r8,       qword [@A + 0]
     add                   r8,       qword [@B + 0]
     add                  rsi,                   r8
     mov                   r8,       qword [@A + 0]
     add                   r8,       qword [@B + 0]
     mov                   r9,                  rsi
     sub                   r9,                   r8
     mov                  rsi,       qword [@C + 0]
     sub                  rsi,       qword [@A + 0]
     add                  rsi,       qword [@B + 0]
     mov                  r10,       qword [@A + 0]
     add                  r10,       qword [@B + 0]
     mov                   r8,                  rsi
     sub                   r8,                  r10
     mov                  rsi,       qword [@C + 0]
     sub                  rsi,       qword [@A + 0]
     add                  rsi,       qword [@B + 0]
     add                   r8,                  rsi
     mov                  rsi,                   r9
     add                  rsi,                   r8
     mov                   r9,                  r11
     sub                   r9,                  rsi
     mov                   r8,       qword [@A + 0]
     add                   r8,       qword [@B + 0]
     mov                  rsi,       qword [@C + 0]
     sub                  rsi,       qword [@A + 0]
     add                  rsi,       qword [@B + 0]
     add                   r8,                  rsi
     mov                  rsi,       qword [@A + 0]
     add                  rsi,       qword [@B + 0]
     mov                  r10,                   r8
     sub                  r10,                  rsi
     mov                  rsi,       qword [@C + 0]
     sub                  rsi,       qword [@A + 0]
     add                  rsi,       qword [@B + 0]
     mov                   r8,       qword [@A + 0]
     add                   r8,       qword [@B + 0]
     mov                  r11,                  rsi
     sub                  r11,                   r8
     mov                  rsi,       qword [@C + 0]
     sub                  rsi,       qword [@A + 0]
     mov                   r8,                  rsi
     add                   r8,       qword [@B + 0]
     mov                  rsi,                  r11
     add                  rsi,                   r8
     mov                  r11,                  r10
     add                  r11,                  rsi
     mov                  rsi,       qword [@A + 0]
     add                  rsi,       qword [@B + 0]
     mov                   r8,       qword [@C + 0]
     sub                   r8,       qword [@A + 0]
     mov                  r10,                   r8
     add                  r10,       qword [@B + 0]
     mov                   r8,                  rsi
     add                   r8,                  r10
     mov                  rsi,       qword [@A + 0]
     add                  rsi,       qword [@B + 0]
     mov                  r10,                   r8
     sub                  r10,                  rsi
     mov                  rsi,       qword [@C + 0]
     sub                  rsi,       qword [@A + 0]
     mov                   r8,                  rsi
     add                   r8,       qword [@B + 0]
     mov                  rsi,       qword [@A + 0]
     add                  rsi,       qword [@B + 0]
     sub                   r8,                  rsi
     mov                  rsi,       qword [@C + 0]
     sub                  rsi,       qword [@A + 0]
     add                  rsi,       qword [@B + 0]
     add                   r8,                  rsi
     mov                  rsi,                  r10
     add                  rsi,                   r8
     mov                   r8,                  r11
     sub                   r8,                  rsi
     mov                  rsi,                   r9
     sub                  rsi,                   r8
     add                  rbx,                  rsi
     mov                   r8,       qword [@A + 0]
     add                   r8,       qword [@B + 0]
     mov                  rsi,       qword [@C + 0]
     sub                  rsi,       qword [@A + 0]
     add                  rsi,       qword [@B + 0]
     mov                   r9,                   r8
     add                   r9,                  rsi
     mov                  rsi,       qword [@A + 0]
     add                  rsi,       qword [@B + 0]
     mov                   r8,       qword [@C + 0]
     sub                   r8,       qword [@A + 0]
     add                   r8,       qword [@B + 0]
     add                  rsi,                   r8
     mov                   r8,                   r9
     sub                   r8,                  rsi
     mov                   r9,       qword [@A + 0]
     add                   r9,       qword [@B + 0]
     mov                  rsi,       qword [@C + 0]
     sub                  rsi,       qword [@A + 0]
     add                  rsi,       qword [@B + 0]
     add                   r9,                  rsi
     mov                  rsi,       qword [@A + 0]
     add                  rsi,       qword [@B + 0]
     sub                   r9,                  rsi
     mov                  r10,                   r8
     sub                  r10,                   r9
     mov                  rsi,       qword [@C + 0]
     sub                  rsi,       qword [@A + 0]
     add                  rsi,       qword [@B + 0]
     mov                   r8,       qword [@A + 0]
     add                   r8,       qword [@B + 0]
     mov                   r9,                  rsi
     sub                   r9,                   r8
     mov                  rsi,       qword [@C + 0]
     sub                  rsi,       qword [@A + 0]
     add                  rsi,       qword [@B + 0]
     add                   r9,                  rsi
     mov                  rsi,       qword [@A + 0]
     add                  rsi,       qword [@B + 0]
     mov                   r8,       qword [@C + 0]
     sub                   r8,       qword [@A + 0]
     add                   r8,       qword [@B + 0]
     add                  rsi,                   r8
     mov                   r8,       qword [@A + 0]
     add                   r8,       qword [@B + 0]
     sub                  rsi,                   r8
     mov                   r8,                   r9
     sub                   r8,                  rsi
     add                  r10,                   r8
     mov                  rsi,       qword [@C + 0]
     sub                  rsi,       qword [@A + 0]
     mov                   r8,                  rsi
     add                   r8,       qword [@B + 0]
     mov                  rsi,       qword [@A + 0]
     add                  rsi,       qword [@B + 0]
     sub                   r8,                  rsi
     mov                  rsi,       qword [@C + 0]
     sub                  rsi,       qword [@A + 0]
     add                  rsi,       qword [@B + 0]
     add                   r8,                  rsi
     mov                   r9,       qword [@A + 0]
     add                   r9,       qword [@B + 0]
     mov                  rsi,       qword [@C + 0]
     sub                  rsi,       qword [@A + 0]
     add                  rsi,       qword [@B + 0]
     mov                  r11,                   r9
     add                  r11,                  rsi
     mov                   r9,       qword [@A + 0]
     add                   r9,       qword [@B + 0]
     mov                  rsi,                  r11
     sub                  rsi,                   r9
     mov                  r11,                   r8
     sub                  r11,                  rsi
     mov                  rsi,       qword [@C + 0]
     sub                  rsi,       qword [@A + 0]
     add                  rsi,       qword [@B + 0]
     mov                   r8,       qword [@A + 0]
     add                   r8,       qword [@B + 0]
     sub                  rsi,                   r8
     mov                   r8,       qword [@C + 0]
     sub                   r8,       qword [@A + 0]
     add                   r8,       qword [@B + 0]
     add                  rsi,                   r8
     mov                   r9,       qword [@A + 0]
     add                   r9,       qword [@B + 0]
     mov                   r8,       qword [@C + 0]
     sub                   r8,       qword [@A + 0]
     mov                  r12,                   r8
     add                  r12,       qword [@B + 0]
     mov                   r8,                   r9
     add                   r8,                  r12
     mov                   r9,       qword [@A + 0]
     add                   r9,       qword [@B + 0]
     sub                   r8,                   r9
     sub                  rsi,                   r8
     mov                   r8,                  r11
     add                   r8,                  rsi
     mov                  r12,                  r10
     add                  r12,                   r8
     mov                  rsi,       qword [@C + 0]
     sub                  rsi,       qword [@A + 0]
     add                  rsi,       qword [@B + 0]
     mov                   r8,       qword [@A + 0]
     add                   r8,       qword [@B + 0]
     sub                  rsi,                   r8
     mov                   r8,       qword [@C + 0]
     sub                   r8,       qword [@A + 0]
     add                   r8,       qword [@B + 0]
     mov                   r9,       qword [@A + 0]
     add                   r9,       qword [@B + 0]
     sub                   r8,                   r9
     mov                   r9,                  rsi
     add                   r9,                   r8
     mov                  rsi,       qword [@C + 0]
     sub                  rsi,       qword [@A + 0]
     mov                   r8,                  rsi
     add                   r8,       qword [@B + 0]
     mov                  rsi,       qword [@A + 0]
     add                  rsi,       qword [@B + 0]
     sub                   r8,                  rsi
     mov                  rsi,       qword [@C + 0]
     sub                  rsi,       qword [@A + 0]
     mov                  r10,                  rsi
     add                  r10,       qword [@B + 0]
     mov                  rsi,                   r8
     add                  rsi,                  r10
     add                   r9,                  rsi
     mov                  rsi,       qword [@A + 0]
     add                  rsi,       qword [@B + 0]
     mov                   r8,       qword [@C + 0]
     sub                   r8,       qword [@A + 0]
     add                   r8,       qword [@B + 0]
     mov                  r10,                  rsi
     add                  r10,                   r8
     mov                  rsi,       qword [@A + 0]
     add                  rsi,       qword [@B + 0]
     mov                  r11,                  r10
     sub                  r11,                  rsi
     mov                  rsi,       qword [@C + 0]
     sub                  rsi,       qword [@A + 0]
     add                  rsi,       qword [@B + 0]
     mov                   r8,       qword [@A + 0]
     add                   r8,       qword [@B + 0]
     sub                  rsi,                   r8
     mov                   r8,       qword [@C + 0]
     sub                   r8,       qword [@A + 0]
     mov                  r10,                   r8
     add                  r10,       qword [@B + 0]
     mov                   r8,                  rsi
     add                   r8,                  r10
     mov                  rsi,                  r11
     add                  rsi,                   r8
     mov                   r8,                   r9
     sub                   r8,                  rsi
     mov                  rsi,       qword [@A + 0]
     add                  rsi,       qword [@B + 0]
     mov                   r9,       qword [@C + 0]
     sub                   r9,       qword [@A + 0]
     add                   r9,       qword [@B + 0]
     add                  rsi,                   r9
     mov                   r9,       qword [@A + 0]
     add                   r9,       qword [@B + 0]
     sub                  rsi,                   r9
     mov                   r9,       qword [@C + 0]
     sub                   r9,       qword [@A + 0]
     mov                  r10,                   r9
     add                  r10,       qword [@B + 0]
     mov                   r9,       qword [@A + 0]
     add                   r9,       qword [@B + 0]
     sub                  r10,                   r9
     mov                   r9,       qword [@C + 0]
     sub                   r9,       qword [@A + 0]
     mov                  r11,                   r9
     add                  r11,       qword [@B + 0]
     mov                   r9,                  r10
     add                   r9,                  r11
     mov                  r10,                  rsi
     add                  r10,                   r9
     mov                   r9,       qword [@A + 0]
     add                   r9,       qword [@B + 0]
     mov                  rsi,       qword [@C + 0]
     sub                  rsi,       qword [@A + 0]
     add                  rsi,       qword [@B + 0]
     mov                  r11,                   r9
     add                  r11,                  rsi
     mov                   r9,       qword [@A + 0]
     add                   r9,       qword [@B + 0]
     mov                  rsi,                  r11
     sub                  rsi,                   r9
     mov                   r9,       qword [@C + 0]
     sub                   r9,       qword [@A + 0]
     add                   r9,       qword [@B + 0]
     mov                  r13,       qword [@A + 0]
     add                  r13,       qword [@B + 0]
     mov                  r11,                   r9
     sub                  r11,                  r13
     mov                   r9,       qword [@C + 0]
     sub                   r9,       qword [@A + 0]
     add                   r9,       qword [@B + 0]
     add                  r11,                   r9
     mov                   r9,                  rsi
     add                   r9,                  r11
     mov                  rsi,                  r10
     sub                  rsi,                   r9
     sub                   r8,                  rsi
     mov                  rsi,                  r12
     add                  rsi,                   r8
     mov                   r8,                  rbx
     sub                   r8,                  rsi
     mov       qword [@A + 0],                   r8
     mov                  rsi,       qword [@C + 0]
     sub                  rsi,       qword [@A + 0]
     mov                   r8,                  rsi
     add                   r8,       qword [@B + 0]
     mov                  rsi,       qword [@A + 0]
     add                  rsi,       qword [@B + 0]
     mov                   r9,                   r8
     sub                   r9,                  rsi
     mov                  rsi,       qword [@C + 0]
     sub                  rsi,       qword [@A + 0]
     mov                   r8,                  rsi
     add                   r8,       qword [@B + 0]
     mov                  rsi,       qword [@A + 0]
     add                  rsi,       qword [@B + 0]
     sub                   r8,                  rsi
     mov                  rsi,                   r9
     add                  rsi,                   r8
     mov                   r8,       qword [@C + 0]
     sub                   r8,       qword [@A + 0]
     mov                   r9,                   r8
     add                   r9,       qword [@B + 0]
     mov                   r8,       qword [@A + 0]
     add                   r8,       qword [@B + 0]
     sub                   r9,                   r8
     mov                   r8,       qword [@C + 0]
     sub                   r8,       qword [@A + 0]
     add                   r8,       qword [@B + 0]
     mov                  r10,                   r9
     add                  r10,                   r8
     mov                   r9,                  rsi
     add                   r9,                  r10
     mov                   r8,       qword [@A + 0]
     add                   r8,       qword [@B + 0]
     mov                  rsi,       qword [@C + 0]
     sub                  rsi,       qword [@A + 0]
     add                  rsi,       qword [@B + 0]
     add                   r8,                  rsi
     mov                  rsi,       qword [@A + 0]
     add                  rsi,       qword [@B + 0]
     mov                  r10,                   r8
     sub                  r10,                  rsi
     mov                  rsi,       qword [@C + 0]
     sub                  rsi,       qword [@A + 0]
     add                  rsi,       qword [@B + 0]
     mov                   r8,       qword [@A + 0]
     add                   r8,       qword [@B + 0]
     sub                  rsi,                   r8
     mov                   r8,       qword [@C + 0]
     sub                   r8,       qword [@A + 0]
     add                   r8,       qword [@B + 0]
     add                  rsi,                   r8
     add                  r10,                  rsi
     mov                   r8,                   r9
     sub                   r8,                  r10
     mov                  rsi,       qword [@A + 0]
     add                  rsi,       qword [@B + 0]
     mov                   r9,       qword [@C + 0]
     sub                   r9,       qword [@A + 0]
     add                   r9,       qword [@B + 0]
     add                  rsi,                   r9
     mov                  r11,       qword [@A + 0]
     add                  r11,       qword [@B + 0]
     mov                   r9,       qword [@C + 0]
     sub                   r9,       qword [@A + 0]
     mov                  r10,                   r9
     add                  r10,       qword [@B + 0]
     mov                   r9,                  r11
     add                   r9,                  r10
     sub                  rsi,                   r9
     mov                  r10,       qword [@A + 0]
     add                  r10,       qword [@B + 0]
     mov                   r9,       qword [@C + 0]
     sub                   r9,       qword [@A + 0]
     add                   r9,       qword [@B + 0]
     add                  r10,                   r9
     mov                   r9,       qword [@A + 0]
     add                   r9,       qword [@B + 0]
     sub                  r10,                   r9
     mov                  r11,                  rsi
     sub                  r11,                  r10
     mov                  rsi,       qword [@C + 0]
     sub                  rsi,       qword [@A + 0]
     mov                   r9,                  rsi
     add                   r9,       qword [@B + 0]
     mov                  rsi,       qword [@A + 0]
     add                  rsi,       qword [@B + 0]
     sub                   r9,                  rsi
     mov                  rsi,       qword [@C + 0]
     sub                  rsi,       qword [@A + 0]
     add                  rsi,       qword [@B + 0]
     add                   r9,                  rsi
     mov                  rsi,       qword [@A + 0]
     add                  rsi,       qword [@B + 0]
     mov                  r10,       qword [@C + 0]
     sub                  r10,       qword [@A + 0]
     add                  r10,       qword [@B + 0]
     add                  rsi,                  r10
     mov                  r10,       qword [@A + 0]
     add                  r10,       qword [@B + 0]
     sub                  rsi,                  r10
     sub                   r9,                  rsi
     mov                  rsi,                  r11
     add                  rsi,                   r9
     mov                  r11,                   r8
     sub                  r11,                  rsi
     mov                  rsi,       qword [@C + 0]
     sub                  rsi,       qword [@A + 0]
     add                  rsi,       qword [@B + 0]
     mov                   r8,       qword [@A + 0]
     add                   r8,       qword [@B + 0]
     mov                   r9,                  rsi
     sub                   r9,                   r8
     mov                  rsi,       qword [@C + 0]
     sub                  rsi,       qword [@A + 0]
     add                  rsi,       qword [@B + 0]
     mov                   r8,       qword [@A + 0]
     add                   r8,       qword [@B + 0]
     sub                  rsi,                   r8
     add                   r9,                  rsi
     mov                  rsi,       qword [@C + 0]
     sub                  rsi,       qword [@A + 0]
     mov                   r8,                  rsi
     add                   r8,       qword [@B + 0]
     mov                  rsi,       qword [@A + 0]
     add                  rsi,       qword [@B + 0]
     sub                   r8,                  rsi
     mov                  rsi,       qword [@C + 0]
     sub                  rsi,       qword [@A + 0]
     add                  rsi,       qword [@B + 0]
     add                   r8,                  rsi
     mov                  r10,                   r9
     add                  r10,                   r8
     mov                   r8,       qword [@A + 0]
     add                   r8,       qword [@B + 0]
     mov                  rsi,       qword [@C + 0]
     sub                  rsi,       qword [@A + 0]
     add                  rsi,       qword [@B + 0]
     add                   r8,                  rsi
     mov                  rsi,       qword [@A + 0]
     add                  rsi,       qword [@B + 0]
     mov                   r9,                   r8
     sub                   r9,                  rsi
     mov                  rsi,       qword [@C + 0]
     sub                  rsi,       qword [@A + 0]
     mov                   r8,                  rsi
     add                   r8,       qword [@B + 0]
     mov                  rsi,       qword [@A + 0]
     add                  rsi,       qword [@B + 0]
     mov                  rbx,                   r8
     sub                  rbx,                  rsi
     mov                  rsi,       qword [@C + 0]
     sub                  rsi,       qword [@A + 0]
     mov                   r8,                  rsi
     add                   r8,       qword [@B + 0]
     mov                  rsi,                  rbx
     add                  rsi,                   r8
     add                   r9,                  rsi
     mov                   r8,                  r10
     sub                   r8,                   r9
     mov                   r9,       qword [@A + 0]
     add                   r9,       qword [@B + 0]
     mov                  rsi,       qword [@C + 0]
     sub                  rsi,       qword [@A + 0]
     add                  rsi,       qword [@B + 0]
     add                   r9,                  rsi
     mov                  rsi,       qword [@A + 0]
     add                  rsi,       qword [@B + 0]
     mov                  r10,                   r9
     sub                  r10,                  rsi
     mov                  rsi,       qword [@C + 0]
     sub                  rsi,       qword [@A + 0]
     mov                   r9,                  rsi
     add                   r9,       qword [@B + 0]
     mov                  rsi,       qword [@A + 0]
     add                  rsi,       qword [@B + 0]
     sub                   r9,                  rsi
     mov                  rsi,       qword [@C + 0]
     sub                  rsi,       qword [@A + 0]
     mov                  rbx,                  rsi
     add                  rbx,       qword [@B + 0]
     mov                  rsi,                   r9
     add                  rsi,                  rbx
     add                  r10,                  rsi
     mov                  rsi,       qword [@A + 0]
     add                  rsi,       qword [@B + 0]
     mov                   r9,       qword [@C + 0]
     sub                   r9,       qword [@A + 0]
     add                   r9,       qword [@B + 0]
     add                  rsi,                   r9
     mov                   r9,       qword [@A + 0]
     add                   r9,       qword [@B + 0]
     mov                  rbx,                  rsi
     sub                  rbx,                   r9
     mov                  rsi,       qword [@C + 0]
     sub                  rsi,       qword [@A + 0]
     add                  rsi,       qword [@B + 0]
     mov                   r9,       qword [@A + 0]
     add                   r9,       qword [@B + 0]
     sub                  rsi,                   r9
     mov                   r9,       qword [@C + 0]
     sub                   r9,       qword [@A + 0]
     add                   r9,       qword [@B + 0]
     add                  rsi,                   r9
     mov                   r9,                  rbx
     add                   r9,                  rsi
     mov                  rsi,                  r10
     sub                  rsi,                   r9
     sub                   r8,                  rsi
     mov                  r12,                  r11
     add                  r12,                   r8
     mov                   r8,       qword [@A + 0]
     add                   r8,       qword [@B + 0]
     mov                  rsi,       qword [@C + 0]
     sub                  rsi,       qword [@A + 0]
     add                  rsi,       qword [@B + 0]
     mov                   r9,                   r8
     add                   r9,                  rsi
     mov                   r8,       qword [@A + 0]
     add                   r8,       qword [@B + 0]
     mov                  rsi,       qword [@C + 0]
     sub                  rsi,       qword [@A + 0]
     mov                  r10,                  rsi
     add                  r10,       qword [@B + 0]
     mov                  rsi,                   r8
     add                  rsi,                  r10
     mov                   r8,                   r9
     sub                   r8,                  rsi
     mov                   r9,       qword [@A + 0]
     add                   r9,       qword [@B + 0]
     mov                  rsi,       qword [@C + 0]
     sub                  rsi,       qword [@A + 0]
     add                  rsi,       qword [@B + 0]
     mov                  r10,                   r9
     add                  r10,                  rsi
     mov                   r9,       qword [@A + 0]
     add                   r9,       qword [@B + 0]
     mov                  rsi,                  r10
     sub                  rsi,                   r9
     mov                  r11,                   r8
     sub                  r11,                  rsi
     mov                  rsi,       qword [@C + 0]
     sub                  rsi,       qword [@A + 0]
     add                  rsi,       qword [@B + 0]
     mov                   r8,       qword [@A + 0]
     add                   r8,       qword [@B + 0]
     sub                  rsi,                   r8
     mov                   r8,       qword [@C + 0]
     sub                   r8,       qword [@A + 0]
     add                   r8,       qword [@B + 0]
     mov                   r9,                  rsi
     add                   r9,                   r8
     mov                  r10,       qword [@A + 0]
     add                  r10,       qword [@B + 0]
     mov                  rsi,       qword [@C + 0]
     sub                  rsi,       qword [@A + 0]
     mov                   r8,                  rsi
     add                   r8,       qword [@B + 0]
     mov                  rsi,                  r10
     add                  rsi,                   r8
     mov                   r8,       qword [@A + 0]
     add                   r8,       qword [@B + 0]
     mov                  r10,                  rsi
     sub                  r10,                   r8
     mov                  rsi,                   r9
     sub                  rsi,                  r10
     add                  r11,                  rsi
     mov                  rsi,       qword [@C + 0]
     sub                  rsi,       qword [@A + 0]
     mov                   r8,                  rsi
     add                   r8,       qword [@B + 0]
     mov                  rsi,       qword [@A + 0]
     add                  rsi,       qword [@B + 0]
     sub                   r8,                  rsi
     mov                  rsi,       qword [@C + 0]
     sub                  rsi,       qword [@A + 0]
     add                  rsi,       qword [@B + 0]
     mov                   r9,                   r8
     add                   r9,                  rsi
     mov                   r8,       qword [@A + 0]
     add                   r8,       qword [@B + 0]
     mov                  rsi,       qword [@C + 0]
     sub                  rsi,       qword [@A + 0]
     add                  rsi,       qword [@B + 0]
     add                   r8,                  rsi
     mov                  rsi,       qword [@A + 0]
     add                  rsi,       qword [@B + 0]
     sub                   r8,                  rsi
     sub                   r9,                   r8
     mov                  rsi,       qword [@C + 0]
     sub                  rsi,       qword [@A + 0]
     mov                   r8,                  rsi
     add                   r8,       qword [@B + 0]
     mov                  rsi,       qword [@A + 0]
     add                  rsi,       qword [@B + 0]
     mov                  r10,                   r8
     sub                  r10,                  rsi
     mov                  rsi,       qword [@C + 0]
     sub                  rsi,       qword [@A + 0]
     mov                   r8,                  rsi
     add                   r8,       qword [@B + 0]
     mov                  rsi,                  r10
     add                  rsi,                   r8
     mov                  r10,       qword [@A + 0]
     add                  r10,       qword [@B + 0]
     mov                   r8,       qword [@C + 0]
     sub                   r8,       qword [@A + 0]
     add                   r8,       qword [@B + 0]
     add                  r10,                   r8
     mov                   r8,       qword [@A + 0]
     add                   r8,       qword [@B + 0]
     sub                  r10,                   r8
     sub                  rsi,                  r10
     mov                   r8,                   r9
     add                   r8,                  rsi
     mov                   r9,                  r11
     add                   r9,                   r8
     mov                  rsi,       qword [@C + 0]
     sub                  rsi,       qword [@A + 0]
     mov                   r8,                  rsi
     add                   r8,       qword [@B + 0]
     mov                  rsi,       qword [@A + 0]
     add                  rsi,       qword [@B + 0]
     sub                   r8,                  rsi
     mov                  rsi,       qword [@C + 0]
     sub                  rsi,       qword [@A + 0]
     add                  rsi,       qword [@B + 0]
     mov                  r10,       qword [@A + 0]
     add                  r10,       qword [@B + 0]
     sub                  rsi,                  r10
     mov                  r10,                   r8
     add                  r10,                  rsi
     mov                  rsi,       qword [@C + 0]
     sub                  rsi,       qword [@A + 0]
     mov                   r8,                  rsi
     add                   r8,       qword [@B + 0]
     mov                  rsi,       qword [@A + 0]
     add                  rsi,       qword [@B + 0]
     sub                   r8,                  rsi
     mov                  rsi,       qword [@C + 0]
     sub                  rsi,       qword [@A + 0]
     add                  rsi,       qword [@B + 0]
     add                   r8,                  rsi
     mov                  rbx,                  r10
     add                  rbx,                   r8
     mov                  rsi,       qword [@A + 0]
     add                  rsi,       qword [@B + 0]
     mov                   r8,       qword [@C + 0]
     sub                   r8,       qword [@A + 0]
     add                   r8,       qword [@B + 0]
     add                  rsi,                   r8
     mov                  r10,       qword [@A + 0]
     add                  r10,       qword [@B + 0]
     mov                   r8,                  rsi
     sub                   r8,                  r10
     mov                  rsi,       qword [@C + 0]
     sub                  rsi,       qword [@A + 0]
     add                  rsi,       qword [@B + 0]
     mov                  r10,       qword [@A + 0]
     add                  r10,       qword [@B + 0]
     sub                  rsi,                  r10
     mov                  r10,       qword [@C + 0]
     sub                  r10,       qword [@A + 0]
     add                  r10,       qword [@B + 0]
     mov                  r11,                  rsi
     add                  r11,                  r10
     mov                  rsi,                   r8
     add                  rsi,                  r11
     sub                  rbx,                  rsi
     mov                   r8,       qword [@A + 0]
     add                   r8,       qword [@B + 0]
     mov                  rsi,       qword [@C + 0]
     sub                  rsi,       qword [@A + 0]
     add                  rsi,       qword [@B + 0]
     add                   r8,                  rsi
     mov                  rsi,       qword [@A + 0]
     add                  rsi,       qword [@B + 0]
     sub                   r8,                  rsi
     mov                  rsi,       qword [@C + 0]
     sub                  rsi,       qword [@A + 0]
     add                  rsi,       qword [@B + 0]
     mov                  r11,       qword [@A + 0]
     add                  r11,       qword [@B + 0]
     mov                  r10,                  rsi
     sub                  r10,                  r11
     mov                  rsi,       qword [@C + 0]
     sub                  rsi,       qword [@A + 0]
     add                  rsi,       qword [@B + 0]
     add                  r10,                  rsi
     add                   r8,                  r10
     mov                  r10,       qword [@A + 0]
     add                  r10,       qword [@B + 0]
     mov                  rsi,       qword [@C + 0]
     sub                  rsi,       qword [@A + 0]
     add                  rsi,       qword [@B + 0]
     add                  r10,                  rsi
     mov                  rsi,       qword [@A + 0]
     add                  rsi,       qword [@B + 0]
     mov                  r11,                  r10
     sub                  r11,                  rsi
     mov                  rsi,       qword [@C + 0]
     sub                  rsi,       qword [@A + 0]
     add                  rsi,       qword [@B + 0]
     mov                  r13,       qword [@A + 0]
     add                  r13,       qword [@B + 0]
     mov                  r10,                  rsi
     sub                  r10,                  r13
     mov                  rsi,       qword [@C + 0]
     sub                  rsi,       qword [@A + 0]
     add                  rsi,       qword [@B + 0]
     add                  r10,                  rsi
     add                  r11,                  r10
     mov                  rsi,                   r8
     sub                  rsi,                  r11
     mov                   r8,                  rbx
     sub                   r8,                  rsi
     mov                  rsi,                   r9
     add                  rsi,                   r8
     mov                   r8,                  r12
     sub                   r8,                  rsi
     mov       qword [@B + 0],                   r8
     mov                  rsi,       qword [@C + 0]
     sub                  rsi,       qword [@A + 0]
     add                  rsi,       qword [@B + 0]
     mov                   r8,       qword [@A + 0]
     add                   r8,       qword [@B + 0]
     mov                   r9,                  rsi
     sub                   r9,                   r8
     mov                  rsi,       qword [@C + 0]
     sub                  rsi,       qword [@A + 0]
     add                  rsi,       qword [@B + 0]
     mov                   r8,       qword [@A + 0]
     add                   r8,       qword [@B + 0]
     sub                  rsi,                   r8
     mov                  r10,                   r9
     add                  r10,                  rsi
     mov                  rsi,       qword [@C + 0]
     sub                  rsi,       qword [@A + 0]
     add                  rsi,       qword [@B + 0]
     mov                   r9,       qword [@A + 0]
     add                   r9,       qword [@B + 0]
     mov                   r8,                  rsi
     sub                   r8,                   r9
     mov                  rsi,       qword [@C + 0]
     sub                  rsi,       qword [@A + 0]
     add                  rsi,       qword [@B + 0]
     add                   r8,                  rsi
     mov                  rsi,                  r10
     add                  rsi,                   r8
     mov                   r9,       qword [@A + 0]
     add                   r9,       qword [@B + 0]
     mov                   r8,       qword [@C + 0]
     sub                   r8,       qword [@A + 0]
     add                   r8,       qword [@B + 0]
     add                   r9,                   r8
     mov                   r8,       qword [@A + 0]
     add                   r8,       qword [@B + 0]
     mov                  r10,                   r9
     sub                  r10,                   r8
     mov                   r8,       qword [@C + 0]
     sub                   r8,       qword [@A + 0]
     add                   r8,       qword [@B + 0]
     mov                   r9,       qword [@A + 0]
     add                   r9,       qword [@B + 0]
     sub                   r8,                   r9
     mov                   r9,       qword [@C + 0]
     sub                   r9,       qword [@A + 0]
     add                   r9,       qword [@B + 0]
     add                   r8,                   r9
     mov                   r9,                  r10
     add                   r9,                   r8
     mov                  r11,                  rsi
     sub                  r11,                   r9
     mov                   r8,       qword [@A + 0]
     add                   r8,       qword [@B + 0]
     mov                  rsi,       qword [@C + 0]
     sub                  rsi,       qword [@A + 0]
     add                  rsi,       qword [@B + 0]
     mov                   r9,                   r8
     add                   r9,                  rsi
     mov                  rsi,       qword [@A + 0]
     add                  rsi,       qword [@B + 0]
     mov                   r8,       qword [@C + 0]
     sub                   r8,       qword [@A + 0]
     add                   r8,       qword [@B + 0]
     add                  rsi,                   r8
     sub                   r9,                  rsi
     mov                  r10,       qword [@A + 0]
     add                  r10,       qword [@B + 0]
     mov                  rsi,       qword [@C + 0]
     sub                  rsi,       qword [@A + 0]
     mov                   r8,                  rsi
     add                   r8,       qword [@B + 0]
     mov                  rsi,                  r10
     add                  rsi,                   r8
     mov                   r8,       qword [@A + 0]
     add                   r8,       qword [@B + 0]
     sub                  rsi,                   r8
     mov                   r8,                   r9
     sub                   r8,                  rsi
     mov                  rsi,       qword [@C + 0]
     sub                  rsi,       qword [@A + 0]
     mov                   r9,                  rsi
     add                   r9,       qword [@B + 0]
     mov                  rsi,       qword [@A + 0]
     add                  rsi,       qword [@B + 0]
     sub                   r9,                  rsi
     mov                  rsi,       qword [@C + 0]
     sub                  rsi,       qword [@A + 0]
     add                  rsi,       qword [@B + 0]
     mov                  r10,                   r9
     add                  r10,                  rsi
     mov                  rsi,       qword [@A + 0]
     add                  rsi,       qword [@B + 0]
     mov                   r9,       qword [@C + 0]
     sub                   r9,       qword [@A + 0]
     add                   r9,       qword [@B + 0]
     add                  rsi,                   r9
     mov                   r9,       qword [@A + 0]
     add                   r9,       qword [@B + 0]
     sub                  rsi,                   r9
     mov                   r9,                  r10
     sub                   r9,                  rsi
     mov                  rsi,                   r8
     add                  rsi,                   r9
     mov                  r10,                  r11
     sub                  r10,                  rsi
     mov                  rsi,       qword [@C + 0]
     sub                  rsi,       qword [@A + 0]
     add                  rsi,       qword [@B + 0]
     mov                   r8,       qword [@A + 0]
     add                   r8,       qword [@B + 0]
     mov                   r9,                  rsi
     sub                   r9,                   r8
     mov                  rsi,       qword [@C + 0]
     sub                  rsi,       qword [@A + 0]
     mov                   r8,                  rsi
     add                   r8,       qword [@B + 0]
     mov                  rsi,       qword [@A + 0]
     add                  rsi,       qword [@B + 0]
     sub                   r8,                  rsi
     mov                  rsi,                   r9
     add                  rsi,                   r8
     mov                   r8,       qword [@C + 0]
     sub                   r8,       qword [@A + 0]
     mov                   r9,                   r8
     add                   r9,       qword [@B + 0]
     mov                   r8,       qword [@A + 0]
     add                   r8,       qword [@B + 0]
     sub                   r9,                   r8
     mov                   r8,       qword [@C + 0]
     sub                   r8,       qword [@A + 0]
     add                   r8,       qword [@B + 0]
     add                   r9,                   r8
     mov                  rbx,                  rsi
     add                  rbx,                   r9
     mov                   r8,       qword [@A + 0]
     add                   r8,       qword [@B + 0]
     mov                  rsi,       qword [@C + 0]
     sub                  rsi,       qword [@A + 0]
     add                  rsi,       qword [@B + 0]
     mov                   r9,                   r8
     add                   r9,                  rsi
     mov                   r8,       qword [@A + 0]
     add                   r8,       qword [@B + 0]
     mov                  rsi,                   r9
     sub                  rsi,                   r8
     mov                   r8,       qword [@C + 0]
     sub                   r8,       qword [@A + 0]
     add                   r8,       qword [@B + 0]
     mov                  r11,       qword [@A + 0]
     add                  r11,       qword [@B + 0]
     mov                   r9,                   r8
     sub                   r9,                  r11
     mov                   r8,       qword [@C + 0]
     sub                   r8,       qword [@A + 0]
     add                   r8,       qword [@B + 0]
     add                   r9,                   r8
     add                  rsi,                   r9
     mov                  r12,                  rbx
     sub                  r12,                  rsi
     mov                   r8,       qword [@A + 0]
     add                   r8,       qword [@B + 0]
     mov                  rsi,       qword [@C + 0]
     sub                  rsi,       qword [@A + 0]
     add                  rsi,       qword [@B + 0]
     add                   r8,                  rsi
     mov                  rsi,       qword [@A + 0]
     add                  rsi,       qword [@B + 0]
     mov                   r9,                   r8
     sub                   r9,                  rsi
     mov                  rsi,       qword [@C + 0]
     sub                  rsi,       qword [@A + 0]
     add                  rsi,       qword [@B + 0]
     mov                   r8,       qword [@A + 0]
     add                   r8,       qword [@B + 0]
     sub                  rsi,                   r8
     mov                   r8,       qword [@C + 0]
     sub                   r8,       qword [@A + 0]
     add                   r8,       qword [@B + 0]
     add                  rsi,                   r8
     mov                  r11,                   r9
     add                  r11,                  rsi
     mov                  rsi,       qword [@A + 0]
     add                  rsi,       qword [@B + 0]
     mov                   r8,       qword [@C + 0]
     sub                   r8,       qword [@A + 0]
     add                   r8,       qword [@B + 0]
     add                  rsi,                   r8
     mov                   r9,       qword [@A + 0]
     add                   r9,       qword [@B + 0]
     mov                   r8,                  rsi
     sub                   r8,                   r9
     mov                  rsi,       qword [@C + 0]
     sub                  rsi,       qword [@A + 0]
     add                  rsi,       qword [@B + 0]
     mov                  rbx,       qword [@A + 0]
     add                  rbx,       qword [@B + 0]
     mov                   r9,                  rsi
     sub                   r9,                  rbx
     mov                  rsi,       qword [@C + 0]
     sub                  rsi,       qword [@A + 0]
     mov                  rbx,                  rsi
     add                  rbx,       qword [@B + 0]
     mov                  rsi,                   r9
     add                  rsi,                  rbx
     mov                   r9,                   r8
     add                   r9,                  rsi
     mov                   r8,                  r11
     sub                   r8,                   r9
     mov                  rsi,                  r12
     sub                  rsi,                   r8
     add                  r10,                  rsi
     mov                  rsi,       qword [@A + 0]
     add                  rsi,       qword [@B + 0]
     mov                   r8,       qword [@C + 0]
     sub                   r8,       qword [@A + 0]
     add                   r8,       qword [@B + 0]
     add                  rsi,                   r8
     mov                   r9,       qword [@A + 0]
     add                   r9,       qword [@B + 0]
     mov                   r8,       qword [@C + 0]
     sub                   r8,       qword [@A + 0]
     mov                  r11,                   r8
     add                  r11,       qword [@B + 0]
     mov                   r8,                   r9
     add                   r8,                  r11
     mov                   r9,                  rsi
     sub                   r9,                   r8
     mov                  r11,       qword [@A + 0]
     add                  r11,       qword [@B + 0]
     mov                  rsi,       qword [@C + 0]
     sub                  rsi,       qword [@A + 0]
     mov                   r8,                  rsi
     add                   r8,       qword [@B + 0]
     mov                  rsi,                  r11
     add                  rsi,                   r8
     mov                   r8,       qword [@A + 0]
     add                   r8,       qword [@B + 0]
     sub                  rsi,                   r8
     sub                   r9,                  rsi
     mov                  rsi,       qword [@C + 0]
     sub                  rsi,       qword [@A + 0]
     add                  rsi,       qword [@B + 0]
     mov                   r8,       qword [@A + 0]
     add                   r8,       qword [@B + 0]
     sub                  rsi,                   r8
     mov                   r8,       qword [@C + 0]
     sub                   r8,       qword [@A + 0]
     add                   r8,       qword [@B + 0]
     add                  rsi,                   r8
     mov                  r11,       qword [@A + 0]
     add                  r11,       qword [@B + 0]
     mov                   r8,       qword [@C + 0]
     sub                   r8,       qword [@A + 0]
     add                   r8,       qword [@B + 0]
     add                  r11,                   r8
     mov                   r8,       qword [@A + 0]
     add                   r8,       qword [@B + 0]
     sub                  r11,                   r8
     sub                  rsi,                  r11
     mov                  r11,                   r9
     add                  r11,                  rsi
     mov                  rsi,       qword [@C + 0]
     sub                  rsi,       qword [@A + 0]
     add                  rsi,       qword [@B + 0]
     mov                   r8,       qword [@A + 0]
     add                   r8,       qword [@B + 0]
     sub                  rsi,                   r8
     mov                   r8,       qword [@C + 0]
     sub                   r8,       qword [@A + 0]
     add                   r8,       qword [@B + 0]
     mov                   r9,                  rsi
     add                   r9,                   r8
     mov                   r8,       qword [@A + 0]
     add                   r8,       qword [@B + 0]
     mov                  rsi,       qword [@C + 0]
     sub                  rsi,       qword [@A + 0]
     add                  rsi,       qword [@B + 0]
     add                   r8,                  rsi
     mov                  rsi,       qword [@A + 0]
     add                  rsi,       qword [@B + 0]
     sub                   r8,                  rsi
     mov                  rbx,                   r9
     sub                  rbx,                   r8
     mov                  rsi,       qword [@C + 0]
     sub                  rsi,       qword [@A + 0]
     mov                   r8,                  rsi
     add                   r8,       qword [@B + 0]
     mov                  rsi,       qword [@A + 0]
     add                  rsi,       qword [@B + 0]
     sub                   r8,                  rsi
     mov                  rsi,       qword [@C + 0]
     sub                  rsi,       qword [@A + 0]
     add                  rsi,       qword [@B + 0]
     add                   r8,                  rsi
     mov                   r9,       qword [@A + 0]
     add                   r9,       qword [@B + 0]
     mov                  rsi,       qword [@C + 0]
     sub                  rsi,       qword [@A + 0]
     add                  rsi,       qword [@B + 0]
     add                   r9,                  rsi
     mov                  r12,       qword [@A + 0]
     add                  r12,       qword [@B + 0]
     mov                  rsi,                   r9
     sub                  rsi,                  r12
     sub                   r8,                  rsi
     mov                  rsi,                  rbx
     add                  rsi,                   r8
     mov                  rbx,                  r11
     add                  rbx,                  rsi
     mov                  rsi,       qword [@C + 0]
     sub                  rsi,       qword [@A + 0]
     add                  rsi,       qword [@B + 0]
     mov                   r8,       qword [@A + 0]
     add                   r8,       qword [@B + 0]
     mov                   r9,                  rsi
     sub                   r9,                   r8
     mov                  rsi,       qword [@C + 0]
     sub                  rsi,       qword [@A + 0]
     add                  rsi,       qword [@B + 0]
     mov                   r8,       qword [@A + 0]
     add                   r8,       qword [@B + 0]
     sub                  rsi,                   r8
     add                   r9,                  rsi
     mov                  rsi,       qword [@C + 0]
     sub                  rsi,       qword [@A + 0]
     add                  rsi,       qword [@B + 0]
     mov                   r8,       qword [@A + 0]
     add                   r8,       qword [@B + 0]
     sub                  rsi,                   r8
     mov                   r8,       qword [@C + 0]
     sub                   r8,       qword [@A + 0]
     add                   r8,       qword [@B + 0]
     add                  rsi,                   r8
     mov                  r12,                   r9
     add                  r12,                  rsi
     mov                   r8,       qword [@A + 0]
     add                   r8,       qword [@B + 0]
     mov                  rsi,       qword [@C + 0]
     sub                  rsi,       qword [@A + 0]
     add                  rsi,       qword [@B + 0]
     add                   r8,                  rsi
     mov                  rsi,       qword [@A + 0]
     add                  rsi,       qword [@B + 0]
     mov                   r9,                   r8
     sub                   r9,                  rsi
     mov                  rsi,       qword [@C + 0]
     sub                  rsi,       qword [@A + 0]
     mov                   r8,                  rsi
     add                   r8,       qword [@B + 0]
     mov                  rsi,       qword [@A + 0]
     add                  rsi,       qword [@B + 0]
     mov                  r11,                   r8
     sub                  r11,                  rsi
     mov                  rsi,       qword [@C + 0]
     sub                  rsi,       qword [@A + 0]
     mov                   r8,                  rsi
     add                   r8,       qword [@B + 0]
     mov                  rsi,                  r11
     add                  rsi,                   r8
     mov                   r8,                   r9
     add                   r8,                  rsi
     mov                   r9,                  r12
     sub                   r9,                   r8
     mov                   r8,       qword [@A + 0]
     add                   r8,       qword [@B + 0]
     mov                  rsi,       qword [@C + 0]
     sub                  rsi,       qword [@A + 0]
     add                  rsi,       qword [@B + 0]
     add                   r8,                  rsi
     mov                  rsi,       qword [@A + 0]
     add                  rsi,       qword [@B + 0]
     mov                  r11,                   r8
     sub                  r11,                  rsi
     mov                  rsi,       qword [@C + 0]
     sub                  rsi,       qword [@A + 0]
     add                  rsi,       qword [@B + 0]
     mov                   r8,       qword [@A + 0]
     add                   r8,       qword [@B + 0]
     sub                  rsi,                   r8
     mov                   r8,       qword [@C + 0]
     sub                   r8,       qword [@A + 0]
     add                   r8,       qword [@B + 0]
     add                  rsi,                   r8
     mov                  r12,                  r11
     add                  r12,                  rsi
     mov                   r8,       qword [@A + 0]
     add                   r8,       qword [@B + 0]
     mov                  rsi,       qword [@C + 0]
     sub                  rsi,       qword [@A + 0]
     mov                  r11,                  rsi
     add                  r11,       qword [@B + 0]
     mov                  rsi,                   r8
     add                  rsi,                  r11
     mov                   r8,       qword [@A + 0]
     add                   r8,       qword [@B + 0]
     mov                  r11,                  rsi
     sub                  r11,                   r8
     mov                  rsi,       qword [@C + 0]
     sub                  rsi,       qword [@A + 0]
     mov                   r8,                  rsi
     add                   r8,       qword [@B + 0]
     mov                  rsi,       qword [@A + 0]
     add                  rsi,       qword [@B + 0]
     sub                   r8,                  rsi
     mov                  rsi,       qword [@C + 0]
     sub                  rsi,       qword [@A + 0]
     add                  rsi,       qword [@B + 0]
     add                   r8,                  rsi
     add                  r11,                   r8
     mov                  rsi,                  r12
     sub                  rsi,                  r11
     mov                   r8,                   r9
     sub                   r8,                  rsi
     mov                   r9,                  rbx
     add                   r9,                   r8
     mov                  rsi,                  r10
     sub                  rsi,                   r9
     mov       qword [@C + 0],                  rsi
     jmp main_3_loop_condition
main_8_loop_exit:
main_9_loop_increment:
     add                  r14,                    1
     jmp main_1_loop_condition
main_10_loop_exit:
     mov                  rax,                    0
main_11_block_exit:
     pop                  rbx
     pop                  r13
     pop                  r14
     pop                  r12
     add                  rsp,                   24
     pop                  rbp
     ret
SECTION .data
SECTION .bss
@A:
    resq                    1
@B:
    resq                    1
@C:
    resq                    1
SECTION .data
__println_int_format:
      db         "%ld", 10, 0
__print_int_format:
      db             "%ld", 0
__print_format:
      db              "%s", 0
__scanf_int_format:
      db             "%ld", 0
__scanf_string_format:
      db              "%s", 0
__toString_format:
      db             "%ld", 0
__parseInt_format:
      db             "%ld", 0
SECTION .bss
__scanf_int_buf:
    resq                    1
__sscanf_int_buf:
    resq                    1
SECTION .text
print_Int:
     mov                  rsi,                  rdi
     mov                  rdi,   __print_int_format
     sub                  rsp,                    8
    call               printf
     add                  rsp,                    8
     ret
println_Int:
     mov                  rsi,                  rdi
     mov                  rdi, __println_int_format
     sub                  rsp,                    8
    call               printf
     add                  rsp,                    8
     ret
print:
     mov                  rsi,                  rdi
     mov                  rdi,       __print_format
     sub                  rsp,                    8
    call               printf
     add                  rsp,                    8
     ret
println:
     sub                  rsp,                    8
    call                 puts
     add                  rsp,                    8
     ret
getInt:
     mov                  rdi,   __scanf_int_format
     mov                  rsi,      __scanf_int_buf
     sub                  rsp,                    8
    call                scanf
     add                  rsp,                    8
     mov                  rax, qword [__scanf_int_buf]
     ret
getString:
    push                  r15
     mov                  rdi,                  300
    call               malloc
     mov                  r15,                  rax
     add                  r15,                    8
     mov                  rdi, __scanf_string_format
     mov                  rsi,                  r15
    call                scanf
     mov                  rdi,                  r15
    call               strlen
     mov      qword [r15 - 8],                  rax
     mov                  rax,                  r15
     pop                  r15
     ret
toString:
    push                  r15
    push                  rdi
     mov                  rdi,                   20
     sub                  rsp,                    8
    call               malloc
     add                  rsp,                    8
     mov                  r15,                  rax
     add                  r15,                    8
     mov                  rdi,                  r15
     mov                  rsi,    __toString_format
     pop                  rdx
    call              sprintf
     mov                  rdi,                  r15
    call               strlen
     mov      qword [r15 - 8],                  rax
     mov                  rax,                  r15
     pop                  r15
     ret
__array_size:
     mov                  rax,      qword [rdi - 8]
     ret
__string_length:
     mov                  rax,      qword [rdi - 8]
     ret
__string_parseInt:
     mov                  rsi,   __scanf_int_format
     mov                  rdx,     __sscanf_int_buf
     sub                  rsp,                    8
    call               sscanf
     add                  rsp,                    8
     mov                  rax, qword [__sscanf_int_buf]
     ret
__string_ord:
     add                  rdi,                  rsi
   movsx                  rax,           byte [rdi]
     ret
__string_connection:
    push                  r15
    push                  r14
    push                  r13
     mov                  r15,      qword [rdi - 8]
     add                  r15,      qword [rsi - 8]
     add                  r15,                    9
     mov                  r14,                  rdi
     mov                  r13,                  rsi
     mov                  rdi,                  r15
    call               malloc
     sub                  r15,                    9
     mov          qword [rax],                  r15
     mov                  r15,                  rax
     add                  r15,                    8
     mov                  rdi,                  r15
     mov                  rsi,                  r14
    call               strcpy
     add                  r15,      qword [r14 - 8]
     mov                  r14,                  rax
     mov                  rdi,                  r15
     mov                  rsi,                  r13
    call               strcpy
     mov                  rax,                  r14
     pop                  r13
     pop                  r14
     pop                  r15
     ret
__string_substring:
    push                  r15
    push                  r14
     mov                  r15,                  rdi
     add                  r15,                  rsi
     mov                  r14,                  rdx
     sub                  r14,                  rsi
     add                  r14,                    1
     mov                  rdi,                  r14
     add                  rdi,                    9
     sub                  rsp,                    8
    call               malloc
     add                  rsp,                    8
     add                  rax,                    8
     mov                  rdi,                  rax
     mov                  rsi,                  r15
     mov                  rdx,                  r14
     sub                  rsp,                    8
    call               memcpy
     add                  rsp,                    8
     mov      qword [rax - 8],                  r14
     mov                  r15,                  rax
     add                  r15,                  r14
     mov                  r15,                    0
     pop                  r14
     pop                  r15
     ret
__string_LE:
     cmp                  eax,                    0
     mov                  rax,                    0
    setl                   al
     ret
__string_LEEQ:
     cmp                  eax,                    0
     mov                  rax,                    0
   setle                   al
     ret
__string_GR:
     cmp                  eax,                    0
     mov                  rax,                    0
    setg                   al
     ret
__string_GREQ:
     cmp                  eax,                    0
     mov                  rax,                    0
   setge                   al
     ret
__string_EQ:
     cmp                  eax,                    0
     mov                  rax,                    0
    sete                   al
     ret
__string_NEQ:
     cmp                  eax,                    0
     mov                  rax,                    0
   setne                   al
     ret
