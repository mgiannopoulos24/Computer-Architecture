.data

message: .asciiz "Please give a positive number: "
#result: .asciiz "The square of your number is: "

.text
main:


loopA: 
		#Print message for user
		la $a0, message
        li $v0, 4
        syscall
		
		#Get integer from user
        li $v0, 5          
        syscall

		#Save the given number in the register s2
        move $s2, $v0       

        #Check if given number is 0, then terminate the program
		beqz $s2, exit      


		#Print the given integer
        move $a0, $v0      
        li $v0, 1
        syscall

		#Print endline
        la $a0, '\n'        
        li $v0, 11
        syscall

		#Count all the previous numbers and the given number.
        li $t7, 1       
        li $t1, 0       
		
		#Now add those numbers
		loop2:
		beq $t7, $s2, add_again 
		add $t1, $t1, $t7
		addi $t7, $t7, 1
		j loop2
		
		#Count the numbers backwards
		add_again:
        move $t7, $s2
        li $t2, 0          
		
		#The last loop for adding the first and the last sum together
		loop3:
		beqz $t7, print_power
		add $t2, $t7, $t2
		addi $t7, $t7, -1
		j loop3


		#Print the square of the given number
		print_power:
			add $t1, $t2, $t1
			move $a0, $t1
			li $v0, 1
			syscall
			
			la $a0, '\n'
			li $v0, 11
			syscall

	

	exit: li $v0, 10
	syscall