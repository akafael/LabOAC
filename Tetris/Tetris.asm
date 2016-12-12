.data
###############
#Variaveis
###############
IRDA.READ:		.word 	0xFF000004 	#teclado
#IRDA.READ:		.word 	0xFFFF0504 
PLAYER.COUNT:		.word	1

STRING.PLAYER1:		.asciiz	 "PLAYER1"
STRING.PLAYER2:		.asciiz	 "PLAYER2"
STRING.PLAYER3:		.asciiz	 "PLAYER3"
STRING.PLAYER4:		.asciiz	 "PLAYER4"
STRING.POINTS:		.asciiz	 "LINES"
STRING.SELECT:		.asciiz	 ">"

####
#PLAYER 1
####
####################################################################################################
PLAYER1.TIMER.COUNT:	.word 	0 #0
PLAYER1.TIMER.END:	.word 	10 # 4			# Tempo de espera varia com clock
#PLAYER1.TIMER.END:	.word 	1 # 4			# Tempo de espera varia com clock
#PLAYER1.TIMER.END:	.word 	2000 #4			# Tempo de espera varia com clock


PLAYER1.NEWPIECE.FLAG:	.word   1 #8
PLAYER1.DRAW.FLAG:	.word   1 #12
PLAYER1.LOST.FLAG:	.word   0 #16

PLAYER1.INITIAL.PIVO:	.word   0xFF003EAA #20		# CUIDADO! endereco deve estar alinhado pois armazenamos por store word
PLAYER1.INIT.FIELD.PIVO:.word   0xFF003E96 #24		# 320 * 50 + 20(pixels antes de começar campo) + 2
PLAYER1.CURRENT.PIVO:	.word	0 #28 
PLAYER1.PAST.PIVO:	.word	0 #32

PLAYER1.CURRENT.TYPE:	.word 	0x00000007 # 36
PLAYER1.CURRENT.STATE:	.word 	0x00000001 # 40

PLAYER1.PIECE.FORM:	.word	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 # 44 
PLAYER1.PAST.FORM:	.word	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0	# 108

PLAYER1.SCORE:		.word	0 #172
	
#PLAYER1.KEY.ROTATE:	.word	0xEA155E87	 # 176
#PLAYER1.KEY.DOWN:	.word	0xF30C5E87	
#PLAYER1.KEY.RIGHT:	.word	0xE31C5E87	
#PLAYER1.KEY.LEFT:	.word	0xE41B5e87	

PLAYER1.KEY.ROTATE:	.word	0x77
PLAYER1.KEY.DOWN:	.word	0x73
PLAYER1.KEY.RIGHT:	.word	0x64
PLAYER1.KEY.LEFT:	.word	0x61

####
#PLAYER 2
####
################################################################################################
PLAYER2.TIMER.COUNT:	.word 	0 
#PLAYER2.TIMER.END:	.word 	1000			# Tempo de espera varia com clock
PLAYER2.TIMER.END:	.word 	10

PLAYER2.NEWPIECE.FLAG:	.word   1
PLAYER2.DRAW.FLAG:	.word   1
PLAYER2.LOST.FLAG:	.word   0

PLAYER2.INITIAL.PIVO:	.word   0xFF003EFA		# CUIDADO! endereco deve estar alinhado pois armazenamos por store word
PLAYER2.INIT.FIELD.PIVO:.word   0xFF003EE6		# INITIAL.PIVO - 4 * SQUARE.UNIT.SIZE
PLAYER2.CURRENT.PIVO:	.word	0
PLAYER2.PAST.PIVO:	.word	0

PLAYER2.CURRENT.TYPE:	.word 	0x00000007
PLAYER2.CURRENT.STATE:	.word 	0x00000001

PLAYER2.PIECE.FORM:	.word	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 
PLAYER2.PAST.FORM:	.word	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0	

PLAYER2.SCORE:		.word	0 # 172

PLAYER2.KEY.ROTATE:	.word	0x79	#0xAAFFFFFF # 176
PLAYER2.KEY.DOWN:	.word	0x79	#0xAAFFFFFF
PLAYER2.KEY.RIGHT:	.word	0x69	#0xAAFFFFFF
PLAYER2.KEY.LEFT:	.word	0x69	#0xAAFFFFFF

####
#PLAYER 3
####
##############################################################################################
PLAYER3.TIMER.COUNT:	.word 	0 
#PLAYER3.TIMER.END:	.word 	1000			# Tempo de espera varia com clock
PLAYER3.TIMER.END:	.word 	10 

PLAYER3.NEWPIECE.FLAG:	.word   1
PLAYER3.DRAW.FLAG:	.word   1
PLAYER3.LOST.FLAG:	.word   0

PLAYER3.INITIAL.PIVO:	.word   0xFF003F4A		# CUIDADO! endereco deve estar alinhado pois armazenamos por store word
PLAYER3.INIT.FIELD.PIVO:.word   0xFF003F36
PLAYER3.CURRENT.PIVO:	.word	0
PLAYER3.PAST.PIVO:	.word	0

PLAYER3.CURRENT.TYPE:	.word 	0x00000007
PLAYER3.CURRENT.STATE:	.word 	0x00000001

PLAYER3.PIECE.FORM:	.word	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 
PLAYER3.PAST.FORM:	.word	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0	

PLAYER3.SCORE:		.word	0 #172

PLAYER3.KEY.ROTATE:	.word	0x79	#0xAAFFFFFF # 176
PLAYER3.KEY.DOWN:	.word	0x79	#0xAAFFFFFF
PLAYER3.KEY.RIGHT:	.word	0x69	#0xAAFFFFFF
PLAYER3.KEY.LEFT:	.word	0x69	#0xAAFFFFFF

####
#PLAYER 4
####
############################################################################################
PLAYER4.TIMER.COUNT:	.word 	0 
#PLAYER4.TIMER.END:	.word 	1000			# Tempo de espera varia com clock
PLAYER4.TIMER.END:	.word 	10 

PLAYER4.NEWPIECE.FLAG:	.word   1
PLAYER4.DRAW.FLAG:	.word   1
PLAYER4.LOST.FLAG:	.word   0

