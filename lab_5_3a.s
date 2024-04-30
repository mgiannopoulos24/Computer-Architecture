.text 
.globl main 
main: 
    la $a0, n            # Load address of n
    lw $t0, 0($a0)       # $t0 = n 
    li $t2, 1            # $t2 index i=1..n 
    li $t1, 1            # $t1 contains i! 
loop: 
    # Original part: Calculate i!
    mul $t1, $t1, $t2   # Calculate i!
    move $a0, $t2       # Move i to $a0 for printing
    li $v0, 1            # Load system call code for printing integer
    syscall              # Display i 
    la $a0, msg1        # Load address of msg1
    li $v0, 4            # Load system call code for printing string
    syscall              # Display "! is :" 
    move $a0, $t1       # Move i! to $a0 for printing
    li $v0, 1            # Load system call code for printing integer
    syscall              # Display i! 
    la $a0, endl        # Load address of endl
    li $v0, 4            # Load system call code for printing string
    syscall              # Print end of line 
    addi $t2, $t2, 1    # i = i + 1 
    ble $t2, $t0, loop  # Repeat if i <= n 

    # Part (b): Calculate i! using single precision floating point arithmetic
    la $a0, n            # Load address of n
    lw $t0, 0($a0)       # $t0 = n 
    li $t2, 1            # $t2 index i=1..n 
    li $t1, 1            # $t1 contains i! 
loop_b: 
    mtc1 $t1, $f1        # Move $t1 to $f1 for conversion
    cvt.s.w $f1, $f1     # Convert $f1 from integer to single precision float
    mtc1 $t2, $f2        # Move $t2 to $f2 for conversion
    cvt.s.w $f2, $f2     # Convert $f2 from integer to single precision float
    mul.s $f1, $f1, $f2  # Calculate i!
    move $a0, $t2        # Move i to $a0 for printing
    li $v0, 1            # Load system call code for printing integer
    syscall              # Display i 
    la $a0, msg1        # Load address of msg1
    li $v0, 4            # Load system call code for printing string
    syscall              # Display "! is :" 
    mtc1 $t1, $f12       # Move $t1 to $f12 for printing
    li $v0, 2            # Load system call code for printing float
    syscall              # Display i! 
    la $a0, endl        # Load address of endl
    li $v0, 4            # Load system call code for printing string
    syscall              # Print end of line 
    addi $t2, $t2, 1    # i = i + 1 
    ble $t2, $t0, loop_b  # Repeat if i <= n 
    
    li $v0, 10           # Load system call code for exit
    syscall              # Exit 

.data 
n: .word 25 
msg1: .asciiz "! is :" 
endl: .asciiz "\n"
