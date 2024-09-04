.data
    array:      .word 10, 20, 30, 40, 50  # Array with 5 elements
    array_size: .word 5                  # Number of elements in the array
    msg_elem:  .asciiz "Element: "       # Message prefix for each element

.text
    main:
        # Load the base address of the array and the array size
        la   $t0, array        # Load address of array into $t0
        lw   $t1, array_size   # Load array size into $t1

        # Initialize index to 0
        li   $t2, 0            # $t2 = index (initialize to 0)

    loop:
        bge  $t2, $t1, exit   # If index >= array size, exit the loop

        # Load the current array element
        sll  $t3, $t2, 2       # $t3 = index * 4 (word size)
        add  $t3, $t0, $t3     # $t3 = base address + offset
        lw   $a0, 0($t3)       # Load array element into $a0

        # Print the message prefix
        li   $v0, 4            # Load the print string syscall code
        la   $a1, msg_elem     # Load address of msg_elem into $a1
        syscall                # Make the system call to print the string

        # Print the array element
        li   $v0, 1            # Load the print integer syscall code
        syscall                # Make the system call to print the integer

        # Print a newline for better formatting
        li   $v0, 4            # Load the print string syscall code
        la   $a0, newline      # Load address of newline into $a0
        syscall                # Make the system call to print the newline

        # Increment the index and loop
        addi $t2, $t2, 1       # $t2 = $t2 + 1
        j    loop              # Jump to loop

    exit:
        # Exit the program
        li   $v0, 10           # Load the exit system call code
        syscall                # Make the system call to exit

.data
    newline: .asciiz "\n"                 # Newline character for formatting
