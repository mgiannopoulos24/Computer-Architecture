.text
.globl main

# Procedure to find the minimum and maximum number
# Takes numbers from registers $a0, $a1, $a2, $a3
# Returns the minimum in register $v0 and the maximum in register $v1
find_min_max:
    # Keep the first number in $v0
    move $v0, $a0
    # Keep the second number in $v1
    move $v1, $a1

    # Check for the minimum number
    ble $a1, $a0, find_min_max_check_second
    move $v0, $a1  # If the second number is smaller, it becomes the minimum

find_min_max_check_second:
    # Check for the maximum number
    bgt $a2, $v1, find_min_max_check_third
    move $v1, $a2  # If the third number is larger, it becomes the maximum

find_min_max_check_third:
    # Check for the minimum number
    ble $a3, $v0, find_min_max_end
    move $v0, $a3  # If the fourth number is smaller, it becomes the minimum

find_min_max_end:
    jr $ra  # Return to the main program

main:
    # Initialize variables
    li $a0, -10
    li $a1, -30
    li $a2, 120
    li $a3, 200

    # Call the procedure to calculate the minimum and maximum
    jal find_min_max

    # Display the maximum
    la $a0, max
    li $v0, 4
    syscall

    move $a0, $v1
    li $v0, 1
    syscall

    # Display the minimum
    la $a0, min
    li $v0, 4
    syscall

    move $a0, $v0
    li $v0, 1
    syscall

    # Display the end of line
    la $a0, endl
    li $v0, 4
    syscall

    # Exit
    li $v0, 10
    syscall

.data
max: .asciiz "Max is : "
min: .asciiz "Min is : "
endl: .asciiz "\n"
