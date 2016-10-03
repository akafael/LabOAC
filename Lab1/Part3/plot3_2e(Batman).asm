#PLOTADOR DO SÍMBOLO DO BATMAN DE 1998
#O PROFRAMA CONSISTE DE 4 PROGRAMAS UNIDOS EM UM SÓ
#CADA SUBPROGRAMA CONSISTE EM UM PLOT DE UMA PARTE DO SÍMBOLO

.eqv VGA 0xFF000000		#ENDEREÇO DA VGA
.eqv X $f0			#DEFINE X = $F0
.eqv Y $f12			#DEFINE Y = $F12
.eqv NUMx 320			#DEFINE NUMx = 320
.eqv NUMy 129			#DEFINE NUMy = 240

.data				#DECLARA VARIÁVEIS E CONSTANTES
LINF:   .float -7.0		
LSUP:   .float 7.0		
NUMX:  	.float 320.0
NUMY:  	.float 240.0
UM:	.float 1.0		
MEIO:	.float 0.5
ZPSC:	.float 0.75
UPTS:	.float 1.3553
UEM:	.float 1.5
QUATRO: .float 4.0
DSU:	.float 2.71
MTRES:  .float -3.0
MUM:	.float -1.0
PN:	.float 0.9
MQUATRO: .float -4.0
SETE:	.float 7.0
PZZN:	.float 0.0914
CINCO:	.float 5.0
DOIS:	.float 2.0
TRES:	.float 3.0
PNS:	.float 0.97
YRES:	.float 0.02925

#SUBPROGRAMA 1

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
	
FUNCAO:	abs.s $f10, X		#2*sqrt(-||x|-1|*|3-|x||/((|x|-1)*(3-|x|)))(1+||x|-3|/(|x|-3))sqrt(1-(x/7)²)+
	sub.s $f6, $f22, $f10	#(5+0.97*(|x-0.5|+|x+0.5|)-3(|x-0.75|+|x+0.75|))(1+|1-|x||/(1-|x|))
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
	j P2
	
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
	bc1t P2
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
	bc1t P2
	addi $t2, $t2, 1	#t2 = t2 + 1
	add.s X, X, $f26	#X = X + Resolução em X
	j L1
	
DRAW:	add $t4, $s0, $t4	#Desenha o gráfico
	sb $t5, 0($t4)
	c.le.s $f25, X		#Condições de Loop
	bc1t P2
	addi $t2, $t2, 1	#t2 = t2 + 1
	add.s X, X, $f26	#X = X + Resolução em X
	j L1



###############################################################################################################
#SUBPROGRAMA 2
	
P2:	andi $t2, $t2, 0	#Reseta t2
	l.s $f11, UM		#f11 = 1.0
	l.s $f16, MTRES		#f16 = -3.0
	l.s $f8, QUATRO		#f8 = 4.0
	l.s $f19, UPTS		#f19 = 1.36
	l.s $f9, MEIO
	l.s $f20, UEM		#f20 = 1.5
	l.s $f21, DSU		#f21 = 2.71
	l.s $f22, TRES		#f22 = 3.0
	l.s $f17, MUM		#f17 = -1.0
	l.s $f15, PN		#f15 = 0.97
	addi $t3, $t1, 1	
	l.s $f24, LINF		#f24 = LINF
	l.s $f25, LSUP		#f25 = LSUP
	l.s $f4, NUMX		#f4 = NUMX
	l.s $f5, NUMY 		#f5 = NUMY
	sub.s $f26, $f25, $f24	#Resolução de X
	div.s $f26, $f26, $f4	#Resolução de X
	l.s $f30, YRES
	j PRINT_2		#PROCEDIMENTO PRINT
	

FUNCAO_2:c.lt.s X, $f16		#Verifica se a função 2 está no domínio real
	bc1t E1_2		
	c.lt.s $f22, X
	bc1t E1_2
	c.lt.s X, $f11
	bc1t E2_2