PLAYER4.INITIAL.PIVO:	.word   0xFF003F9A		# CUIDADO! endereco deve estar alinhado pois armazenamos por store word
PLAYER4.INIT.FIELD.PIVO:.word   0xFF003F86
PLAYER4.CURRENT.PIVO:	.word	0
PLAYER4.PAST.PIVO:	.word	0

PLAYER4.CURRENT.TYPE:	.word 	0x00000007
PLAYER4.CURRENT.STATE:	.word 	0x00000001

PLAYER4.PIECE.FORM:	.word	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 
PLAYER4.PAST.FORM:	.word	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0	

PLAYER4.SCORE:		.word	0 #112

PLAYER4.KEY.ROTATE:	.word	0x79	#0xAAFFFFFF # 176
PLAYER4.KEY.DOWN:	.word	0x79	#0xAAFFFFFF
PLAYER4.KEY.RIGHT:	.word	0x69	#0xAAFFFFFF
PLAYER4.KEY.LEFT:	.word	0x69	#0xAAFFFFFF
									
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

MENU.BACKGROUND:	
.include	"tetrisnes.asm"

GAME.BACKGROUND:
.include	"TetrisField.asm"

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

#.eqv	COLLISION.BASE		0xFF012C00	# Para uma screen de 320x240 = 12C00
.eqv	COLLISION.BASE		0xFF000000	# Para uma screen de 320x240 = 12C00

.eqv	SCREEN.ADRESS.INIT	0xFF000000
.eqv	SCREEN.ADRESS.END	0xFF012C00	#320*240 + FF00_0000 modificar caso mude dimesnsoes
.eqv	SCREEN.X		320
.eqv	SCREEN.Y		240

.eqv	FIELD.WIDTH		10		# Tamanho em unity square dos campos
.eqv	FRAME.SIZE		20		# Largura das bordas
.eqv	FIELD.SIZE		40		# Largura do campo navegavel

# Limites coincidem com as bordas pretas do background
.eqv	FIELD.SUP.LIM		0xFF003C00	# FF000000 + 320 * 48 -> 12 unidades(unity square) abaixo da parte de cima da tela
.eqv	FIELD.INF.LIM		0xFF00F000	# FF012C00 - 320 * 16 -> 4 unidades(unity square) acima da parte de baixo da tela
#.eqv	COL.FIELD.SUP.LIM	0xFF001400	# FF012C00 + 320 * 16
#.eqv	COL.FIELD.INF.LIM	0xFF012C00	# FF012C00 + 320 * 240
.eqv	COL.FIELD.SUP.LIM	0xFF014000	# FF012C00 + 320 * 16
.eqv	COL.FIELD.INF.LIM	0xFF025800	# FF012C00 + 320 * 240

.eqv	PIECES.SUP.LIM		0xFF004100	# Limite indica a partir de qual linha player ira perder	

.eqv	KEY.NOKEY		0
.eqv	KEY.ROTATE		1
.eqv	KEY.DOWN		2
.eqv	KEY.RIGHT		3
.eqv	KEY.LEFT		4

.eqv	COLOR.BLUE		0x000000F0
.eqv	COLOR.GREEN		0x00000038
.eqv	COLOR.RED		0x0000000F
.eqv	COLOR.WHITE		0xFFFFFFFF 	# necessario manter bits a mais ao inves de 0xFF
.eqv	COLOR.BLACK		0x00000000 	# necessario manter bits a mais ao inves de 0x00

.text
main.initial:
	jal	draw.initial.screen
	jal	choose.player.count
	#Clean screen
	jal	clean.screen
	jal	initiate.game
	
	
main:
	jal	check.finish
	bne	$v0, $zero, finish.game	

	la	$a0, PLAYER1.TIMER.COUNT
	jal	update.p
	
	#Checar se temos apenas 1 player
	la	$t0, PLAYER.COUNT	
	lw	$t0, 0($t0)
	addi	$t1, $zero, 1
	beq	$t0, $t1, main.end
	
	la	$a0, PLAYER2.TIMER.COUNT
	jal	update.p
	
	#Checar se temos apenas 2 player
	la	$t0, PLAYER.COUNT	
	lw	$t0, 0($t0)
	addi	$t1, $zero, 2
	beq	$t0, $t1, main.end
	
	la	$a0, PLAYER3.TIMER.COUNT
	jal	update.p
	
	#Checar se temos apenas 3 player
	la	$t0, PLAYER.COUNT	
	lw	$t0, 0($t0)
	addi	$t1, $zero, 3
	beq	$t0, $t1, main.end
	
	la	$a0, PLAYER4.TIMER.COUNT
	jal	update.p
	
	main.end:
	
	j	main
	
initiate.game:
	addi 	$sp, $sp, -4
	sw	$ra, 4($sp)
	
	la	$a0, GAME.BACKGROUND
	jal	draw.bgfigure
	
	la	$a0, PLAYER1.INIT.FIELD.PIVO
	lw	$a0, 0($a0)
	jal	draw.lat.col
	
	la	$a0, PLAYER2.INIT.FIELD.PIVO
	lw	$a0, 0($a0)
	jal	draw.lat.col
	
	la	$a0, PLAYER3.INIT.FIELD.PIVO
	lw	$a0, 0($a0)
	jal	draw.lat.col
	
	la	$a0, PLAYER4.INIT.FIELD.PIVO
	lw	$a0, 0($a0)
	jal	draw.lat.col
	
	#jal 	draw.background
	jal	update.p.points
	
	lw	$ra, 4($sp)
	addi 	$sp, $sp, 4
	
	jr	$ra

