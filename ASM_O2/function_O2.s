	.file	"function.c"
	.intel_syntax noprefix
	.text
	.p2align 4
	.globl	function
	.type	function, @function
function:
	pxor	xmm3, xmm3
	movsd	xmm4, QWORD PTR .LC0[rip]
	pxor	xmm6, xmm6
	movsd	xmm5, QWORD PTR .LC3[rip]
	cvtsi2sd	xmm3, edi
	movq	xmm7, QWORD PTR .LC2[rip]
	movapd	xmm0, xmm3
	divsd	xmm0, xmm4
	.p2align 4,,10
	.p2align 3
.L4:
	movapd	xmm1, xmm0
	movapd	xmm2, xmm3
	mulsd	xmm0, xmm0
	divsd	xmm2, xmm0
	movapd	xmm0, xmm2
	movapd	xmm2, xmm1
	addsd	xmm2, xmm1
	addsd	xmm0, xmm2
	divsd	xmm0, xmm4
	movapd	xmm2, xmm0
	subsd	xmm2, xmm1
	comisd	xmm6, xmm2
	movapd	xmm1, xmm2
	jbe	.L2
	xorpd	xmm1, xmm7
.L2:
	comisd	xmm1, xmm5
	ja	.L4
	ret
	.size	function, .-function
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC0:
	.long	0
	.long	1074266112
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC2:
	.long	0
	.long	-2147483648
	.long	0
	.long	0
	.section	.rodata.cst8
	.align 8
.LC3:
	.long	2576980378
	.long	1068079513
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
