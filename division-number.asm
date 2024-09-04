.data
    num1:   .word 20   # Dividend
    num2:   .word 3    # Divisor
    result: .word 0    # Quotient
    rem:    .word 0    # Remainder

.text
    main:
        # Load dividend and divisor
        lw   $t0, num1  # Load dividend into $t0
        lw   $t1, num2  # Load divisor into $t1

        # Perform division
        div  $t0, $t1  # Divide $t0 by $t1

        # Store results
        mflo $t2       # Move quotient to $t2
        mfhi $t3       # Move remainder to $t3
        sw   $t2, result  # Store quotient
        sw   $t3, rem     # Store remainder

        # Exit program
        li   $v0, 10   # Exit system call code
        syscall        # Exit
