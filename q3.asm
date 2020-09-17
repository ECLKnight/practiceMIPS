.data
    letterA: .asciiz "a"
    letterB: .asciiz "b"
.text

# Part A
lbu $t1, letterA
lbu $t2, letterB

# shift $t1 --> 0 0 a 0
sll $t1 $t1, 8

# $t1 --> 0 0 a b
or $t1, $t1, $t2

# $t2 --> 0 0 0 a
srl $t2, $t1, 8

# $t1 --> 0 0 0 b
sll $t1 $t1, 24
srl $t1 $t1, 24

# Part B
and $t1, $t1, $zero
and $t2, $t2, $zero

la $t1, letterA
la $t2, letterB

# t3 = a
or  $t3, $t1, $t3

# t1 = b
and $t1, $t1, $zero
or  $t1, $t1, $t2

# t2 = a
and $t2, $t2, $zero
or  $t2, $t3, $t2

li $v0, 10
syscall