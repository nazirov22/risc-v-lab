
.data
    input_str1: .string "Enter the number with offset "
    input_str2: .string " ... "

    # (16 + 12) * 4 = 112 bytes
    array: .space 112

.text

.macro read_word(%address, %offset)
    li a7, 4
    la a0, input_str1
    ecall

    li a7, 1
    mv a0, %offset
    ecall

    li a7, 4
    la a0, input_str2
    ecall

    li a7, 5
    ecall

    mv t1, a0

    beqz t1, end_loop

    sw t1, 0(%address)

    li a0, 10
    li a7, 11
    ecall
.end_macro


.macro check()
    bge t5, t2, end_loop
    j begin_loop
.end_macro


.globl main

main:
    # t2
    li t2, 28

    # t5
    li t5, 0

    # t6
    la t6, array

begin_loop:
    read_word(t6, t5)

    addi t5, t5, 1
    addi t6, t6, 4

    check()

end_loop:
    li a7, 10
    ecall
