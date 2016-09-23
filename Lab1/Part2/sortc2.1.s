	.file	1 "sortc.c"     # Informa o nome do arquivo que foi compilado, para fins de debug.
	.section .mdebug.abi32  # Instrui o montador a montar o código em uma secao com o nome .mdebug.abi32.
	.previous               # Troca a secao/subsecao atual pela secao/subsecao anterior.
	.nan	legacy          # Indica qual codificacao de NaN (not a number) e usada, no caso e usada a
                            # codificacao original (legacy).
	.module	fp=32
	.module	oddspreg
	.globl	v               # Torna simbolo v visivel globalmente
	.data                   # Indica o inicio do segmento de dados.
	.align	2               # Alinha o endereco a um multiplo de 2.
	.type	v, @object      # Define que o tipo do simbolo v e @object.
	.size	v, 40           # Define 40 como tamanho do simbolo v.
v:
	.word	5               # Declara 5 como inteiro de 4 bytes
	.word	8               # Declara 8 como inteiro de 4 bytes
	.word	3               # Declara 3 como inteiro de 4 bytes
	.word	4               # Declara 4 como inteiro de 4 bytes
	.word	7               # Declara 7 como inteiro de 4 bytes
	.word	6               # Declara 6 como inteiro de 4 bytes
	.word	8               # Declara 8 como inteiro de 4 bytes
	.word	0               # Declara 0 como inteiro de 4 bytes
	.word	1               # Declara 1 como inteiro de 4 bytes
	.word	9               # Declara 9 como inteiro de 4 bytes
	.rdata                  # Indica o inicio do segmento de dados apenas para leitura (read-only data).
	.align	2               # Alinha o endereco a um multiplo de 2.
.LC0:
	.ascii	"%d\011\000"    # Diretiva de saída da string: "%d\011\000"
	.text                   # Instrui o montador a montar o codigo no segmento de texto.
	.align	2               # Alinha o endereco a um multiplo de 2.
	.globl	show            # Torna simbolo show visivel globalmente
	.set	nomips16        # Desativa opcao para gerar codigo para o processador MIPS 16.
	.set	nomicromips     # Desativa opcao para gerar codigo para o processador microMIPS.
	.ent	show            # marca o inicio da funcao show.
	.type	show, @function # Define que o tipo de show e @function.
show:
	.frame	$fp,32,$31		# vars= 8, regs= 2/0, args= 16, gp= 0. Define o formato da pilha atraves dos argumentos: registrador do quadro ($fp), deslocamento (32), registrador de retorno ($ra).
	.mask	0xc0000000,-4   # Indica os registradores que devem ser salvos na pilha.
	.fmask	0x00000000,0    # Indica os registradores de ponto flutuante que devem ser salvos na pilha.
	.set	noreorder       # Desativa opcao do montador de reordenacao de instrucoes
	.set	nomacro         # Desativa opcao do montador de expansao de macros
	addiu	$sp,$sp,-32
	sw	$31,28($sp)
	sw	$fp,24($sp)
	move	$fp,$sp
	sw	$4,32($fp)
	sw	$5,36($fp)
	sw	$0,16($fp)
	b	.L2
	nop

.L3:
	lw	$2,16($fp)
	sll	$2,$2,2
	lw	$3,32($fp)
	addu	$2,$3,$2
	lw	$2,0($2)
	move	$5,$2
	lui	$2, %HI(.LC0)
	addiu	$4,$2,%lo(.LC0)
	jal	printf
	nop

	lw	$2,16($fp)
	addiu	$2,$2,1
	sw	$2,16($fp)
