.data
###############
#Variaveis
###############
COLLISION.BASE:		.word 	0xFF012C00		# Para uma screen de 320x240 = 12C00

TECLADO:		.word 	0xFF000004 

####
#PLAYER 1
####
####################################################################################################
PLAYER1.TIMER.COUNT:	.word 	0 
#PLAYER1.TIMER.END:	.word 	1000			# Tempo de espera varia com clock
#PLAYER1.TIMER.END:	.word 	1			# Tempo de espera varia com clock
PLAYER1.TIMER.END:	.word 	2000			# Tempo de espera varia com clock


PLAYER1.NEWPIECE.FLAG:	.word   1
PLAYER1.DRAW.FLAG:	.word   1
PLAYER1.LOST.FLAG:	.word   0

PLAYER1.INITIAL.PIVO:	.word   0xFF003EB2		# CUIDADO! endereco deve estar alinhado pois armazenamos por store word
PLAYER1.INIT.FIELD.PIVO:.word   0xFF003E9E		# INITIAL.PIVO - 4 * SQUARE.UNIT.SIZE
PLAYER1.CURRENT.PIVO:	.word	0			 
PLAYER1.PAST.PIVO:	.word	0 

PLAYER1.CURRENT.TYPE:	.word 	0x00000007
PLAYER1.CURRENT.STATE:	.word 	0x00000001

PLAYER1.PIECE.FORM:	.word	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 
PLAYER1.PAST.FORM:	.word	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0	
	
####
#PLAYER 2
####
################################################################################################
PLAYER2.TIMER.COUNT:	.word 	0 
PLAYER2.TIMER.END:	.word 	1000			# Tempo de espera varia com clock

PLAYER2.NEWPIECE.FLAG:	.word   1
PLAYER2.DRAW.FLAG:	.word   1
PLAYER2.LOST.FLAG:	.word   0

PLAYER2.INITIAL.PIVO:	.word   0xFF000302		# CUIDADO! endereco deve estar alinhado pois armazenamos por store word
PLAYER2.INIT.FIELD.PIVO:.word   0xFF0002EE		# INITIAL.PIVO - 4 * SQUARE.UNIT.SIZE
PLAYER2.CURRENT.PIVO:	.word	0
PLAYER2.PAST.PIVO:	.word	0

PLAYER2.CURRENT.TYPE:	.word 	0x00000007
PLAYER2.CURRENT.STATE:	.word 	0x00000001

PLAYER2.PIECE.FORM:	.word	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 
PLAYER2.PAST.FORM:	.word	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0	

####
#PLAYER 3
####
##############################################################################################
PLAYER3.TIMER.COUNT:	.word 	0 
PLAYER3.TIMER.END:	.word 	1000			# Tempo de espera varia com clock

PLAYER3.NEWPIECE.FLAG:	.word   1
PLAYER3.DRAW.FLAG:	.word   1
PLAYER3.LOST.FLAG:	.word   0

PLAYER3.INITIAL.PIVO:	.word   0xFF00033E		# CUIDADO! endereco deve estar alinhado pois armazenamos por store word
PLAYER3.CURRENT.PIVO:	.word	0
PLAYER3.PAST.PIVO:	.word	0

PLAYER3.CURRENT.TYPE:	.word 	0x00000007
PLAYER3.CURRENT.STATE:	.word 	0x00000001

PLAYER3.PIECE.FORM:	.word	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 
PLAYER3.PAST.FORM:	.word	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0	

####
#PLAYER 4
####
############################################################################################
PLAYER4.TIMER.COUNT:	.word 	0 
PLAYER4.TIMER.END:	.word 	1000			# Tempo de espera varia com clock

PLAYER4.NEWPIECE.FLAG:	.word   1
PLAYER4.DRAW.FLAG:	.word   1
PLAYER4.LOST.FLAG:	.word   0

PLAYER4.INITIAL.PIVO:	.word   0xFF00037A		# CUIDADO! endereco deve estar alinhado pois armazenamos por store word
PLAYER4.CURRENT.PIVO:	.word	0
PLAYER4.PAST.PIVO:	.word	0

PLAYER4.CURRENT.TYPE:	.word 	0x00000007
PLAYER4.CURRENT.STATE:	.word 	0x00000001

PLAYER4.PIECE.FORM:	.word	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 
PLAYER4.PAST.FORM:	.word	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0	
				
########################################################################

#Contem endereços relativos ao quadrado pivo = (2,3) modificar caso mude tamanho das pecas

# 4x4
PIECE.ARRAY.ADRESS:	.word   -1288,-1284,-1280,-1276,
				  -8,  -4,    0,   4,
				 1272, 1276, 1280, 1284,
				 2552, 2556, 2560, 2564,

#Utilizado para checar se rotacao e possivel
PIECE.ARRAY.TEMP.FORM:	.word	0,0,0,0,
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
.eqv	PIECE.ARRAY.SIZE	16		#Tamanho dos arrays 16
.eqv	SQUARE.UNIT.SIZE	4		# 4x4 pixels Ao modificar tamanho e necessario atualizar matriz de enrderecos relativos
						# e tambem ponto do pivo inicial da peca ao ser criada

.eqv	SCREEN.ADRESS.INIT	0xFF000000
.eqv	SCREEN.ADRESS.END	0xFF012C00	#320*240 + FF00_0000 modificar caso mude dimesnsoes
.eqv	SCREEN.X		320
.eqv	SCREEN.Y		240

.eqv	FIELD.WIDTH		10		# Tamanho em unity square dos campos
.eqv	FRAME.SIZE		20		# Largura das bordas
.eqv	FIELD.SIZE		40		# Largura do campo navegavel

.eqv	FIELD.SUP.LIM		0xFF003C00	# FF000000 + 320 * 16 -> 4 unidades(unity square) abaixo da parte de cima da tela
.eqv	FIELD.INF.LIM		0xFF00F000	# FF012C00 - 320 * 16 -> 4 unidades(unity square) acima da parte de baixo da tela
.eqv	COL.FIELD.SUP.LIM	0xFF014000	# FF012C00 + 320 * 16
.eqv	COL.FIELD.INF.LIM	0xFF021340	# FF025800 - 320 * 16


.eqv	KEY.RIGHT		0x64
.eqv	KEY.LEFT		0x61 
.eqv	KEY.DOWN		0x73
.eqv	KEY.ROTATE		0x77 #77	

.eqv	COLOR.BLUE		0x000000F0
.eqv	COLOR.GREEN		0x00000038
.eqv	COLOR.RED		0x0000000F
.eqv	COLOR.WHITE		0xFFFFFFFF 	# necessario manter bits a mais ao inves de 0xFF
.eqv	COLOR.BLACK		0x00000000 	# necessario manter bits a mais ao inves de 0x00

.text
	jal 	draw.background
main:
	jal	update.p1
	#jal	update.p2
	#jal	update.p3
	#jal	update.p4
	
	j	main

