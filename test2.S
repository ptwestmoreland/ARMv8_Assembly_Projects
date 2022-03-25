.section .text
.globl test2

test2:
       SUB SP, SP, #16
       STUR X30, [SP, #0]
       SUB X0,X0,X1
       MOV X1, X0
       ADR X0, message
       BL printf
       LDUR X30, [SP, #0]
       ADD SP, SP, #16
       BR X30


.section    .data

message:    .asciz "The result of test2(6, 5) =  %d\n"