.L2:
	lw	$3,16($fp)
	lw	$2,36($fp)
	slt	$2,$3,$2
	bne	$2,$0,.L3
	nop

	li	$4,10			# 0xa
	jal	putchar
	nop

	nop
	move	$sp,$fp
	lw	$31,28($sp)
	lw	$fp,24($sp)
	addiu	$sp,$sp,32
	j	$31
	nop

	.set	macro           # Ativa opcao do montador de expansao de macros
	.set	reorder         # Ativa opcao do montador de reordenacao de instrucoes
	.end	show            # Marca o fim da funcao show.
	.size	show, .-show    # Define .-show como tamanho do simbolo show.
	.align	2               # Alinha o enderec a um multiplo de 2.
	.globl	swap            # Torna simbolo swap visivel globalmente
	.set	nomips16        # Desativa opcao para gerar codigo para o processador MIPS 16.
	.set	nomicromips     # Desativa opcao para gerar codigo para o processador microMIPS.
	.ent	swap            # Marca o inicio da funcao swap
	.type	swap, @function # Define que o tipo de swap e @function.
swap:
	.frame	$fp,16,$31		# vars= 8, regs= 1/0, args= 0, gp= 0. Define o formato da pilha atraves dos argumentos: registrador do quadro ($fp), deslocamento (16), registrador de retorno ($ra).
	.mask	0x40000000,-4   # Indica os registradores que devem ser salvos na pilha.
	.fmask	0x00000000,0    # Indica os registradores de ponto flutuante que devem ser salvos na pilha.
	.set	noreorder       # Desativa opcao do montador de reordenacao de instrucoes
	.set	nomacro         # Desativa opcao do montador de expansao de macros
	addiu	$sp,$sp,-16
	sw	$fp,12($sp)
	move	$fp,$sp
	sw	$4,16($fp)
	sw	$5,20($fp)
	lw	$2,20($fp)
	sll	$2,$2,2
	lw	$3,16($fp)
	addu	$2,$3,$2
	lw	$2,0($2)
	sw	$2,0($fp)
	lw	$2,20($fp)
	sll	$2,$2,2
	lw	$3,16($fp)
	addu	$2,$3,$2
	lw	$3,20($fp)
	addiu	$3,$3,1
	sll	$3,$3,2
	lw	$4,16($fp)
	addu	$3,$4,$3
	lw	$3,0($3)
	sw	$3,0($2)
	lw	$2,20($fp)
	addiu	$2,$2,1
	sll	$2,$2,2
	lw	$3,16($fp)
	addu	$2,$3,$2
	lw	$3,0($fp)
	sw	$3,0($2)
	nop
	move	$sp,$fp
	lw	$fp,12($sp)
	addiu	$sp,$sp,16
	j	$31
	nop

	.set	macro           # Ativa opcao do montador de expansao de macros
	.set	reorder         # Ativa opcao do montador de reordenacao de instrucoes
	.end	swap            # Marca o fim da funcao swap.
	.size	swap, .-swap    # Define .-swap como tamanho do simbolo swap.
	.align	2               # Alinha o endereco a um multiplo de 2.
	.globl	sort            # Torna simbolo sort visivel globalmente
	.set	nomips16        # Desativa opcao para gerar codigo para o processador MIPS 16.
	.set	nomicromips     # Desativa opcao para gerar codigo para o processador microMIPS.
	.ent	sort            # Marca o inicio da funcao sort
	.type	sort, @function # Define que o tipo de sort e @function.
sort:
	.frame	$fp,32,$31		# vars= 8, regs= 2/0, args= 16, gp= 0. Define o formato da pilha atraves dos argumentos: registrador do quadro ($fp), deslocamento (32), registrador de retorno ($ra).
	.mask	0xc0000000,-4   # Indica os registradores que devem ser salvos na pilha.
	.fmask	0x00000000,0    # Indica os registradores de ponto flutuante que devem ser salvos na pilha.
	.set	noreorder       # Desativa opcao do montador de reordenacao de instrucoes
	.set	nomacro         # Desativa opcao do montador de expansao de macros
	addiu	$sp,$sp,-32
	sw	$31,28($sp)
	sw	$fp,24($sp)
	move	$fp,$sp
	sw	$4,32($fp)
	sw	$5,36($fp)
	sw	$0,16($fp)
	b	.L6
	nop

