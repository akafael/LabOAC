

.text

MAIN:

	li $s1, -1
	li $s2, 2
	li $s3, 4
	li $s4, -3
	
	#multu $s3,$s4
	
	mthi $s1      	#HI = -1
	mtlo $s2	#LO = 2
	
	madd $s3,$s4	#{-1,2} + 4*(-3)
	
	mfhi $t1
	mflo $t2
	
	mthi $s1	
	mtlo $s2	
	
	maddu $s3,$s4	#{-1,2} + u(4)*u(-3)
	
	mfhi $t1
	mflo $t2
	
	mthi $s1
	mtlo $s2
	
	msub $s3,$s4	#{-1,2} - 4*(-3)
	
	
	mfhi $t1
	mflo $t2
	
	mthi $s1
	mtlo $s2
	
	msubu $s3,$s4	#{1,2} - u()4*u(-3)
	
	mfhi $t1
	mflo $t2
	
	
