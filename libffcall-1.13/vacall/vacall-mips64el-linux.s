	.file	1 "vacall-mips64.c"
	.section .mdebug.abi64
	.previous
	.abicalls
	.text
	.align	2
	.align	3
	.globl	__vacall
	.ent	__vacall
	.type	__vacall, @function
__vacall:
	.frame	$fp,224,$31		# vars= 176, regs= 6/0, args= 0, gp= 0
	.mask	0xd0070000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	daddiu	$sp,$sp,-224
	sd	$28,200($sp)
	lui	$28,%hi(%neg(%gp_rel(__vacall)))
	daddu	$28,$28,$25
	daddiu	$28,$28,%lo(%neg(%gp_rel(__vacall)))
	ld	$12,%got_disp(vacall_function)($28)
	sd	$fp,208($sp)
	sd	$31,216($sp)
	sd	$18,192($sp)
	sd	$17,184($sp)
	sd	$16,176($sp)
	move	$fp,$sp
	ld	$25,0($12)
	daddiu	$13,$fp,288
	daddiu	$12,$fp,224
	sd	$13,56($fp)
	sd	$4,224($fp)
	sd	$5,232($fp)
	sd	$6,240($fp)
	sd	$7,248($fp)
	sd	$8,256($fp)
	sd	$9,264($fp)
	sd	$10,272($fp)
	sd	$11,280($fp)
	sdc1	$f12,104($fp)
	sdc1	$f13,112($fp)
	sdc1	$f14,120($fp)
	sdc1	$f15,128($fp)
	sdc1	$f16,136($fp)
	sdc1	$f17,144($fp)
	sdc1	$f18,152($fp)
	sdc1	$f19,160($fp)
	swc1	$f12,68($fp)
	swc1	$f13,72($fp)
	swc1	$f14,76($fp)
	swc1	$f15,80($fp)
	swc1	$f16,84($fp)
	swc1	$f17,88($fp)
	swc1	$f18,92($fp)
	swc1	$f19,96($fp)
	sw	$0,0($fp)
	move	$4,$fp
	sd	$12,8($fp)
	sd	$0,16($fp)
	sw	$0,24($fp)
	jal	$25
	sw	$0,64($fp)

	lw	$13,24($fp)
	beq	$13,$0,.L87
	li	$12,1			# 0x1

	beq	$13,$12,.L88
	li	$12,2			# 0x2

	beq	$13,$12,.L88
	li	$12,3			# 0x3

	beq	$13,$12,.L94
	li	$12,4			# 0x4

	beq	$13,$12,.L95
	li	$12,5			# 0x5

	beq	$13,$12,.L96
	li	$12,6			# 0x6

	beq	$13,$12,.L97
	li	$12,7			# 0x7

	beq	$13,$12,.L98
	li	$12,8			# 0x8

	beq	$13,$12,.L92
	li	$12,9			# 0x9

	beq	$13,$12,.L92
	li	$12,10			# 0xa

	beq	$13,$12,.L92
	li	$12,11			# 0xb

	beq	$13,$12,.L92
	li	$12,12			# 0xc

	beq	$13,$12,.L99
	li	$12,13			# 0xd

	beq	$13,$12,.L100
	li	$12,14			# 0xe

	beq	$13,$12,.L92
	li	$12,15			# 0xf

	bnel	$13,$12,.L121
	move	$sp,$fp

	lw	$18,0($fp)
	andi	$12,$18,0x1
	beq	$12,$0,.L33
	andi	$12,$18,0x400

	ld	$2,16($fp)
	.align	3
.L87:
	move	$sp,$fp
.L121:
	ld	$31,216($sp)
	ld	$fp,208($sp)
	ld	$28,200($sp)
	ld	$18,192($sp)
	ld	$17,184($sp)
	ld	$16,176($sp)
	j	$31
	daddiu	$sp,$sp,224

	.align	3
.L88:
	move	$sp,$fp
	lb	$2,40($fp)
	ld	$31,216($sp)
	ld	$fp,208($sp)
	ld	$28,200($sp)
	ld	$18,192($sp)
	ld	$17,184($sp)
	ld	$16,176($sp)
	j	$31
	daddiu	$sp,$sp,224

.L95:
	b	.L87
	lh	$2,40($fp)

.L94:
	b	.L87
	lbu	$2,40($fp)

.L92:
	b	.L87
	ld	$2,40($fp)

.L96:
	b	.L87
	lhu	$2,40($fp)

.L97:
	b	.L87
	lw	$2,40($fp)

.L98:
	b	.L87
	lwu	$2,40($fp)

.L99:
	b	.L87
	lwc1	$f0,40($fp)

.L100:
	b	.L87
	ldc1	$f0,40($fp)

