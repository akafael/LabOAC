##
# TetriMIPS
# "Tetris on Assembly Mips"
# @version 0.001
##

###############################################################################
# Constants
###############################################################################
.eqv   SCREEN_DIM_X               320
.eqv   SCREEN_DIM_Y               240
.eqv   SCREEN_PIXEL0              0xff000000
.eqv   GAME_SCREEN_DIM_X           240           # Pixels
.eqv   GAME_SCREEN_DIM_Y           160           # Pixels
.eqv   GAME_SCREEN_DIM_X_TILES     15           # Tiles
.eqv   GAME_SCREEN_DIM_Y_TILES     10           # Tiles
.eqv   GAME_SCREEN_PIXEL0          0xff000000
.eqv   GAME_SCREEN_X0              40
.eqv   GAME_SCREEN_Y0              40

# Memory Mapping --------------------------------------------------------------
.eqv   MEM_SCREEN                 0xff000000
.eqv   MEM_SCREEN_END             0xff012C00

# Color Codes -----------------------------------------------------------------
.eqv   COLOR_WHITE                0xFF      # 0b11111111
.eqv   COLOR_GREEN                0x3A      # 0b00111000
.eqv   COLOR_BLACK                0x00      # 0b00000000
.eqv   COLOR_RED                  0x07      # 0b00000111
.eqv   COLOR_BLUE                 0xC0      # 0b11000000
.eqv   COLOR_PEN                  0x00F00F
.eqv   NO_COLOR                   0xC8      # 0xFE00FF Invisible Ink (Hardware defined)

# Syscall Codes ---------------------------------------------------------------
.eqv   SYSCALL_PRINT_INT          101  # 1
.eqv   SYSCALL_PRINT_FLOAT        102  # 2
.eqv   SYSCALL_PRINT_STR          104  # 4
.eqv   SYSCALL_READ_INT           5
.eqv   SYSCALL_READ_FLOAT         6
.eqv   SYSCALL_READ_STR           8
.eqv   SYSCALL_EXIT               10
.eqv   SYSCALL_PRINT_CHAR         111  # 11
.eqv   SYSCALL_READ_CHAR          12
.eqv   SYSCALL_TIME               30
.eqv   SYSCALL_SLEEP              32
.eqv   SYSCALL_RAND               41
.eqv   SYSCALL_PLOT               45
.eqv   SYSCALL_GETPLOT            46
.eqv   SYSCALL_CLEAN_SCREEN       48
.eqv   SYSCALL_READ_SD            49
.eqv   SYSCALL_MIDI_PLAYER        33

# Screen Elements Position SIZEpos (YYXXxxyy) ---------------------------------
.eqv   PLAYER_POKEMON_SIZEPOS   0x30244C30

###############################################################################
# Macro Segment - Often repeted Routines
###############################################################################


.macro print_rectangle %x,%y,%width,%height,%color
    addi    $a0,$0,%x           # X left top corner
    addi    $a1,$0,%y   # Y left top corner
    addi    $v0,$0,%color       # Color

    addi    $a2,$0,%width       # width
    addi    $a3,$0,%height      # height
    jal draw_rectangle
.end_macro

.macro drawFig %x,%y,%width,%height, %image
    addi    $a0,$0,%x           # X left top corner
    addi    $a1,$0,%y   # Y left top corner
    addi    $v0,$0,%image       # Color

    addi    $a2,$0,%width       # width
    addi    $a3,$0,%height      # height
    jal  draw_figure
.end_macro

.macro clear_screen
    print_rectangle GAME_SCREEN_X0,GAME_SCREEN_Y0,GAME_SCREEN_DIM_X,GAME_SCREEN_DIM_Y,COLOR_BLUE
.end_macro

###############################################################################
# Data Segment - "Variables"
###############################################################################
.data

my_img:
.include "img_file.asm"

tetrisbg:
.include "img/tetrisnes.asm"

tetrisbg2:
.include "img/atetris.asm"


my_other_img:
.word    0x3A073A07
.word    0x3A073A07
.word    0x3A073A07
.word    0x3A073A07

###############################################################################
# Text Segment
###############################################################################
.text

main:
	# Draw a background figure
	la  $a0,tetrisbg
	jal  draw_bgfigure

	# Draw a background figure
	la  $a0,tetrisbg2
	jal  draw_bgfigure

	# Draw a file figure
	addi    $a0,$0,0x80           # X left top corner
	addi    $a1,$0,0x80   # Y left top corner
	la  	$v0,my_img
	addi    $a2,$0,0x30       # width
	addi    $a3,$0,0x24      # height
	jal  draw_figure
	


	#clear_screen
	j main

# Auxiliar Procedures ---------------------------------------------------------

##
# Print a rectangle on the screen
#
# Arguments:
# $a0 x position
# $a1 y position
# $a2 width
# $a3 height
# $v0 color (format BBGG.GRRR.bbgg.grrr)
#
# Internal use:
# $s0 x temp position
# $s1 y temp position
# $s2 color
# $t3 counter
# $t4 address to print
# $t7 temporary
# $s3 x end position
# $s4 y end position
#
##
draw_rectangle:
    addi $sp, $sp, -56
    sw $ra, 0($sp)
    sw $a0, 4($sp)
    sw $a1, 8($sp)
    sw $a2, 12($sp)
    sw $a3, 16($sp)
    sw $s0, 20($sp)
    sw $s1, 24($sp)
    sw $s2, 28($sp)
    sw $t3, 32($sp)
    sw $t4, 36($sp)
    sw $t7, 48($sp)
    sw $s3, 52($sp)
    sw $s4, 56($sp)

