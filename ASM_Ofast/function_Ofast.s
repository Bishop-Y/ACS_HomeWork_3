	.file	"function.c"
	.intel_syntax noprefix
	.text
	.p2align 4
	.globl	function
	.type	function, @function
function:
	pxor	xmm3, xmm3
	movsd	xmm4, QWORD PTR .LC0[rip]
	movsd	xmm6, QWORD PTR .LC2[rip]
	pxor	xmm5, xmm5
	cvtsi2sd	xmm3, edi
	movapd	xmm1, xmm3
	mulsd	xmm1, xmm4
	jmp	.L2
	.p2align 4,,10
	.p2align 3
.L8:
	comisd	xmm2, xmm6
	jbe	.L10
.L5:
	movapd	xmm1, xmm0
.L2:
	movapd	xmm0, xmm1
	movapd	xmm7, xmm3
	movapd	xmm2, xmm1
	mulsd	xmm0, xmm1
	addsd	xmm2, xmm1
	divsd	xmm7, xmm0
	movapd	xmm0, xmm7
	addsd	xmm0, xmm2
	mulsd	xmm0, xmm4
	movapd	xmm2, xmm0
	subsd	xmm2, xmm1
	comisd	xmm5, xmm2
	jbe	.L8
	subsd	xmm1, xmm0
	comisd	xmm1, xmm6
	ja	.L5
	ret
	.p2align 4,,10
	.p2align 3
.L10:
	ret
	.size	function, .-function
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC0:
	.long	1431655765
	.long	1070945621
	.align 8
.LC2:
	.long	2576980378
	.long	1068079513
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
