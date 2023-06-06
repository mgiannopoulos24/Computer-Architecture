#################################################
# #
# lab4_1a.s #
# stack exercise 1 (to be completed) #
# #
#################################################
 .text
 .globl __start
__start:
# start of main program
 li $a0,20 # Initialize variables
 li $a1,-5 #
 li $a2,60 #
 li $a3,200 #
 move $t0,$v0
 move $t1,$v1
 la $a0,max
 li $v0,4
 syscall # display "Max is :"
 move $a0,$t0
 li $v0,1
 syscall # display max
 la $a0,endl
 li $v0,4
 syscall # display end of line
 la $a0,min
 li $v0,4
 syscall # display "Min is :"
 move $a0,$t1
 li $v0,1
 syscall # display min
 la $a0,endl
 li $v0,4
 syscall # display end of line
 li $v0,10
 syscall # exit
# end of main program
# start of procedure
#
# end of procedure
 .data
 
 X: word 40,50,60,100
max: .asciiz "Max is : "
min: .asciiz "Min is : "
endl: .asciiz "\n"
#################################################
# #
# End of program #
# #
#################################################