update.p:# (a0 = PLAYERX.TIMER.COUNT) Mapeamento em relacao
	addi 	$sp, $sp, -8
	sw	$ra, 0($sp)
	sw	$s4, 4($sp)
	
	add	$s4, $zero, $a0		# s4 = PLAYERX.TIMER.COUNT
	
	#checamos se player ja perdeu 
	addi	$t0, $s4, 16			# PLAYER1.LOST.FLAG
	lw	$t0, 0($t0) 			
	bne	$t0, $zero, update.p.end	# caso tenha perdido pulamos para end

	#checamos se flag de nova peca esta ativa
	addi	$t0, $s4, 8			# PLAYER1.NEWPIECE.FLAG
	lw	$t0, 0($t0)	
	beq	$t0, $zero, update.p.draw
	
	
	######
	# INICIALIZACAO DA PECA
	######
	######################################################################################
	# Caso a flag sinalize vamos sortear nova peca e reiniciar pivo
	# randomizar uma peca 0 a 6
	update.p.rand:
	li 	$v0, 42  
	li 	$a1, 6 
	#syscall     
	add	$a0, $a0, 1
	#Debug
	add	$a0, $zero ,2
	
	addi	$t0, $s4, 36		# PLAYER1.CURRENT.TYPE
	addi	$t1, $s4, 40		# PLAYER1.CURRENT.STATE
	
	sw	$a0, 0($t0)		
	addi	$a0, $zero, 1
	sw	$a0, 0($t1)		 
	
	# Reiniciar pivo da peca
	update.p.pivo:
	addi	$t0, $s4, 20			# PLAYER1.INITIAL.PIVO
	addi	$t1, $s4, 28 			# PLAYER1.CURRENT.PIVO
	lw	$t0, 0($t0)  			# Pivo do player 1 
	sw	$t0, 0($t1)			# Armazenamos novo pivo
	
	# rotaciona apenas para popular array form 
	addi	$a0, $s4, 44  			# PLAYER1.PIECE.FORM		
	addi    $a1, $s4, 36 			# PLAYER1.CURRENT.TYPE
	addi	$a2, $s4, 40			# PLAYER1.CURRENT.STATE
	addi	$t1, $zero, PIECE.STATE4
	sw	$t1, 0($a2)			# Jogamos valor da peca para estado 4, para ao rotacionar ir sempre para estado 1
	jal	rotate.piece			# peca inicial esta sendo setada diretamente na memoria
	
	addi	$t1, $s4, 8 			# PLAYER1.NEWPIECE.FLAG	
	sw	$zero, 0($t1)			# abaixamos a flag
	##########################################################################################
	
	update.p.draw:
	addi	$t1, $s4, 12 			# PLAYER1.DRAW.FLAG		
	lw	$t1, 0($t1)			
	beq	$t1, $zero, update.p.check.count 	# caso nao possa atualizar pulamos para contagem	
	
	#####
	# DESENHAR PECA E PEGAR INPUTS
	#####
	##########################################################################################
	# Jogamos pivo para t0

	addi	$t0, $s4, 28 			# PLAYER1.CURRENT.PIVO
	lw	$t0, 0($t0)			# Endereco do pivo 
	
	#desenhamos peca
	add	$a0, $zero, $t0			# Endereco do pivo 
	add	$a1, $zero, COLOR.RED		# Cor para desenhar
	addi	$a2, $s4, 44 			# PLAYER1.PIECE.FORM	# Qual forma sera desenhada
	jal 	draw.piece
	
	#salvamos posicao passada para apagar peca ou desenha fixa			 
	addi	$t1, $s4, 32 			# PLAYER1.PAST.PIVO
	sw	$t0, 0($t1)			# Armazenamos pivo atual para pivo passado
	
	#Acrscenta movimento para baixo em $t0
	add 	$t1, $zero, SQUARE.UNIT.SIZE
	addi	$t2, $zero, SCREEN.X
	mult	$t1, $t2
	mflo	$t1
	add	$t0, $t0, $t1			# t0 = proxima posicao
	
	#salvamos possicao passada e array passado
	addi	$a0, $s4, 108			# PLAYER1.PAST.FORM		# array past = array form
	addi	$a1, $s4, 44			# PLAYER1.PIECE.FORM	
	jal	copy.array
	
	#Pegar input e acrescentamos em $t0
	add	$a0, $s4, 176			#PLAYER.KEY.ROTATE
	jal 	get.input
	add	$s1, $zero, $t0			# $s1 = posicao anteior ao input mas acrescido de movimento para baixo
	add 	$t0 , $t0, $v0			#acrescenta input
	
	#v1 recebe rotacao
	beq	$v1, $zero, update.p.no.use.rotation
	############################################################################################
	
	####
	# VALIDACAO DE ROTACAO
	####
	############################################################################################
	#Caso ocorra requerimento de rotacao copiamos estado atual para temporario e validamos
	#Se for valido entao copiamos array temporario para atual
	la	$a0, PIECE.ARRAY.TEMP.FORM
	addi	$a1, $s4, 44				# PLAYER1.PIECE.FORM
	jal	copy.array
	
	#rotacionamos array
	la	$a0, PIECE.ARRAY.TEMP.FORM
	addi    $a1, $s4, 36				# PLAYER1.CURRENT.TYPE
	addi	$a2, $s4, 40				# PLAYER1.CURRENT.STATE
	jal	rotate.piece
	
	#Checamos se ocorre colisao 
	la	$a1, PIECE.ARRAY.TEMP.FORM
	add	$a0, $zero, $t0 
	jal	check.collision.piece
	bne	$v0, $zero, update.p.no.use.rotation
	
	#Se passou no teste de colisoes atualizamos array form
	addi	$a0, $s4, 44				# PLAYER1.PIECE.FORM
	la	$a1, PIECE.ARRAY.TEMP.FORM
	jal	copy.array
	j	update.p.save.pivo		#esta ok pulamos direto para contagem	
	#######################################################################################
	
	######################################################################################
	update.p.no.use.rotation:
	#checamos se apos acrscentar movimento para baixo + input ocorre colisao por lateral
	addi	$a1, $s4, 44 				# PLAYER1.PIECE.FORM
	add	$a0, $zero, $t0 
	jal	check.collision.piece
	beq	$v0, $zero, update.p.use.input
	update.p.dont.use.input:			#caso ocorra colisao lateral em qualquer quadrado unitario
	add	$t0, $zero, $s1				#e conferir se ocorre colisao por baixo 
	update.p.use.input:#input ja foi acrescido em t0
	
	#checamos se apos acrscentar movimento para baixo com ou sem input se ocorre colisao por baixo 
	addi	$a1, $s4, 44 				# PLAYER1.PIECE.FORM
	add	$a0, $zero, $t0 
	jal	check.collision.piece
	bne	$v0, $zero, update.p.draw.static		# pulamos imediatamente para peca estatica
	##########################################################################################
	
	update.p.save.pivo:
	addi	$t1, $s4, 28 		# PLAYER1.CURRENT.PIVO		#gurdamos novo pivo com inputs e acrescimos
	sw	$t0, 0($t1)		
	
	#setamos uma flag para nao fazer update na peca apenas apos a contagem
	addi	$t0, $s4, 12 				# PLAYER1.DRAW.FLAG		
	sw	$zero, 0($t0)				
	
	######
	# CONTAGEM EM STANDBY
	######
	###########################################################################################
	# Contagem para atualizar peca
	update.p.check.count:
	addi	$t0, $s4, 0 			# PLAYER1.TIMER.COUNT
	addi	$t1, $s4, 4			# PLAYER1.TIMER.END
	lw	$t2, 0($t0)			# PLAYER1.TIMER.COUNT	# t2 = contador
	lw	$t3, 0($t1)			# PLAYER1.TIMER.END	# t3 = final da contagem
	update.p.lp1:
		beq 	$t2, $t3, update.p.lp1.end
		addi	$t2, $t2, 1
		sw	$t2, 0($t0)		#armazena contagem
		j	update.p.end		#terminamos update
	update.p.lp1.end:
	sw	$zero, 0($t0)		#reiniciamos contador
	###########################################################################################
	
	###########
	# APAGAR PECA
	###########
	#apagar quadrado passado
	update.p.piece.erase:
	addi	$t0, $s4, 32 			# PLAYER1.PAST.PIVO# possui pivo passado anterior a input e rotacao
	lw	$a0, 0($t0)			# PLAYER1.PAST.PIVO
	addi 	$a1, $zero, COLOR.WHITE
	addi	$a2, $s4, 108			# PLAYER1.PAST.FORM
	jal 	draw.piece
	
	#permitimos que peca seja desenhada novamente
	addi	$t0, $s4, 12 			# PLAYER1.DRAW.FLAG		
	addi	$t1, $zero, 1			 
	sw	$t1, 0($t0)				
	
	j	update.p.end				# retornamos para main para proximo update
	#############################################################################################
	
	###########
	# ATUALIZAR COLISAO
	###########
	#############################################################################################
	#Atualizamos matriz de colisao caso peca nao possa mais mover
	update.p.draw.static:
	addi	$t0, $s4, 32 			# PLAYER1.PAST.PIVO #possui pivo passado anterior a input e rotacao
	lw	$a0, 0($t0)			# PLAYER1.PAST.PIVO
	addi	$a1, $s4, 108			# PLAYER1.PIECE.FORM	
	addi	$a2, $zero, 1	
	jal	update.piece.collision.matrix
	
	#Checamos se alguma linha foi preenchida
	#la	$a0, PLAYER1.PAST.PIVO		#possui pivo passado anterior a input e rotacao
	#la	$a1, PLAYER1.INIT.FIELD.PIVO
	lw	$a0, 32($s4)			# PLAYER1.PAST.PIVO	
	lw	$a1, 24($s4)			# PLAYER1.INIT.FIELD.PIVO
	
	jal	check.row	#precisa usar retorno em v1 pois update piece collision retorna em v0 valor avaliado posteriormente
	
	#atualizar pontuacao do player
	add	$t0, $s4, 172
	lw	$t1, 0($t0)
	add	$t1, $t1, $v1
	sw	$t1, 0($t0) 
	
	# Verificamos se pecas atingiram limite superior
	beq	$v0, $zero, update.p.not.lost			# <---------------------- v0 utilizado aqui
	addi	$t0, $s4, 16 			# PLAYER1.LOST.FLAG #caso tenham perdido entao player perdeu
	addi	$t1, $zero, 1
	sw	$t1, 0($t0)			# PLAYER1.LOST.FLAG
	update.p.not.lost:
	
	# permitimos criacao de nova peca
	addi	$t0, $s4, 8 			# PLAYER1.NEWPIECE.FLAG
	addi	$t1, $zero , 1
	sw	$t1, 0($t0)		
	
	# e permitimos que peca seja desenhada novamente
	addi	$t0, $s4, 12			# PLAYER1.DRAW.FLAG		
	addi	$t1, $zero, 1			 
	sw	$t1, 0($t0)			# PLAYER1.DRAW.FLAG		
	
	update.p.end:
	lw	$ra, 0($sp)
	lw	$s4, 4($sp)
	addi 	$sp, $sp, 8
	
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
	
	mult	$t1, $s1				# SCREEN.X * SQUARE.UNIT.SIZE/2
	mflo	$t1
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
	addi	$t1, $zero, COLLISION.BASE
	
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
		
		#Checamos se colisao ultrapassa limite superior estipulado
		addi	$t4, $zero, PIECES.SUP.LIM
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
	addi	$t1, $zero, COLLISION.BASE
	
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

