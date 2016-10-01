.eqv VGA 0xFF000000		#ENDEREÇO DA VGA
.eqv X $f0			#DEFINE X = $F20
.eqv Y $f12			#DEFINE Y = $F21
.eqv NUMx 320			#DEFINE NUMx = 320
.eqv NUMy 239			#DEFINE NUMy = 240

.data				#DECLARA VARIÁVEIS
LINF:   .float -1.0
LSUP:   .float 10.0
NUMX:  .float 320.0
NUMY:  .float 240.0

.text
	mtc1 $zero, $f18	#Define um zero em float
	la $t1, NUMx		#t1 = 320
	la $t0, NUMy		#t0 = 240
	addi $t3, $t1, 1	
	l.s $f24, LINF		#f24 = LINF
	l.s $f25, LSUP		#f25 = LSUP
	l.s $f4, NUMX		#f4 = NUMX
	l.s $f5, NUMY 		#f5 = NUMY
	div.s $f26, $f25, $f4	#Resolução de X
	j LIMITS		#Calcula o máximo e o mínimo real da função
L2:	sub.s $f30, $f31, $f30	#Resolução de Y
	div.s $f30, $f30, $f5	
	j PRINT			#PROCEDIMENTO PRINT
	
EXIT:	li $v0,10		#Encerra o programa
	syscall
	
FUNCAO:	c.lt.s  X, $f18		#Separa NaN de números reais
	bc1t E1			
	sqrt.s Y, X		#Função da letra C
	jr $ra
E1:	mov.s Y, $f18		#Caso NaN, plota no zero, na cor verde
	li $t5,0x38		
	jr $ra
	
PRINT:	andi $t2, $t2, 0	#Reseta X
L1:	bne $t3, $t2,PLOT	#Se t3 != t2, executa plot	
	j EXIT
	
PLOT:	li $t5,0x7
	la $s0, VGA		#s0 = endereço da VGA
	mtc1 $t2, X		#Passa t2 para CP1(FP)
	cvt.s.w X, X		#Converte X para float
	mul.s X, X, $f26	#Ajusta a resolução de X
	add.s X, X, $f24	#Ajusta X para começar do LInf
	jal FUNCAO		#Calcula a função	
	div.s Y, Y, $f30	#Ajusta a resolução de Y
	cvt.w.s Y, Y		#Converte Y de float para word
	mfc1 $t4, Y		#Copia Y para t4
	sub $t4, $t0, $t4	#Ajusta Y para começar do (240,0), não do (0,0)
	mul $t4, $t4, $t1	#320*Y
	add $t4, $t4, $t2	# +X
	slti $t7, $t4, 0	#Não pintar caso o byte calculado seja anterior ao inicio de 0xFF000000
	beqz $t7, DRAW		
	addi $t2, $t2, 1
	j L1
	
DRAW:	add $t4, $s0, $t4	#Desenha o gráfico
	sb $t5, 0($t4)
	addi $t2, $t2, 1
	j L1

	
LIMITS:	mtc1 $t2, X		#t2 varia de 0 a 319, move t2 para o registrador FP X
	cvt.s.w X, X		#Converte para FP
	add.s X, $f24, X	# X = X + Linf
	mul.s X, $f26, X	#X = X * Resolução de X
	jal FUNCAO		#Calcula a funcao
	mtc1 $zero, X
	add.s $f30, $f18, Y	#Calcula o primeiro YMIN
	add.s $f31, $f18, Y	#Calcula o primeiro YMAX
	
LOOP:	mtc1 $t2, X		#t2 varia de 0 a 319, move t2 para o registrador FP X
	cvt.s.w X, X		#Converte para FP
	add.s X, $f24, X	# X = X + Linf
	mul.s X, $f26, X	#X = X * Resolução de X
	jal FUNCAO		#Calcula a função

	c.le.s Y, $f30		#se Y<=YMIN 
	bc1t YMIN
	c.le.s $f31, Y		#se YMAX<= Y
	bc1t YMAX
	addi $t2, $t2, 1
	j LOOP
	
YMIN:	mov.s $f30, Y		#Y = YMIN
	beq $t3, $t2, L2	#Condições de Loop
	addi $t2, $t2, 1
	j LOOP

YMAX:	mov.s $f31, Y		#Y = YMAX
	beq $t3, $t2, L2	#Condições de loop
	addi $t2, $t2, 1
	j LOOP	
