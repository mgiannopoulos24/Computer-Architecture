.text
.globl main

main:
    li $t1, 0           # Counter for string
    li $s0, 'x'         # Character to end copy
    li $t3, 5           # Constant n

while_loop:
    lbu $t0, string($t1)    # Load a character
    beq $t0, $s0, end_loop  # If character is 'x', then exit loop
    bge $t1, $t3, end_loop  # If more than n characters read, then exit loop
    sb $t0, copy($t1)       # Copy character
    addi $t1, $t1, 1        # Increment counter
    j while_loop             # Repeat while loop

end_loop:
    li $t2, 0
    sb $t2, copy($t1)        # Append end character to copied string

    la $a0, copy             # Display copied string
    li $v0, 4
    syscall

    li $v0, 10               # Exit
    syscall

.data
string: .asciiz "Mary had a little lamb"
copy: .space 80
