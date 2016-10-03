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
UPTS:	.float 1.3553
UEM:	.float 1.5
QUATRO: .float 4.0
DSU:	.float 2.71
MTRES:  .float -3.0
TRES:	.float 3.0
MUM:	.float -1.0
PN:	.float 0.9
YRES:	.float 0.02925
.text
	mtc1 $zero, $f18	#Define um zero em float
	la $t1, NUMx		#t1 = 320
	la $t0, NUMy		#t0 = 129
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
	j PRINT			#PROCEDIMENTO PRINT
	

	
EXIT:	li $v0,10		#Encerra o programa
	syscall
	
	#INSERIR AQUI A FUNÇÃO. CASO EXISTAM NÚMEROS IMAGINÁRIOS NA IMAGEM DA FUNÇÃO
	#PARA O DOMÍNIO SELECIONADO, REDIRECIONAR CASOS PARA O LABEL E1
	#RECEBE X EM $F0 E RETORNA Y EM $F12
#		xF6	xF7	xF8	xF9	xF17	xF10	xF13	xF15	F27
FUNCAO:	c.lt.s X, $f16
	bc1t E1
	c.lt.s $f22, X
	bc1t E1
	c.lt.s X, $f11
	bc1t E2
BACK:	abs.s $f10, X
	sub.s $f6,  $f10, $f11
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
	
E1:	li $t5, 0xFF		#Para NaN, plotar em branco
	jr $ra			#Retorna pra PC+4 (caso X seja 1.5)
	
E2:	c.lt.s $f17, X
	bc1f BACK
	bc1t E1
	
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
