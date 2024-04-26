###################################################
# 
# lab1_1.s 
# Pseudoinstruction examples - System calls 
# t0 - holds each byte from string in turn 
# t1 - contains count of characters 
# t2 - points to the string 
# 
###################################################
###################################################
# 
# text segment 
# 
###################################################
.text
.globl main

main:
    # t2 points to the string
    la $t2, str
    # t1 holds the count
    li $t1, 0

nextCh:
    # get a byte from string
    lb $t0, ($t2)
    # zero means end of string
    beqz $t0, strEnd
    # increment count
    addi $t1, $t1, 1
    # move pointer one character
    addi $t2, $t2, 1
    # go round the loop again
    j nextCh

strEnd:
    # system call to print
    la $a0, ans
    li $v0, 4
    syscall

    # system call to print the length worked out
    move $a0, $t1
    li $v0, 1
    syscall

    # system call to print a newline
    la $a0, endl
    li $v0, 4
    syscall

    # exit
    li $v0, 10
    syscall

###################################################
# 
# data segment 
# 
###################################################
.data
str: .asciiz "hello world"
ans: .asciiz "Length is "
endl: .asciiz "\n"

###################################################
# 
# End of File 
# 
###################################################
