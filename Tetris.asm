.data
###############
#Variaveis
###############
COLLISION.BASE:		.word 0xFF012C00		# Para uma screen de 320x240 = 12C00

TECLADO:		.word 0xFF000004 
 
PIECE.CURRENT.TYPE:	.word 0x00000007
PIECE.CURRENT.STATE:	.word 0x00000001
 
#Contem endereços relativos ao quadrado pivo = (2,3) modificar caso mude tamanho das pecas
PIECE.ARRAY.ADRESS:	.word   -1288,-1284,-1280,-1276,
				  -8,  -4,    0,   4,
				 1272, 1276, 1280, 1284,
				 2552, 2556, 2560, 2564,
#Informa se peca existe na matriz
PIECE.ARRAY.FORM:	.word	0,0,0,0,
				0,0,0,0,
				0,0,0,0,
				0,0,0,0

#Utilizado para checar se rotacao e possivel
PIECE.ARRAY.TEMP.FORM:	.word	0,0,0,0,
				0,0,0,0,
				0,0,0,0,
				0,0,0,0
				
#Quarda forma anterior caso ocorra rotacao, para que anterior seja apagado corretamente
PIECE.ARRAY.PAST.FORM:	.word	0,0,0,0,
				0,0,0,0,
				0,0,0,0,
				0,0,0,0
				

#ESTADOS DAS PECAS
#######################
PIECE.ARRAY.O.STATE1:	.word	0,0,0,0,
				0,1,1,0,
				0,1,1,0,
				0,0,0,0

########################
PIECE.ARRAY.I.STATE1:	.word	0,0,0,0,
				1,1,1,1,
				0,0,0,0,
				0,0,0,0
				
PIECE.ARRAY.I.STATE2:	.word	0,0,1,0,
				0,0,1,0,
				0,0,1,0,
				0,0,1,0
				
				
########################
PIECE.ARRAY.S.STATE1:	.word	0,0,0,0,
				0,0,1,1,
				0,1,1,0,
				0,0,0,0
				
PIECE.ARRAY.S.STATE2:	.word	0,0,1,0,
				0,0,1,1,
				0,0,0,1,
				0,0,0,0
				
				
########################
PIECE.ARRAY.Z.STATE1:	.word	0,0,0,0,
				0,1,1,0,
				0,0,1,1,
				0,0,0,0
				
PIECE.ARRAY.Z.STATE2:	.word	0,0,0,1,
				0,0,1,1,
				0,0,1,0,
				0,0,0,0
				
				
########################
PIECE.ARRAY.L.STATE1:	.word	0,0,0,0,
				0,1,1,1,
				0,1,0,0,
				0,0,0,0
				
PIECE.ARRAY.L.STATE2:	.word	0,0,1,0,
				0,0,1,0,
				0,0,1,1,
				0,0,0,0
				
PIECE.ARRAY.L.STATE3:	.word	0,0,0,1,
				0,1,1,1,
				0,0,0,0,
				0,0,0,0
				
PIECE.ARRAY.L.STATE4:	.word	0,1,1,0,
				0,0,1,0,
				0,0,1,0,
				0,0,0,0
				
				
########################
PIECE.ARRAY.J.STATE1:	.word	0,0,0,0,
				0,1,1,1,
				0,0,0,1,
				0,0,0,0
				
PIECE.ARRAY.J.STATE2:	.word	0,0,1,1,
				0,0,1,0,
				0,0,1,0,
				0,0,0,0
				
PIECE.ARRAY.J.STATE3:	.word	0,1,0,0,
				0,1,1,1,
				0,0,0,0,
				0,0,0,0
				
PIECE.ARRAY.J.STATE4:	.word	0,0,1,0,
				0,0,1,0,
				0,1,1,0,
				0,0,0,0
				
########################
PIECE.ARRAY.T.STATE1:	.word	0,0,0,0,
				0,1,1,1,
				0,0,1,0,
				0,0,0,0
				
PIECE.ARRAY.T.STATE2:	.word	0,0,1,0,
				0,0,1,1,
				0,0,1,0,
				0,0,0,0
				
PIECE.ARRAY.T.STATE3:	.word	0,0,1,0,
				0,1,1,1,
				0,0,0,0,
				0,0,0,0
				
PIECE.ARRAY.T.STATE4:	.word	0,0,1,0,
				0,1,1,0,
				0,0,1,0,
				0,0,0,0

################
# Definiçoes
################

#TIPOS DE PECAS
.eqv	PIECE.O.BLOCK		0x01
.eqv	PIECE.I.BLOCK		0x02
.eqv	PIECE.S.BLOCK		0x03
.eqv	PIECE.Z.BLOCK		0x04
.eqv	PIECE.L.BLOCK		0x05
.eqv	PIECE.J.BLOCK		0x06
.eqv	PIECE.T.BLOCK		0x07

