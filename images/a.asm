.data
prompt1: .asciiz "enter the value of p: "
prompt2: .asciiz "number is: "
prompt3: .asciiz " invalid input ,please enter a number between 10 and 10000 "
.text
main:
li $v0,4
la $a0,prompt1
syscall
li $v0,5
syscall
move $t0,$v0
move $t1,$t0
blt $t0,10,pri1
bgt $t0,10000,pri1
li $t4,1
loop:
beq $s1,1,pri
blt $t1,2,end
sub $t1,$t1,$t4

li $t2,2
li $s1,1
j loop1
loop1:
bge $t2,$t1,loop


div $t1,$t2
mfhi $t3
beq $t3,0,set
addi $t2,$t2,1
j loop1

pri1:
li $v0,4
la $a0,prompt1
syscall
pri:
li $v0,4
la $a0,prompt2
syscall
li $v0,1
move $a0,$t1
syscall
li $v0,10
syscall
set:
li $s1,0
j loop
end:
li $v0,10
syscall



