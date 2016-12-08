.data

#dimensoes da tela
SCREEN_WIDTH: 	.word 320
SCREEN_HEIGHT: 	.word 240

#limites para desenho do grafico
X_LINF: 	.float	-10
X_SUP: 		.float	10
Y_LINF:		.float	-8
Y_SUP:		.float	8

#cores dos eixos x e y
AXIS_COLOR: 	.word 0x06
GRAPH_COLOR:	.word 0x88

#posicao inicial da tela
MMIO: 		.word 0xff000000

#funçoes para plotar
FUNC1:		.word 0x10
FUNC2:		.word 0x20
FUNC3:		.word 0x30
FUNC4:		.word 0x40

#Batman e um conjunto de funçoes apenas necessario mandar plotar BATMANPT1 
BATMANPT1:	.word 0x50
BATMANPT2:	.word 0x51
BATMANPT3:	.word 0x52
BATMANPT4:	.word 0x53
BATMANPT5:	.word 0x54	

.text
main:
	#valores limites para o grafico
	lw $t7, FUNC1
	
InitiatePlot:
	la $t0, X_LINF
	lw $a0, 0($t0)
	la $t0, X_SUP
	lw $a1, 0($t0)
	la $t0, Y_LINF
	lw $a2, 0($t0)
	la $t0, Y_SUP
	lw $a3, 0($t0)
	
	addi $sp, $sp, -4
	add $t0, $zero, $t7 #load function em t1
	sw $t0, 0($sp)
	
	jal Desenhar_Eixos
	jal Plot
	
	addi $sp , $sp , 4
	
	li $a0,1000  
	li $v0,32
	syscall
	
	li $v0,48
	li $a0,0xFF
	syscall
	
	lw $t0, BATMANPT1
	beq $t0, $t7, main
	add $t7, $t7, 0x00000010
	
	j InitiatePlot
	
	j END

Plot:#($a0 = X_LINF,$a1 = X_SUP, $a2 = Y_LINF, $a3 = Y_SUP, $sp = FUNCTION)
	
	# nao e necessario salvar argumentos pois ficarao em cp1
	addi $sp , $sp, -4 
	sw $ra, 0($sp)
	
	#movemos valores de limites para c1
	mtc1 $a0, $f0
	mtc1 $a1, $f1
	mtc1 $a2, $f2
	mtc1 $a3, $f3
	
	#Colocamos valores das dimensoes em $f4 e $f5 320x240
	lw $s0, SCREEN_WIDTH
	mtc1 $s0, $f4
	lw $s1, SCREEN_HEIGHT
	mtc1 $s1, $f5
	
	#convertemos dimensoes da tela para float
	cvt.s.w $f4, $f4		# $f4 = SCREEN_WIDTH .float
	cvt.s.w $f5, $f5		# $f5 = SCREEN_HEIGHT .float
	
	#cor do grafico
	lw $s2, GRAPH_COLOR		# cor do eixo
	#MMIO adress
	lw $s3, MMIO
	#Passamos function para registrdor tambem salvo
	lw $s4, 4($sp) 
	
	INITIATE_LOOP:
	#iremos calcular o valor das distancias DELTA entre os pontos do eixo x
	#uma vez que estamos limitados ao intervalo em x de SCREEN_WIDTH
	sub.s $f6, $f1, $f0		# X_SUP - X_INF
	div.s $f6, $f6, $f4		# (X_SUP - X_INF) / SCREEN_WIDTH
					# $f6 contem nosso DELTA
	mov.s $f7, $f0			# $f7 sera o x inicial = X_INF 
	
	# indice ira percorrer eixo x calculando valores da funcao
	addi $t0, $zero, 0 		# j = 0
	
	LOOP_GRAPH:
		beq $t0, $s0, End_Plot
		
		mfc1 $a0, $f7		# Chamamos funcao passando parametro x
		add $a1, $zero,$s4	#FUNCTION para plot
		jal Function		# Espera se um retorno em ponto flutuante em $v0
		
		mtc1 $v0 , $f8		# y(x) em ponto flutuante
		
		# caso y nao esteja no intervalo desejado entao grafico estara fora dos limites
		# de y portanto podera nao ter um endereço fora dos limites caso seja calculado
		# Logo e necessario pular a rotina de plot na tela
		
		c.lt.s 0, $f8, $f2	
		bc1t 0, END_PLOT_SCREEN		# y(x) < Y_INF
		c.lt.s 0, $f8, $f3	
		bc1f 0, END_PLOT_SCREEN 	# y(x) > Y_SUP
			
		# calcular posicao relativa da linha 
		PLOT_SCREEN:
			sub.s $f9, $f3, $f8	# Y_SUP - y(x)
			sub.s $f10, $f3, $f2 	# Y_SUP - Y_INF
			div.s $f9 , $f9, $f10	# distancia em percentual da tela de Y_SUP a y(x)
		
			mul.s $f8 ,$f9, $f5	# distancia percentual * SCREEN_HEIGHT 
		
			# agora para armazenar valor do pixel
			cvt.w.s $f8, $f8	# y para int
			mfc1 $t2, $f8
			
			mult $t2 , $s0 	# y * SCREEN_WIDTH
			mflo $t2
			add $t1, $t2, $t0	# (y * SCREEN_WIDTH) + x
			add $t1, $t1, $s3	# (y * SCREEN_WIDTH + x ) + MMIO
		
			sb $s2, 0($t1)		# $s2 = GRAPH_COLOR
		END_PLOT_SCREEN:
		
		addi $t0, $t0, 1	# incrementamos 1 em j
		add.s $f7, $f7, $f6	# incrementamos delta em X
		j LOOP_GRAPH

	End_Plot:	
	lw $t0, BATMANPT1
	lw $t1, BATMANPT5
	sge $t0, $s4, $t0
	slt $t1 ,$s4, $t1
	and $t1, $t1, $t0 
	
	add $s4, $s4, 1		# Proxima funcao de batman, pois sao imediatas, identificador difere em 1 
	
	bne $t1, $zero, INITIATE_LOOP

	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra
	