BACK_2:	abs.s $f10, X		#(2.7105 + 1.5 - 0.5abs(x) - 1.3553sqrt(4 - (abs(x) - 1)²))*
	sub.s $f6,  $f10, $f11	# sqrt(abs(abs(x) - 1) / (abs(x) - 1)) + 0.9
	mul.s $f6, $f6, $f6
	sub.s $f6, $f8, $f6
	sqrt.s $f6, $f6
	mul.s $f6, $f6, $f19
	mul.s $f7, $f10, $f9
	sub.s $f7, $f20, $f7
	add.s $f7, $f7, $f21
	sub.s $f6, $f7, $f6
	sub.s $f7, $f10, $f11
	abs.s $f7, $f7
	sub.s $f13, $f10, $f11
	div.s $f7, $f7, $f13
	sqrt.s $f7, $f7
	mul.s Y, $f7, $f6
	add.s Y, Y, $f15
	jr $ra			#Retorna pra PC+4
	
E1_2:	li $t5, 0xFF		#Para NaN, plotar em branco
	jr $ra			#Retorna pra PC+4 (caso X seja 1.5)
	
E2_2:	c.lt.s $f17, X
	bc1f BACK_2
	bc1t E1_2
	
PRINT_2:mov.s X, $f24		#Reseta X
	mul $t2, $t2, 0
	c.eq.s X, $f25		#Condições de Loop
	bc1f PLOT_2		#Se X != LSUP, executa plot	
	j P3
	
PLOT_2:	la $s0, VGA		#s0 = endereço da VGA
L1_2:	li $t5,0x7		#Cor vermelha
	jal FUNCAO_2		#Calcula a função
	div.s Y, Y, $f30	#Ajusta a resolução de Y
	c.lt.s Y, $f18		#Se Y<0, vá para L3
	bc1t L3_2
	cvt.w.s Y, Y		#Converte Y de float para word
	mfc1 $t4, Y		#Copia Y para t4
	sub $t4, $t0, $t4	#Ajusta Y para começar do (129,0) ou (239,0), não do (0,0)
	mul $t4, $t4, $t1	#320*Y
	add $t4, $t4, $t2	# +X
	slti $t7, $t4, 0	#Não pintar caso o byte calculado seja anterior ao inicio de 0xFF000000
	beqz $t7, DRAW_2		
	c.le.s $f25, X		#Condições de Loop
	bc1t P3
	addi $t2, $t2, 1	#t2 = t2 + 1
	add.s X, X, $f26	#X = X + Resolução em X
	j L1_2

#O meio da tela é o eixo X, ou seja Y =0. Caso Y seja menor que zero, o ajuste do offset é (129 + módulo de Y*Resolução_Y)(L3)
#Caso Y seja maior que zero, o ajuste de offset é 129 - (Y*resolução de Y)

L3_2:	abs.s Y, Y		#Tira o módulo de Y
	cvt.w.s Y, Y		#Converte Y de float para word
	mfc1 $t4, Y		#Copia Y para t4
	add $t4, $t0, $t4	#Ajusta Y para começar do (129,0) ou (239,0), não do (0,0)
	mul $t4, $t4, $t1	#320*Y
	add $t4, $t4, $t2	# +X
	slti $t7, $t4, 0	#Não pintar caso o byte calculado seja anterior ao inicio de 0xFF000000
	beqz $t7, DRAW_2
	c.le.s $f25, X		#Condições de Loop
	bc1t P3
	addi $t2, $t2, 1	#t2 = t2 + 1
	add.s X, X, $f26	#X = X + Resolução em X
	j L1_2
	
DRAW_2:	add $t4, $s0, $t4	#Desenha o gráfico
	sb $t5, 0($t4)
	c.le.s $f25, X		#Condições de Loop
	bc1t P3
	addi $t2, $t2, 1	#t2 = t2 + 1
	add.s X, X, $f26	#X = X + Resolução em X
	j L1_2
	
##################################################################################################
#SUBPROGRAMA 3

