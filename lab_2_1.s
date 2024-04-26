.data
    input:  .word 0x12345678     # Ο αρχικός δυαδικός αριθμός εδώ

.text
    # Εκτελούμε το κυρίως τμήμα του προγράμματος
    main:
        lw $t0, input           # Φορτώνουμε τον αριθμό από τη μνήμη
        jal binary_to_gray      # Καλούμε τη συνάρτηση για μετατροπή σε Gray
        li $v0, 10              # Κωδικός εξόδου για την τερματική συνάρτηση
        syscall                 # Τερματισμός προγράμματος

    # Συνάρτηση για μετατροπή δυαδικού αριθμού σε κωδικοποίηση Gray
    binary_to_gray:
        li $t1, 0               # Αρχικοποίηση ενός καταχωρητή για τον Gray αριθμό
        li $t2, 1               # Αρχικοποίηση ενός καταχωρητή για μάσκα αλλαγής
        li $t3, 32              # Αρχικοποίηση ενός καταχωρητή για τον αριθμό των bits

    loop:
        and $t4, $t0, $t2      # Λογική πράξη AND για να πάρουμε το τελευταίο bit
        xor $t1, $t1, $t4      # Λογική πράξη XOR για τον Gray αριθμό
        srl $t0, $t0, 1        # Δεξιά ολίσθηση του δυαδικού αριθμού
        srl $t2, $t2, 1        # Δεξιά ολίσθηση της μάσκας
        addi $t3, $t3, -1      # Μείωση του μετρητή bits
        bnez $t3, loop         # Επανάληψη μέχρι να έχουμε εξαντλήσει όλα τα bits

        # Επιστροφή του Gray αριθμού
        jr $ra
