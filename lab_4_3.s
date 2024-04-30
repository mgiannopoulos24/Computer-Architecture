.text
.globl main

main:
    # start of main program
    la $a0, prompt
    li $v0, 4
    syscall              # display "Enter integer number :"

    li $v0, 5
    syscall              # read integer
    move $a0, $v0       # Pass the integer as an argument to the recursive procedure

    jal recursive      # Call the recursive procedure
    move $a1, $v0     # Store the return value (minimum stack pointer address)

    # Continue with displaying the end of line and exiting
    la $a0, endl
    li $v0, 4
    syscall              # display end of line

    # Display the minimum stack pointer address used
    move $a0, $a1
    li $v0, 1
    syscall

    li $v0, 10
    syscall              # exit

# end of main program

# start of procedure
recursive:
    # Initialize register to store minimum stack pointer address
    move $s0, $sp

    # Check if the integer is zero
    beq $a0, $zero, end_recursive   # If the integer is zero, return

    # Print the value of the integer
    move $a0, $a0
    li $v0, 1
    syscall

    # Decrement the integer by one
    sub $a0, $a0, 1

    # Recursive call to the procedure
    jal recursive

end_recursive:
    # Update $v0 with minimum stack pointer address used
    move $v0, $s0

    jr $ra   # Return to the caller

# end of procedure

.data
prompt: .asciiz "Enter integer number :"
endl: .asciiz "\n"
