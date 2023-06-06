.data

message: .asciiz "Please give a  number: "


.text
main:

	#Print message for user
		la $a0, message
        li $v0, 4
        syscall
		
		#Get integer from user
        li $v0, 5          
        syscall

		#Save the given number in the register s2
        move $s1, $v0       
		
		#Get the 8 bits of the given number
		add $s1,-8
		move $s1,$s2
		syscall

		#Get the rest bits of the number
		add $s2,-23
		move $s2,$s3
		syscall
		
		



	exit: li $v0, 10
	syscall