.data

.text
main:

    li $t0, 1
    li $t1, 100
    
loop:   
    li $v0, 1
    move $a0, $t0
    syscall
    
    addi $t0, $t0, 1

    bgt $t0, $t1, end
    
    j loop

end:
    li $v0, 10
    syscall