#ESTADOS DE PECAS
.eqv	PIECE.STATE1		0x01
.eqv	PIECE.STATE2		0x02
.eqv	PIECE.STATE3		0x03
.eqv	PIECE.STATE4		0x04

#TAMANHO DOS ARRAYS
.eqv	PIECE.ARRAY.SIZE	0x10		#Tamanho dos arrays 16

.eqv	MMIO 			0xFF000000

.eqv	SCREEN.ADRESS.INIT	0xFF000000
.eqv	SCREEN.ADRESS.END	0xFF012C00	#320*240 + FF00_0000 modificar caso mude dimesnsoes
.eqv	SCREEN.X		320
.eqv	SCREEN.Y		240
.eqv	FRAME.SIZE		20		# Largura das bordas
.eqv	FIELD.SIZE		40		# Largura do campo navegavel

.eqv	KEY.RIGHT		0x64
.eqv	KEY.LEFT		0x61 
.eqv	KEY.DOWN		0x73
.eqv	KEY.ROTATE		0x77 #77	

.eqv	SQUARE.UNIT.SIZE	4		# Ao modificar tamanho e necessario atualizar matriz de enrderecos relativos
						# e tambem ponto do pivo inicial da peca ao ser criada
.eqv	COLOR.BLUE		0x000000F0
.eqv	COLOR.RED		0x0000000F
.eqv	COLOR.WHITE		0xFFFFFFFF 	# necessario manter bits a mais ao inves de 0xFF
.eqv	COLOR.BLACK		0x00000000 	# necessario manter bits a mais ao inves de 0x00

.text
	#jal 	draw.background
	jal 	manage.piece

manage.piece:
	#randomizar uma peca 0 a 6
	li 	$v0, 42  
	li 	$a1, 6 
	syscall     
	add	$a0, $a0, 1
	
	la	$t0, PIECE.CURRENT.TYPE
	la	$t1, PIECE.CURRENT.STATE
	
	sw	$a0, 0($t0)		# current piece 
	addi	$a0, $zero, 1
	sw	$a0, 0($t1)		# current sate = 1
	
	#t0 = pivo
	addi	$t0, $zero, 0xFF000182		# modificar caso mude tamanho dos pixels FF00_0000 + 320*(tamanho peca) + 58
	la	$a0, PIECE.ARRAY.FORM		# rotaciona apenas para popular array form 
	jal	rotate.piece			# peca inicial esta sendo setada diretamente na memoria
	
manage.piece.update:
	#desenhamos peca
	add	$a0, $zero, $t0 
	add	$a1, $zero, COLOR.RED
	la	$a2, PIECE.ARRAY.FORM
	jal 	draw.piece
	
	#salva em s0 posicao passada
	add	$s0, $zero, $t0
	
	#Acrscenta movimento para baixo em $t0
	add 	$t1, $zero, SQUARE.UNIT.SIZE
	mul	$t1, $t1, SCREEN.X
	
	#salvamos possicao passada e array passado
	add	$t2, $zero, $t0			# t2 = possicao passada
	la	$a0, PIECE.ARRAY.PAST.FORM	# array past = array form
	la	$a1, PIECE.ARRAY.FORM
	jal	copy.array
	
	add	$t0, $t0, $t1			# t0 = proxima posicao
	
	#Pegar input e acrescentamos em $t0
	jal 	get.input
	add	$s1, $zero, $t0			# $s1 = posicao anteior ao input mas acrescido de movimento para baixo
	add 	$t0 , $t0, $v0			#acrescenta input
	
	#v1 recebe rotacao
	beq	$v1, $zero, manage.piece.no.use.rotation 
	
	############################################################################################
	#Caso ocorra requerimento de rotacao copiamos estado atual para temporario e validamos
	#Se for valido entao copiamos array temporario para atual
	manage.piece.val.rot:
	la	$a0, PIECE.ARRAY.TEMP.FORM
	la	$a1, PIECE.ARRAY.FORM
	jal	copy.array
	
	#rotacionamos array
	la	$a0, PIECE.ARRAY.TEMP.FORM
	jal	rotate.piece
	
	#Checamos se ocorre colisao lateral
	la	$a1, PIECE.ARRAY.TEMP.FORM
	add	$a0, $zero, $t0 
	jal	check.collision.piece
	bne	$v0, $zero, manage.piece.no.use.rotation
	
	#Checamos se ocorre colisao por baixo
	la	$a1, PIECE.ARRAY.TEMP.FORM
	add	$a0, $zero, $t0 
	jal	check.collision.piece
	bne	$v0, $zero, manage.piece.no.use.rotation
	
	#Se passou no teste de colisoes atualizamos array form
	la	$a0, PIECE.ARRAY.FORM
	la	$a1, PIECE.ARRAY.TEMP.FORM
	jal	copy.array
	#######################################################################################
	
	######################################################################################
	manage.piece.no.use.rotation:
	#checamos se apos acrscentar movimento para baixo + input ocorre colisao por lateral
	la	$a1, PIECE.ARRAY.FORM
	add	$a0, $zero, $t0 
	jal	check.collision.piece
	beq	$v0, $zero, manage.piece.use.input
	manage.piece.dont.use.input:			#caso ocorra colisao lateral em qualquer quadrado unitario
	add	$t0, $zero, $s1				#e conferir se ocorre colisao por baixo 
	manage.piece.use.input:#input ja foi acrescido em t0
	
	#checamos se apos acrscentar movimento para baixo com ou sem input se ocorre colisao por baixo 
	la	$a1, PIECE.ARRAY.FORM
	add	$a0, $zero, $t0 
	jal	check.collision.piece
	bne	$v0, $zero, manage.piece.draw.static
	##########################################################################################
	
	manage.piece.use.rotation:
	#esperar 1 segundo
	manage.piece.wait.1sec:
	li $a0,50  
	li $v0,32
	syscall
	
	#apagar quadrado passado
	manage.piece.erase:
	add	$a0, $zero, $t2 		#t2 possui pivo passado antes de acrscentar movimento e inputs
	addi 	$a1, $zero, COLOR.WHITE
	la	$a2, PIECE.ARRAY.PAST.FORM
	jal 	draw.piece
	j	manage.piece.update
	
	#desenhamos com cor estatica
	manage.piece.draw.static:

	add	$a0, $zero, $s0 
	sb	$zero, 0($s0)
	la	$a1, PIECE.ARRAY.FORM	
	addi	$a2, $zero, 1	
	jal	update.piece.collision.matrix
	
	#add	$a0, $zero, $s0 
	#addi 	$a1, $zero, COLOR.STATIC.PIECE
	#la	$a2, PIECE.ARRAY.FORM
	#jal 	draw.piece
	
	
	j	manage.piece
	
	j end
	

