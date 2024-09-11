.data
    num1:   .word 200    # Dividend
    num2:   .word 100    # Divisor
   
.text
main:
    # Load values
    lw $t0, num1        # Load the dividend (200) into $t0
    lw $t1, num2        # Load the divisor (100) into $t1
    
    # Perform division
    div $t0, $t1        # Divide $t0 by $t1; quotient in $lo, remainder in $hi
    
    # Move the quotient
    mflo $t2            # Move the quotient from $lo to $t2
    
    # Print the result
    li $v0, 1           # Load system call code for print integer
    move $a0, $t2       # Move the result from $t2 to $a0
    syscall             # Make the system call to print the integer
    
    # Exit the program
    li $v0, 10          # Load system call code for exit
    syscall             # Make the system call to exit the program
