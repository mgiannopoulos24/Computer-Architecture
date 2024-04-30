.text
.globl main
main:
    # Prompt the user to enter an integer number
    la $a0, prompt
    li $v0, 4
    syscall              # Display "Enter integer number:"

    # Read the integer from the user
    li $v0, 5
    syscall              # Read integer
    move $a0, $v0       # Pass the integer as an argument to the recursive procedure

    # Call the recursive procedure to calculate Fibonacci
    jal fibonacci      

    # Store the return value (nth Fibonacci term) in $a1
    move $a1, $v0     

    # Display end of line
    la $a0, endl
    li $v0, 4
    syscall              

    # Display the nth Fibonacci term
    move $a0, $a1
    li $v0, 1
    syscall

    # Exit the program
    li $v0, 10
    syscall              

# Recursive procedure for Fibonacci calculation
fibonacci:
    # Check if n is less than or equal to 1
    ble $a0, 1, fibonacci_end   # Base case: return n as the Fibonacci term

    # Recursive call to compute (n-1)th Fibonacci term
    addi $a0, $a0, -1
    jal fibonacci
    move $s0, $v0    # Store the result of (n-1)th Fibonacci term

    # Recursive call to compute (n-2)th Fibonacci term
    addi $a0, $a0, -1
    jal fibonacci
    move $s1, $v0    # Store the result of (n-2)th Fibonacci term

    # Compute nth Fibonacci term
    add $v0, $s0, $s1

fibonacci_end:
    jr $ra   # Return to the caller

.data
prompt: .asciiz "Enter integer number: "
endl: .asciiz "\n"