draw.piece:#(a0 = pivo, a1 = color, $a2 = endereco inicial do array)
	addi 	$sp, $sp, -28
	sw	$t0, 0($sp)
	sw	$t1, 4($sp)
	sw	$t2, 8($sp)
	sw	$t3, 12($sp)
	sw	$t4, 16($sp)
	sw	$t5, 20($sp)
	sw	$ra, 24($sp)

	add 	$t0, $zero, $a0
	add 	$t1, $zero, $a2		#inicio do array
	addi	$t2, $zero, 0			#i = 0
	addi 	$t3, $zero, PIECE.ARRAY.SIZE	#t3 = 16	
	
	#desenha unidades da peca
	draw.piece.loop1:
		beq 	$t2, $t3, draw.piece.loop1.end
		
		sll     $t4, $t2, 2		# i * 4
		add	$t4, $t4, $t1		#array.exist[i]
		lw	$t4, 0($t4)				
		beq	$t4, $zero, draw.piece.nodraw		# caso array esteja vazio
		
		# pegar endereco relativo ao pivo
		la	$t4, PIECE.ARRAY.ADRESS
		sll     $t5, $t2, 2		# i * 4
		add	$t4, $t4, $t5		#array.adress[i]
		lw	$t4, 0($t4)
		
		add	$t5, $t4, $t0		#adicionamos ao pivo endereco da peca
		
		#draw piece at t5
		add	$a0, $zero, $t5 
		add 	$a1, $zero, $a1
		jal 	draw.unit.square	
		
		draw.piece.nodraw:
		
		addi	$t2, $t2, 1
		j draw.piece.loop1
	draw.piece.loop1.end:
	
	lw	$t0, 0($sp)
	lw	$t1, 4($sp)
	lw	$t2, 8($sp)
	lw	$t3, 12($sp)
	lw	$t4, 16($sp)
	lw	$t5, 20($sp)
	lw	$ra, 24($sp)
	addi 	$sp, $sp, 28
	
	jr $ra

check.collision.piece:#(a0 = pivo, a1 = endereco array) retorna 1 se ocorreu colisao 
	addi 	$sp, $sp, -28
	sw	$t0, 0($sp)
	sw	$t1, 4($sp)
	sw	$t2, 8($sp)
	sw	$t3, 12($sp)
	sw	$t4, 16($sp)
	sw	$t5, 20($sp)
	sw	$ra, 24($sp)
	
	add	$t0, $zero, $a0
	add 	$t1, $zero, $a1		#inicio do array
	addi	$t2, $zero, 0			#i = 0
	addi 	$t3, $zero, PIECE.ARRAY.SIZE	#t3 = 16	
	
	check.collision.piece1:
		beq 	$t2, $t3, check.collision.piece1.end
		
		sll     $t4, $t2, 2		# i * 4
		add	$t4, $t4, $t1		#array.exist[i]
		lw	$t4, 0($t4)				
		beq	$t4, $zero, check.collision.piece.nocheck		# caso array esteja vazio
		
		# pegar endereco relativo ao pivo
		la	$t4, PIECE.ARRAY.ADRESS
		sll     $t5, $t2, 2		# i * 4
		add	$t4, $t4, $t5		#array.adress[i]
		lw	$t4, 0($t4)
		
		add	$t5, $t4, $t0		#adicionamos ao pivo endereco da peca
		
		# checa colisao em t5
		add	$a0, $zero, $t5 
		jal	check.collision
		bne	$v0, $zero, check.collision.piece.hit	#caso ocorra colisao saimos do loop
		
		check.collision.piece.nocheck:
		
		addi	$t2, $t2, 1
		j check.collision.piece1
	check.collision.piece1.end:
	
	add 	$v0 , $zero, 0		#nao ocorreram colisoes
	j check.collision.piece.end
	
	check.collision.piece.hit:
	addi	$v0, $zero, 1		#ocorreu uma colisao
	
	check.collision.piece.end:
	lw	$t0, 0($sp)
	lw	$t1, 4($sp)
	lw	$t2, 8($sp)
	lw	$t3, 12($sp)
	lw	$t4, 16($sp)
	lw	$t5, 20($sp)
	lw	$ra, 24($sp)
	addi 	$sp, $sp, 28
	
	jr $ra
	
	
