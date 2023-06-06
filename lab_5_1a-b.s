###Text segment###


	.text
	.globl __start
__start:

	lwcl	$f4, zerofloat


	show_message: 	li $v0,4
									la $a0,printmsg
									syscall

	read_int: li $v0, 6
					syscall


	print_int: 	li $v0, 2
						add.s $f12,$f0,$f4
						syscall

	exit:
				li $v0,10
				syscall

###Data segment###

	.data
	printmsg: .asciiz "enter your number: "
	zerofloat: .float 0.0
	exitmsg: .asciiz "your number is: "