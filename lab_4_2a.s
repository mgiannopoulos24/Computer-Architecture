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

    # Continue with displaying the end of line and exiting
    la $a0, endl
    li $v0, 4
    syscall              # display end of line

    li $v0, 10
    syscall              # exit

# end of main program

# start of procedure
recursive:
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
    jr $ra   # Return to the caller

# end of procedure

.data
prompt: .asciiz "Enter integer number :"
endl: .asciiz "\n"