#checa se em a0 ouve colisao por baixo e retorna true em v0
#colisoes por baixo impedem movimentacao da peça
check.collision:#(a0 = adress) v0 = 1 colisao, v0 = 0 sem colisao
	#salvar registradores utilizados
	addi 	$sp, $sp, -12
	sw	$t0, 0($sp)
	sw	$t1, 4($sp)
	sw	$t2, 8($sp)
	
	#checar limite inferior
	addi 	$t0, $zero, SCREEN.ADRESS.END
	slt 	$t0, $a0, $t0				# caso proximo endereço nao esteja fora do limite inferior da tela
	beq	$t0, $zero, collision.hit  
	
	#checar por pecas ja posicionadas
	addi	$t0, $zero, MMIO
	la	$t1, COLLISION.BASE
	lw	$t1, 0($t1)
	
	sub	$t2, $a0, $t0		# distancia do inicio da tela ate ponto
	add	$t0, $t1, $t2 		# para facilitar calculos matriz de colisao possui mesmo tamaanho que tela
					# portanto apenas subtraimos valor e adicionamos em COLLISION.BASE
	#t0 = endereco relativo na matriz de colisao
	lb	$t0, 0($t0)	
	addi	$t1, $zero, 1			
	beq	$t0, $t1, collision.hit		
	
	collision.not.hit:
		addi	$v0, $zero, 0
		j 	check.collision.end
	collision.hit:
		addi	$v0, $zero, 1
		
	check.collision.end:
	lw	$t0, 0($sp)
	lw	$t1, 4($sp)
	lw	$t2, 8($sp)
	addi 	$sp, $sp, 12
	jr $ra

update.piece.collision.matrix:#(a0 = pivo, $a1 = endereco inicial array, $a2 = 1/0, 1 adiciona peca 0 retira) 
	addi 	$sp, $sp, -28
	sw	$t0, 0($sp)
	sw	$t1, 4($sp)
	sw	$t2, 8($sp)
	sw	$t3, 12($sp)
	sw	$t4, 16($sp)
	sw	$t5, 20($sp)
	sw	$ra, 24($sp)
	
	add	$t0, $zero, $a0
	add	$t1, $zero, $a1		#inicio do array
	addi	$t2, $zero, 0			#i = 0
	addi 	$t3, $zero, PIECE.ARRAY.SIZE	#t3 = 16	
	
	update.piece.collision.loop1:
		beq 	$t2, $t3, update.piece.collision.loop1.end
		
		sll     $t4, $t2, 2		# i * 4
		add	$t4, $t4, $t1		#array.exist[i]
		lw	$t4, 0($t4)				
		beq	$t4, $zero, update.piece.collision.nocheck		# caso array esteja vazio
		
		# pegar endereco relativo ao pivo
		la	$t4, PIECE.ARRAY.ADRESS
		sll     $t5, $t2, 2		# i * 4
		add	$t4, $t4, $t5		#array.adress[i]
		lw	$t4, 0($t4)
		
		add	$t5, $t4, $t0		#adicionamos ao pivo endereco da peca
		
		# adiciona na matriz em t5
		add	$a0, $zero, $t5 
		add	$a1, $zero, $a2		#a1 e guardado em t0 no inicio
		jal	update.dot.collision.matrix
		
		update.piece.collision.nocheck:
		
		addi	$t2, $t2, 1
		j update.piece.collision.loop1
	update.piece.collision.loop1.end:
	
	update.piece.collision.end:
	lw	$t0, 0($sp)
	lw	$t1, 4($sp)
	lw	$t2, 8($sp)
	lw	$t3, 12($sp)
	lw	$t4, 16($sp)
	lw	$t5, 20($sp)
	lw	$ra, 24($sp)
	addi 	$sp, $sp, 28
	
	jr $ra
	

