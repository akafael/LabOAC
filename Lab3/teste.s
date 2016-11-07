##
# Teste da ISA MIPS PUM v4.5
# @version 0.78
##

###############################################################################
# Data Segment - "Variables"
###############################################################################
.data
    msg1: .asciiz "Organizacao e Arquitetura de Computadores 2016/2 !"
    msg2: .asciiz "Programa executado com sucesso! Fim de execucao!"

###############################################################################
# Text Segment
###############################################################################
.text

# Test ULA --------------------------------------------------------------------
test.add:
    addi $t0, $zero, 0x00000100	#$t0 == 0x00000100
    addiu $t1, $t0, 0xffff0001	#$t1 == 0xffff0101
    add $t2, $t1, $t0		#$t2 == 0xffff0201
    addu $t3, $t2, $t2		#$t3 == 0x(1)fffe0402

test.logic:
    and $t4, $t2, $t1		#$t4 == 0xffff0001
    andi $t5, $t2, 0xffff0000	#$t5 == 0xffff0000
    or $t4, $t2, $t1		#$t4 == 0xffff0301
    ori $t5, $t2, 0xffff0000	#$t5 == 0xffff0201
    xor $t4, $t2, $t1		#$t4 == 0x00000300
    xori $t5, $t2, 0xffff0000	#$t5 == 0x00000201
    nor $t4, $t2, $t1		#$t4 == 0x0000fcfe

test.shift:
    sll $t6, $t2, 8			#$t6 == 0xff020100
    srl $t7, $t6, 12		#$t7 == 0x000ff020
    sra $t8, $t6, 12		#$t8 == 0xfffff020
    sllv $t6, $t2, $t1		#$t6 == 0xfffe0402
    srlv $t7, $t6, $t1		#$t7 == 0x7fff0201
    srav $t8, $t6, $t1		#$t8 == 0xffff0201

test.sub:
    subu $t1, $t1, $t0		#$t1 == 0xffff0001
    sub $t2, $t4, $t0		#$t2 == 0x0000fbfe

test.mul:
    mult $t4, $t0			#hi == 0x00000000		lo == 0x00fcfe00
    mfhi $s0			#$s0 == 0x00000000
    mflo $s1			#$s1 == 0x00fcfe00
    multu $t8, $t4			#hi == 0x0000fcfd		lo == 0x04fcf8fe
    mfhi $s2			#$s2 == 0x0000fcfd
    mflo $s3			#$s3 == 0x04fcf8fe

test.div:
    div $t4, $t0			#hi == 0x000000fe		lo == 0x000000fc
    mfhi $s4			#$s4 == 0x000000fe
    mflo $s5			#$s5 == 0x000000fc
    divu $t8, $t0			#hi == 0x00000001		lo == 0x00ffff02
    mfhi $s6			#$s6 == 0x00000001
    mflo $s7			#$s7 == 0x00ffff02

test.hilo:
    mthi $s2			#hi == 0x0000fcfd
    mtlo $s3			#lo == 0x04fcf8fe

test.slt:
    slt $a0, $s6, $s7		#$a0 == 1
    slti $a1, $s6, 0x005		#$a1 == 1
    sltu $a2, $t7, $t8		#$a2 == 1
    sltiu $a3, $s6, 0xff9		#$a3 == 1

# Test Branch -----------------------------------------------------------------

#branch instructions
    ori $t1, $zero, 0x23
    ori $t2, $zero, -3
branch:
    bgtz $t1, lessequalzero
    ori $t0, $zero, 0xffff
lessequalzero:
    blez $t2, greaterequal
    ori $t0, $zero, 0xfffe
greaterequal:
    bgez $t1, greaterandlink
    ori $t0, $zero, 0xfffd
greaterandlink:
    bgezal $t1, lessthan
    ori $t0, $zero, 0xfffc
lessthan:
    bltz $t2, lessandlink
    ori $t0, $zero, 0xfffb
lessandlink:
    bltzal $t2, naobranch
    ori $t0, $zero, 0xfffa

naobranch:
    bgtz $t2, label1
    ori $t0, $zero, 0x0fff
