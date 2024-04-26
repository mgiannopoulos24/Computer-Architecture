#################################################
#                                               #
#           Data Segment                       #
#                                               #
#################################################

.data
endl:           .asciiz     "\n"

#################################################
#                                               #
#           Text Segment                       #
#                                               #
#################################################

.text
.globl __start    

__start:

    # Your code goes here

Exit:
    li      $v0, 10
    syscall         # Exit program

#################################################
#                                               #
#           Useful Procedures                   #
#                                               #
#################################################

#print_endl:
#   la      $a0, endl        # Load address of newline
#   li      $v0, 4           # System call to print
#   syscall
#   jr      $ra              # Return

# Add other useful procedures here

#################################################
#                                               #
#           Leaf Procedures                     #
#                                               #
#################################################

leaf_proc_using_stack:
    # Prologue
    # addi   $sp, $sp, -16   # Allocate stack space
    # sw     $t0, 0($sp)     # Save registers
    # sw     $t1, 4($sp)
    # sw     $t2, 8($sp)
    # sw     $t3, 12($sp)

    # Your code goes here

    # Epilogue
    # lw     $t0, 0($sp)     # Restore registers
    # lw     $t1, 4($sp)
    # lw     $t2, 8($sp)
    # lw     $t3, 12($sp)
    # addi   $sp, $sp, 16    # Deallocate stack space
    jr      $ra              # Return

# Add other leaf procedures here

#################################################
#                                               #
#           Node Procedures                     #
#                                               #
#################################################

node_proc_using_stack:
    # Prologue
    # addi   $sp, $sp, -16   # Allocate stack space
    # sw     $ra, 12($sp)    # Save $ra
    # sw     $t0, 8($sp)     # Save other registers
    # sw     $t1, 4($sp)
    # sw     $t2, 0($sp)

    # Your code goes here

    # Epilogue
    # lw     $t0, 0($sp)     # Restore other registers
    # lw     $t1, 4($sp)
    # lw     $t2, 8($sp)
    # lw     $ra, 12($sp)    # Restore $ra
    # addi   $sp, $sp, 16    # Deallocate stack space
    jr      $ra              # Return

# Add other node procedures here

#################################################
#                                               #
#           Control Structures                  #
#                                               #
#################################################

switch_case_no_break:
    # Your code for switch-case without breaks

switch_case_with_break:
    # Your code for switch-case with breaks

while_do_1_condition:
    # Your code for while loop with single condition

while_do_a_AND_b:
    # Your code for while loop with AND condition

while_do_a_OR_b_1:
    # Your code for while loop with OR condition, approach 1

while_do_a_OR_b_2:
    # Your code for while loop with OR condition, approach 2

# Add other control structures here
