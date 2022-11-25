	.file	"function.c"
	.intel_syntax noprefix
	.text
	.globl	function
	.type	function, @function
function:
	pxor	xmm3, xmm3
	cvtsi2sd	xmm3, edi
	movapd	xmm0, xmm3
	divsd	xmm0, QWORD PTR .LC0[rip]
	movsd	xmm6, QWORD PTR .LC0[rip]
	pxor	xmm5, xmm5
	movq	xmm7, QWORD PTR .LC2[rip]
	movsd	xmm4, QWORD PTR .LC3[rip]
	jmp	.L4
.L8:
	xorpd	xmm1, xmm7
.L2:
	comisd	xmm1, xmm4
	jbe	.L7
.L4:
	movapd	xmm2, xmm0
	movapd	xmm1, xmm0
	mulsd	xmm1, xmm0
	movapd	xmm8, xmm3
	divsd	xmm8, xmm1
	addsd	xmm0, xmm0
	addsd	xmm0, xmm8
	divsd	xmm0, xmm6
	movapd	xmm1, xmm0
	subsd	xmm1, xmm2
	comisd	xmm5, xmm1
	jbe	.L2
	jmp	.L8
.L7:
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