update.p1:
	addi 	$sp, $sp, -4
	sw	$ra, 4($sp)
	
	#checamos se player ja perdeu 
	la	$t0, PLAYER1.LOST.FLAG
	lw	$t0, 0($t0)
	bne	$t0, $zero, update.p1.end	# caso tenha perdido pulamos para end

	#checamos se flag de nova peca esta ativa
	la	$t0, PLAYER1.NEWPIECE.FLAG
	lw	$t0, 0($t0)
	beq	$t0, $zero, update.p1.draw
	
	######
	# INICIALIZACAO DA PECA
	######
	######################################################################################
	# Caso a flag sinalize vamos sortear nova peca e reiniciar pivo
	# randomizar uma peca 0 a 6
	update.p1.rand:
	li 	$v0, 42  
	li 	$a1, 6 
	syscall     
	add	$a0, $a0, 1
	
	la	$t0, PLAYER1.CURRENT.TYPE
	la	$t1, PLAYER1.CURRENT.STATE
	
	sw	$a0, 0($t0)		# current piece 
	addi	$a0, $zero, 1
	sw	$a0, 0($t1)		# current sate  
	
	# Reiniciar pivo da peca
	update.p1.pivo:
	la	$t1, PLAYER1.CURRENT.PIVO
	la	$t0, PLAYER1.INITIAL.PIVO
	lw	$t0, 0($t0)  			# Pivo do player 1
	sw	$t0, 0($t1)			# Armazenamos novo pivo
	
	la	$a0, PLAYER1.PIECE.FORM		# rotaciona apenas para popular array form 
	la      $a1, PLAYER1.CURRENT.TYPE
	la	$a2, PLAYER1.CURRENT.STATE
	addi	$t1, $zero, PIECE.STATE4
	sw	$t1, 0($a2)			# Jogamos valor da peca para estado 4, para ao rotacionar ir sempre para estado 1
	jal	rotate.piece			# peca inicial esta sendo setada diretamente na memoria
	
	la	$t1, PLAYER1.NEWPIECE.FLAG
	sw	$zero, 0($t1)			#abaixamos a flag
	##########################################################################################
	
	update.p1.draw:
	la	$t1, PLAYER1.DRAW.FLAG		
	lw	$t1, 0($t1)
	beq	$t1, $zero, update.p1.check.count 	# caso nao possa atualizar pulamos para contagem	
	
	#####
	# DESENHAR PECA E PEGAR INPUTS
	#####
	##########################################################################################
	# Jogamos pivo para t0
	la	$t0, PLAYER1.CURRENT.PIVO
	lw	$t0, 0($t0)			# Endereco do pivo 
	
	#desenhamos peca
	add	$a0, $zero, $t0			# Endereco do pivo 
	add	$a1, $zero, COLOR.RED		# Cor para desenhar
	la	$a2, PLAYER1.PIECE.FORM		# Qual forma sera desenhada
	jal 	draw.piece
	
	#salvamos posicao passada para apagar peca ou desenha fixa			 
	la	$t1, PLAYER1.PAST.PIVO
	sw	$t0, 0($t1)			# Armazenamos pivo atual para pivo passado
	
	#Acrscenta movimento para baixo em $t0
	add 	$t1, $zero, SQUARE.UNIT.SIZE
	mul	$t1, $t1, SCREEN.X
	add	$t0, $t0, $t1			# t0 = proxima posicao
	
	#salvamos possicao passada e array passado
	la	$a0, PLAYER1.PAST.FORM		# array past = array form
	la	$a1, PLAYER1.PIECE.FORM	
	jal	copy.array
	
	#Pegar input e acrescentamos em $t0
	jal 	get.input
	add	$s1, $zero, $t0			# $s1 = posicao anteior ao input mas acrescido de movimento para baixo
	add 	$t0 , $t0, $v0			#acrescenta input
	
	#v1 recebe rotacao
	beq	$v1, $zero, update.p1.no.use.rotation
	############################################################################################
	
	####
	# VALIDACAO DE ROTACAO
	####
	############################################################################################
	#Caso ocorra requerimento de rotacao copiamos estado atual para temporario e validamos
	#Se for valido entao copiamos array temporario para atual
	la	$a0, PIECE.ARRAY.TEMP.FORM
	la	$a1, PLAYER1.PIECE.FORM
	jal	copy.array
	
	#rotacionamos array
	la	$a0, PIECE.ARRAY.TEMP.FORM
	la      $a1, PLAYER1.CURRENT.TYPE
	la	$a2, PLAYER1.CURRENT.STATE
	jal	rotate.piece
	
	#Checamos se ocorre colisao 
	la	$a1, PIECE.ARRAY.TEMP.FORM
	add	$a0, $zero, $t0 
	jal	check.collision.piece
	bne	$v0, $zero, update.p1.no.use.rotation
	
	#Se passou no teste de colisoes atualizamos array form
	la	$a0, PLAYER1.PIECE.FORM
	la	$a1, PIECE.ARRAY.TEMP.FORM
	jal	copy.array
	j	update.p1.save.pivo		#esta ok pulamos direto para contagem	
	#######################################################################################
	
	######################################################################################
	update.p1.no.use.rotation:
	#checamos se apos acrscentar movimento para baixo + input ocorre colisao por lateral
	la	$a1, PLAYER1.PIECE.FORM
	add	$a0, $zero, $t0 
	jal	check.collision.piece
	beq	$v0, $zero, update.p1.use.input
	update.p1.dont.use.input:			#caso ocorra colisao lateral em qualquer quadrado unitario
	add	$t0, $zero, $s1				#e conferir se ocorre colisao por baixo 
	update.p1.use.input:#input ja foi acrescido em t0
	
	#checamos se apos acrscentar movimento para baixo com ou sem input se ocorre colisao por baixo 
	la	$a1, PLAYER1.PIECE.FORM
	add	$a0, $zero, $t0 
	jal	check.collision.piece
	bne	$v0, $zero, update.p1.draw.static		# pulamos imediatamente para peca estatica
	##########################################################################################
	
	update.p1.save.pivo:
	la	$t1, PLAYER1.CURRENT.PIVO		#gurdamos novo pivo com inputs e acrescimos
	sw	$t0, 0($t1)			
	
	#setamos uma flag para nao fazer update na peca apenas apos a contagem
	la	$t0, PLAYER1.DRAW.FLAG		
	sw	$zero, 0($t0)	
	
	######
	# CONTAGEM EM STANDBY
	######
	###########################################################################################
	# Contagem para atualizar peca
	update.p1.check.count:
	la	$t0, PLAYER1.TIMER.COUNT
	la	$t1, PLAYER1.TIMER.END
	lw	$t2, 0($t0)			# t2 = contador
	lw	$t3, 0($t1)			# t3 = final da contagem
	update.p1.lp1:
		beq 	$t2, $t3, update.p1.lp1.end
		addi	$t2, $t2, 1
		sw	$t2, 0($t0)		#armazena contagem
		j	update.p1.end		#terminamos update
	update.p1.lp1.end:
	sw	$zero, 0($t0)		#reiniciamos contador
	###########################################################################################
	
	###########
	# APAGAR PECA
	###########
	#apagar quadrado passado
	update.p1.piece.erase:
	la	$t0, PLAYER1.PAST.PIVO		#possui pivo passado anterior a input e rotacao
	lw	$a0, 0($t0)	
	addi 	$a1, $zero, COLOR.WHITE
	la	$a2, PLAYER1.PAST.FORM
	jal 	draw.piece
	
	#permitimos que peca seja desenhada novamente
	la	$t0, PLAYER1.DRAW.FLAG		
	addi	$t1, $zero, 1			 
	sw	$t1, 0($t0)	
	
	j	update.p1.end				# retornamos para main para proximo update
	#############################################################################################
	
	###########
	# ATUALIZAR COLISAO
	###########
	#############################################################################################
	#Atualizamos matriz de colisao caso peca nao possa mais mover
	update.p1.draw.static:
	la	$t0, PLAYER1.PAST.PIVO		#possui pivo passado anterior a input e rotacao
	lw	$a0, 0($t0)	
	la	$a1, PLAYER1.PIECE.FORM	
	addi	$a2, $zero, 1	
	jal	update.piece.collision.matrix
	
	#Checamos se alguma linha foi preenchida
	la	$a0, PLAYER1.PAST.PIVO		#possui pivo passado anterior a input e rotacao
	la	$a1, PLAYER1.INIT.FIELD.PIVO
	lw	$a0, 0($a0)
	lw	$a1, 0($a1)
	jal	check.row
	
	# Verificamos se pecas atingiram limite superior
	beq	$v0, $zero, update.p1.not.lost
	la	$t0, PLAYER1.LOST.FLAG 			#caso tenham perdido entao player perdeu
	addi	$t1, $zero, 1
	sw	$t1, 0($t0)
	update.p1.not.lost:
	
	#permitimos criacao de nova peca
	la	$t0, PLAYER1.NEWPIECE.FLAG
	addi	$t1, $zero , 1
	sw	$t1, 0($t0)
	
	#e permitimos que peca seja desenhada novamente
	la	$t0, PLAYER1.DRAW.FLAG		
	addi	$t1, $zero, 1			 
	sw	$t1, 0($t0)	
	
	update.p1.end:
	lw	$ra, 4($sp)
	addi 	$sp, $sp, 4
	
	jr	$ra