.L10:
	lw	$2,16($fp)
	addiu	$2,$2,-1
	sw	$2,20($fp)
	b	.L7
	nop

.L9:
	lw	$5,20($fp)
	lw	$4,32($fp)
	jal	swap
	nop

	lw	$2,20($fp)
	addiu	$2,$2,-1
	sw	$2,20($fp)
.L7:
	lw	$2,20($fp)
	bltz	$2,.L8
	nop

	lw	$2,20($fp)
	sll	$2,$2,2
	lw	$3,32($fp)
	addu	$2,$3,$2
	lw	$3,0($2)
	lw	$2,20($fp)
	addiu	$2,$2,1
	sll	$2,$2,2
	lw	$4,32($fp)
	addu	$2,$4,$2
	lw	$2,0($2)
	slt	$2,$2,$3
	bne	$2,$0,.L9
	nop

.L8:
	lw	$2,16($fp)
	addiu	$2,$2,1
	sw	$2,16($fp)
.L6:
	lw	$3,16($fp)
	lw	$2,36($fp)
	slt	$2,$3,$2
	bne	$2,$0,.L10
	nop

	nop
	move	$sp,$fp
	lw	$31,28($sp)
	lw	$fp,24($sp)
	addiu	$sp,$sp,32
	j	$31
	nop

	.set	macro               # Ativa opcao do montador de expansao de macros
	.set	reorder             # Ativa opcao do montador de reordenacao de instrucoes
	.end	sort                # Marca o fim da funcao sort.
	.size	sort, .-sort        # Define .-sort como tamanho do simbolo sort.
	.align	2                   # Alinha o endereco a um multiplo de 2.
	.globl	main                # Torna simbolo main visivel globalmente
	.set	nomips16            # Desativa opcao para gerar codigo para o processador MIPS 16.
	.set	nomicromips         # Desativa opcao para gerar codigo para o processador microMIPS.
	.ent	main                # Marca o inicio da funcao main
	.type	main, @function     # Define que o tipo de main e @function.
main:
	.frame	$fp,24,$31          # vars= 0, regs= 2/0, args= 16, gp= 0. Define o formato da pilha atraves dos argumentos: registrador do quadro ($fp), deslocamento (24), registrador de retorno ($ra).
	.mask	0xc0000000,-4       # Indica os registradores que devem ser salvos na pilha.
	.fmask	0x00000000,0        # Indica os registradores de ponto flutuante que devem ser salvos na pilha.
	.set	noreorder           # Desativa opcao do montador de reordenacao de instrucoes
	.set	nomacro             # Desativa opcao do montador de expansao de macros
	addiu	$sp,$sp,-24
	sw	$31,20($sp)
	sw	$fp,16($sp)
	move	$fp,$sp
	li	$5,10			# 0xa
	lui	$2,%hi(v)
	addiu	$4,$2,%lo(v)
	jal	show
	nop

	li	$5,10			# 0xa
	lui	$2,%hi(v)
	addiu	$4,$2,%lo(v)
	jal	sort
	nop

	li	$5,10			# 0xa
	lui	$2,%hi(v)
	addiu	$4,$2,%lo(v)
	jal	show
	nop

	nop
	move	$sp,$fp
	lw	$31,20($sp)
	lw	$fp,16($sp)
	addiu	$sp,$sp,24
	j	$31
	nop

	.set	macro           # Ativa opcao do montador de expansao de macros
	.set	reorder         # Ativa opcao do montador de reordenacao de instrucoes
	.end	main            # Marca o fim da funcao main
	.size	main, .-main    # Define .-main como tamanho do simbolo main
	.ident	"GCC: (Sourcery CodeBench Lite 2016.05-7) 5.3.0"  # insere no arquivo objeto a tag: "GCC: (Sourcery CodeBench Lite 2016.05-7) 5.3.0".
