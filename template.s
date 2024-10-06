#################################################
#                                               #
#           Data Segment                        #
#                                               #
#################################################

.data
endl:           .asciiz     "\n"
msg:            .asciiz     "Hello, MIPS World!\n"
num:            .word       10

#################################################
#                                               #
#           Text Segment                        #
#                                               #
#################################################

.text
.globl __start    

__start:
    # Print a message
    la      $a0, msg        # Load address of message
    li      $v0, 4          # System call to print string
    syscall

    # Example: Call a procedure that uses stack
    jal     leaf_proc_using_stack

    # Example: Arithmetic operations
    li      $t0, 5
    li      $t1, 10
    add     $t2, $t0, $t1   # $t2 = $t0 + $t1
    sub     $t3, $t1, $t0   # $t3 = $t1 - $t0
    mul     $t4, $t0, $t1   # $t4 = $t0 * $t1
    div     $t1, $t0        # Divide $t1 by $t0
    mflo    $t5             # Move quotient to $t5
    mfhi    $t6             # Move remainder to $t6

    # Print newline
    jal     print_endl

    # Example: Logical operations
    li      $t7, 0xFF00FF00
    li      $t8, 0x00FF00FF
    and     $t9, $t7, $t8   # Bitwise AND
    or      $s0, $t7, $t8   # Bitwise OR
    xor     $s1, $t7, $t8   # Bitwise XOR
    not     $s2, $t7        # Bitwise NOT

    # Example: Looping
    li      $t0, 0          # Initialize counter to 0
while_loop:
    bge     $t0, 5, Exit    # Exit loop if counter >= 5
    # Print counter
    move    $a0, $t0
    li      $v0, 1          # System call to print integer
    syscall
    jal     print_endl
    addi    $t0, $t0, 1     # Increment counter
    j       while_loop

Exit:
    li      $v0, 10
    syscall         # Exit program

#################################################
#                                               #
#           Useful Procedures                   #
#                                               #
#################################################

print_endl:
    la      $a0, endl        # Load address of newline
    li      $v0, 4           # System call to print
    syscall
    jr      $ra              # Return

print_msg:
    la      $a0, msg         # Load address of message
    li      $v0, 4           # System call to print
    syscall
    jr      $ra              # Return

#################################################
#                                               #
#           Leaf Procedures                     #
#                                               #
#################################################

leaf_proc_using_stack:
    # Prologue
    addi    $sp, $sp, -16    # Allocate stack space
    sw      $t0, 0($sp)      # Save registers
    sw      $t1, 4($sp)
    sw      $t2, 8($sp)
    sw      $t3, 12($sp)

    # Example computation
    li      $t0, 42
    li      $t1, 24
    add     $t2, $t0, $t1

    # Epilogue
    lw      $t0, 0($sp)      # Restore registers
    lw      $t1, 4($sp)
    lw      $t2, 8($sp)
    lw      $t3, 12($sp)
    addi    $sp, $sp, 16     # Deallocate stack space
    jr      $ra              # Return

#################################################
#                                               #
#           Node Procedures                     #
#                                               #
#################################################

node_proc_using_stack:
    # Prologue
    addi    $sp, $sp, -16    # Allocate stack space
    sw      $ra, 12($sp)     # Save $ra
    sw      $t0, 8($sp)      # Save other registers
    sw      $t1, 4($sp)
    sw      $t2, 0($sp)

    # Example function call
    jal     leaf_proc_using_stack

    # Epilogue
    lw      $t0, 0($sp)      # Restore other registers
    lw      $t1, 4($sp)
    lw      $t2, 8($sp)
    lw      $ra, 12($sp)     # Restore $ra
    addi    $sp, $sp, 16     # Deallocate stack space
    jr      $ra              # Return

#################################################
#                                               #
#           Control Structures                  #
#                                               #
#################################################

switch_case_no_break:
    li      $t0, 3           # Example value
    li      $t1, 1
    li      $t2, 2
    li      $t3, 3
    beq     $t0, $t1, case_1
    beq     $t0, $t2, case_2
    beq     $t0, $t3, case_3
    j       end_switch
case_1:
    # Code for case 1
    j       switch_case_no_break
case_2:
    # Code for case 2
    j       switch_case_no_break
case_3:
    # Code for case 3
end_switch:
    # End of switch-case

switch_case_with_break:
    li      $t0, 2           # Example value
    li      $t1, 1
    li      $t2, 2
    li      $t3, 3
    beq     $t0, $t1, case_1_break
    beq     $t0, $t2, case_2_break
    beq     $t0, $t3, case_3_break
    j       end_switch_break
case_1_break:
    # Code for case 1
    j       end_switch_break
case_2_break:
    # Code for case 2
    j       end_switch_break
case_3_break:
    # Code for case 3
end_switch_break:
    # End of switch-case with breaks

while_do_1_condition:
    li      $t0, 0
while_cond:
    bge     $t0, 10, end_while
    # Code inside while loop
    addi    $t0, $t0, 1
    j       while_cond
end_while:
    # End of while loop

while_do_a_AND_b:
    li      $t0, 0
    li      $t1, 0
while_and:
    bge     $t0, 5, end_while_and
    bge     $t1, 5, end_while_and
    # Code inside while (a AND b)
    addi    $t0, $t0, 1
    addi    $t1, $t1, 1
    j       while_and
end_while_and:
    # End of while loop with AND condition

while_do_a_OR_b_1:
    li      $t0, 0
    li      $t1, 0
while_or_1:
    bge     $t0, 5, check_b
    j       continue_or_1
check_b:
    bge     $t1, 5, end_while_or_1
continue_or_1:
    # Code inside while (a OR b), approach 1
    addi    $t0, $t0, 1
    addi    $t1, $t1, 1
    j       while_or_1
end_while_or_1:
    # End of while loop with OR condition, approach 1

while_do_a_OR_b_2:
    li      $t0, 0
    li      $t1, 0
while_or_2:
    blt     $t0, 5, continue_or_2
    blt     $t1, 5, continue_or_2
    j       end_while_or_2
continue_or_2:
    # Code inside while (a OR b), approach 2
    addi    $t0, $t0, 1
    addi    $t1, $t1, 1
    j       while_or_2
end_while_or_2:
    # End of while loop with OR condition, approach 2

#################################################
#                                               #
#           Function Call Example               #
#                                               #
#################################################

function_call_example:
    li      $a0, 5           # Argument to function
    jal     factorial        # Call factorial function
    # Result is in $v0
    j       Exit

factorial:
    # Factorial function using recursion
    # Prologue
    addi    $sp, $sp, -8
    sw      $ra, 4($sp)
    sw      $a0, 0($sp)

    # Base case
    li      $t0, 1
    beq     $a0, $t0, factorial_base

    # Recursive case
    addi    $a0, $a0, -1
    jal     factorial
    lw      $a0, 0($sp)
    mul     $v0, $a0, $v0
    j       factorial_end

factorial_base:
    li      $v0, 1

factorial_end:
    # Epilogue
    lw      $ra, 4($sp)
    addi    $sp, $sp, 8
    jr      $ra