.data
    # Define a string to be printed
    message: .asciiz "Hello, World!"

.text
main:
    # Load the address of the string into register $a0
    li   $v0, 4          # System call code for print_str
    la   $a0, message    # Load address of the string
    syscall              # Make the system call to print the string

    # Exit the program
    li   $v0, 10         # System call code for exit
    syscall              # Make the system call to exit the program