P3:	andi $t2, $t2, 0	#Reseta t2
	l.s $f11, UM		#f11 = 1.0
	l.s $f27, SETE		#f27 = 7.0
	l.s $f16, MTRES		#f16 = -3.0
	l.s $f8, QUATRO		#f8 = 4.0
	l.s $f9, MQUATRO	#f9 = -4.0
	addi $t3, $t1, 1	
	l.s $f24, LINF		#f24 = LINF
	l.s $f25, LSUP		#f25 = LSUP
	l.s $f4, NUMX		#f4 = NUMX
	l.s $f5, NUMY 		#f5 = NUMY
	sub.s $f26, $f25, $f24	#Resolução de X
	div.s $f26, $f26, $f4	#Resolução de X
	l.s $f30, YRES
	j PRINT_3		#PROCEDIMENTO PRINT
	

FUNCAO_3:c.lt.s X, $f24		#Verifica se a função 3 está no domínio real
	bc1t E1_3
	c.lt.s $f27, X
	bc1t E1_3
	c.lt.s X, $f8
	bc1t E2_3
BACK_3:	div.s $f6, X, $f27	#-3*sqrt(1 - (x / 7)²)* sqrt(abs(abs(x) - 4) / (abs(x) - 4))
	mul.s $f6, $f6, $f6
	sub.s $f6, $f11, $f6
	sqrt.s $f6, $f6
	mul.s $f6, $f16, $f6
	abs.s $f17, X
	sub.s $f7, $f17, $f8
	abs.s $f7, $f7
	sub.s $f19, $f17, $f8
	div.s $f7, $f7, $f19
	sqrt.s $f7, $f7
	mul.s Y, $f6, $f7
	
	jr $ra			#Retorna pra PC+4
E1_3:	li $t5, 0xFF		#Para NaN, plotar em branco
	jr $ra			#Retorna pra PC+4 (caso X seja 1.5)
	
E2_3:	c.lt.s $f9, X
	bc1f BACK_3
	bc1t E1_3
PRINT_3:mov.s X, $f24		#Reseta X
	mul $t2, $t2, 0
	c.eq.s X, $f25		#Condições de Loop
	bc1f PLOT_3		#Se X != LSUP, executa plot	
	j P4
	
PLOT_3:	la $s0, VGA		#s0 = endereço da VGA
L1_3:	li $t5,0x7		#Cor vermelha
	jal FUNCAO_3		#Calcula a função
	div.s Y, Y, $f30	#Ajusta a resolução de Y
	c.lt.s Y, $f18		#Se Y<0, vá para L3
	bc1t L3_3
	cvt.w.s Y, Y		#Converte Y de float para word
	mfc1 $t4, Y		#Copia Y para t4
	sub $t4, $t0, $t4	#Ajusta Y para começar do (129,0) ou (239,0), não do (0,0)
	mul $t4, $t4, $t1	#320*Y
	add $t4, $t4, $t2	# +X
	slti $t7, $t4, 0	#Não pintar caso o byte calculado seja anterior ao inicio de 0xFF000000
	beqz $t7, DRAW_3		
	c.le.s $f25, X		#Condições de Loop
	bc1t P4
	addi $t2, $t2, 1	#t2 = t2 + 1
	add.s X, X, $f26	#X = X + Resolução em X
	j L1

#O meio da tela é o eixo X, ou seja Y =0. Caso Y seja menor que zero, o ajuste do offset é (129 + módulo de Y*Resolução_Y)(L3)
#Caso Y seja maior que zero, o ajuste de offset é 129 - (Y*resolução de Y)

L3_3:	abs.s Y, Y		#Tira o módulo de Y
	cvt.w.s Y, Y		#Converte Y de float para word
	mfc1 $t4, Y		#Copia Y para t4
	add $t4, $t0, $t4	#Ajusta Y para começar do (129,0) ou (239,0), não do (0,0)
	mul $t4, $t4, $t1	#320*Y
	add $t4, $t4, $t2	# +X
	slti $t7, $t4, 0	#Não pintar caso o byte calculado seja anterior ao inicio de 0xFF000000
	beqz $t7, DRAW_3
	c.le.s $f25, X		#Condições de Loop
	bc1t P4
	addi $t2, $t2, 1	#t2 = t2 + 1
	add.s X, X, $f26	#X = X + Resolução em X
	j L1_3
	
