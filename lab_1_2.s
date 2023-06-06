 ################
    # Text Segment #
    ################

	.text
	.globl __start
__start:


###part (b)


		la $a0, Addr11   		#load address to the a0
		lbu $t0, 0($a0)   		#load unsigned byte on  t0
		lhu $t1, 0($a0)  			#load halfword on t1
		lw $t2, 0($a0)			#load word on t2
		
		
		
###part (c)
		
		la $a0, Addr12   		#load address to the a0
		lbu $t3, 0($a0)   		#load unsigned byte on t3
		lhu $t4, 0($a0)  			#load halfword on t4
		lw $t5, 0($a0)			#load word on t5

		
###part (d)


###part (e)

lbu $t6, 4($a0)
sb $t6, 16($a0)

		
li $v0,10
syscall

    ################
    # Data Segment #
    ################
	
	
##part (a)
	.data
Addr11: .byte 0x01, 0x02, 0x03, 0x04 #Address 0x10010000  - 0x10010003
Addr12: .byte 0x81, 0x82, 0x83, 0x84 #Address 0x10010004  - 0x10010007
Addr13: .word 0x12345678 #Address 0x10010008
Addr14: .word 0x87654321 #Address 0x1001000C