draw_rectangle.init:
    add   $s0,$0,$a0  # Start x
    add   $s1,$0,$a1  # Start y
    add   $s3,$s0,$a2 # end x
    add   $s4,$s1,$a3 # end y
    add   $s2,$0,$v0  # color

draw_rectangle.loopY:
draw_rectangle.loopX:

    # Calculate Pixel's Adress:
    addi  $t3,$0,SCREEN_DIM_X
    mul   $t3,$t3,$s1
    add   $t3,$t3,$s0   # Y*SCREEN_X + X
    add   $t4,$t3,SCREEN_PIXEL0

draw_rectangle.drawPixel:
    sb    $s2,0($t4)    # Draw a pixel

draw_rectangle.nextPixel:
    addi  $s0,$s0,1 # X++
    slt   $t7,$s0,$s3   # lim x
    bne   $t7,$0,draw_rectangle.loopX
end.draw_rectangle.loopX:
    add   $s0,$0,$a0    # X = X0
    addi  $s1,$s1,1 # Y++
    slt   $t7,$s1,$s4   # lim y
    bne   $t7,$0,draw_rectangle.loopY
end.draw_rectangle.loopY:
end.draw_rectangle:
    lw $ra, 0($sp)
    lw $a0, 4($sp)
    lw $a1, 8($sp)
    lw $a2, 12($sp)
    lw $a3, 16($sp)
    lw $s0, 20($sp)
    lw $s1, 24($sp)
    lw $s2, 28($sp)
    lw $t3, 32($sp)
    lw $t4, 36($sp)
    lw $t7, 48($sp)
    lw $s3, 52($sp)
    lw $s4, 56($sp)

    addi $sp, $sp, 56
    add  $v0,$0,$0
    jr  $ra


##
# Print a figure on the screen
#
# Arguments:
# $a0 beginX,beginY
# $a1 sizeX,sizeY
# $a2 address image
#
# Internal use:
# $t0
# $t1
# $t2
# $t3
# $t4
# $t5
# $t6
#
##
draw_figure:
    addi $sp, $sp, -28
    sw $t0, 0($sp)
    sw $t1, 4($sp)
    sw $t2, 8($sp)
    sw $t3, 12($sp)
    sw $t4, 16($sp)
    sw $t5, 22($sp)
    sw $t6, 24($sp)

    add $t0, $a0, $0    # x inicial
    add $t1, $a1, $0    # y inicial

    addi $t2, $zero, SCREEN_DIM_X    # 320
    mul $t2, $t2, $t1   # Y*320
    li $t1, SCREEN_PIXEL0  # Posição inical memoria
    addu $t2, $t1, $t2  # Posição na memoria, para VGA, deslocamento apenas em Y
    addu $t2, $t2, $t0  # Posição na memoria, para VGA, deslocamento Y e X
    addu $t5, $v0, $zero# Posição memoria da figura

    add $t0, $a2, $0    # Altura
    add $t1, $a3, $0    # Largura

    add $t3, $zero, $zero   # Zera $t3
    add $t4, $zero, $zero   # Zera $t4
    addiu $t2, $t2, -320    # Correção
loop1_draw_fig:
   slt  $t9,$t4,$t1
   beq $t9, $0, fim_draw_fig   # Acabou de printar figura
    sub $t2, $t2, $t3   # Volta para posição delta X = 0
    addiu $t2, $t2, 320     # Posição na memoria, para VGA, deslocado em Y
    addiu $t4, $t4, 1   # Contador Y
    add  $t3, $zero, $zero  # Zera Contador X
loop2_draw_fig:
   slt  $t9,$t3,$t0
   beq $t9, $0, loop1_draw_fig # Acabou uma linha
    lw $t6, 0($t5)      # Le word, da figura
    sw $t6, 0($t2)      # Grava word, na VGA
    addiu $t2, $t2, 4   # Desloca X, onde $t2 é posição da memoria na VGA
    addiu $t5, $t5, 4   # Desloca leitura da figura
    addiu $t3, $t3, 4   # Contador linha
    j loop2_draw_fig
fim_draw_fig:
    lw $t0, 0($sp)
    lw $t1, 4($sp)
    lw $t2, 8($sp)
    lw $t3, 12($sp)
    lw $t4, 16($sp)
    lw $t5, 22($sp)
    lw $t6, 24($sp)
    addi $sp, $sp, 28
    jr  $ra

##
# Print a figure on the screen
#
# Arguments:
# $a0 address image
#
# Internal use:
# $t0
# $t1
# $t2
# $t3
# $t4
# $t5
# $t6
#
##
draw_bgfigure:
    addi $sp, $sp, -28
    sw $t0, 0($sp)
    sw $t1, 4($sp)
    sw $t2, 8($sp)
    sw $t3, 12($sp)
    sw $t4, 16($sp)
    sw $t5, 22($sp)
    sw $t6, 24($sp)

    addi $t0, $0, MEM_SCREEN
    addi $t1, $0, MEM_SCREEN_END
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