DRAW_3:	add $t4, $s0, $t4	#Desenha o gráfico
	sb $t5, 0($t4)
	c.le.s $f25, X		#Condições de Loop
	bc1t P4
	addi $t2, $t2, 1	#t2 = t2 + 1
	add.s X, X, $f26	#X = X + Resolução em X
	j L1_3

#######################################################################################################################
#SUPROGRAMA 4

P4:	andi $t2, $t2, 0	#Reseta t2
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
	sub.s $f26, $f25, $f24	#Resolução de X
	div.s $f26, $f26, $f4	#Resolução de X
	l.s $f30, YRES
	j PRINT_4		#PROCEDIMENTO PRINT

	
EXIT:	li $v0,10		#Encerra o programa
	syscall

FUNCAO_4:c.lt.s X, $f9		#Verifica se a função 4 estã no domínio real
	bc1t E1_4
	c.lt.s $f8, X
	bc1t E1
	abs.s $f17, X		#abs(x / 2) - 0.0914x² - 3 + sqrt(1 - (abs(abs(x) - 2) - 1)²)
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
E1_4:	li $t5, 0xFF		#Para NaN, plotar em branco
	jr $ra			#Retorna pra PC+4 (caso X seja 1.5)
	
PRINT_4:mov.s X, $f24		#Reseta X
	mul $t2, $t2, 0
	c.eq.s X, $f25		#Condições de Loop
	bc1f PLOT_4		#Se X != LSUP, executa plot	
	j EXIT
	
PLOT_4:	la $s0, VGA		#s0 = endereço da VGA
L1_4:	li $t5,0x7		#Cor vermelha
	jal FUNCAO_4		#Calcula a função
	div.s Y, Y, $f30	#Ajusta a resolução de Y
	c.lt.s Y, $f18		#Se Y<0, vá para L3
	bc1t L3_4
	cvt.w.s Y, Y		#Converte Y de float para word
	mfc1 $t4, Y		#Copia Y para t4
	sub $t4, $t0, $t4	#Ajusta Y para começar do (129,0), não do (0,0)
	mul $t4, $t4, $t1	#320*Y
	add $t4, $t4, $t2	# +X
	slti $t7, $t4, 0	#Não pintar caso o byte calculado seja anterior ao inicio de 0xFF000000
	beqz $t7, DRAW_4	
	c.le.s $f25, X		#Condições de Loop
	bc1t EXIT
	addi $t2, $t2, 1	#t2 = t2 + 1
	add.s X, X, $f26	#X = X + Resolução em X
	j L1_4

#O meio da tela é o eixo X, ou seja Y =0. Caso Y seja menor que zero, o ajuste do offset é (129 + módulo de Y*Resolução_Y)(L3)
#Caso Y seja maior que zero, o ajuste de offset é 129 - (Y*resolução de Y)

L3_4:	abs.s Y, Y		#Tira o módulo de Y
	cvt.w.s Y, Y		#Converte Y de float para word
	mfc1 $t4, Y		#Copia Y para t4
	add $t4, $t0, $t4	#Ajusta Y para começar do (129,0) ou (239,0), não do (0,0)
	mul $t4, $t4, $t1	#320*Y
	add $t4, $t4, $t2	# +X
	slti $t7, $t4, 0	#Não pintar caso o byte calculado seja anterior ao inicio de 0xFF000000
	beqz $t7, DRAW_4
	c.le.s $f25, X		#Condições de Loop
	bc1t EXIT
	addi $t2, $t2, 1	#t2 = t2 + 1
	add.s X, X, $f26	#X = X + Resolução em X
	j L1_4
	
DRAW_4:	add $t4, $s0, $t4	#Desenha o gráfico
	sb $t5, 0($t4)
	c.le.s $f25, X		#Condições de Loop
	bc1t EXIT
	addi $t2, $t2, 1	#t2 = t2 + 1
	add.s X, X, $f26	#X = X + Resolução em X
	j L1_4
