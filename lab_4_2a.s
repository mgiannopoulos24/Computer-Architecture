##text_segment##

	.text
		.globl __start
	__start:


# start of main program
 la $a0,prompt
 li $v0,4
 syscall # display "Enter integer number :"
 li $v0,5
 syscall # read integer
 move $t0,$v0
 la $a0,endl
 li $v0,4
 syscall # display end of line
 move $a0,$t0 
 li $v0,10
 syscall # exit
# end of main program
# start of procedure
procedure_check:

		check_if_zero:
		move $t1,$t0
		slt $t2,$t1,$s0
		jr $ra

		otherwise:

		addi $t1, $t1,-1
		move $a0,$t1
		jal procedure_check

		return_res:
			li $v0,1
			syscall
		


# end of procedure
 .data
prompt: .asciiz "Enter integer number :"
endl: .asciiz "\n"
#################################################
# #
# End of program #
# #
#################################################