update.p2:
	addi 	$sp, $sp, -4
	sw	$ra, 4($sp)
	
	#checamos se player ja perdeu 
	la	$t0, PLAYER2.LOST.FLAG
	lw	$t0, 0($t0)
	bne	$t0, $zero, update.p2.end	# caso tenha perdido pulamos para end

	#checamos se flag de nova peca esta ativa
	la	$t0, PLAYER2.NEWPIECE.FLAG
	lw	$t0, 0($t0)
	beq	$t0, $zero, update.p2.draw
	
	######
	# INICIALIZACAO DA PECA
	######
	######################################################################################
	# Caso a flag sinalize vamos sortear nova peca e reiniciar pivo
	# randomizar uma peca 0 a 6
	update.p2.rand:
	li 	$v0, 42  
	li 	$a1, 6 
	syscall     
	add	$a0, $a0, 1
	
	la	$t0, PLAYER2.CURRENT.TYPE
	la	$t1, PLAYER2.CURRENT.STATE
	
	sw	$a0, 0($t0)		# current piece 
	addi	$a0, $zero, 1
	sw	$a0, 0($t1)		# current sate  
	
	# Reiniciar pivo da peca
	update.p2.pivo:
	la	$t1, PLAYER2.CURRENT.PIVO
	la	$t0, PLAYER2.INITIAL.PIVO
	lw	$t0, 0($t0) 			
	sw	$t0, 0($t1)			# Armazenamos novo pivo
	
	la	$a0, PLAYER2.PIECE.FORM		# rotaciona apenas para popular array form 
	la      $a1, PLAYER2.CURRENT.TYPE
	la	$a2, PLAYER2.CURRENT.STATE
	addi	$t1, $zero, PIECE.STATE4
	sw	$t1, 0($a2)			# Jogamos valor da peca para estado 4, para ao rotacionar ir sempre para estado 1
	jal	rotate.piece			# peca inicial esta sendo setada diretamente na memoria
	
	la	$t1, PLAYER2.NEWPIECE.FLAG
	sw	$zero, 0($t1)			#abaixamos a flag
	##########################################################################################
	
	update.p2.draw:
	la	$t1, PLAYER2.DRAW.FLAG		
	lw	$t1, 0($t1)
	beq	$t1, $zero, update.p2.check.count 	# caso nao possa atualizar pulamos para contagem	
	
	#####
	# DESENHAR PECA E PEGAR INPUTS
	#####
	##########################################################################################
	# Jogamos pivo para t0
	la	$t0, PLAYER2.CURRENT.PIVO
	lw	$t0, 0($t0)			# Endereco do pivo 
	
	#desenhamos peca
	add	$a0, $zero, $t0			# Endereco do pivo 
	add	$a1, $zero, COLOR.BLUE		# Cor para desenhar
	la	$a2, PLAYER2.PIECE.FORM		# Qual forma sera desenhada
	jal 	draw.piece
	
	#salvamos posicao passada para apagar peca ou desenha fixa			 
	la	$t1, PLAYER2.PAST.PIVO
	sw	$t0, 0($t1)			# Armazenamos pivo atual para pivo passado
	
	#Acrscenta movimento para baixo em $t0
	add 	$t1, $zero, SQUARE.UNIT.SIZE
	mul	$t1, $t1, SCREEN.X
	add	$t0, $t0, $t1			# t0 = proxima posicao
	
	#salvamos possicao passada e array passado
	la	$a0, PLAYER2.PAST.FORM		# array past = array form
	la	$a1, PLAYER2.PIECE.FORM	
	jal	copy.array
	
	#Pegar input e acrescentamos em $t0
	jal 	get.input
	add	$s1, $zero, $t0			# $s1 = posicao anteior ao input mas acrescido de movimento para baixo
	add 	$t0 , $t0, $v0			#acrescenta input
	
	#v1 recebe rotacao
	beq	$v1, $zero, update.p2.no.use.rotation
	############################################################################################
	
	####
	# VALIDACAO DE ROTACAO
	####
	############################################################################################
	#Caso ocorra requerimento de rotacao copiamos estado atual para temporario e validamos
	#Se for valido entao copiamos array temporario para atual
	la	$a0, PIECE.ARRAY.TEMP.FORM
	la	$a1, PLAYER2.PIECE.FORM
	jal	copy.array
	
	#rotacionamos array
	la	$a0, PIECE.ARRAY.TEMP.FORM
	la      $a1, PLAYER2.CURRENT.TYPE
	la	$a2, PLAYER2.CURRENT.STATE
	jal	rotate.piece
	
	#Checamos se ocorre colisao 
	la	$a1, PIECE.ARRAY.TEMP.FORM
	add	$a0, $zero, $t0 
	jal	check.collision.piece
	bne	$v0, $zero, update.p2.no.use.rotation
	
	#Se passou no teste de colisoes atualizamos array form
	la	$a0, PLAYER2.PIECE.FORM
	la	$a1, PIECE.ARRAY.TEMP.FORM
	jal	copy.array
	j	update.p2.save.pivo		#esta ok pulamos direto para contagem	
	#######################################################################################
	
	######################################################################################
	update.p2.no.use.rotation:
	#checamos se apos acrscentar movimento para baixo + input ocorre colisao por lateral
	la	$a1, PLAYER2.PIECE.FORM
	add	$a0, $zero, $t0 
	jal	check.collision.piece
	beq	$v0, $zero, update.p2.use.input
	update.p2.dont.use.input:			#caso ocorra colisao lateral em qualquer quadrado unitario
	add	$t0, $zero, $s1				#e conferir se ocorre colisao por baixo 
	update.p2.use.input:#input ja foi acrescido em t0
	
	#checamos se apos acrscentar movimento para baixo com ou sem input se ocorre colisao por baixo 
	la	$a1, PLAYER2.PIECE.FORM
	add	$a0, $zero, $t0 
	jal	check.collision.piece
	bne	$v0, $zero, update.p2.draw.static		# pulamos imediatamente para peca estatica
	##########################################################################################
	
	update.p2.save.pivo:
	la	$t1, PLAYER2.CURRENT.PIVO		#gurdamos novo pivo com inputs e acrescimos
	sw	$t0, 0($t1)			
	
	#setamos uma flag para nao fazer update na peca apenas apos a contagem
	la	$t0, PLAYER2.DRAW.FLAG		
	sw	$zero, 0($t0)	
	
	######
	# CONTAGEM EM STANDBY
	######
	###########################################################################################
	# Contagem para atualizar peca
	update.p2.check.count:
	la	$t0, PLAYER2.TIMER.COUNT
	la	$t1, PLAYER2.TIMER.END
	lw	$t2, 0($t0)			# t2 = contador
	lw	$t3, 0($t1)			# t3 = final da contagem
	update.p2.lp1:
		beq 	$t2, $t3, update.p2.lp1.end
		addi	$t2, $t2, 1
		sw	$t2, 0($t0)		#armazena contagem
		j	update.p2.end		#terminamos update
	update.p2.lp1.end:
	sw	$zero, 0($t0)		#reiniciamos contador
	###########################################################################################
	
	###########
	# APAGAR PECA
	###########
	#apagar quadrado passado
	update.p2.piece.erase:
	la	$t0, PLAYER2.PAST.PIVO		#possui pivo passado anterior a input e rotacao
	lw	$a0, 0($t0)	
	addi 	$a1, $zero, COLOR.WHITE
	la	$a2, PLAYER2.PAST.FORM
	jal 	draw.piece
	
	#permitimos que peca seja desenhada novamente
	la	$t0, PLAYER2.DRAW.FLAG		
	addi	$t1, $zero, 1			 
	sw	$t1, 0($t0)	
	
	j	update.p2.end				# retornamos para main para proximo update
	#############################################################################################
	
	###########
	# ATUALIZAR COLISAO
	###########
	#############################################################################################
	#Atualizamos matriz de colisao caso peca nao possa mais mover
	update.p2.draw.static:
	la	$t0, PLAYER2.PAST.PIVO		#possui pivo passado anterior a input e rotacao
	lw	$a0, 0($t0)	
	la	$a1, PLAYER2.PIECE.FORM	
	addi	$a2, $zero, 1	
	jal	update.piece.collision.matrix	#Tambem checa por colisao superior caso player tenha perdido
	
	#Checamos se alguma linha foi preenchida
	la	$a0, PLAYER2.PAST.PIVO		#possui pivo passado anterior a input e rotacao
	la	$a1, PLAYER2.INIT.FIELD.PIVO
	lw	$a0, 0($a0)
	lw	$a1, 0($a1)
	jal	check.row
	
	# Verificamos se pecas atingiram limite superior
	beq	$v0, $zero, update.p2.not.lost
	la	$t0, PLAYER2.LOST.FLAG 			#caso tenham perdido entao player perdeu
	addi	$t1, $zero, 1
	sw	$t1, 0($t0)
	update.p2.not.lost:
	
	#permitimos criacao de nova peca
	la	$t0, PLAYER2.NEWPIECE.FLAG
	addi	$t1, $zero , 1
	sw	$t1, 0($t0)
	
	#e permitimos que peca seja desenhada novamente
	la	$t0, PLAYER2.DRAW.FLAG		
	addi	$t1, $zero, 1			 
	sw	$t1, 0($t0)	
	
	update.p2.end:
	lw	$ra, 4($sp)
	addi 	$sp, $sp, 4
	
	jr	$ra

