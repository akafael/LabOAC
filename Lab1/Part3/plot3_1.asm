.eqv VGA 0xFF000000		#ENDERE�O DA VGA
.eqv X $f0			#DEFINE X = $F20
.eqv Y $f12			#DEFINE Y = $F21
.eqv ZERO $f18
.eqv NUMx 320			#DEFINE NUMx = 320
.eqv NUMy 129			#DEFINE NUMy = 240

.data				#DECLARA VARI�VEIS
LINF:   .float xxxx		#Colocar aqui LINF
LSUP:   .float xxxx		#Colocar aqui LSUP
NUMX:  .float 320.0
NUMY:  .float 240.0
UM:	.float 1.0		#Declarar aqui n�meros utilizados em sua fun��o
MEIOUM:	.float 1.5
.text
	mtc1 $zero, $f18	#Define um zero em float
	la $t1, NUMx		#t1 = 320
	la $t0, NUMy		#t0 = 129
	l.s $f11, UM		#f11 = 1.0
	l.s $f27, MEIOUM	#f27 = 1.5
	addi $t3, $t1, 1	
	l.s $f24, LINF		#f24 = LINF
	l.s $f25, LSUP		#f25 = LSUP
	l.s $f4, NUMX		#f4 = NUMX
	l.s $f5, NUMY 		#f5 = NUMY
	sub.s $f26, $f25, $f24	#Resolu��o de X
	div.s $f26, $f26, $f4	#Resolu��o de X
	j LIMITS		#Calcula o m�ximo e o m�nimo real da fun��o
L2:	c.le.s $f18, $f30	#Verifica se Ymin � menor que zero
	bc1t Y0 		
	sub.s $f30, $f31, $f30	#Resolu��o de Y
	div.s $f30, $f30, $f5	#Resolu��o de Y
	j PRINT			#PROCEDIMENTO PRINT
	
Y0:	mul $t0, $t0, $zero	#Reajusta o offset para Y come�ar em 239, 0
	addi $t0, $t0, 239
	sub.s $f30, $f31, $f30	#Resolu��o de Y
	div.s $f30, $f30, $f5	#Resolu��o de Y
	j PRINT			#PROCEDIMENTO PRINT
	
EXIT:	li $v0,10		#Encerra o programa
	syscall
	

FUNCAO:	#INSERIR AQUI A FUN��O. CASO EXISTAM N�MEROS IMAGIN�RIOS NA IMAGEM DA FUN��O
	#PARA O DOM�NIO SELECIONADO, REDIRECIONAR CASOS PARA O LABEL E1
	
	#RECEBE X EM $F0 E RETORNA Y EM $F12
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
	sub $t4, $t0, $t4	#Ajusta Y para come�ar do (129,0) ou (239,0), n�o do (0,0)
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

	
LIMITS:	add.s X, $f24, X	# X = X + Linf
	jal FUNCAO		#Calcula a funcao
	mtc1 $zero, X		#Certifica que X � 0
	add.s $f30, ZERO, Y	#Calcula o primeiro YMIN
	add.s $f31, ZERO, Y	#Calcula o primeiro YMAX
	
	add.s X, $f24, X	# X = X + Linf
LOOP:	jal FUNCAO		#Calcula a fun��o
	c.le.s Y, $f30		#se Y<=YMIN 
	bc1t YMIN
	c.le.s $f31, Y		#se YMAX<= Y
	bc1t YMAX
	c.le.s $f25, X		#Condi��es de Loop
	bc1t L2
	add.s X, X, $f26
	j LOOP
	
YMIN:	mov.s $f30, Y		#Y = YMIN
	c.le.s $f25, X		#Condi��es de Loop
	bc1t L2
	add.s X, X, $f26
	j LOOP

YMAX:	mov.s $f31, Y		#Y = YMAX
	c.le.s $f25, X		#Condi��es de Loop
	bc1t L2
	add.s X, X, $f26
	j LOOP	