# "Desenha" limites laterais de acordo com pivo do player e tamanho do campo (FIELD.WIDTH) 
draw.lat.col:#(a0 = PLAYER.INIT.FIELD.PIVO)
	addi 	$sp, $sp, -16
	sw	$t0, 0($sp)
	sw	$t1, 4($sp)
	sw	$t2, 8($sp)
	sw	$t3, 12($sp)
	
	addi	$t0, $zero, SCREEN.ADRESS.INIT
	addi	$t1, $zero, COLLISION.BASE
	
	sub	$t2, $a0, $t0		# distancia do inicio da tela ate ponto
	
	# t0 - contem endereco inicial da coluna a esquerda 
	add	$t0, $t1, $t2 		
	addi	$t1, $zero, SQUARE.UNIT.SIZE
	sub	$t0, $t0, $t1	
	
	# para calcular coluna a direita basta adicionar FIELD.WIDTH + 1 * SQUARE.UNIT.SIZE
	addi	$t2, $zero, FIELD.WIDTH
	addi	$t2, $t2, 1
	mult	$t1, $t2		# (FIELD.WIDTH + 1) * SQUARE.UNIT.SIZE
	mflo	$t1
	add	$t1, $t0, $t1		# endereco coluna a esquerda + (FIELD.WIDTH + 1) * SQUARE.UNIT.SIZE
	
	# Faremos um loop para desenhar ate limite inferior da matriz de colisao
	addi	$t2, $zero, SCREEN.ADRESS.END
	
	draw.lat.col.lp1:
		slt	$t3, $t0, $t2				# enquanto t0, for menor que limite inferior da matriz de colisao
		beq	$t3, $zero, draw.lat.col.lp1.end
		
		addi	$t3, $zero, 1
		sb	$t3, 0($t0)
		sb	$t3, 0($t1)	
		
		# Adicionamos para proximo pivo abaixo
		addi	$t3, $zero, SQUARE.UNIT.SIZE
		addi	$t4, $zero, SCREEN.X
		mult	$t3, $t4
		mflo	$t3
		
		add	$t0, $t0 ,$t3
		add	$t1, $t1 ,$t3
		j	draw.lat.col.lp1
	draw.lat.col.lp1.end:
	
	lw	$t0, 0($sp)
	lw	$t1, 4($sp)
	lw	$t2, 8($sp)
	lw	$t3, 12($sp)
	addi 	$sp, $sp, 16
	
	jr	$ra