update.p3:
	addi 	$sp, $sp, -4
	sw	$ra, 4($sp)
	
	#checamos se player ja perdeu 
	la	$t0, PLAYER3.LOST.FLAG
	lw	$t0, 0($t0)
	bne	$t0, $zero, update.p3.end	# caso tenha perdido pulamos para end

	#checamos se flag de nova peca esta ativa
	la	$t0, PLAYER3.NEWPIECE.FLAG
	lw	$t0, 0($t0)
	beq	$t0, $zero, update.p3.draw
	
	######
	# INICIALIZACAO DA PECA
	######
	######################################################################################
	# Caso a flag sinalize vamos sortear nova peca e reiniciar pivo
	# randomizar uma peca 0 a 6
	update.p3.rand:
	li 	$v0, 42  
	li 	$a1, 6 
	syscall     
	add	$a0, $a0, 1
	
	la	$t0, PLAYER3.CURRENT.TYPE
	la	$t1, PLAYER3.CURRENT.STATE
	
	sw	$a0, 0($t0)		# current piece 
	addi	$a0, $zero, 1
	sw	$a0, 0($t1)		# current sate  
	
	# Reiniciar pivo da peca
	update.p3.pivo:
	la	$t1, PLAYER3.CURRENT.PIVO
	la	$t0, PLAYER3.INITIAL.PIVO
	lw	$t0, 0($t0) 		# Pivo do player 1
	sw	$t0, 0($t1)			# Armazenamos novo pivo
	
	la	$a0, PLAYER3.PIECE.FORM		# rotaciona apenas para popular array form 
	la      $a1, PLAYER3.CURRENT.TYPE
	la	$a2, PLAYER3.CURRENT.STATE
	addi	$t1, $zero, PIECE.STATE4
	sw	$t1, 0($a2)			# Jogamos valor da peca para estado 4, para ao rotacionar ir sempre para estado 1
	jal	rotate.piece			# peca inicial esta sendo setada diretamente na memoria
	
	la	$t1, PLAYER3.NEWPIECE.FLAG
	sw	$zero, 0($t1)			#abaixamos a flag
	##########################################################################################
	
	update.p3.draw:
	la	$t1, PLAYER3.DRAW.FLAG		
	lw	$t1, 0($t1)
	beq	$t1, $zero, update.p3.check.count 	# caso nao possa atualizar pulamos para contagem	
	
	#####
	# DESENHAR PECA E PEGAR INPUTS
	#####
	##########################################################################################
	# Jogamos pivo para t0
	la	$t0, PLAYER3.CURRENT.PIVO
	lw	$t0, 0($t0)			# Endereco do pivo 
	
	#desenhamos peca
	add	$a0, $zero, $t0			# Endereco do pivo 
	add	$a1, $zero, COLOR.GREEN		# Cor para desenhar
	la	$a2, PLAYER3.PIECE.FORM		# Qual forma sera desenhada
	jal 	draw.piece
	
	#salvamos posicao passada para apagar peca ou desenha fixa			 
	la	$t1, PLAYER3.PAST.PIVO
	sw	$t0, 0($t1)			# Armazenamos pivo atual para pivo passado
	
	#Acrscenta movimento para baixo em $t0
	add 	$t1, $zero, SQUARE.UNIT.SIZE
	mul	$t1, $t1, SCREEN.X
	add	$t0, $t0, $t1			# t0 = proxima posicao
	
	#salvamos possicao passada e array passado
	la	$a0, PLAYER3.PAST.FORM		# array past = array form
	la	$a1, PLAYER3.PIECE.FORM	
	jal	copy.array
	
	#Pegar input e acrescentamos em $t0
	jal 	get.input
	add	$s1, $zero, $t0			# $s1 = posicao anteior ao input mas acrescido de movimento para baixo
	add 	$t0 , $t0, $v0			#acrescenta input
	
	#v1 recebe rotacao
	beq	$v1, $zero, update.p3.no.use.rotation
	############################################################################################
	
	####
	# VALIDACAO DE ROTACAO
	####
	############################################################################################
	#Caso ocorra requerimento de rotacao copiamos estado atual para temporario e validamos
	#Se for valido entao copiamos array temporario para atual
	la	$a0, PIECE.ARRAY.TEMP.FORM
	la	$a1, PLAYER3.PIECE.FORM
	jal	copy.array
	
	#rotacionamos array
	la	$a0, PIECE.ARRAY.TEMP.FORM
	la      $a1, PLAYER3.CURRENT.TYPE
	la	$a2, PLAYER3.CURRENT.STATE
	jal	rotate.piece
	
	#Checamos se ocorre colisao 
	la	$a1, PIECE.ARRAY.TEMP.FORM
	add	$a0, $zero, $t0 
	jal	check.collision.piece
	bne	$v0, $zero, update.p3.no.use.rotation
	
	#Se passou no teste de colisoes atualizamos array form
	la	$a0, PLAYER3.PIECE.FORM
	la	$a1, PIECE.ARRAY.TEMP.FORM
	jal	copy.array
	j	update.p3.save.pivo		#esta ok pulamos direto para contagem	
	#######################################################################################
	
	######################################################################################
	update.p3.no.use.rotation:
	#checamos se apos acrscentar movimento para baixo + input ocorre colisao por lateral
	la	$a1, PLAYER3.PIECE.FORM
	add	$a0, $zero, $t0 
	jal	check.collision.piece
	beq	$v0, $zero, update.p3.use.input
	update.p3.dont.use.input:			#caso ocorra colisao lateral em qualquer quadrado unitario
	add	$t0, $zero, $s1				#e conferir se ocorre colisao por baixo 
	update.p3.use.input:#input ja foi acrescido em t0
	
	#checamos se apos acrscentar movimento para baixo com ou sem input se ocorre colisao por baixo 
	la	$a1, PLAYER3.PIECE.FORM
	add	$a0, $zero, $t0 
	jal	check.collision.piece
	bne	$v0, $zero, update.p3.draw.static		# pulamos imediatamente para peca estatica
	##########################################################################################
	
	update.p3.save.pivo:
	la	$t1, PLAYER3.CURRENT.PIVO		#gurdamos novo pivo com inputs e acrescimos
	sw	$t0, 0($t1)			
	
	#setamos uma flag para nao fazer update na peca apenas apos a contagem
	la	$t0, PLAYER3.DRAW.FLAG		
	sw	$zero, 0($t0)	
	
	######
	# CONTAGEM EM STANDBY
	######
	###########################################################################################
	# Contagem para atualizar peca
	update.p3.check.count:
	la	$t0, PLAYER3.TIMER.COUNT
	la	$t1, PLAYER3.TIMER.END
	lw	$t2, 0($t0)			# t2 = contador
	lw	$t3, 0($t1)			# t3 = final da contagem
	update.p3.lp1:
		beq 	$t2, $t3, update.p3.lp1.end
		addi	$t2, $t2, 1
		sw	$t2, 0($t0)		#armazena contagem
		j	update.p3.end		#terminamos update
	update.p3.lp1.end:
	sw	$zero, 0($t0)		#reiniciamos contador
	###########################################################################################
	
	###########
	# APAGAR PECA
	###########
	#apagar quadrado passado
	update.p3.piece.erase:
	la	$t0, PLAYER3.PAST.PIVO		#possui pivo passado anterior a input e rotacao
	lw	$a0, 0($t0)	
	addi 	$a1, $zero, COLOR.WHITE
	la	$a2, PLAYER3.PAST.FORM
	jal 	draw.piece
	
	#permitimos que peca seja desenhada novamente
	la	$t0, PLAYER3.DRAW.FLAG		
	addi	$t1, $zero, 1			 
	sw	$t1, 0($t0)	
	
	j	update.p3.end				# retornamos para main para proximo update
	#############################################################################################
	
	###########
	# ATUALIZAR COLISAO
	###########
	#############################################################################################
	#Atualizamos matriz de colisao caso peca nao possa mais mover
	update.p3.draw.static:
	la	$t0, PLAYER3.PAST.PIVO		#possui pivo passado anterior a input e rotacao
	lw	$a0, 0($t0)	
	la	$a1, PLAYER3.PIECE.FORM	
	addi	$a2, $zero, 1	
	jal	update.piece.collision.matrix
	
	# Verificamos se pecas atingiram limite superior
	beq	$v0, $zero, update.p3.not.lost
	la	$t0, PLAYER3.LOST.FLAG 			#caso tenham perdido entao player perdeu
	addi	$t1, $zero, 1
	sw	$t1, 0($t0)
	update.p3.not.lost:
	
	#permitimos criacao de nova peca
	la	$t0, PLAYER3.NEWPIECE.FLAG
	addi	$t1, $zero , 1
	sw	$t1, 0($t0)
	
	#e permitimos que peca seja desenhada novamente
	la	$t0, PLAYER3.DRAW.FLAG		
	addi	$t1, $zero, 1			 
	sw	$t1, 0($t0)	
	
	update.p3.end:
	lw	$ra, 4($sp)
	addi 	$sp, $sp, 4
	
	jr	$ra
	
	
