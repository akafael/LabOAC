.text
	li	$t1, 3
	li	$t2, -1
	#multu 	$t1, $t2
	mthi	$t1	 # HI = 3
	mtlo	$t1	 # LO = -1
	madd 	$t1, $t2 # (0xffffffff*0x00000003) == 0xfffffffffffffffd; LO = 0xffffffff + (0xfffffffd) = -1 - 3 = -4 = 0x1fffffffc; Hi = 0x00000003 + 0xffffffff + 0x00000001(veio do da soma do LO = 0x00000003
	mfhi	$t3	 # t3 = 3
	mflo	$t4	 # t4 = 0
	
	li	$t5, 0
	li	$t6, 0
	mthi	$t5	 # HI = 0
	mtlo	$t6	 # LO = 0
	maddu 	$t1, $t2 # (0xffffffff*0x00000003) == 0x2fffffffd; LO = 0 + 0xfffffffd = 0xfffffffd; HI = 0x00000000 + 0x00000002 = 0x00000000
	mfhi	$t3	 # $t3 = 2
	mflo	$t4	 # $t4 = -3
	
	li	$t5, 0
	li	$t6, 0
	li	$t7, 1
	mthi	$t5	 # HI = 0
	mtlo	$t6	 # LO = 0
	msub	$t1, $t7 # (0xffffffff*0x00000003) == 0xfffffffffffffffd; LO = 0 - (3) = -3 ; Hi = 0x00000000 - 0xffffffff = -1
	mfhi	$t3	 # $t3 = -1
	mflo	$t4	 # $t4 = -3
	multu 	$t1, $t2
	li	$t5, 0
	li	$t6, 0
	mthi	$t5	 # HI = 0
	mtlo	$t6	 # LO = 0
	msubu	$t1, $t2 # (0xffffffff*0x00000003) == 0x2fffffffd; LO = 0 - 0xfffffffd = 3; HI = 0x00000000 - 0x00000002 - 0xffffffff(veio da operação de jogo de sinal do LO) = 0xfffffffd 
	mfhi	$t3	 # $t3 = -3
	mflo	$t4	 # $t4 = 3
FIM: 	j FIM   		# para parar o processador sem syscall 10

