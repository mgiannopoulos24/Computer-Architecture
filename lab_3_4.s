.data
input_string: .space 100    # Initialize a buffer for user input
output_string: .space 100   # Initialize a buffer for output
prompt: .asciiz "Enter a string: "
newline: .asciiz "\n"

.text
.globl main
main:
    # Print prompt for user input
    li $v0, 4
    la $a0, prompt
    syscall

    # Read input from user
    li $v0, 8
    la $a0, input_string
    li $a1, 100    # Maximum input length
    syscall

    # Call function to convert characters to uppercase
    la $a0, input_string
    la $a1, output_string
    jal convert_to_uppercase

    # Print the converted sequence
    li $v0, 4
    la $a0, output_string
    syscall

    # Exit the program
    li $v0, 10
    syscall

# Subroutine to convert characters to uppercase
# $a0: input address (string)
# $a1: output address (string)
convert_to_uppercase:
    li $t0, 0          # Initialize index for input_string
    li $t1, 0          # Initialize index for output_string

convert_loop:
    lb $t2, ($a0)      # Read a character from input_string
    beqz $t2, end_convert   # Exit loop if end of string is reached

    # Check if the character is lowercase (expecting ASCII codes from 97 to 122)
    li $t3, 97
    bge $t2, $t3, check_uppercase

    # If not lowercase, simply copy it to output_string
    sb $t2, ($a1)
    addi $a0, $a0, 1    # Increment input index
    addi $a1, $a1, 1    # Increment output index
    j convert_loop

check_uppercase:
    # Check if the character is lowercase (expecting ASCII codes from 97 to 122)
    li $t4, 122
    ble $t2, $t4, convert_uppercase

    # If the character is not lowercase, simply copy it to output_string
    sb $t2, ($a1)
    addi $a0, $a0, 1    # Increment input index
    addi $a1, $a1, 1    # Increment output index
    j convert_loop

convert_uppercase:
    # Convert lowercase to uppercase
    li $t5, 32          # ASCII difference between lowercase and uppercase
    sub $t2, $t2, $t5

    # Copy the converted character to output_string
    sb $t2, ($a1)
    addi $a0, $a0, 1    # Increment input index
    addi $a1, $a1, 1    # Increment output index
    j convert_loop

end_convert:
    # Terminate subroutine
    sb $zero, ($a1)     # Place NULL at the end of output_string
    jr $ra              # Return from subroutine