update.p4:
	addi 	$sp, $sp, -4
	sw	$ra, 4($sp)

	#checamos se player ja perdeu 
	la	$t0, PLAYER4.LOST.FLAG
	lw	$t0, 0($t0)
	bne	$t0, $zero, update.p4.end	# caso tenha perdido pulamos para end

	#checamos se flag de nova peca esta ativa
	la	$t0, PLAYER4.NEWPIECE.FLAG
	lw	$t0, 0($t0)
	beq	$t0, $zero, update.p4.draw
	
	######
	# INICIALIZACAO DA PECA
	######
	######################################################################################
	# Caso a flag sinalize vamos sortear nova peca e reiniciar pivo
	# randomizar uma peca 0 a 6
	update.p4.rand:
	li 	$v0, 42  
	li 	$a1, 6 
	syscall     
	add	$a0, $a0, 1
	
	la	$t0, PLAYER4.CURRENT.TYPE
	la	$t1, PLAYER4.CURRENT.STATE
	
	sw	$a0, 0($t0)		# current piece 
	addi	$a0, $zero, 1
	sw	$a0, 0($t1)		# current sate  
	
	# Reiniciar pivo da peca
	update.p4.pivo:
	la	$t1, PLAYER4.CURRENT.PIVO
	la	$t0, PLAYER4.INITIAL.PIVO
	lw	$t0, 0($t0) 		# Pivo do player 1
	sw	$t0, 0($t1)			# Armazenamos novo pivo
	
	la	$a0, PLAYER4.PIECE.FORM		# rotaciona apenas para popular array form 
	la      $a1, PLAYER4.CURRENT.TYPE
	la	$a2, PLAYER4.CURRENT.STATE
	addi	$t1, $zero, PIECE.STATE4
	sw	$t1, 0($a2)			# Jogamos valor da peca para estado 4, para ao rotacionar ir sempre para estado 1
	jal	rotate.piece			# peca inicial esta sendo setada diretamente na memoria
	
	la	$t1, PLAYER4.NEWPIECE.FLAG
	sw	$zero, 0($t1)			#abaixamos a flag
	##########################################################################################
	
	update.p4.draw:
	la	$t1, PLAYER4.DRAW.FLAG		
	lw	$t1, 0($t1)
	beq	$t1, $zero, update.p4.check.count 	# caso nao possa atualizar pulamos para contagem	
	
	#####
	# DESENHAR PECA E PEGAR INPUTS
	#####
	##########################################################################################
	# Jogamos pivo para t0
	la	$t0, PLAYER4.CURRENT.PIVO
	lw	$t0, 0($t0)			# Endereco do pivo 
	
	#desenhamos peca
	add	$a0, $zero, $t0			# Endereco do pivo 
	add	$a1, $zero, COLOR.BLACK		# Cor para desenhar
	la	$a2, PLAYER4.PIECE.FORM		# Qual forma sera desenhada
	jal 	draw.piece
	
	#salvamos posicao passada para apagar peca ou desenha fixa			 
	la	$t1, PLAYER4.PAST.PIVO
	sw	$t0, 0($t1)			# Armazenamos pivo atual para pivo passado
	
	#Acrscenta movimento para baixo em $t0
	add 	$t1, $zero, SQUARE.UNIT.SIZE
	mul	$t1, $t1, SCREEN.X
	add	$t0, $t0, $t1			# t0 = proxima posicao
	
	#salvamos possicao passada e array passado
	la	$a0, PLAYER4.PAST.FORM		# array past = array form
	la	$a1, PLAYER4.PIECE.FORM	
	jal	copy.array
	
	#Pegar input e acrescentamos em $t0
	jal 	get.input
	add	$s1, $zero, $t0			# $s1 = posicao anteior ao input mas acrescido de movimento para baixo
	add 	$t0 , $t0, $v0			#acrescenta input
	
	#v1 recebe rotacao
	beq	$v1, $zero, update.p4.no.use.rotation
	############################################################################################
	
	####
	# VALIDACAO DE ROTACAO
	####
	############################################################################################
	#Caso ocorra requerimento de rotacao copiamos estado atual para temporario e validamos
	#Se for valido entao copiamos array temporario para atual
	la	$a0, PIECE.ARRAY.TEMP.FORM
	la	$a1, PLAYER4.PIECE.FORM
	jal	copy.array
	
	#rotacionamos array
	la	$a0, PIECE.ARRAY.TEMP.FORM
	la      $a1, PLAYER4.CURRENT.TYPE
	la	$a2, PLAYER4.CURRENT.STATE
	jal	rotate.piece
	
	#Checamos se ocorre colisao 
	la	$a1, PIECE.ARRAY.TEMP.FORM
	add	$a0, $zero, $t0 
	jal	check.collision.piece
	bne	$v0, $zero, update.p4.no.use.rotation
	
	#Se passou no teste de colisoes atualizamos array form
	la	$a0, PLAYER4.PIECE.FORM
	la	$a1, PIECE.ARRAY.TEMP.FORM
	jal	copy.array
	j	update.p4.save.pivo		#esta ok pulamos direto para contagem	
	#######################################################################################
	
	######################################################################################
	update.p4.no.use.rotation:
	#checamos se apos acrscentar movimento para baixo + input ocorre colisao por lateral
	la	$a1, PLAYER4.PIECE.FORM
	add	$a0, $zero, $t0 
	jal	check.collision.piece
	beq	$v0, $zero, update.p4.use.input
	update.p4.dont.use.input:			#caso ocorra colisao lateral em qualquer quadrado unitario
	add	$t0, $zero, $s1				#e conferir se ocorre colisao por baixo 
	update.p4.use.input:#input ja foi acrescido em t0
	
	#checamos se apos acrscentar movimento para baixo com ou sem input se ocorre colisao por baixo 
	la	$a1, PLAYER4.PIECE.FORM
	add	$a0, $zero, $t0 
	jal	check.collision.piece
	bne	$v0, $zero, update.p4.draw.static		# pulamos imediatamente para peca estatica
	##########################################################################################
	
	update.p4.save.pivo:
	la	$t1, PLAYER4.CURRENT.PIVO		#gurdamos novo pivo com inputs e acrescimos
	sw	$t0, 0($t1)			
	
	#setamos uma flag para nao fazer update na peca apenas apos a contagem
	la	$t0, PLAYER4.DRAW.FLAG		
	sw	$zero, 0($t0)	
	
	######
	# CONTAGEM EM STANDBY
	######
	###########################################################################################
	# Contagem para atualizar peca
	update.p4.check.count:
	la	$t0, PLAYER4.TIMER.COUNT
	la	$t1, PLAYER4.TIMER.END
	lw	$t2, 0($t0)			# t2 = contador
	lw	$t3, 0($t1)			# t3 = final da contagem
	update.p4.lp1:
		beq 	$t2, $t3, update.p4.lp1.end
		addi	$t2, $t2, 1
		sw	$t2, 0($t0)		#armazena contagem
		j	update.p4.end		#terminamos update
	update.p4.lp1.end:
	sw	$zero, 0($t0)		#reiniciamos contador
	###########################################################################################
	
	###########
	# APAGAR PECA
	###########
	#apagar quadrado passado
	update.p4.piece.erase:
	la	$t0, PLAYER4.PAST.PIVO		#possui pivo passado anterior a input e rotacao
	lw	$a0, 0($t0)	
	addi 	$a1, $zero, COLOR.WHITE
	la	$a2, PLAYER4.PAST.FORM
	jal 	draw.piece
	
	#permitimos que peca seja desenhada novamente
	la	$t0, PLAYER4.DRAW.FLAG		
	addi	$t1, $zero, 1			 
	sw	$t1, 0($t0)	
	
	j	update.p4.end				# retornamos para main para proximo update
	#############################################################################################
	
	###########
	# ATUALIZAR COLISAO
	###########
	#############################################################################################
	#Atualizamos matriz de colisao caso peca nao possa mais mover
	update.p4.draw.static:
	la	$t0, PLAYER4.PAST.PIVO		#possui pivo passado anterior a input e rotacao
	lw	$a0, 0($t0)	
	la	$a1, PLAYER4.PIECE.FORM	
	addi	$a2, $zero, 1	
	jal	update.piece.collision.matrix
	
	# Verificamos se pecas atingiram limite superior
	beq	$v0, $zero, update.p4.not.lost
	la	$t0, PLAYER4.LOST.FLAG 			#caso tenham perdido entao player perdeu
	addi	$t1, $zero, 1
	sw	$t1, 0($t0)
	update.p4.not.lost:
	
	#permitimos criacao de nova peca
	la	$t0, PLAYER4.NEWPIECE.FLAG
	addi	$t1, $zero , 1
	sw	$t1, 0($t0)
	
	#e permitimos que peca seja desenhada novamente
	la	$t0, PLAYER4.DRAW.FLAG		
	addi	$t1, $zero, 1			 
	sw	$t1, 0($t0)	
	
	update.p4.end:
	lw	$ra, 4($sp)
	addi 	$sp, $sp, 4
	
	jr	$ra



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

