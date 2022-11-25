	.file	"function.c"
	.intel_syntax noprefix
	.text
	.globl	function
	.type	function, @function
function:
	push	rbp
	mov	rbp, rsp
	# mov	DWORD PTR -36[rbp], edi # x = rdi
	mov r12d, edi #
	# cvtsi2sd	xmm0, DWORD PTR -36[rbp]
	cvtsi2sd xmm0, r12d
	movsd	xmm1, QWORD PTR .LC0[rip] # xmm1 = 3.0
	divsd	xmm0, xmm1
	movsd	QWORD PTR -32[rbp], xmm0 # guess = xmm0
	movsd	xmm0, QWORD PTR .LC1[rip]
	movsd	QWORD PTR -8[rbp], xmm0 # eps = xmm0
	movsd	xmm0, QWORD PTR .LC2[rip]
	movsd	QWORD PTR -24[rbp], xmm0 # difference = xmm0
	jmp	.L2
.L6:
	movsd	xmm0, QWORD PTR -32[rbp]
	movapd	xmm2, xmm0
	addsd	xmm2, xmm0
	# cvtsi2sd	xmm1, DWORD PTR -36[rbp]
	cvtsi2sd xmm1, r12d
	movsd	xmm0, QWORD PTR -32[rbp]
	mulsd	xmm0, xmm0
	divsd	xmm1, xmm0
	movapd	xmm0, xmm1
	addsd	xmm0, xmm2
	movsd	xmm1, QWORD PTR .LC0[rip]
	divsd	xmm0, xmm1
	# movsd	QWORD PTR -16[rbp], xmm0 # res = xmm0
	movsd [r13], xmm0 #
	# movsd	xmm0, QWORD PTR -16[rbp]
	movsd xmm0, [r13]
	movapd	xmm1, xmm0
	subsd	xmm1, QWORD PTR -32[rbp]
	pxor	xmm0, xmm0
	comisd	xmm0, xmm1
	jbe	.L9
	# movsd	xmm0, QWORD PTR -16[rbp]
	movsd xmm0, [r13]
	subsd	xmm0, QWORD PTR -32[rbp]
	movq	xmm1, QWORD PTR .LC4[rip]
	xorpd	xmm0, xmm1
	movsd	QWORD PTR -24[rbp], xmm0
	jmp	.L5
.L9:
	# movsd	xmm0, QWORD PTR -16[rbp]
	movsd xmm0, [r13]
	subsd	xmm0, QWORD PTR -32[rbp]
	movsd	QWORD PTR -24[rbp], xmm0
.L5:
	# movsd	xmm0, QWORD PTR -16[rbp]
	movsd xmm0, [r13]
	movsd	QWORD PTR -32[rbp], xmm0
.L2:
	movsd	xmm0, QWORD PTR -24[rbp]
	comisd	xmm0, QWORD PTR -8[rbp]
	ja	.L6
	# movsd	xmm0, QWORD PTR -16[rbp]
	movsd xmm0, [r13]
	pop	rbp
	ret
	.size	function, .-function
	.section	.rodata
	.align 8
.LC0:
	.long	0
	.long	1074266112
	.align 8
.LC1:
	.long	2576980378
	.long	1068079513
	.align 8
.LC2:
	.long	0
	.long	1072693248
	.align 16
.LC4:
	.long	0
	.long	-2147483648
	.long	0
	.long	0
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