check.row:#(a0 = pivo da peca, a1 = pivo do inicio do campo) $v1 = pontuacao
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
	
	#pontuacao para zero
	add	$v1, $zero, $zero
	
	# Calcular ponto inicial da verificacao
	sub	$t0, $a0, $a1			# Subtraimos pivo da peca do pivo inicial
	addi    $t1, $zero, SCREEN.X		# pegamos o valor da divisao + 8 = square.unit * 2 (pois alem do pivo da
	div	$t0, $t1			# peca temos mais duas linhas de unity square que podem
	mflo	$t0				# ter modificado estado do tabuleiro) e multiplicamos por 320
	addi	$t0, $t0, SQUARE.UNIT.SIZE
	addi	$t0, $t0, SQUARE.UNIT.SIZE
	mult	$t0, $t1			# Temos em t0 distancia em relacao a a1
	mflo	$t0
	
	add	$t0, $t0, $a1			# t0 = ponto inicial da verificao na tela
	
	# Salvamos em s0 para caso seja necessario mover linha para baixo
	add	$s0, $zero, $t0			
	
	# Tranformar para endereco da matriz de colisao
	addi	$t2, $zero, SCREEN.ADRESS.INIT
	addi	$t1, $zero, COLLISION.BASE
	
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
		#add	$t6, $zero, $s0
		
		check.row.lp2:
			beq	$t2, $t3 ,check.row.clean.row	# caso loop chegue aqui linha esta preenchida
			
			#Checamos se a checagem nao ultrapassa os limites do campo
			addi	$t6, $zero, FIELD.INF.LIM
			slt	$t6, $t6, $t4			# caso estejamos alem do FIEL.INF.LIM
			bne	$t6, $zero, check.row.lp2.end	# se nao for zero entao t4 > t6
			
			lb	$t5, 0($t4)
			#debug
			#sb	$zero, 0($t6)
			
			addi	$t6, $zero, 0xFFFFFFFF		# Caso esteja preenchido com cor branca
			beq	$t5, $t6, check.row.lp2.end
			#beq	$t5, $zero, check.row.lp2.end	# caso nao esteja preenchido entao linha nao esta preenchida 
			addi	$t4, $t4, SQUARE.UNIT.SIZE 			# Verificamos proximo quadrado
			
			#debug
			#addi	$t6, $t6, SQUARE.UNIT.SIZE
			
			addi	$t2, $t2, 1
			j	check.row.lp2
		
		check.row.clean.row:
		# Nao acrescentamos para proxima linha pois esta ja tera descido
		
		jal	update.p.points
		
		add	$a0, $zero, $s0
		addi	$a1, $zero, FIELD.INF.LIM
		addi	$a2, $zero, FIELD.SUP.LIM
		addi	$a3, $zero, 0			#nao e matriz de colisao
		jal	drop.row
		
		#add	$a0, $zero, $s1
		#addi	$a1, $zero, COL.FIELD.INF.LIM
		#addi	$a2, $zero, COL.FIELD.SUP.LIM
		#addi	$a3, $zero, 1			# Dropar como matriz de colisao
		#jal	drop.row
		
		addi	$v1, $v1, 1
		
		addi	$t0, $t0, 1
		j	check.row.lp1
		
		check.row.lp2.end:
		addi	$t3, $zero, SQUARE.UNIT.SIZE
		addi	$t2, $zero, SCREEN.X
		mult	$t2, $t3
		mflo	$t2
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
	
	addi	$t0 , $zero, SQUARE.UNIT.SIZE	
	addi	$t1, $zero, SCREEN.X
	mult	$t0, $t1
	mflo	$t0
	add	$a2, $a2, $t0
	
	# Queremos subir para a unidade acima
	# Dividimos a unidade por dois acrescentamos 1 
	addi	$t0 , $zero, SQUARE.UNIT.SIZE		
	addi	$t1, $zero, 2
	div	$t0, $t1
	mflo	$t0
	addi	$t0, $t0, 1
	
	# Multitplicamos pelo tamanho da tela para chegar a primeira linha da unidade acima
	addi	$t1, $zero, SCREEN.X
	mult	$t0, $t1
	mflo	$t0
	
	# Para entao pegar endereco do ponto inicial de onde iremos abaixar
	sub	$t0, $a0, $t0
	subi	$t0, $t0, 2			# Subtraimos de 2 pois estaremos abaixo do pivo e o q queremos 
						# e estar exatamente no canto inferior esquerdo da unidade
	
	# Vamos acrescentar ao limite superior uma unidade
	# Pois sempre movemos da unidade superior para a inferior
	add	$t1, $zero, $a2			# Limite superior
	addi	$t2, $zero, SQUARE.UNIT.SIZE
	addi	$t3, $zero, SCREEN.X
	mult 	$t2, $t3
	mflo	$t2
	sub	$t1, $t1, $t2			
	
	drop.row.lp1:
		slt	$t2 ,$t0, $t1
		bne	$t2, $zero, drop.row.lp1.end
		
		addi	$t2, $zero, SQUARE.UNIT.SIZE
		addi	$t3, $zero, FIELD.WIDTH
		
		mult	$t3, $t2		# t3 = quantos pixels serao movidos da linha
		mflo	$t3
		addi	$t2, $zero, 0		# indice j
		add	$t4, $zero, $t0		# t4 = endereco atual sendo abaixado
		
		drop.row.lp2:
			beq	$t2, $t3, drop.row.lp2.end
			
			# Calculamos destino unidade*scree.x + t4
			addi	$t5, $zero, SQUARE.UNIT.SIZE
			addi	$t6, $zero, SCREEN.X
			mult 	$t5, $t6
			mflo	$t5
			
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
get.input:#(a0 = PLAYER.KEY.ROTATE)
	#salvar registradores usados
	addi 	$sp, $sp, -12
	sw	$t0, 0($sp)
	sw	$t1, 4($sp)
	sw	$ra, 8($sp)

	#Retorna em v0 key pressionada
	#a0 ja contem PLAYER.KEY.ROTATE
	jal	get.key
	add	$t0, $zero, $v0
	
	get.input.witch:
		get.input.rotate:
			addi 	$t1, $zero, KEY.ROTATE			
			bne 	$t0, $t1, get.input.down
			add 	$v0, $zero, $zero
			addi 	$v1, $zero, 1
			j 	get.input.end
		get.input.down:
			addi 	$t1, $zero, KEY.DOWN
			bne 	$t0, $t1, get.input.right
			addi 	$v0, $zero, 3840		
			add 	$v1, $zero, $zero
			j 	get.input.end
		get.input.right:
			addi 	$t1, $zero, KEY.RIGHT
			bne 	$t0, $t1, get.input.left
			addi 	$v0, $zero, SQUARE.UNIT.SIZE
			add 	$v1, $zero, $zero
			j 	get.input.end
		get.input.left:
			addi 	$t1, $zero, KEY.LEFT
			bne 	$t0, $t1, get.input.nokey
			addi 	$v0, $zero, -SQUARE.UNIT.SIZE
			add 	$v1, $zero, $zero
			j 	get.input.end
		get.input.nokey:
			add 	$v1, $zero, $zero
			add	$v0, $zero, $zero
	
	get.input.end:
	lw	$t0, 0($sp)
	lw	$t1, 4($sp)
	lw	$ra, 8($sp)
	addi 	$sp, $sp, 12
	
	jr $ra

