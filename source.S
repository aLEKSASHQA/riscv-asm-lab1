.data
STRLEN:
.word 4
STRCNT:
.word 4
matrix:
.word 1, 1, 1, 1
.word 2, 2, 2, 2
.word 3, 3, 3, 3
.word 4, 4, 4, 4
STRNUM:
.word 3
result:
.word 0

.text

main:
la a2, STRLEN
lw a2, 0(a2) # STRLEN
la a3, STRCNT
lw a3, 0(a3) # STRCNT
la a6, STRNUM
lw a6, 0(a6) # STRNUM 

la a4, matrix
la a5, result

call process
la a2, STRCNT
la a3, result
call print
call exit

print:
lw t1, 0(a2)
addi a0, x0, 1 # print_int ecall
lw a1, 0(a3)
ecall

ret

exit:
addi a0, x0, 10
ecall

process:
add t1, a2, x0 # t1 = STRLEN
add t2, a3, x0 # t2 = STRCNT
add t4, a6, x0 # t4 = STRNUM 

# search needed string offset by string number
search_loop:
beq t4, x0, search_end
addi t4,t4,-1
addi t3, x0, 0 # row element number

inc_loop:
addi a4, a4, 4 # increment array pointer
addi t3, t3, 1 
blt t3, t1, inc_loop # if t3 < t1 then target

j search_loop
search_end:

addi t4, x0, 0 # row pointer

init:
addi t5, x0, 0 # result to save
addi t3, x0, 0 # row element number

cycle:
lw t6, 0(a4) # load value from array
addi a4, a4, 4 # increment array pointer
add t5, t5, t6 # count sum
addi t3, t3, 1
blt t3, t1, cycle
sw t5, 0(a5) # save result 
ret