#adiciona ponto na matriz de colisao
update.dot.collision.matrix:#(a0 = endereco a ser acrescentado na matriz de colisao, a1 = 1 acidionar 0 retirar)
	addi 	$sp, $sp, -12
	sw	$t0, 0($sp)
	sw	$t1, 4($sp)
	sw	$t2, 8($sp)
	
	addi	$t0, $zero, MMIO
	la	$t1, COLLISION.BASE
	lw	$t1, 0($t1)
	
	sub	$t2, $a0, $t0		# distancia do inicio da tela ate ponto
	add	$t0, $t1, $t2 		# para facilitar calculos matriz de colisao possui mesmo tamaanho que tela
					# portanto apenas subtraimos valor e adicionamos em COLLISION.BASE

	sb	$a1, 0($t0)		#a1 = 0, retirar da matriz de colisao
					#a0 = 1, adicionar na matriz de colisao
	
	lw	$t0, 0($sp)
	lw	$t1, 4($sp)
	lw	$t2, 8($sp)
	addi 	$sp, $sp, 12

	jr	$ra
	
	
draw.unit.square:#(a0 = square pivot, a1 = draw color)
	#salvar registradores usados
	addi 	$sp, $sp, -24
	sw	$t0, 0($sp)
	sw	$t1, 4($sp)
	sw	$t2, 8($sp)
	sw	$s0, 12($sp)
	sw	$s1, 16($sp)
	sw	$s2, 20($sp)
	
	addi	$t0, $zero, MMIO
	
	slt	$t0, $a0, $t0
	bne	$t0, $zero, unit.square.end
	
	addi 	$s0, $zero, SQUARE.UNIT.SIZE		# s0 = SQUARE.UNIT.SIZE
	addi	$s1, $zero, SCREEN.X			# s1 = SCREEN.X
	addi	$s2, $zero, SCREEN.Y			# s2 = SCREEN.Y
	
	# Para maior eficiencia cor sera armazenada em bytes portanto precisamos replica la no registrador
	sll	$t0, $a1, 8
	or	$t1, $t0, $a1
	sll	$t0, $t0, 8
	or	$t1, $t0, $t1
	sll	$t0, $t0, 8
	or	$a1, $t0, $t1 
	
	# Calcular ponto inicial para draw  
	# Canto superior esquerdo
	div	$t1, $s0, 2				# t1 = SQUARE.UNIT.SIZE/2
	sub	$t0, $a0, $t1				# pivot - SQUARE.UNIT.SIZE/2				
	
	mul	$t1, $s1, $t1				# SCREEN.X * SQUARE.UNIT.SIZE/2
	sub	$t0, $t0, $t1		 		# t0 = canto superior esquerdo
	
	#Loop para percorrer quadrado e desenhar
	add 	$t1, $zero, $zero			# t1 = i
	add 	$t2, $zero, $zero			# t2 = j
	
	unit.square.loop1:
		beq 	$t1, $s0 , unit.square.loop1.end	
		unit.square.loop2:
			beq 	$t2, $s0 , unit.square.loop2.end
			sw	$a1, 0($t0)
			addi 	$t0, $t0, 4				# adiciona para proxima coluna 
			addi	$t2, $t2, 4
			j unit.square.loop2
		unit.square.loop2.end:
		addi	$t0, $t0, SCREEN.X		# Adiciona para proxima linha
		sub	$t0, $t0, SQUARE.UNIT.SIZE
		add 	$t2, $zero, $zero		# t2 = j = 0
		addi	$t1, $t1, 1
		j unit.square.loop1
	unit.square.loop1.end:
	
	unit.square.end:
	#devolver registradores usados
	lw	$t0, 0($sp)
	lw	$t1, 4($sp)
	lw	$t2, 8($sp)
	lw	$s0, 12($sp)
	lw	$s1, 16($sp)
	lw	$s2, 20($sp)
	addi 	$sp, $sp, 24
	
	jr $ra

get.input:#($v0 = valor para adicionar a pivo, v1 = requerimento de rotacao)
	#salvar registradores usados
	addi 	$sp, $sp, -4
	sw	$t0, 0($sp)

	lw $t0, TECLADO
	lw $t0 ,0($t0)
	
	movement.witch.key:
		key.rotate:
			bne $t0, KEY.ROTATE, key.down
			add $v0, $zero, $zero
			addi $v1, $zero, 1
			j end.get.input
		key.down:
			bne $t0, KEY.DOWN, key.right
			addi $v0, $zero, 3840		# nada por enquanto
			add $v1, $zero, $zero
			j end.get.input
		key.right:
			bne $t0, KEY.RIGHT, key.left
			addi $v0, $zero, SQUARE.UNIT.SIZE
			add $v1, $zero, $zero
			j end.get.input
		key.left:
			bne $t0, KEY.LEFT, key.nokey
			addi $v0, $zero, -SQUARE.UNIT.SIZE
			add $v1, $zero, $zero
			j end.get.input
		key.nokey:
			add $v1, $zero, $zero
			add $v0, $zero, $zero
	
	end.get.input:
	#limpamos endereço do teclado
	lw $t0, TECLADO
	sw $zero , 0($t0)
	
	lw	$t0, 0($sp)
	addi 	$sp, $sp, 4
	
	jr $ra
	
	
