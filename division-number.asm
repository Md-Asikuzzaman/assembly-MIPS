.data
    num1:   .word 200    # Dividend
    num2:   .word 100    # Divisor
   
.text
main:
    # Load values
    lw $t0, num1  
    lw $t1, num2      
    
    # Perform division
    div $t0, $t1  
    
    # Move the quotient
    mflo $t2        
    
    # Print the result
    li $v0, 1          
    move $a0, $t2      
    syscall             
    
    # Exit the program
    li $v0, 10         
    syscall            
