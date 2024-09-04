.data
    num1:   .word 30   # First number
    num2:   .word 15   # Second number
    result: .word 0    # To store the result of subtraction

.text
    main:
        # Load the two numbers into registers
        lw   $t0, num1  # Load the first number (minuend) into $t0
        lw   $t1, num2  # Load the second number (subtrahend) into $t1

        # Perform the subtraction
        sub  $t2, $t0, $t1  # Subtract $t1 from $t0, result in $t2

        # Store the result
        sw   $t2, result    # Store the result in memory

        # Exit the program
        li   $v0, 10        # Load the exit system call code
        syscall             # Make the system call to exit
