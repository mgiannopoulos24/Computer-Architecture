.data
x_prompt: .asciiz "Enter the value of x: "
result_msg: .asciiz "e^x = "
newline: .asciiz "\n"

.text
.globl main
main:
    # Prompt the user to enter the value of x
    li $v0, 4
    la $a0, x_prompt
    syscall

    # Read the value of x
    li $v0, 6
    syscall
    mov.s $f2, $f0   # Move the value of x to $f2

    # Initialize variables
    li $t0, 8        # Number of terms to use in the Taylor series
    li $t1, 1        # Initialize the power of x
    li.s $f4, 1.0    # Initialize the result to 1.0
    li.s $f5, 1.0    # Initialize the factorial to 1.0
    li.s $f6, 1.0    # Initialize the term to be added to 1.0

calc_terms:
    # Calculate the next term of the Taylor series
    div.s $f6, $f6, $f5     # Calculate x^n / n!
    add.s $f4, $f4, $f6     # Add the term to the result

    # Update the power of x and the factorial for the next term
    addi $t1, $t1, 1        # Increment the power of x
    mul.s $f5, $f5, $f31    # Update the factorial (n!)

   # Check if more terms need to be calculated
    addi $t0, $t0, -1  # Decrement the counter
    bnez $t0, calc_terms


    # Display the result
    li $v0, 4
    la $a0, result_msg
    syscall

    li $v0, 2
    mov.s $f12, $f4   # Move the result to $f12 for printing
    syscall

    # Print newline
    li $v0, 4
    la $a0, newline
    syscall

    # Exit
    li $v0, 10
    syscall