#v0 = key pressionada KEY.TYPE
get.key:#(a0 = PLAYER.KEY.ROTATE)
	addi 	$sp, $sp, -8
	sw	$t0, 0($sp)
	sw	$t1, 4($sp)
		
	la 	$t0, IRDA.READ
	lw 	$t1 ,0($t0)
	lw	$t0, 0($t1)
	
	get.key.witch:
		get.key.rotate:
			add 	$t1, $a0, 0			# PLAYER.KEY.ROTATE
			lw 	$t1, 0($t1)	
			bne 	$t0, $t1, get.key.down
			addi 	$v0, $zero, KEY.ROTATE
			j 	get.key.clean
		get.key.down:
			add 	$t1, $a0, 4			# PLAYER.KEY.DOWN
			lw 	$t1, 0($t1)
			bne 	$t0, $t1, get.key.right
			addi 	$v0, $zero, KEY.DOWN
			j 	get.key.clean
		get.key.right:
			add 	$t1, $a0, 8			# PLAYER.KEY.RIGHT
			lw 	$t1, 0($t1)
			bne 	$t0, $t1, get.key.left
			addi 	$v0, $zero, KEY.RIGHT
			j 	get.key.clean
		get.key.left:
			add 	$t1, $a0, 12			# PLAYER.KEY.LEFT
			lw 	$t1, 0($t1)
			bne 	$t0, $t1, get.key.nokey
			addi 	$v0, $zero, KEY.LEFT
			j 	get.key.clean
		get.key.nokey:
			addi	$v0, $zero, KEY.NOKEY
			j	get.key.no.clean
	
	get.key.clean:
	#limpamos endereço do teclado
	lw 	$t0, IRDA.READ
	sw 	$zero , 0($t0)
	
	get.key.no.clean:
	
	lw	$t0, 0($sp)
	lw	$t1, 4($sp)
	addi 	$sp, $sp, 8
	
	jr $ra


update.p.points:
	addi 	$sp, $sp, -24
	sw	$ra, 0($sp)
	sw	$a0, 4($sp)
	sw	$a1, 8($sp)
	sw	$a2, 12($sp)
	sw	$t0, 16($sp)
	sw	$t1, 20($sp)
	
	######
	#PLAYER 1
	######
	###############################################################
	
	la	$a0, STRING.PLAYER1 
	la	$a1, PLAYER1.SCORE
	addi	$a2, $zero, 12
	jal	print.status
	
	#Checar se temos apenas 1 player
	la	$t0, PLAYER.COUNT	
	lw	$t0, 0($t0)
	addi	$t1, $zero, 1
	beq	$t0, $t1, update.p.points.end
	
	######
	#PLAYER 2
	######
	###############################################################
	
	la	$a0, STRING.PLAYER2 
	la	$a1, PLAYER2.SCORE
	addi	$a2, $zero, 92
	jal	print.status
	
	#Checar se temos apenas 1 player
	la	$t0, PLAYER.COUNT	
	lw	$t0, 0($t0)
	addi	$t1, $zero, 2
	beq	$t0, $t1, update.p.points.end
	
	######
	#PLAYER 3
	######
	###############################################################
	
	la	$a0, STRING.PLAYER3 
	la	$a1, PLAYER3.SCORE
	addi	$a2, $zero, 172
	jal	print.status
	
	#Checar se temos apenas 1 player
	la	$t0, PLAYER.COUNT	
	lw	$t0, 0($t0)
	addi	$t1, $zero, 3
	beq	$t0, $t1, update.p.points.end
	
	######
	#PLAYER 4
	######
	###############################################################
	la	$a0, STRING.PLAYER4 
	la	$a1, PLAYER4.SCORE
	addi	$a2, $zero, 252
	jal	print.status
	
	update.p.points.end:
	lw	$ra, 0($sp)
	lw	$a0, 4($sp)
	lw	$a1, 8($sp)
	lw	$a2, 12($sp)
	lw	$t0, 16($sp)
	lw	$t1, 20($sp)
	addi 	$sp, $sp, 24
	
	jr 	$ra