.L33:
	beq	$12,$0,.L87
	andi	$12,$18,0x4

	beq	$12,$0,.L36
	ld	$25,32($fp)

	ld	$13,32($fp)
	li	$12,1			# 0x1
	beq	$13,$12,.L101
	li	$12,2			# 0x2

	beq	$13,$12,.L102
	li	$12,4			# 0x4

	beq	$13,$12,.L103
	li	$12,8			# 0x8

	bnel	$13,$12,.L121
	move	$sp,$fp

	ld	$12,16($fp)
	b	.L87
	ld	$2,0($12)

.L36:
	daddiu	$12,$25,-1
	sltu	$12,$12,16
	beq	$12,$0,.L122
	andi	$12,$18,0x2000

	li	$12,1			# 0x1
	beq	$25,$12,.L104
	li	$12,2			# 0x2

	beq	$25,$12,.L105
	li	$12,3			# 0x3

	beq	$25,$12,.L106
	li	$12,4			# 0x4

	beq	$25,$12,.L107
	li	$12,5			# 0x5

	beq	$25,$12,.L108
	li	$12,6			# 0x6

	beq	$25,$12,.L109
	li	$12,7			# 0x7

	beq	$25,$12,.L110
	daddiu	$12,$25,-8

	sltu	$12,$12,9
	beq	$12,$0,.L122
	andi	$12,$18,0x2000

	ld	$24,16($fp)
	lbu	$13,1($24)
	lbu	$12,0($24)
	lbu	$14,2($24)
	lbu	$15,3($24)
	dsll	$13,$13,8
	lbu	$16,4($24)
	or	$12,$12,$13
	dsll	$14,$14,16
	lbu	$17,5($24)
	or	$12,$12,$14
	dsll	$15,$15,24
	lbu	$13,6($24)
	or	$12,$12,$15
	dsll	$16,$16,32
	lbu	$14,7($24)
	or	$12,$12,$16
	dsll	$17,$17,40
	dsll	$13,$13,48
	or	$12,$12,$17
	or	$12,$12,$13
	dsll	$14,$14,56
	li	$13,8			# 0x8
	beq	$25,$13,.L45
	or	$2,$12,$14

	li	$12,9			# 0x9
	beq	$25,$12,.L111
	li	$12,10			# 0xa

	beq	$25,$12,.L112
	li	$12,11			# 0xb

	beq	$25,$12,.L113
	li	$12,12			# 0xc

	beq	$25,$12,.L114
	li	$12,13			# 0xd

	beq	$25,$12,.L115
	li	$12,14			# 0xe

	beq	$25,$12,.L116
	li	$12,15			# 0xf

	beq	$25,$12,.L117
	li	$12,16			# 0x10

	bne	$25,$12,.L122
	andi	$12,$18,0x2000

	lbu	$13,9($24)
	lbu	$12,8($24)
	lbu	$14,10($24)
	lbu	$15,11($24)
	dsll	$13,$13,8
	lbu	$16,12($24)
	or	$12,$12,$13
	dsll	$14,$14,16
	lbu	$17,13($24)
	or	$12,$12,$14
	dsll	$15,$15,24
	lbu	$13,14($24)
	or	$12,$12,$15
	dsll	$16,$16,32
	lbu	$14,15($24)
	or	$12,$12,$16
	dsll	$17,$17,40
	or	$12,$12,$17
	dsll	$13,$13,48
	or	$12,$12,$13
	dsll	$14,$14,56
	or	$3,$12,$14
.L45:
	andi	$12,$18,0x2000
.L122:
	beq	$12,$0,.L123
	andi	$12,$18,0x4000

	li	$12,4			# 0x4
	beq	$25,$12,.L118
	li	$12,8			# 0x8

	beq	$25,$12,.L119
	ld	$12,16($fp)

.L78:
	andi	$12,$18,0x4000
.L123:
	beq	$12,$0,.L87
	li	$12,8			# 0x8

	beq	$25,$12,.L120
	li	$12,16			# 0x10

	bnel	$25,$12,.L121
	move	$sp,$fp

	ld	$12,16($fp)
	ldc1	$f2,8($12)
	b	.L87
	ldc1	$f0,0($12)

.L103:
	ld	$12,16($fp)
	b	.L87
	lwu	$2,0($12)

.L120:
	ld	$12,16($fp)
	b	.L87
	ldc1	$f0,0($12)

.L118:
	ld	$12,16($fp)
	b	.L78
	lwc1	$f0,0($12)

.L102:
	ld	$12,16($fp)
	b	.L87
	lhu	$2,0($12)

.L101:
	ld	$12,16($fp)
	b	.L87
	lbu	$2,0($12)

.L104:
	ld	$12,16($fp)
	b	.L45
	lbu	$2,0($12)

.L117:
	lbu	$13,9($24)
	lbu	$12,8($24)
	lbu	$14,10($24)
	lbu	$15,11($24)
	dsll	$13,$13,8
	lbu	$16,12($24)
	or	$12,$12,$13
	dsll	$14,$14,16
	lbu	$13,13($24)
	or	$12,$12,$14
	dsll	$15,$15,24
	lbu	$14,14($24)
	or	$12,$12,$15
	dsll	$16,$16,32
	or	$12,$12,$16
	dsll	$13,$13,40
	or	$12,$12,$13
	dsll	$14,$14,48
	b	.L45
	or	$3,$12,$14