draw.unit.square:#(a0 = square pivot, a1 = draw color)
	#salvar registradores usados
	addi 	$sp, $sp, -32
	sw	$t0, 0($sp)
	sw	$t1, 4($sp)
	sw	$t2, 8($sp)
	sw	$t3, 12($sp)
	sw	$t4, 16($sp)
	sw	$s0, 20($sp)
	sw	$s1, 24($sp)
	sw	$s2, 28($sp)
	
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
			
			# Checamos se valor esta dentro do limite inferior da tela
			addi	$t3, $zero, SCREEN.ADRESS.INIT
			slt	$t3, $t0, $t3
			bne	$t3, $zero, unit.square.not.store
			
			unit.square.store:
			sw	$a1, 0($t0)
			unit.square.not.store:
			
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
	lw	$t3, 12($sp)
	lw	$t4, 16($sp)
	lw	$s0, 20($sp)
	lw	$s1, 24($sp)
	lw	$s2, 28($sp)
	addi 	$sp, $sp, 32
	
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
	addi 	$t0, $zero, FIELD.INF.LIM
	slt 	$t0, $a0, $t0				# caso proximo endereço nao esteja fora do limite inferior da tela
	beq	$t0, $zero, collision.hit  
	
	#checar por pecas ja posicionadas
	addi	$t0, $zero, SCREEN.ADRESS.INIT
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

