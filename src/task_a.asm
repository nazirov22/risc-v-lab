.text
.globl main

main:
    li a7, 5
    ecall

    li t0, 12
    beq a0, t0, match

    li a0, 0
    j print_result

match:
    li a0, 1

print_result:
    li a7, 1
    ecall

    li a7, 10
    ecall