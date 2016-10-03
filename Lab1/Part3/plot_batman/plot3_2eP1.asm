.eqv VGA 0xFF000000		#ENDEREÇO DA VGA
.eqv X $f0			#DEFINE X = $F0
.eqv Y $f12			#DEFINE Y = $F12
.eqv ZERO $f18
.eqv NUMx 320			#DEFINE NUMx = 320
.eqv NUMy 129			#DEFINE NUMy = 240

.data				#DECLARA VARIÁVEIS
LINF:   .float -7.0		#Colocar aqui LINF
LSUP:   .float 7.0		#Colocar aqui LSUP
NUMX:  	.float 320.0
NUMY:  	.float 240.0
UM:	.float 1.0		#Declarar aqui números utilizados em sua função
MEIO:	.float 0.5
ZPSC:	.float 0.75
CINCO:	.float 5.0
DOIS:	.float 2.0
TRES:	.float 3.0
PNS:	.float 0.97
YRES:	.float 0.02925 
.text
	mtc1 $zero, $f18	#Define um zero em float
	la $t1, NUMx		#t1 = 320
	la $t0, NUMy		#t0 = 129
	l.s $f11, UM		#f11 = 1.0
	l.s $f16, ZPSC		#f16 = 0.75
	l.s $f8, CINCO		#f8 = 5.0
	l.s $f9, MEIO		#f9 = 0.5
	l.s $f19, DOIS		#f19 = 2.0
	l.s $f22, TRES		#f22 = 3.0
	l.s $f15, PNS		#f15 = 0.97
	addi $t3, $t1, 1	
	l.s $f24, LINF		#f24 = LINF
	l.s $f25, LSUP		#f25 = LSUP
	l.s $f4, NUMX		#f4 = NUMX
	l.s $f5, NUMY 		#f5 = NUMY
	sub.s $f26, $f25, $f24	#Resolução de X
	div.s $f26, $f26, $f4	#Resolução de X
	l.s $f30, YRES
	j PRINT			#PROCEDIMENTO PRINT
	

	
EXIT:	li $v0,10		#Encerra o programa
	syscall
	
#		xF20	F17	F21	xF13	xF6	xF7
FUNCAO:	c.lt.s X, $f24
	bc1t E1
	c.lt.s $f25, X
	bc1t E1
	abs.s $f10, X
	sub.s $f6, $f22, $f10
	abs.s $f6, $f6
	sub.s $f7, $f10, $f11
	sub.s $f13, $f22, $f10
	mul.s $f7, $f13, $f7
	div.s $f6, $f6, $f7
	sub.s $f7, $f10, $f11
	abs.s $f7, $f7
	mfc1 $s3, $f7
	ori $s3, $s3, 0x80000000
	mtc1 $s3, $f7
	mul.s $f6, $f7, $f6
	sqrt.s $f6, $f6
	mul.s $f6, $f6, $f19
	sub.s $f7, $f10, $f22
	abs.s $f7, $f7
	sub.s $f13, $f10, $f22
	div.s $f7, $f7, $f13
	add.s $f7, $f7, $f11
	div.s $f20, X, $f25
	mul.s $f20, $f20, $f20
	sub.s $f20, $f11, $f20
	sqrt.s $f20, $f20
	mul.s $f6, $f6, $f7
	mul.s $f6, $f6, $f20
	add.s $f7, X, $f9
	abs.s $f7, $f7
	sub.s $f13, X, $f9
	abs.s $f13, $f13
	add.s $f7, $f7, $f13
	mul.s $f7, $f7, $f15
	add.s $f7, $f7, $f8
	add.s $f20, X, $f16
	abs.s $f20, $f20
	sub.s $f13, X, $f16
	abs.s $f13, $f13
	add.s $f20, $f20, $f13
	mul.s $f20, $f20, $f22
	sub.s $f7, $f7, $f20
	sub.s $f13, $f11, $f10
	abs.s $f13, $f13
	sub.s $f20, $f11, $f10
	div.s $f13, $f13, $f20
	add.s $f13, $f13, $f11
	mul.s $f7, $f7, $f13
	add.s Y, $f6, $f7
	
	jr $ra			#Retorna pra PC+4
	
E1:	li $t5, 0xFF		#Para NaN, plotar em branco
	jr $ra			#Retorna pra PC+4 (caso X seja 1.5)
	
	
PRINT:	mov.s X, $f24		#Reseta X
	mul $t2, $t2, 0
	c.eq.s X, $f25		#Condições de Loop
	bc1f PLOT		#Se X != LSUP, executa plot	
	j EXIT
	
PLOT:	la $s0, VGA		#s0 = endereço da VGA
L1:	li $t5,0x7		#Cor vermelha
	jal FUNCAO		#Calcula a função
	div.s Y, Y, $f30	#Ajusta a resolução de Y
	c.lt.s Y, $f18		#Se Y<0, vá para L3
	bc1t L3
	cvt.w.s Y, Y		#Converte Y de float para word
	mfc1 $t4, Y		#Copia Y para t4
	sub $t4, $t0, $t4	#Ajusta Y para começar do (129,0) ou (239,0), não do (0,0)
	mul $t4, $t4, $t1	#320*Y
	add $t4, $t4, $t2	# +X
	slti $t7, $t4, 0	#Não pintar caso o byte calculado seja anterior ao inicio de 0xFF000000
	beqz $t7, DRAW		
	c.le.s $f25, X		#Condições de Loop
	bc1t EXIT
	addi $t2, $t2, 1	#t2 = t2 + 1
	add.s X, X, $f26	#X = X + Resolução em X
	j L1

#O meio da tela é o eixo X, ou seja Y =0. Caso Y seja menor que zero, o ajuste do offset é (129 + módulo de Y*Resolução_Y)(L3)
#Caso Y seja maior que zero, o ajuste de offset é 129 - (Y*resolução de Y)

L3:	abs.s Y, Y		#Tira o módulo de Y
	cvt.w.s Y, Y		#Converte Y de float para word
	mfc1 $t4, Y		#Copia Y para t4
	add $t4, $t0, $t4	#Ajusta Y para começar do (129,0) ou (239,0), não do (0,0)
	mul $t4, $t4, $t1	#320*Y
	add $t4, $t4, $t2	# +X
	slti $t7, $t4, 0	#Não pintar caso o byte calculado seja anterior ao inicio de 0xFF000000
	beqz $t7, DRAW
	c.le.s $f25, X		#Condições de Loop
	bc1t EXIT
	addi $t2, $t2, 1	#t2 = t2 + 1
	add.s X, X, $f26	#X = X + Resolução em X
	j L1
	
DRAW:	add $t4, $s0, $t4	#Desenha o gráfico
	sb $t5, 0($t4)
	c.le.s $f25, X		#Condições de Loop
	bc1t EXIT
	addi $t2, $t2, 1	#t2 = t2 + 1
	add.s X, X, $f26	#X = X + Resolução em X
	j L1
