.eqv VGA 0xFF000000
.eqv NUMX 320
.eqv NUMY 240
.eqv LIMLIMPA 76800 #76241


.data
LINF:  	.float -1.0
LSUP:	.float  1.0
NX:	.float  320
NY:	.float  240
UM:	.float  1.0
LINFY: 	.float  -1.0   #$f8
LSUPY:  .float  1.0    #$f9
YRESOL: .float  0.008333
LINF2:  .float -2.0
LSUP2:	.float  2.0
LINFY2: 	.float  0.0   #$f8
LSUPY2:  .float  5.0    #$f9
YRESOL2: .float  0.0208333  


.text
MAIN:	jal LIMPA
	jal PLOT
	jal LIMPA
	addi $s1,$zero,1
	jal PLOT2
	li $v0,10
	syscall

FUNCAO:	# letra A)
	addi $at,$zero,1
	beq $at,$s1, graf1 	
	sub.s $f6,$f0,$f6	# mesma coisa que f6 = -f6  func
	jr $ra	
	
graf1: 	l.s $f10,UM
	mul.s $f6,$f6,$f6
	add.s $f6,$f6,$f10
	jr $ra	
			
PLOT:	
	ori $t5,$zero,320
 	
	
	#plot
	la $at, LINF
	lwc1 $f1, 0($at)	# -1.0 LINF
	
	
	la $at, LSUP
	lwc1 $f2, 0($at)	# 1.0
	
	la $at, LINFY
	lwc1 $f8, 0($at)
	lwc1 $f9, 4($at)
	
	
	
	la $at,NX
	lwc1 $f4, 0($at)	#320 pixels
	
	sub.s $f3,$f2,$f1	#  f3 = fsup - flinf
	div.s $f3,$f3,$f4	# f3 = x_resol
	
				
	lui $at,0x3f40		#
	mtc1 $at,$f4		# 0.75 = 240/320
	
	
	la $at, YRESOL
	lwc1 $f4, 0($at)
	#div.s $f4,$f3,$f4	# f4 = y_resol
	
	
	andi $s2,$s2, 0		#força os bits de s2 a ser 0 #primeiro pixel de x
	 
	add.s $f5,$f0,$f0 	# f5 = 0+0  #primeiro pixel x 
	
	
	
loop:				#realiza essa linha 
	mul.s $f6,$f5,$f3 	# f6 = f5 * x_resol
	add.s $f6,$f6,$f1	# f6 = f6 + fLINF 
	#sub.s $f6,$f0,$f6	# mesma coisa que f6 = -f6  func
	
	addi $sp,$sp,-4
	sw $ra, 0($sp)
	jal FUNCAO
	lw $ra, 0($sp)
	addi $sp,$sp,4	

	
	sub.s $f6,$f6,$f8 
	#sub.s $f6,$f6,$f1	# f6 = f6 - fLINF
	div.s $f6,$f6,$f4 	# f6 = f6/y_resol ou  f6 = f6*0.75
	
	cvt.w.s $f7, $f6  	#converte float para int
	mfc1 $t4,$f7
	
	
	nor $t4,$t4,$t4         #faz t4= t4' para poder somar com um e obter -t4					<<<<
	addi $t4,$t4,241	#toma 240 para arrumar o numero de pixels e 1 para negativar t4                     	<<<<<
	
	slti $at,$t4,240       # veriica se o ultrapassa o numero de pixels   t4<240 ? 1:0
	beq $at,$zero, pula    # ultrapassa numero de pixels 
	slti $at,$t4,0         #t4 <0 ? 1:0
	bne $at,$zero,pula     #ultrapassa

	#pinta 	 	 	
	lui $t1, 0XFF00		#prepara para 	
	mul  $t4, $t4, $t5	# y*320	
	add  $t4, $s2, $t4
	add  $t1, $t4, $t1	
	addi $t0, $zero,0	
	sb $t0, 0($t1)		
	
	
pula:	addi $s2,$s2,1		#  s2++
	mtc1 $s2,$f5
	cvt.s.w $f5,$f5
	#add.s $f5,$f5,$f2     	# f5 = f5 + 1 (pois f2 = LSUP) 		
	slti $t3,$s2,320		#  s2< 10 ? 1:0
	bne  $t3,$zero,loop	#  t3 !=  0 ? loop : pc+4
	jr $ra 
	
PLOT2:	
	ori $t5,$zero,320
 	
 	addi $s2,$zero,1 #seleciona o numero do plot(a,b,c,d) dentre (0,1,2,3)
	
	#plot
	la $at, LINF2
	lwc1 $f1, 0($at)	# -1.0 LINF
	
	
	la $at, LSUP2
	lwc1 $f2, 0($at)	# 1.0
	
	la $at, LINFY2
	lwc1 $f8, 0($at)
	lwc1 $f9, 4($at)
	
	
	
	la $at,NX
	lwc1 $f4, 0($at)	#320 pixels
	
	sub.s $f3,$f2,$f1	#  f3 = fsup - flinf
	div.s $f3,$f3,$f4	# f3 = x_resol
	
				
	lui $at,0x3f40		#
	mtc1 $at,$f4		# 0.75 = 240/320
	
	
	la $at, YRESOL2
	lwc1 $f4, 0($at)
	#div.s $f4,$f3,$f4	# f4 = y_resol
	
	
	andi $s2,$s2, 0		#força os bits de s2 a ser 0 #primeiro pixel de x
	 
	add.s $f5,$f0,$f0 	# f5 = 0+0  #primeiro pixel x 
	
	j loop
	
LIMPA: 
	lui $t1, 0XFF00
	ori $t0, $zero,255
	addi $t3, $zero,LIMLIMPA
	add $t2,$zero,$zero
lloop:	
	
	
	sb $t0, 0($t1)
	addi $t1,$t1,1
	addi $t2,$t2,1
	slt $at,$t2,$t3
	beq $at,$zero,vaza
	j lloop
			
vaza:	jr $ra
	
	
	
	
	
	
	
	
		
