	.file	"function.c"
	.intel_syntax noprefix
	.text
	.globl	function
	.type	function, @function
function:
	cvtsi2sd	xmm2, edi
	movsd	xmm3, QWORD PTR .LC0[rip]
	xorps	xmm5, xmm5
	movq	xmm6, QWORD PTR .LC2[rip]
	movsd	xmm4, QWORD PTR .LC3[rip]
	movapd	xmm0, xmm2
	divsd	xmm0, xmm3
.L4:
	movapd	xmm1, xmm0
	movapd	xmm7, xmm2
	mulsd	xmm0, xmm0
	divsd	xmm7, xmm0
	movapd	xmm0, xmm7
	movapd	xmm7, xmm1
	addsd	xmm7, xmm1
	addsd	xmm0, xmm7
	divsd	xmm0, xmm3
	movapd	xmm7, xmm0
	subsd	xmm7, xmm1
	comisd	xmm5, xmm7
	movapd	xmm1, xmm7
	jbe	.L2
	xorps	xmm1, xmm6
.L2:
	comisd	xmm1, xmm4
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