.L116:
	lbu	$13,9($24)
	lbu	$12,8($24)
	lbu	$14,10($24)
	lbu	$15,11($24)
	dsll	$13,$13,8
	lbu	$16,12($24)
	or	$12,$12,$13
	dsll	$14,$14,16
	lbu	$13,13($24)
	or	$12,$12,$14
	dsll	$15,$15,24
	or	$12,$12,$15
	dsll	$16,$16,32
	or	$12,$12,$16
	dsll	$13,$13,40
	b	.L45
	or	$3,$12,$13

.L119:
	lwc1	$f2,4($12)
	b	.L78
	lwc1	$f0,0($12)

.L105:
	ld	$12,16($fp)
	lbu	$13,1($12)
	lbu	$14,0($12)
	dsll	$13,$13,8
	b	.L45
	or	$2,$14,$13

.L107:
	ld	$12,16($fp)
	lbu	$13,1($12)
	lbu	$15,0($12)
	lbu	$14,2($12)
	lbu	$16,3($12)
	dsll	$13,$13,8
	or	$15,$15,$13
	dsll	$14,$14,16
	or	$15,$15,$14
	dsll	$16,$16,24
	b	.L45
	or	$2,$15,$16

.L106:
	ld	$12,16($fp)
	lbu	$14,1($12)
	lbu	$15,2($12)
	lbu	$13,0($12)
	dsll	$14,$14,8
	dsll	$15,$15,16
	or	$13,$13,$14
	b	.L45
	or	$2,$13,$15

.L115:
	lbu	$13,9($24)
	lbu	$12,8($24)
	lbu	$14,10($24)
	lbu	$15,11($24)
	dsll	$13,$13,8
	lbu	$16,12($24)
	or	$12,$12,$13
	dsll	$14,$14,16
	or	$12,$12,$14
	dsll	$15,$15,24
	or	$12,$12,$15
	dsll	$16,$16,32
	b	.L45
	or	$3,$12,$16

.L114:
	lbu	$12,9($24)
	lbu	$14,8($24)
	lbu	$13,10($24)
	lbu	$15,11($24)
	dsll	$12,$12,8
	or	$14,$14,$12
	dsll	$13,$13,16
	or	$14,$14,$13
	dsll	$15,$15,24
	b	.L45
	or	$3,$14,$15

.L113:
	lbu	$12,9($24)
	lbu	$14,10($24)
	lbu	$13,8($24)
	dsll	$12,$12,8
	dsll	$14,$14,16
	or	$13,$13,$12
	b	.L45
	or	$3,$13,$14

.L112:
	lbu	$12,9($24)
	lbu	$13,8($24)
	dsll	$12,$12,8
	b	.L45
	or	$3,$13,$12

.L111:
	b	.L45
	lbu	$3,8($24)

.L110:
	ld	$12,16($fp)
	lbu	$14,1($12)
	lbu	$13,0($12)
	lbu	$15,2($12)
	lbu	$16,3($12)
	dsll	$14,$14,8
	lbu	$17,4($12)
	or	$13,$13,$14
	dsll	$15,$15,16
	lbu	$14,5($12)
	or	$13,$13,$15
	dsll	$16,$16,24
	lbu	$15,6($12)
	or	$13,$13,$16
	dsll	$17,$17,32
	or	$13,$13,$17
	dsll	$14,$14,40
	or	$13,$13,$14
	dsll	$15,$15,48
	b	.L45
	or	$2,$13,$15

.L109:
	ld	$13,16($fp)
	lbu	$14,1($13)
	lbu	$12,0($13)
	lbu	$15,2($13)
	lbu	$16,3($13)
	dsll	$14,$14,8
	lbu	$17,4($13)
	or	$12,$12,$14
	dsll	$15,$15,16
	lbu	$14,5($13)
	or	$12,$12,$15
	dsll	$16,$16,24
	or	$12,$12,$16
	dsll	$17,$17,32
	or	$12,$12,$17
	dsll	$14,$14,40
	b	.L45
	or	$2,$12,$14

.L108:
	ld	$12,16($fp)
	lbu	$14,1($12)
	lbu	$13,0($12)
	lbu	$15,2($12)
	lbu	$16,3($12)
	dsll	$14,$14,8
	lbu	$17,4($12)
	or	$13,$13,$14
	dsll	$15,$15,16
	or	$13,$13,$15
	dsll	$16,$16,24
	or	$13,$13,$16
	dsll	$17,$17,32
	b	.L45
	or	$2,$13,$17

	.set	macro
	.set	reorder
	.end	__vacall
	.ident	"GCC: (GNU) 4.0.2"