#F(x) = -x
#retorno em ponto flutuante
Function:#($a0 = X, $a1 = FUNCTION)			
	addi $sp , $sp ,-24
	swc1 $f0, 0($sp)	# armazenamos $f0
	swc1 $f1, 4($sp)	# armazenamos $f1
	swc1 $f2, 8($sp)	# armazenamos $f2
	swc1 $f3, 12($sp)	# armazenamos $f3
	swc1 $f4, 16($sp)	# armazenamos $f4
	swc1 $f5, 20($sp)	# armazenamos $f5
	
	lw $v0 , FUNC1
	beq $a1, $v0, YFUNC1 
	lw $v0 , FUNC2
	beq $a1, $v0, YFUNC2 
	lw $v0 , FUNC3
	beq $a1, $v0, YFUNC3 
	lw $v0 , FUNC4
	beq $a1, $v0, YFUNC4 
	lw $v0 , BATMANPT1
	beq $a1, $v0, YBATMANPT1 
	lw $v0 , BATMANPT2
	beq $a1, $v0, YBATMANPT2 
	lw $v0 , BATMANPT3
	beq $a1, $v0, YBATMANPT3 
	lw $v0 , BATMANPT4
	beq $a1, $v0, YBATMANPT4 
	lw $v0 , BATMANPT5
	beq $a1, $v0, YBATMANPT5 
	
	#Funcao desejada deve ser botada a frente
	#F(x) = -x
	YFUNC1:
		addi $v0, $zero, -1	# $v0 = -1
		mtc1 $v0, $f1		
		cvt.s.w $f1, $f1 	# $f1 = -1.0f
		mtc1 $a0 , $f0		# $f0 = x
		
		mul.s $f0, $f0, $f1	# f0 = -1.0f * x  
		mfc1 $v0, $f0		# v0 = -x
		j End_Function
	
	YFUNC3:
	# F(x) = sqrt(x)
		mtc1 $a0, $f0
		sqrt.s $f0, $f0
		mfc1 $v0, $f0
		j End_Function
	
	YFUNC2:
	#F(x) = x^2 + 1
		addi $v0, $zero, 1	# $v0 = -1
		mtc1 $v0, $f1		
		cvt.s.w $f1, $f1 	# $f1 = 1.0f
		mtc1 $a0 , $f0		# $f0 = x
		mul.s $f0, $f0, $f0	# $f0 = x^2
	
		add.s $f0, $f0, $f1	# f0 = x^2 + 1  
		mfc1 $v0, $f0		# v0 = x^2 + 1 
		j End_Function
	
	YFUNC4:
	# F(x) =  (x-1)(x-2)(x+1)^2/(x-1.5)
		addi $v0,$zero, 0x3FC00000	# 1.5
		
		mtc1 $a0, $f0		# $f0 = x
		
		addi $v0, $zero, 1	# 1
		mtc1 $v0, $f1
		cvt.s.w $f1, $f1	# 1.0f
		
		add.s $f2, $f0 , $f1	# (x + 1.0f)
		mul.s $f2, $f2 , $f2	# (x + 1.0f)^2
		sub.s $f3, $f0 , $f1	# (x - 1.0f)
		
		mul.s $f2, $f2, $f3	# (x + 1.0f)^2*(x - 1.0f) 
		
		addi $v0, $zero, 2	# 2
		mtc1 $v0, $f1
		cvt.s.w $f1, $f1	# 2.0f
		
		sub.s $f1, $f0, $f1	# (x - 2.0f)
		mul.s $f2, $f2, $f1	# (x + 1.0f)^2*(x - 1.0f)(x - 2.0f)
		
		addi $v0, $zero, 0x3FC00000	# 1.5f
		mtc1 $v0, $f1
		
		sub.s $f1, $f0, $f1	# (x - 1.5f)
		div.s $f0, $f2, $f1 	# (x + 1.0f)^2*(x - 1.0f)(x - 2.0f)/(x - 1.5f)
		
		mfc1 $v0, $f0
		j End_Function
	
	#Batman
	YBATMANPT1:
		#primeira parcela
		# (3)*sqrt(1 -(x/7)^2) * sqrt(abs(abs(x) – 4)/(abs(x)-4)
		addi $v0, $zero, 0x40E00000
		mtc1 $v0, $f1		#f1 = 7
		mtc1 $a0, $f2		#f2 = x
		
		div.s $f0, $f2, $f1	# x/7
		mul.s $f0, $f0, $f0	# (x/7)^2
		
		addi $v0, $zero, 0x3F800000
		mtc1 $v0, $f1		#f1 = 1
		
		sub.s $f0, $f1, $f0	# 1 - x/7)^2
		sqrt.s $f0, $f0		#sqrt(1 -(x/7)^2)
		
		addi $v0, $zero, 0x40400000
		mtc1 $v0, $f1		# f1 = 3
		
		mul.s $f0, $f0, $f1 	# f0 =(3)*sqrt(1 -(x/7)^2)
	
		addi $v0, $zero, 0x40800000
		mtc1 $v0, $f1		# f1 = 4
		abs.s $f2, $f2		# f2 = abs(x)
		
		sub.s $f3, $f2, $f1	# (abs(x) – 4)
		abs.s $f4, $f3		# abs(abs(x) – 4)
		
		div.s $f3, $f4, $f3	# abs(abs(x) – 4)/(abs(x)-4)
		sqrt.s $f3, $f3		# sqrt(abs(abs(x) – 4)/(abs(x)-4)
		
		mul.s $f0, $f0, $f3
		mfc1 $v0, $f0 
		j End_Function
	
	YBATMANPT2:
		# (-3)*sqrt(1 -(x/7)^2) * sqrt(abs(abs(x) – 4)/(abs(x)-4)
		addi $v0, $zero, 0x40E00000
		mtc1 $v0, $f1		#f1 = 7
		mtc1 $a0, $f2		#f2 = x
		
		div.s $f0, $f2, $f1	# x/7
		mul.s $f0, $f0, $f0	# (x/7)^2
		
		addi $v0, $zero, 0x3F800000
		mtc1 $v0, $f1		#f1 = 1
		
		sub.s $f0, $f1, $f0	# 1 - x/7)^2
		sqrt.s $f0, $f0		#sqrt(1 -(x/7)^2)
		
		addi $v0, $zero, 0xC0400000
		mtc1 $v0, $f1		# f1 = 3
		
		mul.s $f0, $f0, $f1 	# f0 =(3)*sqrt(1 -(x/7)^2)
	
		addi $v0, $zero, 0x40800000
		mtc1 $v0, $f1		# f1 = 4
		abs.s $f2, $f2		# f2 = abs(x)
		
		sub.s $f3, $f2, $f1	# (abs(x) – 4)
		abs.s $f4, $f3		# abs(abs(x) – 4)
		
		div.s $f3, $f4, $f3	# abs(abs(x) – 4)/(abs(x)-4)
		sqrt.s $f3, $f3		# sqrt(abs(abs(x) – 4)/(abs(x)-4)
		
		mul.s $f0, $f0, $f3
		mfc1 $v0, $f0 
		j End_Function
	
	YBATMANPT3:
		#abs(x/2) – 0.0913722 * x^2-3+sqrt(1 – (abs(abs(x) – 2) – 1)^2)
		addi $v0, $zero, 0x40000000
		mtc1 $v0, $f1		# f1 = 4
		mtc1 $a0, $f2		# f2 = x
		
		div.s $f0, $f2, $f1	# (x/2)
		abs.s $f0 , $f0		# abs(x/2)
		
		addi $v0, $zero, 0x3DBB2159
		mtc1 $v0, $f1		# f1 = 0.0913722
		
		mul.s $f3, $f2, $f2 	# x^2
		mul.s $f1, $f1, $f3	# 0.0913722 * x^2
		
		sub.s $f0, $f0, $f1	#abs(x/2) – 0.0913722 * x^2
		
		addi $v0, $zero, 0x40400000
		mtc1 $v0, $f1		# f1 = 3
		
		sub.s $f0, $f0, $f1 	# abs(x/2) – 0.0913722 * x^2-3
		
		#sqrt(1 – (abs(abs(x) – 2) – 1)^2)
		addi $v0, $zero, 0x40000000
		mtc1 $v0, $f1		# f1 = 2
		
		abs.s $f3, $f2		# f3 = abs(x)
		sub.s $f3, $f3, $f1	#(abs(x) – 2)
		abs.s $f3, $f3		#abs(abs(x) – 2)
		
		addi $v0, $zero, 0x3F800000
		mtc1 $v0, $f1		# f1 = 1
		
		sub.s $f3, $f3, $f1	# (abs(abs(x) – 2) – 1)
		mul.s $f3, $f3, $f3	# (abs(abs(x) – 2) – 1)^2
		
		sub.s $f3, $f1, $f3	# (1 – (abs(abs(x) – 2) – 1)^2)
		sqrt.s $f3, $f3		# sqrt(1 – (abs(abs(x) – 2) – 1)^2)
		
		add.s $f0, $f0, $f3
		mfc1 $v0, $f0 
		j End_Function
	
	YBATMANPT4:
		#(4.21052 – 0.5*abs(x) – 1.35526 * sqrt(4 – (abs(x) – 1)^2)) * sqrt(abs(abs(x) – 1)/(abs(x) – 1))
		addi $v0, $zero, 0x3F000000
		mtc1 $v0, $f1		# f1 = 0.5
		mtc1 $a0, $f2		# f2 = x
		abs.s $f2, $f2		# f2 = abs(x)
		
		mul.s $f0, $f2, $f1 	# 0.5*abs(x) 
		
		addi $v0, $zero, 0x4086BC94
		mtc1 $v0, $f1		# f1 = 4.21052
		
		sub.s $f0, $f1, $f0	# f0 = 4.21052 – 0.5*abs(x)
		
		addi $v0, $zero, 0x3F800000
		mtc1 $v0, $f1		# f1 = 1.0
		
		sub.s $f3, $f2, $f1	# (abs(x) – 1)
		mul.s $f3, $f3 $f3	# (abs(x) – 1)^2
		
		addi $v0, $zero, 0x40800000
		mtc1 $v0, $f1		# f1 = 4.0	
		
		sub.s $f3, $f1, $f3	# 4 – (abs(x) – 1)^2
		sqrt.s $f3, $f3		# sqrt(4 – (abs(x) – 1)^2))
		
		addi $v0, $zero, 0x3FAD7929
		mtc1 $v0, $f1		# f1 = 1.35526
					
					# f0 = 4.21052 – 0.5*abs(x)
					# f2 = abs(x) 
		mul.s $f3, $f3, $f1	# f3 = 1.35526 * sqrt(4 – (abs(x) – 1)^2))
		
		addi $v0, $zero, 0x3F800000
		mtc1 $v0, $f1		# f1 = 1.0
		
		sub.s $f1 ,$f2, $f1 	# f1 = (abs(x) – 1)
		abs.s $f4, $f1		#abs(abs(x) – 1)
		div.s $f1, $f4, $f1	#(abs(abs(x) – 1)/(abs(x) – 1))
		sqrt.s $f1, $f1
		
		mul.s $f1 , $f1, $f3 	# f1 = 1.35526 * sqrt(4 – (abs(x) – 1)^2)) * sqrt(abs(abs(x) – 1)/(abs(x) – 1))
		sub.s $f0, $f0, $f1	# f0 = 4.21052 – 0.5*abs(x) - f1
		
		mfc1 $v0, $f0 
		j End_Function
	
	YBATMANPT5:
	#(4.5 + 0.75*(abs(x - 0.5) + abs(x + 0.5)) -2.75*(abs(x - 0.75) + abs(x + 0.75)))*(1 + abs(1 - abs(x)) / (1 - abs(x)))
		addi $v0, $zero, 0x3F000000
		mtc1 $v0, $f1		# f1 = 0.5
		mtc1 $a0, $f2		# f2 = x
		
		sub.s $f0, $f2, $f1	# f0 =(x - 0.5)
		add.s $f3, $f2, $f1	# f3 =(x + 0.5)
		
		abs.s $f0, $f0		# f0 = abs(x - 0.5)
		abs.s $f3, $f3		# f3 = abs(x + 0.5)
		
		add.s $f0, $f0, $f3	#(abs(x - 0.5) + abs(x + 0.5))
		
		addi $v0, $zero, 0x3F400000
		mtc1 $v0, $f1		# f1 = 0.75
		
		mul.s $f0, $f0, $f1	#0.75*(abs(x - 0.5) + abs(x + 0.5))
		
		addi $v0, $zero, 0x41250000
		mtc1 $v0, $f1		# f1 = 4.5
		
		add.s $f0, $f0, $f1	# f0 = 4.5 + 0.75*(abs(x - 0.5) + abs(x + 0.5))
		
		addi $v0, $zero, 0x3F400000
		mtc1 $v0, $f1		# f1 = 0.75
		
		sub.s $f3, $f2, $f1	# (x - 0.75)
		add.s $f4, $f2, $f1	# (x + 0.75)
		
		abs.s $f3, $f3		# abs(x - 0.75)
		abs.s $f4, $f4		# abs(x + 0.75)
		
		add.s $f3, $f3, $f4 	# (abs(x - 0.75) + abs(x + 0.75))
		
		addi $v0, $zero, 0x40300000
		mtc1 $v0, $f1		# f1 = 2.75
		
					# f0 = 4.5 + 0.75*(abs(x - 0.5) + abs(x + 0.5))
		mul.s $f3, $f3, $f1	# f3 = 2.75*(abs(x - 0.75) + abs(x + 0.75))
		
		addi $v0, $zero, 0x3F800000
		mtc1 $v0, $f1		# f1 = 1.0
		
	#(4.5 + 0.75*(abs(x - 0.5) + abs(x + 0.5)) -2.75*(abs(x - 0.75) + abs(x + 0.75)))*(1 + abs(1 - abs(x)) / (1 - abs(x)))
		
		abs.s $f2, $f2 		# f2 = abs(x)
		sub.s $f5, $f1, $f2	# f5 = 1 - abs(x)
		abs.s $f4, $f5		# f4 = abs(1-abs(x))
		
		div.s $f4, $f4, $f5	 # abs(1 - abs(x)) / (1 - abs(x))
		add.s $f1, $f1, $f4	 # f1 = 1 + abs(1 - abs(x)) / (1 - abs(x))
		
		mul.s $f1, $f3, $f1	# 2.75*(abs(x - 0.75) + abs(x + 0.75)) * f1
		sub.s $f0, $f0, $f1	
		
		mfc1 $v0, $f0
	
	End_Function:
	lwc1 $f0, 0($sp)	
	lwc1 $f1, 4($sp)
	lwc1 $f2, 8($sp)	
	lwc1 $f3, 12($sp)
	lwc1 $f4, 16($sp)
	lwc1 $f5, 20($sp)	
	addi $sp , $sp , 24
	
	jr $ra
	