# v0 = pecas colidiram com limite superior  
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
		
		#Checamos se colisao ultrapassa limite inferior da tela
		addi	$t4, $zero, FIELD.SUP.LIM
		slt	$t4, $t5, $t4
		bne	$t4, $zero, update.piece.out
		
		# adiciona na matriz em t5
		add	$a0, $zero, $t5 
		add	$a1, $zero, $a2		#a1 e guardado em t0 no inicio
		jal	update.dot.collision.matrix
		
		update.piece.collision.nocheck:
		
		addi	$t2, $t2, 1
		j update.piece.collision.loop1
	update.piece.collision.loop1.end:
	
	addi	$v0, $zero, 0
	j	update.piece.collision.end
	
	update.piece.out:
	addi	$v0, $zero, 1
	
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
	
	addi	$t0, $zero, SCREEN.ADRESS.INIT
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


check.row:#(a0 = pivo da peca, a1 = pivo do inicio do campo)
	addi 	$sp, $sp, -40
	sw	$t0, 0($sp)
	sw	$t1, 4($sp)
	sw	$t2, 8($sp)
	sw	$t3, 12($sp)
	sw	$t4, 16($sp)
	sw	$t5, 20($sp)
	sw	$t6, 24($sp)
	sw	$s0, 28($sp)
	sw	$s1, 32($sp)
	sw	$ra, 36($sp)
	
	# Calcular ponto inicial da verificacao
	sub	$t0, $a0, $a1			# Subtraimos pivo da peca do pivo inicial
	addi    $t1, $zero, SCREEN.X		# pegamos o valor da divisao + 8 = square.unit * 2 (pois alem do pivo da
	div	$t0, $t1			# peca temos mais duas linhas de unity square que podem
	mflo	$t0				# ter modificado estado do tabuleiro) e multiplicamos por 320
	addi	$t0, $t0, SQUARE.UNIT.SIZE
	addi	$t0, $t0, SQUARE.UNIT.SIZE
	mul	$t0, $t0, $t1			# Temos em t0 distancia em relacao a a1
	
	add	$t0, $t0, $a1			# t0 = ponto inicial da verificao na tela
	
	# Salvamos em s0 para caso seja necessario mover linha para baixo
	add	$s0, $zero, $t0			
	
	# Tranformar para endereco da matriz de colisao
	addi	$t2, $zero, SCREEN.ADRESS.INIT
	la	$t1, COLLISION.BASE
	lw	$t1, 0($t1)
	
	sub	$t0, $t0, $t2	    		# Distancia do inicio da tela ate ponto
	add	$t0, $t0, $t1 			# t0 = endereco para inicar verificao 
	
	# Salvamos em s1 ponto inicial para verificao na matriz de colisao
	add	$s1, $zero, $t0	
	
	add	$t0, $zero, 0			# i = 0
	add	$t1, $zero, 4			# Faremos verificacao 4 vezes pois peca modifica
						# 4 posiveis linhas 
	
	check.row.lp1:
		beq	$t0, $t1, check.row.lp1.end
		
		addi	$t2, $zero, 0				
		addi	$t3, $zero, FIELD.WIDTH		# quantidade de quadrado para verificar na linha
		add	$t4, $zero, $s1			# Ponto inicial da verificacao
		#debug
		add	$t6, $zero, $s0
		
		check.row.lp2:
			beq	$t2, $t3 ,check.row.clean.row	# caso loop chegue aqui linha esta preenchida
			
			lb	$t5, 0($t4)
			#debug
			sb	$zero, 0($t6)
			
			beq	$t5, $zero, check.row.lp2.end	# caso nao esteja preenchido entao linha nao esta preenchida 
			
			addi	$t4, $t4, SQUARE.UNIT.SIZE 			# Verificamos proximo quadrado
			
			#debug
			addi	$t6, $t6, SQUARE.UNIT.SIZE
			
			addi	$t2, $t2, 1
			j	check.row.lp2
		
		check.row.clean.row:
		# Nao acrescentamos para proxima linha pois esta ja tera descido
		
		add	$a0, $zero, $s0
		addi	$a1, $zero, FIELD.INF.LIM
		addi	$a2, $zero, FIELD.SUP.LIM
		addi	$a3, $zero, 0			#nao e matriz de colisao
		jal	drop.row
		
		add	$a0, $zero, $s1
		addi	$a1, $zero, COL.FIELD.INF.LIM
		addi	$a2, $zero, COL.FIELD.SUP.LIM
		addi	$a3, $zero, 1			# Dropar como matriz de colisao
		jal	drop.row
		
		addi	$t0, $t0, 1
		j	check.row.lp1
		
		check.row.lp2.end:
		addi	$t3, $zero, SQUARE.UNIT.SIZE
		addi	$t2, $zero, SCREEN.X
		mul	$t2, $t2, $t3
		sub	$s0, $s0, $t2		# Subtraimos nos pivos para verificar proxima linha acima
		sub	$s1, $s1, $t2
		addi	$t0, $t0, 1
		j	check.row.lp1
	check.row.lp1.end:
	
	lw	$t0, 0($sp)
	lw	$t1, 4($sp)
	lw	$t2, 8($sp)
	lw	$t3, 12($sp)
	lw	$t4, 16($sp)
	lw	$t5, 20($sp)
	lw	$t6, 24($sp)
	lw	$s0, 28($sp)
	lw	$s1, 32($sp)
	lw	$ra, 36($sp)
	addi 	$sp, $sp, 40

	jr	$ra