label1:
    blez $t1, label2
    ori $t0, $zero, 0x0ffe
label2:
    bgez $t2, label3
    ori $t0, $zero, 0x0ffd
label3:
    bgezal $t2, label4
    ori $t0, $zero, 0x0ffc
label4:
    bltz $t1, label5
    ori $t0, $zero, 0x0ffb
label5:
    bltzal $t1, zeros
    ori $t0, $zero, 0x0ffa

zeros:
    bgtz $zero, zero1
    ori $t0, $zero, 0x00ff
zero1:
    blez $zero, zero2
    ori $t0, $zero, 0x00fe
zero2:
    bgez $zero, zero3
    ori $t0, $zero, 0x00fd
zero3:
    bgezal $zero, zero4
    ori $t0, $zero, 0x00fc
zero4:
    bltz $zero, zero5
    ori $t0, $zero, 0x00fb
zero5:
    bltzal $zero, fim
    ori $t0, $zero, 0x00fa

# Test Memory Access ----------------------------------------------------------
test.mem:
    ori $t3, $t3, 0xf0f0		#$t3 == 0xfffef4f2
    addi $sp, $sp, -12		#malloc
    sw $t3, 8($sp)			#store word
    sh $t3, 4($sp)			#store halfword
    sb $t3, 0($sp)			#store byte
    lw $v0, 8($sp)			#$v0 == 0xfffef4f2
    lh $v1, 4($sp)			#$v1 == 0xfffff4f2	(signal extention)
    lhu $a0, 4($sp)			#$a0 == 0x0000f4f2
    lb $a1, 0($sp)			#$a1 == 0xfffffff2	(signal extention)
    lbu $a2, 0($sp)			#$a2 == 0x000000f2
    addi $sp, $sp, 12		#free

test.lui:
    lui $a3, 0x0fff			#$a3 == 0x0fff0000

# Test Jump -------------------------------------------------------------------

test.jump:
    j NEXT				#go to NEXT
    addiu $at, $zero, 0xffffffff	#never reaches here
NEXT:
    jal OTHER			#go to OTHER
    nop
    j ENDJUMP			#go to JUMPEND
OTHER:
    addi $ra, $ra, 4		#$ra = $ra + 4
    jr $ra				# go to .$ra
ENDJUMP:

# Test SYSCALL ----------------------------------------------------------------

# Test ULA FPU ----------------------------------------------------------------
test.fpu:
    addiu $t0, $zero, 0x40A402A6	#dec 5.1253233
    mtc1 $t0, $f0			#$f0 == 0x40A402A6
    mtc1 $v0, $f1			#$f1 == 0xfffef4f2
    mtc1 $a3, $f2			#$f2 == 0x0fff0000
    mtc1 $s3, $f3			#$f3 == 0x04fcf8fe
    mtc1 $zero, $f4			#$f4 == 0x00000000

    add.s $f5, $f3, $f2
    sub.s $f6, $f4, $f0
    mul.s $f7, $f1, $f0
    div.s $f8, $f5, $f6
    sqrt.s $f9, $f1
    abs.s $f10, $f6
    mov.s $f8, $f7
    neg.s $f11, $f9
    c.eq.s $f10, $f10		#coproc1 Flag set to true
    c.lt.s $f10, $f0		#coproc1 Flag set to false
    c.le.s $f0, $f10		#coproc1 Flag set to true
    cvt.s.w $f12, $f10		#$f12 = integer equivalent
    cvt.w.s $f13, $f12		#$f13 == $f10

    addi $sp, $sp, -4		#maloc
    swc1 $f5, 0($sp)
    lwc1 $f13, 0($sp)
    addi $sp, $sp, 4		#free

    mfc1 $t0, $f12
    bc1f 1, LABEL
    j ERRO				#se nao der branch na linha anterior, não printa msg2

LABEL:
    addi $v0, $zero, 4
    la $a0,msg2			#nao vi a implementação de la no aquivo "parametros" (nem de li)
    #lui $at, 0xXXXXXXXX		#|-> substitute load address (ver endereço)
    #ori $a0, $at, oxXXXXXXXX	#|
    syscall

ERRO:
    nop


