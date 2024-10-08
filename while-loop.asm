.data
    newline: .asciiz "\n"  # Newline character for formatting

.text
    main:
        # Initialize the loop counter
        li   $t0, 1        # $t0 = 1 (starting value)

    while_loop:
        # Check if the counter is greater than 100
        li   $t1, 101      # Load the value 101 into $t1
        bge  $t0, $t1, exit  # If $t0 >= 101, exit the loop

        # Print the current value of the counter
        move $a0, $t0      # Move the counter value to $a0 (argument register)
        li   $v0, 1        # Load the print integer syscall code
        syscall            # Make the system call to print the integer

        # Print a newline
        li   $v0, 4        # Load the print string syscall code
        la   $a0, newline  # Load address of newline string into $a0
        syscall            # Make the system call to print the newline

        # Increment the counter
        addi $t0, $t0, 1   # $t0 = $t0 + 1

        # Continue the loop
        j    while_loop    # Jump back to the start of the loop

    exit:
        # Exit the program
        li   $v0, 10       # Load the exit system call code
        syscall            # Make the system call to exit