print.status:#(a0 = endereco string STRING.PLAYER , a1 = endereco pontuacao PLAYER.SCORE, a2 = coluna para plotar)
	addi	$sp, $sp, -32
	sw	$s0, 0($sp)
	sw	$s1, 4($sp)
	sw	$s2, 8($sp)
	sw	$v0,12($sp)
	sw	$a0,16($sp)
	sw	$a1,20($sp)
	sw	$a2,24($sp)
	sw	$a3,28($sp)
	
	add	$s0, $zero, $a0
	add	$s1, $zero, $a1
	add	$s2, $zero, $a2
	
	addi 	$v0,$zero, 104 	#4
	add 	$a0, $zero, $s0
	add 	$a1, $zero, $s2
	li 	$a2,13
	li 	$a3,0x00FF
	syscall
	
	addi 	$v0,$zero, 104 #4
	la 	$a0, STRING.POINTS
	add 	$a1, $zero, $s2
	li 	$a2,22
	li 	$a3,0x00FF
	syscall
	
	addi 	$v0,$zero, 101	#1
	add	$a0, $zero, $s1
	lw	$a0, 0($a0)
	add 	$a1, $zero, $s2
	addi	$a1, $a1, 48
	li 	$a2,22
	li 	$a3,0x00FF
	syscall
	
	lw	$s0, 0($sp)
	lw	$s1, 4($sp)
	lw	$s2, 8($sp)
	lw	$v0,12($sp)
	lw	$a0,16($sp)
	lw	$a1,20($sp)
	lw	$a2,24($sp)
	lw	$a3,28($sp)
	addi	$sp, $sp, 32
	
	jr	$ra

#Informa em PLAYER.COUNT numero de players, o controle utilizado e do player 1
choose.player.count:		
	addi	$sp, $sp, -12
	sw	$t0, 0($sp)
	sw	$t1, 4($sp)
	sw	$ra, 8($sp)
	
	# selecao inicial do player
	add	$t0, $zero, 1
	
	choose.player.get.key:
	add	$a0, $zero, $t0
	jal	draw.marker
	
	la	$a0, PLAYER1.KEY.ROTATE
	jal	get.key
	
	choose.player.witch.key:
		choose.player.right:
			addi 	$t1, $zero, KEY.RIGHT			
			bne 	$v0, $t1, choose.player.left
			
			#adicionamos para proximo player
			addi	$t0, $t0, 1
			addi	$t1, $zero, 5
			beq	$t0, $t1, choose.player.right.sub
			j choose.player.get.key
			
			# Caso estejamos em zero voltamos para 4
			choose.player.right.sub:
			add	$t0, $zero, 1
			j choose.player.get.key
			
		choose.player.left:
			addi 	$t1, $zero, KEY.LEFT			
			bne 	$v0, $t1, choose.player.select
			
			#adicionamos para proximo player
			addi	$t0, $t0, -1
			beq	$t0, $zero, choose.player.left.add
			j choose.player.get.key
			
			# Caso estejamos em zero voltamos para 4
			choose.player.left.add:
			add	$t0, $zero, 4
			j choose.player.get.key
		
		choose.player.select:
			addi 	$t1, $zero, KEY.ROTATE			
			bne 	$v0, $t1, choose.player.none
			j	choose.player.end
		
		choose.player.none:
			j	choose.player.get.key
	
	choose.player.end:
	
	# Armazenamos contagem de players
	la	$t1, PLAYER.COUNT
	sw	$t0, 0($t1)
	
	lw	$t0, 0($sp)
	lw	$t1, 4($sp)
	lw	$ra, 8($sp)
	addi	$sp, $sp, 12
	
	jr	$ra
	
# Desenha marcador na posicao selecionada
draw.marker:#(a0 = PLAYER selecionado 1..4)
	addi	$sp, $sp, -32
	sw	$ra, 0($sp)
	sw	$t0, 4($sp)
	sw	$t1, 8($sp)
	sw	$t2, 12($sp)
	sw	$t3, 16($sp)
	sw	$t4, 20($sp)
	sw	$t5, 24($sp)
	sw	$t6, 28($sp)
	
	addi	$t5, $zero, 0x00FF	# Desenhar marcador com cor
	addi	$t6, $zero, 0x0000	# Nao desenhar marcador
	
	add	$t0, $zero, $t6
	add	$t1, $zero, $t6
	add	$t2, $zero, $t6
	add	$t3, $zero, $t6
	
	draw.marker.p1:
		addi	$t4, $zero, 1
		bne	$a0, $t4, draw.marker.p2
		add	$t0, $zero, $t5
		j	draw.marker.at
	draw.marker.p2:
		addi	$t4, $zero, 2
		bne	$a0, $t4, draw.marker.p3
		add	$t1, $zero, $t5
		j	draw.marker.at
	draw.marker.p3:
		addi	$t4, $zero, 3
		bne	$a0, $t4, draw.marker.p4
		add	$t2, $zero, $t5
		j	draw.marker.at
	draw.marker.p4:
		addi	$t4, $zero, 4
		bne	$a0, $t4, draw.marker.at
		add	$t3, $zero, $t5
	
	draw.marker.at:
	
	# Strings com marcadores de players
	la 	$a0, STRING.SELECT 
	li 	$a1, 117 
	li 	$a2, 135
	add 	$a3, $zero, $t0
	jal 	print.string
	
	la 	$a0, STRING.SELECT 
	li 	$a1, 117 
	li 	$a2, 145
	add 	$a3, $zero, $t1
	jal 	print.string
	
	la 	$a0, STRING.SELECT 
	li 	$a1, 117 
	li 	$a2, 155
	add 	$a3, $zero, $t2
	jal 	print.string
	
	la 	$a0, STRING.SELECT 
	li 	$a1, 117 
	li 	$a2, 165
	add 	$a3, $zero, $t3
	jal 	print.string
	
	lw	$ra, 0($sp)
	lw	$t0, 4($sp)
	lw	$t1, 8($sp)
	lw	$t2, 12($sp)
	lw	$t3, 16($sp)
	lw	$t4, 20($sp)
	lw	$t5, 24($sp)
	lw	$t6, 28($sp)
	addi	$sp, $sp, 32
	
	jr $ra 