draw.background:
	#salvar registradores usados
	addi 	$sp, $sp, -16
	sw	$t0, 0($sp)
	sw	$t1, 4($sp)
	sw	$t2, 8($sp)
	sw	$t3, 12($sp)
	
	addi	$t0, $zero, SCREEN.ADRESS.INIT
	addi	$t1, $zero, SCREEN.ADRESS.END
									
	addi	$s0, $zero, COLOR.BLACK				
	addi	$s1, $zero, COLOR.WHITE
	addi	$s2, $zero, FRAME.SIZE			
	addi	$s3, $zero, FIELD.SIZE
							
	clear.screen.loop1:
		beq 	$t0, $t1, end.clear.screen
		
		addi	$t2, $zero, 0
		
		# Field 
		clear.screen.loop3:
			beq	$t2, $s3, clear.screen.loop3.end
			sw 	$s1, 0($t0)
			
			addi 	$t2, $t2, 4
			addi	$t0, $t0, 4
			beq 	$t0, $t1, end.clear.screen
			j 	clear.screen.loop3
		clear.screen.loop3.end:
		
		addi	$t2, $zero, 0
		
		#Frame
		clear.screen.loop2:
			beq	$t2, $s2, clear.screen.loop2.end
			sw 	$s0, 0($t0)
		
			addi 	$t2, $t2, 4	
			addi	$t0, $t0, 4
			beq 	$t0, $t1, end.clear.screen
			j 	clear.screen.loop2
		clear.screen.loop2.end:
		
		j clear.screen.loop1
		
	end.clear.screen:
	lw	$t0, 0($sp)
	lw	$t1, 4($sp)
	lw	$t2, 8($sp)
	lw	$t3, 12($sp)
	addi 	$sp, $sp, 16
	
	jr $ra


