.data
    # Define a string to be printed
    message: .asciiz "Hello, World!"

.text
main:
    
    li   $v0, 4          
    la   $a0, message    
    syscall              

    # Exit the program
    li   $v0, 10        
    syscall             