#Modifica $s0, $s1, $s2
Desenhar_Eixos:#($a0 = X_LINF,$a1 = X_SUP, $a2 = Y_LINF, $a3 = Y_SUP)
	
	#movemos valores de limites para c1
	mtc1 $a0, $f0
	mtc1 $a1, $f1
	mtc1 $a2, $f2
	mtc1 $a3, $f3
	
	#Colocamos valores das dimensoes em $f4 e $f5 320x240
	lw $s0, SCREEN_WIDTH
	mtc1 $s0, $f4
	lw $s1, SCREEN_HEIGHT
	mtc1 $s1, $f5
	
	#cor dos eixos
	lw $s2, AXIS_COLOR		# cor do eixo
		
	#convertemos dimensoes da tela para float
	cvt.s.w $f4, $f4		# $f4 = SCREEN_WIDTH .float
	cvt.s.w $f5, $f5		# $f5 = SCREEN_HEIGHT .float
	
	Eixo_Horizontal:
		#comparamos os sinais dos limites
		xor $t0 , $a2, $a3 		
		not $t0, $t0			# (Y_LINF xor Y_SUP)'
		srl $t0, $t0, 31		# caso tenham mesmo sinal nao teremos eixo horizontal
		beq $t0, 1, Eixo_Vertical	# logo EX: (0 xor 0)' = 1
		
		#pegar distancia relativa de Y_SUP a 0
		sub.s $f6, $f3 , $f2		# Y_SUP - Y_INF
		div.s $f6, $f3, $f6		# Y_SUP / (Y_SUP - Y_INF) nos dara uma distancia relativa de Y_SUP ate o eixo y = 0
		
		#agora vamos calcular quanta linhas deverao ser puladas para desenharmos o eixo
		mul.s $f6, $f5, $f6		# SCREEN_HEIGHT * altura relativa a 0		
		cvt.w.s $f6, $f6		# Convertemos para um valor inteiro para efetuar iteracao
		
		#movemos este valor para o banco de registradores
		mfc1 $t0, $f6	
		mult $t0, $s0		# multiplicamos quantas linhas devem ser puladas por SCREEN_WIDTH
		mflo $t0
		
		lw $t1, MMIO			# e este valor sera somado ao endereco inicial da tela
		add $t0, $t1, $t0		# t0 = inicio do eixo horizontal
						
		# inicializamos um indice para iterar pelas colunas
		addi $t1, $zero, 0		# j = 0
		
		LOOP_WIDTH:beq $t1, $s0, Eixo_Vertical
			sb $s2, 0($t0)
			addi $t0, $t0, 1
			addi $t1, $t1, 1
		j LOOP_WIDTH
			
	Eixo_Vertical:
		#comparamos os sinais dos limites
		xor $t0 , $a0, $a1 		
		not $t0, $t0			# (X_LINF xor X_SUP)'
		srl $t0, $t0, 31		# caso tenham mesmo sinal nao teremos eixo vertical
		beq $t0, 1, End_Desenhar_Fixos	# logo EX: (0 xor 0)' = 1
		
		#pegar distancia relativa de X_SUP a 0
		sub.s $f6, $f1 , $f0		# X_SUP - X_INF
		mtc1 $zero, $f7			# pegamos o 0 em float point
		sub.s $f7, $f7, $f0		# 0 - X_INF 
		div.s $f6, $f7, $f6		# 0 - X_INF / (X_SUP - X_INF) nos dara uma distancia relativa de X_INF ate o x = 0 
		
		#agora vamos calcular o valor inicial do eixo x = 0
		mul.s $f6, $f4, $f6		# SCREEN_WIDTH * distancia relativa ate eixo x=o		
		cvt.w.s $f6, $f6		# Convertemos para um valor inteiro para efetuar iteracao
		
		#movemos este valor para o banco de registradores
		mfc1 $t0, $f6			# este sera o endereco do primeiro pixel do eixo vertical
		
		lw $t1, MMIO			# e este valor sera somado ao endereco inicial da tela
		add $t0, $t1, $t0		# t0 = inicio do eixo horizontal
						
		# inicializamos um indice para iterar pelas linha
		addi $t1, $zero, 0		# i = 0
		
		LOOP_LENGHT:beq $t1, $s1, End_Desenhar_Fixos
			sb $s2, 0($t0)
			add $t0, $t0, $s0 	# adicionamos mais uma linha SCREEN_WIDTH
			addi $t1, $t1, 1
		j LOOP_LENGHT
		
	End_Desenhar_Fixos:
		jr $ra

END:
	addi $v0 , $zero, 10
	syscall