finish.game:
	#reinicia valores dos jogadores q necessitam reinicializar
	la	$t0, PLAYER1.LOST.FLAG
	la	$t1, PLAYER2.LOST.FLAG
	la	$t2, PLAYER3.LOST.FLAG
	la	$t3, PLAYER4.LOST.FLAG
	
	sw	$zero, 0($t0)
	sw	$zero, 0($t1)
	sw	$zero, 0($t2)
	sw	$zero, 0($t3)
	
	addi	$v0, $zero, 32
	addi	$a0, $zero, 3000
	syscall 
	
	j	main.initial

#(v0 = 1 , finalizar jogo)
check.finish:
	addi	$sp, $sp, -28
	sw	$ra, 0($sp)
	sw	$t0, 4($sp)
	sw	$t1, 8($sp)
	sw	$t2, 12($sp)
	sw	$t3, 16($sp)
	sw	$t4, 20($sp)
	sw	$t5, 24($sp)
	
	la	$t0, PLAYER1.LOST.FLAG
	lw	$t0,0($t0)
	la	$t1, PLAYER2.LOST.FLAG
	lw	$t1,0($t1)
	la	$t2, PLAYER3.LOST.FLAG
	lw	$t2,0($t2)
	la	$t3, PLAYER4.LOST.FLAG
	lw	$t3,0($t3)
	
	la	$t4, PLAYER.COUNT
	lw	$t4, 0($t4)
	
	addi	$t5, $zero, 1
	beq	$t5, $t4, check.finish.val1
	addi	$t5, $zero, 2
	beq	$t5, $t4, check.finish.val2
	addi	$t5, $zero, 3
	beq	$t5, $t4, check.finish.val3
	addi	$t5, $zero, 4
	beq	$t5, $t4, check.finish.val4
	
	check.finish.val1:
		addi	$v0, $zero, 0
		beq	$t0, $zero, check.finish.end
		addi	$v0, $zero, 1
		j	check.finish.end
		
	check.finish.val2:
		addi	$v0, $zero, 0
		beq	$t0, $zero, check.finish.end
		beq	$t1, $zero, check.finish.end
		addi	$v0, $zero, 1
		j	check.finish.end
	
	check.finish.val3:
		addi	$v0, $zero, 0
		beq	$t0, $zero, check.finish.end
		beq	$t1, $zero, check.finish.end
		beq	$t2, $zero, check.finish.end
		addi	$v0, $zero, 1
		j	check.finish.end
	
	check.finish.val4:
		addi	$v0, $zero, 0
		beq	$t0, $zero, check.finish.end
		beq	$t1, $zero, check.finish.end
		beq	$t2, $zero, check.finish.end
		beq	$t3, $zero, check.finish.end
		addi	$v0, $zero, 1
		j	check.finish.end
	
	check.finish.end:
	
	lw	$ra, 0($sp)
	lw	$t0, 4($sp)
	lw	$t1, 8($sp)
	lw	$t2, 12($sp)
	lw	$t3, 16($sp)
	lw	$t4, 20($sp)
	lw	$t5, 24($sp)
	addi	$sp, $sp, 28
	
	jr 	$ra
	


#Screen com opcoes e background
draw.initial.screen:
	addi	$sp, $sp, -4
	sw	$ra, 0($sp)
	
	# Desenhar background
	la	$a0, MENU.BACKGROUND
	jal	draw.bgfigure
	
	# Strings com opcoes de players
	la 	$a0, STRING.PLAYER1 
	li 	$a1, 125 
	li 	$a2, 135
	li 	$a3,0x00FF
	jal 	print.string
	
	la 	$a0, STRING.PLAYER2 
	li 	$a1, 125 
	li 	$a2, 145
	li 	$a3,0x00FF
	jal 	print.string
	
	la 	$a0, STRING.PLAYER3 
	li 	$a1, 125 
	li 	$a2, 155
	li 	$a3,0x00FF
	jal 	print.string
	
	la 	$a0, STRING.PLAYER4 
	li 	$a1, 125 
	li 	$a2, 165
	li 	$a3,0x00FF
	jal 	print.string
	
	lw	$ra, 0($sp)
	addi	$sp, $sp, 4
	
	jr	$ra
	
print.string:#(a0 = STRING, a1 = COLUNA, a2 = LINHA, a3 = COLOR)
	addi 	$v0,$zero, 104 	#4
	syscall
	
	jr	$ra 

draw.bgfigure:#(a0 = adress image)
    addi $sp, $sp, -28
    sw $t0, 0($sp)
    sw $t1, 4($sp)
    sw $t2, 8($sp)
    sw $t3, 12($sp)
    sw $t4, 16($sp)
    sw $t5, 22($sp)
    sw $t6, 24($sp)
    
    addi $t0, $0, SCREEN.ADRESS.INIT
    addi $t1, $0, SCREEN.ADRESS.END
    add  $t2, $0, $t0 # Inicia Contador
    addu $t5, $a0, $zero # Posição memoria da figura

    loop_draw_bgfig:
    	sltu  $t9,$t1,$t2  # Verifica se chegou no final
    	bne $t9, $0, fim_draw_bgfig   # Acabou de printar figura
    	lw $t6, 0($t5)      # Le word, da figura
    	sw $t6, 0($t2)      # Grava word, na VGA
    	addiu $t2, $t2, 4   # Desloca Contador, onde $t2 é posição da memoria na VGA
    	addiu $t5, $t5, 4   # Desloca leitura da figura
    	j loop_draw_bgfig
    fim_draw_bgfig:

    lw $t0, 0($sp)
    lw $t1, 4($sp)
    lw $t2, 8($sp)
    lw $t3, 12($sp)
    lw $t4, 16($sp)
    lw $t5, 22($sp)
    lw $t6, 24($sp)
    addi $sp, $sp, 28

    jr  $ra

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

clean.screen:
	addi 	$sp, $sp, -16
	sw	$t0, 0($sp)
	sw	$t1, 4($sp)
	sw	$t2, 8($sp)
	sw	$t3, 12($sp)
	
	addi	$t0, $zero, SCREEN.ADRESS.INIT
	addi	$t1, $zero, SCREEN.ADRESS.END
	addi	$t2, $zero, COLOR.WHITE
	
	clean.screen.loop1:
		slt	$t3, $t0, $t1
		beq	$t3, $zero, clean.screen.loop1.end 
		
		sw	$t2, 0($t0) 
		
		addi	$t0, $t0, 4
		j	clean.screen.loop1
	clean.screen.loop1.end:

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
