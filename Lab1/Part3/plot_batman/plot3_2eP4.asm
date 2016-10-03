.eqv VGA 0xFF000000		#ENDERE�O DA VGA
.eqv X $f0			#DEFINE X = $F20
.eqv Y $f12			#DEFINE Y = $F21
.eqv ZERO $f18
.eqv NUMx 320			#DEFINE NUMx = 320
.eqv NUMy 129			#DEFINE NUMy = 240

.data				#DECLARA VARI�VEIS
LINF:   .float -7.0		#Colocar aqui LINF
LSUP:   .float 7.0		#Colocar aqui LSUP
NUMX:  .float 320.0
NUMY:  .float 240.0
UM:	.float 1.0		#Declarar aqui n�meros utilizados em sua fun��o
PZZN:	.float 0.0914
DOIS:	.float 2.0
TRES:	.float 3.0
QUATRO: .float 4.0
MQUATRO: .float -4.0
YRES:	.float 0.02925
.text
	mtc1 $zero, $f18	#Define um zero em float
	la $t1, NUMx		#t1 = 320
	la $t0, NUMy		#t0 = 129
	l.s $f11, UM		#f11 = 1.0
	l.s $f27, PZZN		#f27 = 0.009
	l.s $f19, DOIS		#f19 = 2.0
	l.s $f16, TRES
	l.s $f8, QUATRO
	l.s $f9, MQUATRO
	addi $t3, $t1, 1	
	l.s $f24, LINF		#f24 = LINF
	l.s $f25, LSUP		#f25 = LSUP
	l.s $f4, NUMX		#f4 = NUMX
	l.s $f5, NUMY 		#f5 = NUMY
	sub.s $f26, $f25, $f24	#Resolu��o de X
	div.s $f26, $f26, $f4	#Resolu��o de X
	l.s $f30, YRES
	j PRINT			#PROCEDIMENTO PRINT

	
EXIT:	li $v0,10		#Encerra o programa
	syscall
	
#		xF6	F7	F8	F9
	#INSERIR AQUI A FUN��O. CASO EXISTAM N�MEROS IMAGIN�RIOS NA IMAGEM DA FUN��O
	#PARA O DOM�NIO SELECIONADO, REDIRECIONAR CASOS PARA O LABEL E1
	#RECEBE X EM $F0 E RETORNA Y EM $F12
FUNCAO:	c.lt.s X, $f9
	bc1t E1
	c.lt.s $f8, X
	bc1t E1
	abs.s $f17, X
	div.s $f6, X, $f19
	abs.s $f6, $f6
	mul.s $f7, X, X
	mul.s $f7, $f7, $f27
	sub.s $f6, $f6, $f7
	sub.s $f6, $f6, $f16
	sub.s $f7, $f17, $f19
	abs.s $f7, $f7
	sub.s $f7, $f7, $f11
	mul.s $f7, $f7, $f7
	sub.s $f7, $f11, $f7
	sqrt.s $f7, $f7
	add.s Y, $f7, $f6
	jr $ra			#Retorna pra PC+4
E1:	li $t5, 0xFF		#Para NaN, plotar em branco
	jr $ra			#Retorna pra PC+4 (caso X seja 1.5)
	
PRINT:	mov.s X, $f24		#Reseta X
	mul $t2, $t2, 0
	c.eq.s X, $f25		#Condi��es de Loop
	bc1f PLOT		#Se X != LSUP, executa plot	
	j EXIT
	
PLOT:	la $s0, VGA		#s0 = endere�o da VGA
L1:	li $t5,0x7		#Cor vermelha
	jal FUNCAO		#Calcula a fun��o
	div.s Y, Y, $f30	#Ajusta a resolu��o de Y
	c.lt.s Y, $f18		#Se Y<0, v� para L3
	bc1t L3
	cvt.w.s Y, Y		#Converte Y de float para word
	mfc1 $t4, Y		#Copia Y para t4
	sub $t4, $t0, $t4	#Ajusta Y para come�ar do (129,0), n�o do (0,0)
	mul $t4, $t4, $t1	#320*Y
	add $t4, $t4, $t2	# +X
	slti $t7, $t4, 0	#N�o pintar caso o byte calculado seja anterior ao inicio de 0xFF000000
	beqz $t7, DRAW		
	c.le.s $f25, X		#Condi��es de Loop
	bc1t EXIT
	addi $t2, $t2, 1	#t2 = t2 + 1
	add.s X, X, $f26	#X = X + Resolu��o em X
	j L1

#O meio da tela � o eixo X, ou seja Y =0. Caso Y seja menor que zero, o ajuste do offset � (129 + m�dulo de Y*Resolu��o_Y)(L3)
#Caso Y seja maior que zero, o ajuste de offset � 129 - (Y*resolu��o de Y)

L3:	abs.s Y, Y		#Tira o m�dulo de Y
	cvt.w.s Y, Y		#Converte Y de float para word
	mfc1 $t4, Y		#Copia Y para t4
	add $t4, $t0, $t4	#Ajusta Y para come�ar do (129,0) ou (239,0), n�o do (0,0)
	mul $t4, $t4, $t1	#320*Y
	add $t4, $t4, $t2	# +X
	slti $t7, $t4, 0	#N�o pintar caso o byte calculado seja anterior ao inicio de 0xFF000000
	beqz $t7, DRAW
	c.le.s $f25, X		#Condi��es de Loop
	bc1t EXIT
	addi $t2, $t2, 1	#t2 = t2 + 1
	add.s X, X, $f26	#X = X + Resolu��o em X
	j L1
	
DRAW:	add $t4, $s0, $t4	#Desenha o gr�fico
	sb $t5, 0($t4)
	c.le.s $f25, X		#Condi��es de Loop
	bc1t EXIT
	addi $t2, $t2, 1	#t2 = t2 + 1
	add.s X, X, $f26	#X = X + Resolu��o em X
	j L1
