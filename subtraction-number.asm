.data
    num1:   .word 12
    num2:   .word 23
    result: .word 0
.text
main:

    lw $t0, num1
    lw $t1, num2
    
     # Perform the subtraction
    sub $t2, $t0, $t1
    
    # Store the result
    sw $t2, result
    
    # Print the result
    li $v0, 1
    lw $a0, result
    syscall

    li $v0, 10
    syscall
    
    
