.data
# Define constants
zero:   .float 0.0
pos_inf: .float 1.0e38   # Positive infinity approximation
neg_inf: .float -1.0e38   # Negative infinity approximation
pos_nan: .word 0x7fc00000   # Positive NaN representation
x:      .float 5.0     # Positive number
y:      .float -3.0    # Negative number

# Strings for displaying results
result_msg: .asciiz "Result: "
newline:    .asciiz "\n"

.text
.globl main
main:
    # Load constants into registers
    l.s $f0, zero
    l.s $f1, pos_inf
    l.s $f2, neg_inf
    l.s $f3, pos_nan

    # Load numbers into registers
    l.s $f4, x
    l.s $f5, y

    # Perform arithmetic operations
    add.s $f6, $f4, $f5     # x + y
    sub.s $f7, $f4, $f5     # x - y
    mul.s $f8, $f4, $f5     # x * y
    div.s $f9, $f4, $f5     # x / y

    # Display results
    li $v0, 4               # Print string syscall code
    la $a0, result_msg      # Load address of result_msg into $a0
    syscall                 # Print result_msg

    # Display x + y
    li $v0, 2               # Float print syscall code
    mov.s $f12, $f6         # Load $f6 (x + y) into $f12
    syscall                 # Print x + y
    li $v0, 4               # Print string syscall code
    la $a0, newline         # Load address of newline into $a0
    syscall                 # Print newline

    # Display x - y
    li $v0, 4               # Print string syscall code
    la $a0, result_msg      # Load address of result_msg into $a0
    syscall                 # Print result_msg
    li $v0, 2               # Float print syscall code
    mov.s $f12, $f7         # Load $f7 (x - y) into $f12
    syscall                 # Print x - y
    li $v0, 4               # Print string syscall code
    la $a0, newline         # Load address of newline into $a0
    syscall                 # Print newline

    # Display x * y
    li $v0, 4               # Print string syscall code
    la $a0, result_msg      # Load address of result_msg into $a0
    syscall                 # Print result_msg
    li $v0, 2               # Float print syscall code
    mov.s $f12, $f8         # Load $f8 (x * y) into $f12
    syscall                 # Print x * y
    li $v0, 4               # Print string syscall code
    la $a0, newline         # Load address of newline into $a0
    syscall                 # Print newline

    # Display x / y
    li $v0, 4               # Print string syscall code
    la $a0, result_msg      # Load address of result_msg into $a0
    syscall                 # Print result_msg
    li $v0, 2               # Float print syscall code
    mov.s $f12, $f9         # Load $f9 (x / y) into $f12
    syscall                 # Print x / y

    # Exit
    li $v0, 10              # Exit syscall code
    syscall                 # Exit program
