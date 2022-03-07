.globl lab04b

//This is an ARMv8 assembly language function declared in main that computes the factorial of an input integer n

lab04b:
        SUB SP, SP, #16
        STUR X19, [SP,0]
        SUB X11,X0,#1
        SUB X19,X0,#1
        ADD X9, XZR, XZR

loop:
      CBNZ X11, mult_loop
      B exit
      mult_loop:
                CBZ X19, mult_eol
                ADD X9,X9,X0
                SUB X19, X19, #1
                B mult_loop

       mult_eol:
                ADD X0, X9, XZR
                ADD X9, XZR, XZR
                SUB X19, X11, #1
                SUB X11, X11, #1
                B loop

 exit:
      LDUR X19, [SP,0]
      ADD SP,SP,16
      BR X30
