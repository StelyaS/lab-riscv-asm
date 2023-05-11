.data
N:
.word 4
M:
.word 4
column:
.word 0
matrix:
.word 1 2 3 4
.word 5 6 7 8
.word 9 10 11 12
.word 13 14 15 16
res:
.word 0

.text

main:
la a2, N
la a3, M
la a4, matrix
la a5, column
la a6, res
call process
call print
call exit

print:
lw a1, 0(a6)
addi a0, x0, 1 
ecall


exit:
addi a0, x0, 10
ecall

process:
lw t1, 0(a2) # N value
lw t2, 0(a3) # M value 
lw t3, 0(a5) # column value 

slli t3,t3,2 # column value in bytes
slli t1,t1,2 # number of elements in row in bytes

add a4, a4, t3 # increment array pointer to match column number
addi t4, x0, 0 # row number
addi t5, x0, 0 # element at pointer 
addi t6, x0, 0 # result to save


loop:
lw t5, 0(a4) # load value from matrix element at pointer
add t6, t6, t5 # count sum
add a4, a4, t1 # increment array pointer by N 
addi t4, t4, 1 
blt t4, t2, loop

sw t6, 0(a6) # save result to res
ret