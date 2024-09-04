.data
    # No data section needed for this simplified version

.text
main:
    # Load the two numbers into registers
    li   $t0, 5          # Load immediate value 5 into register $t0
    li   $t1, 7          # Load immediate value 7 into register $t1

    # Add the two numbers
    add  $t2, $t0, $t1   # Add contents of $t0 and $t1, store result in $t2

    # Print the sum
    li   $v0, 1          # System call code for print_int
    move $a0, $t2        # Move the result (sum) into $a0 (argument for print_int)
    syscall              # Make the system call to print the integer

    # Exit the program
    li   $v0, 10         # System call code for exit
    syscall              # Make the system call to exit the program


# With Output String

.data
    # Define a string to display the result
    result_str: .asciiz "The sum is: "

.text
main:
    # Load the two numbers into registers
    li   $t0, 5          # Load immediate value 5 into register $t0
    li   $t1, 7          # Load immediate value 7 into register $t1

    # Add the two numbers
    add  $t2, $t0, $t1   # Add contents of $t0 and $t1, store result in $t2

    # Print the result string
    li   $v0, 4          # System call code for print_str
    la   $a0, result_str # Load address of the result string
    syscall              # Make the system call to print the result string

    # Print the sum
    li   $v0, 1          # System call code for print_int
    move $a0, $t2        # Move the result (sum) into $a0 (argument for print_int)
    syscall              # Make the system call to print the integer

    # Exit the program
    li   $v0, 10         # System call code for exit
    syscall              # Make the system call to exit the program
