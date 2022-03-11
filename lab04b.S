.globl lab04b

//function recursively computes factorial of a number n
//only works after my_mul has been fixed


lab04b:
        SUB SP, SP, #16 //make room to push 2 registers onto stack
        STUR X30, [SP, #8] //store return register in memory
        STUR X1, [SP, #0] //store for later use


if: //defining selection statements for use in factorial function
     CMP X0, XZR // compare n and 0
     B.NE else  // if n != 0 branch to else
     EOR X0, XZR, #1  //if n = 0 set return value to 1; fact(0) = 1
     B exit  //leave when this condition is met

else:
     ADD X1, XZR, X0  //storing X0 in X1
     SUB X0, X0, #1 // decrementing X0 (n-1)
     BL lab04b //branch and link to factorial function
     BL my_mul  //branch and link to my_mul



exit:
     LDUR X1, [SP, #0]  //restoring registers from stack
     LDUR X30, [SP, #8]
     ADD SP, SP, #16  //reducing stack after popping off two values
     BR X30  // branch to register X30 (return to calling point PC + 4)
