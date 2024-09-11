.data

    number1: .word 100
    number2: .word 50
    result:  .word 0

.text
main:

    lw $t0, number1
    lw $t1, number2
    
    mul $t2, $t0, $t1
    
    mflo $t2
    
    sw $t2, result
    
    li $v0, 1
    lw $a0, result
    syscall
    
    
    li $v0, 10
    syscall
