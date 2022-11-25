	.file	"function.c"
	.intel_syntax noprefix
	.text
	.globl	function
	.type	function, @function
function:
	endbr64	
	push	rbp	#
	mov	rbp, rsp	#,
	mov	DWORD PTR -36[rbp], edi	# x, x
# ./function.c:3:     double guess = x / 3.0;
	cvtsi2sd	xmm0, DWORD PTR -36[rbp]	# xmm0 = x
# ./function.c:3:     double guess = x / 3.0;
	movsd	xmm1, QWORD PTR .LC0[rip] # xmm1 = 3.0
	divsd	xmm0, xmm1	# xmm0 /= xmm1 <=> (x / 3.0)
	movsd	QWORD PTR -8[rbp], xmm0	# guess, xmm0
# ./function.c:4:     double eps = 0.05;
	movsd	xmm0, QWORD PTR .LC1[rip]	# xmm0 = 0.05
	movsd	QWORD PTR -32[rbp], xmm0	# eps = xmm0
# ./function.c:5:     double difference = 1.0;
	movsd	xmm0, QWORD PTR .LC2[rip]	# xmm0 = 1.0
	movsd	QWORD PTR -16[rbp], xmm0	# difference = xmm0
# ./function.c:8:     while (difference > eps) {
	jmp	.L2	# заходим в while
.L6:
# ./function.c:9:         res = (2.0 * guess + 1.0 * x / (guess * guess)) / 3.0;
	movsd	xmm0, QWORD PTR -8[rbp]	# xmm0 = guess
	movapd	xmm2, xmm0
	addsd	xmm2, xmm0
# ./function.c:9:         res = (2.0 * guess + 1.0 * x / (guess * guess)) / 3.0;
	cvtsi2sd	xmm1, DWORD PTR -36[rbp]	# xmm1 = x
# ./function.c:9:         res = (2.0 * guess + 1.0 * x / (guess * guess)) / 3.0;
	movsd	xmm0, QWORD PTR -8[rbp]	# xmm0 = guess
	mulsd	xmm0, xmm0	# xmm0 *= xmm0 <=> (guess * guess)
# ./function.c:9:         res = (2.0 * guess + 1.0 * x / (guess * guess)) / 3.0;
	divsd	xmm1, xmm0
	movapd	xmm0, xmm1
# ./function.c:9:         res = (2.0 * guess + 1.0 * x / (guess * guess)) / 3.0;
	addsd	xmm0, xmm2
# ./function.c:9:         res = (2.0 * guess + 1.0 * x / (guess * guess)) / 3.0;
	movsd	xmm1, QWORD PTR .LC0[rip]	# xmm1 = 3.0
	divsd	xmm0, xmm1	# xmm0 /= xmm1
	movsd	QWORD PTR -24[rbp], xmm0	# res = xmm0
# ./function.c:10:         if (res - guess < 0) {
	movsd	xmm0, QWORD PTR -24[rbp]	# xmm0 = res
	movapd	xmm1, xmm0
	subsd	xmm1, QWORD PTR -8[rbp]	# xmm1 -= guess
# ./function.c:10:         if (res - guess < 0) {
	pxor	xmm0, xmm0
	comisd	xmm0, xmm1
	jbe	.L9	# если res - guess >= 0, то прыгаем в L9 (в else)
# ./function.c:11:             difference = -1.0 * (res - guess);
	movsd	xmm0, QWORD PTR -24[rbp] # xmm0 = res
	subsd	xmm0, QWORD PTR -8[rbp]	# xmm0 -= guess
# ./function.c:11:             difference = -1.0 * (res - guess);
	movq	xmm1, QWORD PTR .LC4[rip]	# xmm1 = -1.0
	xorpd	xmm0, xmm1
	movsd	QWORD PTR -16[rbp], xmm0	# difference = xmm0
	jmp	.L5
.L9:
# ./function.c:13:             difference = (res - guess);
	movsd	xmm0, QWORD PTR -24[rbp]	# xmm0 res
	subsd	xmm0, QWORD PTR -8[rbp]	# xmm0 -= guess
	movsd	QWORD PTR -16[rbp], xmm0	# difference = xmm0
.L5:
# ./function.c:15:         guess = res;
	movsd	xmm0, QWORD PTR -24[rbp]	# xmm0 res
	movsd	QWORD PTR -8[rbp], xmm0	# guess = xmm0
.L2:
# ./function.c:8:     while (difference > eps) {
	movsd	xmm0, QWORD PTR -16[rbp]	# tmp108, difference
	comisd	xmm0, QWORD PTR -32[rbp]	# tmp108, eps
	ja	.L6	# если difference > eps, то заходим обратно в while
# ./function.c:18:     return res;
	movsd	xmm0, QWORD PTR -24[rbp]	# xmm0 = res
# ./function.c:19: }
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
	.section	.note.gnu.property,"a"
	.align 8
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 8
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 8
4:
