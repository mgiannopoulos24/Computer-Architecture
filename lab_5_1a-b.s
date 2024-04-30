    .data
input_prompt:   .asciiz "Enter a floating point number: "
output_format:  .asciiz "You entered: %.2f\n"

    .text
    .globl main

main:
    # Print input prompt
    li $v0, 4                   # Load system call code for printing string
    la $a0, input_prompt        # Load address of input prompt string
    syscall                     # Print input prompt

    # Read float from console
    li $v0, 6                   # Load system call code for reading float
    syscall                     # Read float
    mov.s $f12, $f0             # Move float from $f0 to $f12 for printing

    # Print float
    li $v0, 2                   # Load system call code for printing float
    syscall                     # Print float

    # (c) Directly load numbers into registers
    # Commenting out this section for simulating direct loading of numbers into registers
    # Remove the comment to try this section
    # li $f0, 0x00000001        # +min: Smallest positive denormalized number

    # Exit program
    li $v0, 10                  # Load system call code for exit
    syscall                     # Exit program
