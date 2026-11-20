
.text
.globl main

main:
    li a7, 5
    ecall

    mv t0, a0
    li t1, 118
    li t2, 12

    bge t0, t1, x_greater

    mv t3, t0
    mv t4, t1
    j loop

x_greater:
    mv t3, t1
    mv t4, t0

loop:
    mv a0, t3
    li a7, 1
    ecall

    li a0, 32
    li a7, 11
    ecall

    add t3, t3, t2

    ble t3, t4, loop

    li a0, 10
    li a7, 11
    ecall

    li a7, 10
    ecall