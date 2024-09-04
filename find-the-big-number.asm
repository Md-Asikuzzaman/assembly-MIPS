.data
    num1:   .word 100   # First number
    num2:   .word 200   # Second number
    num3:   .word 300   # Third number
    msg_max: .asciiz "The largest number is: "  # Message to print the result

.text
    main:
        # Load the three numbers into registers
        lw   $t0, num1   # Load num1 into $t0
        lw   $t1, num2   # Load num2 into $t1
        lw   $t2, num3   # Load num3 into $t2

        # Compare $t0 and $t1 to find the maximum of these two
        bge  $t0, $t1, check_num3   # If $t0 >= $t1, go to check_num3
        move $t3, $t1              # Else, $t3 = $t1 (maximum of $t0 and $t1)
        j    compare_with_num3     # Jump to compare_with_num3

    check_num3:
        move $t3, $t0              # $t3 = $t0 (maximum of $t0 and $t1)

    compare_with_num3:
        bge  $t3, $t2, print_max  # If $t3 >= $t2, go to print_max
        move $t3, $t2              # Else, $t3 = $t2 (maximum of $t3 and $t2)

    print_max:
        # Print the message
        li   $v0, 4        # Load the print string syscall code
        la   $a0, msg_max # Load address of msg_max into $a0
        syscall            # Make the system call to print the string

        # Print the largest number
        move $a0, $t3      # Move the largest number to $a0
        li   $v0, 1        # Load the print integer syscall code
        syscall            # Make the system call to print the integer

        # Exit the program
        li   $v0, 10       # Load the exit system call code
        syscall            # Make the system call to exit