#rotacao sempre no sentido horario
rotate.piece:#(a0 = endereco do array a ser rotacionado)
	#salvar registradores usados
	addi 	$sp, $sp, -12
	sw	$t0, 0($sp)
	sw	$t1, 4($sp)
	sw	$ra, 8($sp)

	la	$t0, PIECE.CURRENT.TYPE
	lw	$t0,0($t0)
	
	#switch case
	addi 	$t1, $zero, PIECE.O.BLOCK
	beq 	$t0, $t1, rotate.o.block
	addi 	$t1, $zero, PIECE.I.BLOCK
	beq 	$t0, $t1, rotate.i.block
	addi 	$t1, $zero, PIECE.S.BLOCK
	beq 	$t0, $t1, rotate.s.block
	addi 	$t1, $zero, PIECE.Z.BLOCK
	beq 	$t0, $t1, rotate.z.block
	addi 	$t1, $zero, PIECE.L.BLOCK
	beq 	$t0, $t1, rotate.l.block
	addi 	$t1, $zero, PIECE.J.BLOCK
	beq 	$t0, $t1, rotate.j.block
	addi 	$t1, $zero, PIECE.T.BLOCK
	beq 	$t0, $t1, rotate.t.block
	#caso default
	j	rotate.piece.end

	rotate.o.block:
		la	$t0, PIECE.CURRENT.STATE
		lw	$t0,0($t0)
		
		addi 	$t1, $zero, PIECE.STATE1
		beq 	$t0, $t1, rotate.o.to.state1
		addi 	$t1, $zero, PIECE.STATE2
		beq 	$t0, $t1, rotate.o.to.state1
		addi 	$t1, $zero, PIECE.STATE3
		beq 	$t0, $t1, rotate.o.to.state1
		addi 	$t1, $zero, PIECE.STATE4
		beq 	$t0, $t1, rotate.o.to.state1
		#default
		j	rotate.piece.end
		
		rotate.o.to.state1:
		la	$a1, PIECE.ARRAY.O.STATE1
		jal	copy.array
		addi	$t1, $zero, PIECE.STATE1
		la	$t0, PIECE.CURRENT.STATE
		sw	$t1, 0($t0)
		j	rotate.piece.end
		 
		
	rotate.i.block:
		la	$t0, PIECE.CURRENT.STATE
		lw	$t0,0($t0)
		
		addi 	$t1, $zero, PIECE.STATE1
		beq 	$t0, $t1, rotate.i.to.state2
		addi 	$t1, $zero, PIECE.STATE2
		beq 	$t0, $t1, rotate.i.to.state1
		addi 	$t1, $zero, PIECE.STATE3
		beq 	$t0, $t1, rotate.i.to.state1
		addi 	$t1, $zero, PIECE.STATE4
		beq 	$t0, $t1, rotate.i.to.state1
		#default
		j	rotate.piece.end
		
		rotate.i.to.state1:
		la	$a1, PIECE.ARRAY.I.STATE1
		jal	copy.array
		addi	$t1, $zero, PIECE.STATE1
		la	$t0, PIECE.CURRENT.STATE
		sw	$t1, 0($t0)
		j	rotate.piece.end
		
		rotate.i.to.state2:
		la	$a1, PIECE.ARRAY.I.STATE2
		jal	copy.array
		addi	$t1, $zero, PIECE.STATE2
		la	$t0, PIECE.CURRENT.STATE
		sw	$t1, 0($t0)
		j	rotate.piece.end
		
		
	rotate.s.block:
		la	$t0, PIECE.CURRENT.STATE
		lw	$t0,0($t0)
		
		addi 	$t1, $zero, PIECE.STATE1
		beq 	$t0, $t1, rotate.s.to.state2
		addi 	$t1, $zero, PIECE.STATE2
		beq 	$t0, $t1, rotate.s.to.state1
		addi 	$t1, $zero, PIECE.STATE3
		beq 	$t0, $t1, rotate.s.to.state1
		addi 	$t1, $zero, PIECE.STATE4
		beq 	$t0, $t1, rotate.s.to.state1
		#default
		j	rotate.piece.end
		
		rotate.s.to.state1:
		la	$a1, PIECE.ARRAY.S.STATE1
		jal	copy.array
		addi	$t1, $zero, PIECE.STATE1
		la	$t0, PIECE.CURRENT.STATE
		sw	$t1, 0($t0)
		j	rotate.piece.end
		
		rotate.s.to.state2:
		la	$a1, PIECE.ARRAY.S.STATE2
		jal	copy.array
		addi	$t1, $zero, PIECE.STATE2
		la	$t0, PIECE.CURRENT.STATE
		sw	$t1, 0($t0)
		j	rotate.piece.end
		
	rotate.z.block:
		la	$t0, PIECE.CURRENT.STATE
		lw	$t0,0($t0)
		
		addi 	$t1, $zero, PIECE.STATE1
		beq 	$t0, $t1, rotate.z.to.state2
		addi 	$t1, $zero, PIECE.STATE2
		beq 	$t0, $t1, rotate.z.to.state1
		addi 	$t1, $zero, PIECE.STATE3
		beq 	$t0, $t1, rotate.z.to.state1
		addi 	$t1, $zero, PIECE.STATE4
		beq 	$t0, $t1, rotate.z.to.state1
		#default
		j	rotate.piece.end
		
		rotate.z.to.state1:
		la	$a1, PIECE.ARRAY.Z.STATE1
		jal	copy.array
		addi	$t1, $zero, PIECE.STATE1
		la	$t0, PIECE.CURRENT.STATE
		sw	$t1, 0($t0)
		j	rotate.piece.end
		
		rotate.z.to.state2:
		la	$a1, PIECE.ARRAY.Z.STATE2
		jal	copy.array
		addi	$t1, $zero, PIECE.STATE2
		la	$t0, PIECE.CURRENT.STATE
		sw	$t1, 0($t0)
		j	rotate.piece.end
		
	rotate.l.block:
		la	$t0, PIECE.CURRENT.STATE
		lw	$t0,0($t0)
		
		addi 	$t1, $zero, PIECE.STATE1
		beq 	$t0, $t1, rotate.l.to.state2
		addi 	$t1, $zero, PIECE.STATE2
		beq 	$t0, $t1, rotate.l.to.state3
		addi 	$t1, $zero, PIECE.STATE3
		beq 	$t0, $t1, rotate.l.to.state4
		addi 	$t1, $zero, PIECE.STATE4
		beq 	$t0, $t1, rotate.l.to.state1
		#default
		j	rotate.piece.end
		
		rotate.l.to.state1:
		la	$a1, PIECE.ARRAY.L.STATE1
		jal	copy.array
		addi	$t1, $zero, PIECE.STATE1
		la	$t0, PIECE.CURRENT.STATE
		sw	$t1, 0($t0)
		j	rotate.piece.end
		
		rotate.l.to.state2:
		la	$a1, PIECE.ARRAY.L.STATE2
		jal	copy.array
		addi	$t1, $zero, PIECE.STATE2
		la	$t0, PIECE.CURRENT.STATE
		sw	$t1, 0($t0)
		j	rotate.piece.end
		
		rotate.l.to.state3:
		la	$a1, PIECE.ARRAY.L.STATE3
		jal	copy.array
		addi	$t1, $zero, PIECE.STATE3
		la	$t0, PIECE.CURRENT.STATE
		sw	$t1, 0($t0)
		j	rotate.piece.end
		
		rotate.l.to.state4:
		la	$a1, PIECE.ARRAY.L.STATE4
		jal	copy.array
		addi	$t1, $zero, PIECE.STATE4
		la	$t0, PIECE.CURRENT.STATE
		sw	$t1, 0($t0)
		j	rotate.piece.end
		
	rotate.j.block:
		la	$t0, PIECE.CURRENT.STATE
		lw	$t0,0($t0)
		
		addi 	$t1, $zero, PIECE.STATE1
		beq 	$t0, $t1, rotate.j.to.state2
		addi 	$t1, $zero, PIECE.STATE2
		beq 	$t0, $t1, rotate.j.to.state3
		addi 	$t1, $zero, PIECE.STATE3
		beq 	$t0, $t1, rotate.j.to.state4
		addi 	$t1, $zero, PIECE.STATE4
		beq 	$t0, $t1, rotate.j.to.state1
		#default
		j	rotate.piece.end
		
		rotate.j.to.state1:
		la	$a1, PIECE.ARRAY.J.STATE1
		jal	copy.array
		addi	$t1, $zero, PIECE.STATE1
		la	$t0, PIECE.CURRENT.STATE
		sw	$t1, 0($t0)
		j	rotate.piece.end
		
		rotate.j.to.state2:
		la	$a1, PIECE.ARRAY.J.STATE2
		jal	copy.array
		addi	$t1, $zero, PIECE.STATE2
		la	$t0, PIECE.CURRENT.STATE
		sw	$t1, 0($t0)
		j	rotate.piece.end
		
		rotate.j.to.state3:
		la	$a1, PIECE.ARRAY.J.STATE3
		jal	copy.array
		addi	$t1, $zero, PIECE.STATE3
		la	$t0, PIECE.CURRENT.STATE
		sw	$t1, 0($t0)
		j	rotate.piece.end
		
		rotate.j.to.state4:
		la	$a1, PIECE.ARRAY.J.STATE4
		jal	copy.array
		addi	$t1, $zero, PIECE.STATE4
		la	$t0, PIECE.CURRENT.STATE
		sw	$t1, 0($t0)
		j	rotate.piece.end
		
	rotate.t.block:
		la	$t0, PIECE.CURRENT.STATE
		lw	$t0,0($t0)
		
		addi 	$t1, $zero, PIECE.STATE1
		beq 	$t0, $t1, rotate.t.to.state2
		addi 	$t1, $zero, PIECE.STATE2
		beq 	$t0, $t1, rotate.t.to.state3
		addi 	$t1, $zero, PIECE.STATE3
		beq 	$t0, $t1, rotate.t.to.state4
		addi 	$t1, $zero, PIECE.STATE4
		beq 	$t0, $t1, rotate.t.to.state1
		#default
		j	rotate.piece.end
		
		rotate.t.to.state1:
		la	$a1, PIECE.ARRAY.T.STATE1
		jal	copy.array
		addi	$t1, $zero, PIECE.STATE1
		la	$t0, PIECE.CURRENT.STATE
		sw	$t1, 0($t0)
		j	rotate.piece.end
		
		rotate.t.to.state2:
		la	$a1, PIECE.ARRAY.T.STATE2
		jal	copy.array
		addi	$t1, $zero, PIECE.STATE2
		la	$t0, PIECE.CURRENT.STATE
		sw	$t1, 0($t0)
		j	rotate.piece.end
		
		rotate.t.to.state3:
		la	$a1, PIECE.ARRAY.T.STATE3
		jal	copy.array
		addi	$t1, $zero, PIECE.STATE3
		la	$t0, PIECE.CURRENT.STATE
		sw	$t1, 0($t0)
		j	rotate.piece.end
		
		rotate.t.to.state4:
		la	$a1, PIECE.ARRAY.T.STATE4
		jal	copy.array
		addi	$t1, $zero, PIECE.STATE4
		la	$t0, PIECE.CURRENT.STATE
		sw	$t1, 0($t0)
		j	rotate.piece.end

	rotate.piece.end:
	
	lw	$t0, 0($sp)
	lw	$t1, 4($sp)
	lw	$ra, 8($sp)
	addi 	$sp, $sp, 12
	
	jr	$ra


copy.array:#(a0 = endereco para qual sera copiado, a1 = endereco do que sera copiado)	a0 = a1
	addi 	$sp, $sp, -16
	sw	$t0, 0($sp)
	sw	$t1, 4($sp)
	sw	$t2, 8($sp)
	sw	$ra, 12($sp)
	
	addi	$t0, $zero, 0				# i = 0
	addi	$t1, $zero, PIECE.ARRAY.SIZE		# i = 0 ... i = 16
	
	copy.array.loop1:
		beq 	$t0, $t1 copy.array.loop1.end
		
		lw	$t2, 0($a1)		# tiramos de a1
		sw	$t2, 0($a0)		# armazenamos em a0
		
		addi	$a0, $a0, 4		#avancamos em a0 e a1
		addi	$a1, $a1, 4
		addi	$t0, $t0, 1
		j	copy.array.loop1
	copy.array.loop1.end:
	
	lw	$t0, 0($sp)
	lw	$t1, 4($sp)
	lw	$t2, 8($sp)
	lw	$ra, 12($sp)
	addi 	$sp, $sp, 16
	
	jr $ra
		
end:
	addi 	$v0, $zero, 10
	syscall