drop.row:#(a0 = pivo da primeira peca da linha a ser removida, a1 = FIELD.INF.LIM, a2 = FIELD.SUP.LIM, a3 = dropar matriz de colisao)
	addi 	$sp, $sp, -32
	sw	$t0, 0($sp)
	sw	$t1, 4($sp)
	sw	$t2, 8($sp)
	sw	$t3, 12($sp)
	sw	$t4, 16($sp)
	sw	$t5, 20($sp)
	sw	$t6, 24($sp)
	sw	$t7, 28($sp)
	
	# Queremos subir para a unidade acima
	# Dividimos a unidade por dois acrescentamos 1 
	addi	$t0 , $zero, SQUARE.UNIT.SIZE		
	addi	$t1, $zero, 2
	div	$t0, $t1
	mflo	$t0
	addi	$t0, $t0, 1
	
	# Multitplicamos pelo tamanho da tela para chegar a primeira linha da unidade acima
	addi	$t1, $zero, SCREEN.X
	mul	$t0, $t0, $t1
	
	# Para entao pegar endereco do ponto inicial de onde iremos abaixar
	sub	$t0, $a0, $t0
	subi	$t0, $t0, 2			# Subtraimos de 2 pois estaremos abaixo do pivo e o q queremos 
						# e estar exatamente no canto inferior esquerdo da unidade
	
	# Vamos acrescentar ao limite superior uma unidade
	# Pois sempre movemos da unidade superior para a inferior
	add	$t1, $zero, $a2			# Limite superior
	addi	$t2, $zero, SQUARE.UNIT.SIZE
	addi	$t3, $zero, SCREEN.X
	mul 	$t2, $t2, $t3
	sub	$t1, $t1, $t2			
	
	drop.row.lp1:
		slt	$t2 ,$t0, $t1
		bne	$t2, $zero, drop.row.lp1.end
		
		addi	$t2, $zero, SQUARE.UNIT.SIZE
		addi	$t3, $zero, FIELD.WIDTH
		
		mul	$t3, $t2, $t3		# t3 = quantos pixels serao movidos da linha
		addi	$t2, $zero, 0		# indice j
		add	$t4, $zero, $t0		# t4 = endereco atual sendo abaixado
		
		drop.row.lp2:
			beq	$t2, $t3, drop.row.lp2.end
			
			# Calculamos destino unidade*scree.x + t4
			addi	$t5, $zero, SQUARE.UNIT.SIZE
			addi	$t6, $zero, SCREEN.X
			mul 	$t5, $t5, $t6
			
			# t5 = destino
			add	$t5, $t5, $t4
			
			#caso seja matriz de colisao sempre vamos dropar
			bne	$a3, $zero, drop.row.store	
			
			# Tiramos do ponto e acrescentamos no destino
			add	$t7, $zero, $a1
			slt	$t7, $t5, $t7
			beq	$t7, $zero, drop.row.not.store 
			
			drop.row.store:
			lw	$t6, 0($t4)
			sw	$t6, 0($t5)
			drop.row.not.store:
			
			addi	$t2, $t2, 4
			addi	$t4, $t4, 4
			j	drop.row.lp2
		drop.row.lp2.end:
				
		
		subi	$t0, $t0, SCREEN.X 
		j	drop.row.lp1
	drop.row.lp1.end:
	
	lw	$t0, 0($sp)
	lw	$t1, 4($sp)
	lw	$t2, 8($sp)
	lw	$t3, 12($sp)
	lw	$t4, 16($sp)
	lw	$t5, 20($sp)
	lw	$t6, 24($sp)
	lw	$t7, 28($sp)
	addi 	$sp, $sp, 32
	
	jr	$ra


#($v0 = valor para adicionar a pivo, v1 = requerimento de rotacao)
get.input:
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
	
	addi	$s0, $zero, COLOR.BLACK				
	addi	$s1, $zero, COLOR.WHITE
	addi	$s2, $zero, FRAME.SIZE			
	addi	$s3, $zero, FIELD.SIZE
	
	addi	$t0, $zero, SCREEN.ADRESS.INIT
	addi	$t1, $zero, FIELD.SUP.LIM
							
	draw.background.lp1:
		beq 	$t0, $t1, draw.background.lp1.end
		sw 	$s0, 0($t0)
		addi	$t0, $t0, 4
		j 	draw.background.lp1
	draw.background.lp1.end:
	
	addi	$t0, $zero, FIELD.INF.LIM
	addi	$t1, $zero, SCREEN.ADRESS.END
							
	draw.background.lp2:
		beq 	$t0, $t1, draw.background.lp2.end
		sw 	$s0, 0($t0)
		addi	$t0, $t0, 4
		j 	draw.background.lp2
	draw.background.lp2.end:
	
	lw	$t0, 0($sp)
	lw	$t1, 4($sp)
	lw	$t2, 8($sp)
	lw	$t3, 12($sp)
	addi 	$sp, $sp, 16
	
	jr $ra


#rotacao sempre no sentido horario
rotate.piece:#(a0 = endereco do array a ser rotacionado, a1 = piece type adress, a2 = piece current state adress)
	#salvar registradores usados
	addi 	$sp, $sp, -12
	sw	$t0, 0($sp)
	sw	$t1, 4($sp)
	sw	$ra, 8($sp)

	lw	$t0, 0($a1)
	
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
		lw	$t0,0($a2)
		
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
		sw	$t1, 0($a2)
		j	rotate.piece.end
		 
		
	rotate.i.block:
		lw	$t0,0($a2)
		
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
		sw	$t1, 0($a2)
		j	rotate.piece.end
		
		rotate.i.to.state2:
		la	$a1, PIECE.ARRAY.I.STATE2
		jal	copy.array
		addi	$t1, $zero, PIECE.STATE2
		sw	$t1, 0($a2)
		j	rotate.piece.end
		
		
	rotate.s.block:
		lw	$t0,0($a2)
		
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
		sw	$t1, 0($a2)
		j	rotate.piece.end
		
		rotate.s.to.state2:
		la	$a1, PIECE.ARRAY.S.STATE2
		jal	copy.array
		addi	$t1, $zero, PIECE.STATE2
		sw	$t1, 0($a2)
		j	rotate.piece.end
		
	rotate.z.block:
		lw	$t0,0($a2)
		
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
		sw	$t1, 0($a2)
		j	rotate.piece.end
		
		rotate.z.to.state2:
		la	$a1, PIECE.ARRAY.Z.STATE2
		jal	copy.array
		addi	$t1, $zero, PIECE.STATE2
		sw	$t1, 0($a2)
		j	rotate.piece.end
		
	rotate.l.block:
		lw	$t0,0($a2)
		
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
		sw	$t1, 0($a2)
		j	rotate.piece.end
		
		rotate.l.to.state2:
		la	$a1, PIECE.ARRAY.L.STATE2
		jal	copy.array
		addi	$t1, $zero, PIECE.STATE2
		sw	$t1, 0($a2)
		j	rotate.piece.end
		
		rotate.l.to.state3:
		la	$a1, PIECE.ARRAY.L.STATE3
		jal	copy.array
		addi	$t1, $zero, PIECE.STATE3
		sw	$t1, 0($a2)
		j	rotate.piece.end
		
		rotate.l.to.state4:
		la	$a1, PIECE.ARRAY.L.STATE4
		jal	copy.array
		addi	$t1, $zero, PIECE.STATE4
		sw	$t1, 0($a2)
		j	rotate.piece.end
		
	rotate.j.block:
		lw	$t0,0($a2)
		
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
		sw	$t1, 0($a2)
		j	rotate.piece.end
		
		rotate.j.to.state2:
		la	$a1, PIECE.ARRAY.J.STATE2
		jal	copy.array
		addi	$t1, $zero, PIECE.STATE2
		sw	$t1, 0($a2)
		j	rotate.piece.end
		
		rotate.j.to.state3:
		la	$a1, PIECE.ARRAY.J.STATE3
		jal	copy.array
		addi	$t1, $zero, PIECE.STATE3
		sw	$t1, 0($a2)
		j	rotate.piece.end
		
		rotate.j.to.state4:
		la	$a1, PIECE.ARRAY.J.STATE4
		jal	copy.array
		addi	$t1, $zero, PIECE.STATE4
		sw	$t1, 0($a2)
		j	rotate.piece.end
		
	rotate.t.block:
		lw	$t0,0($a2)
		
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
		sw	$t1, 0($a2)
		j	rotate.piece.end
		
		rotate.t.to.state2:
		la	$a1, PIECE.ARRAY.T.STATE2
		jal	copy.array
		addi	$t1, $zero, PIECE.STATE2
		sw	$t1, 0($a2)
		j	rotate.piece.end
		
		rotate.t.to.state3:
		la	$a1, PIECE.ARRAY.T.STATE3
		jal	copy.array
		addi	$t1, $zero, PIECE.STATE3
		sw	$t1, 0($a2)
		j	rotate.piece.end
		
		rotate.t.to.state4:
		la	$a1, PIECE.ARRAY.T.STATE4
		jal	copy.array
		addi	$t1, $zero, PIECE.STATE4
		sw	$t1, 0($a2)
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
