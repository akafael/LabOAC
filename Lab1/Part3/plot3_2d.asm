.eqv VGA 0xFF000000		#ENDEREÇO DA VGA
.eqv X $f0			#DEFINE X = $F20
.eqv Y $f12			#DEFINE Y = $F21
.eqv ZERO $f18
.eqv NUMx 320			#DEFINE NUMx = 320
.eqv NUMy 129			#DEFINE NUMy = 240

.data				#DECLARA VARIÁVEIS
LINF:   .float -2.0
LSUP:   .float 3.0
NUMX:  .float 320.0
NUMY:  .float 240.0
UM:	.float 1.0
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
	sub.s $f26, $f25, $f24	#Resolução de X
	div.s $f26, $f26, $f4	#Resolução de X
	j LIMITS		#Calcula o máximo e o mínimo real da função
L2:	c.le.s $f18, $f30	#Verifica se Ymin é menor que zero
	bc1t Y0 		
	sub.s $f30, $f31, $f30	#Resolução de Y
	div.s $f30, $f30, $f5	#Resolução de Y
	j PRINT			#PROCEDIMENTO PRINT
	
Y0:	mul $t0, $t0, $zero	#Reajusta o offset para Y começar em 239, 0
	addi $t0, $t0, 239
	sub.s $f30, $f31, $f30	#Resolução de Y
	div.s $f30, $f30, $f5	#Resolução de Y
	j PRINT			#PROCEDIMENTO PRINT
	
EXIT:	li $v0,10		#Encerra o programa
	syscall
	
#LETRA b
FUNCAO:	c.eq.s X, $f27		#Se X atual for 1.5, ignore o plot
	bc1t E1			
	mov.s $f19, $f18	#Reseta os registradores utilizados temporariamente para calcular a função
	mov.s $f20, $f18
	mov.s $f21, $f18
	mov.s $f22, $f18
	add.s $f19, X, $f11	#(X+1)
	mul.s $f19, $f19, $f19	#(X+1)^2
	sub.s $f20, X, $f11	#(X-1)
	sub.s $f21, X, $f11	#(X-2)
	sub.s $f21, $f21, $f11	#também (X-2)
	sub.s $f22, X, $f27	#(X-1.5)
	mul.s Y, $f19, $f20	#(X+1)^2 *(X-1)
	mul.s Y, Y, $f21	#(X+1)^2 *(X-1)*(X-2)
	div.s Y, Y, $f22	#(X+1)^2 *(X-1)*(X-2)/(X-1.5)
	jr $ra			#Retorna pra PC+4
E1:	li $t5, 0xFF		#Define a cor branca, caso seja 1.5
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

	
LIMITS:	add.s X, $f24, X	# X = X + Linf
	jal FUNCAO		#Calcula a funcao
	mtc1 $zero, X		#Certifica que X é 0
	add.s $f30, ZERO, Y	#Calcula o primeiro YMIN
	add.s $f31, ZERO, Y	#Calcula o primeiro YMAX
	
	add.s X, $f24, X	# X = X + Linf
LOOP:	jal FUNCAO		#Calcula a função
	c.le.s Y, $f30		#se Y<=YMIN 
	bc1t YMIN
	c.le.s $f31, Y		#se YMAX<= Y
	bc1t YMAX
	c.le.s $f25, X		#Condições de Loop
	bc1t L2
	add.s X, X, $f26
	j LOOP
	
YMIN:	mov.s $f30, Y		#Y = YMIN
	c.le.s $f25, X		#Condições de Loop
	bc1t L2
	add.s X, X, $f26
	j LOOP

YMAX:	mov.s $f31, Y		#Y = YMAX
	c.le.s $f25, X		#Condições de Loop
	bc1t L2
	add.s X, X, $f26
	j LOOP	
