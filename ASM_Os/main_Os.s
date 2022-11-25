	.file	"main.c"
	.intel_syntax noprefix
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"random"
.LC1:
	.string	"w"
.LC2:
	.string	"Generated number: %d"
.LC3:
	.string	"\nResult: %f"
.LC4:
	.string	"r"
.LC5:
	.string	"File does not exist"
.LC6:
	.string	"%d"
.LC7:
	.string	"%f"
.LC8:
	.string	"Enter type of filling: manual (1) or random (number != 1): "
.LC9:
	.string	"\nEnter your number: "
.LC10:
	.string	"\nEnter seed: "
.LC11:
	.string	"Generated number: %d\n"
.LC12:
	.string	"\nTime: %d\n"
.LC13:
	.string	"Result: %f\n"
	.section	.text.startup,"ax",@progbits
	.globl	main
	.type	main, @function
main:
	push	rbp
	push	rbx
	sub	rsp, 56
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR 40[rsp], rax
	xor	eax, eax
	cmp	edi, 3
	jne	.L2
	mov	rbp, QWORD PTR 8[rsi]
	mov	rbx, rsi
	lea	rsi, .LC0[rip]
	mov	rdi, rbp
	call	strcmp@PLT
	test	eax, eax
	jne	.L3
	xor	edi, edi
	call	time@PLT
	mov	rdi, rax
	call	srand@PLT
	call	rand@PLT
	mov	ecx, 2000000000
	mov	edi, 1000000000
	cdq
	idiv	ecx
	sub	edi, edx
	mov	DWORD PTR 28[rsp], edi
	call	function@PLT
	mov	rdi, QWORD PTR 16[rbx]
	lea	rsi, .LC1[rip]
	movsd	QWORD PTR 8[rsp], xmm0
	call	fopen@PLT
	mov	ecx, DWORD PTR 28[rsp]
	mov	esi, 1
	lea	rdx, .LC2[rip]
	mov	rdi, rax
	mov	rbp, rax
	xor	eax, eax
	call	__fprintf_chk@PLT
	movsd	xmm0, QWORD PTR 8[rsp]
	lea	rdx, .LC3[rip]
	jmp	.L16
.L3:
	mov	rdi, rbp
	lea	rsi, .LC4[rip]
	call	fopen@PLT
	mov	rbp, rax
	test	rax, rax
	jne	.L5
	lea	rdi, .LC5[rip]
	call	puts@PLT
	xor	edi, edi
	jmp	.L15
.L5:
	lea	rdx, 28[rsp]
	lea	rsi, .LC6[rip]
	mov	rdi, rax
	xor	eax, eax
	call	__isoc99_fscanf@PLT
	mov	rdi, rbp
	call	fclose@PLT
	mov	edi, DWORD PTR 28[rsp]
	call	function@PLT
	mov	rdi, QWORD PTR 16[rbx]
	lea	rsi, .LC1[rip]
	movsd	QWORD PTR 8[rsp], xmm0
	call	fopen@PLT
	movsd	xmm0, QWORD PTR 8[rsp]
	lea	rdx, .LC7[rip]
	mov	rbp, rax
.L16:
	mov	rdi, rbp
	mov	esi, 1
	mov	al, 1
	call	__fprintf_chk@PLT
	mov	rdi, rbp
.L15:
	call	fclose@PLT
	jmp	.L11
.L2:
	lea	rsi, .LC8[rip]
	xor	eax, eax
	mov	ebp, edi
	mov	edi, 1
	call	__printf_chk@PLT
	xor	eax, eax
	lea	rsi, 32[rsp]
	lea	rdi, .LC6[rip]
	call	__isoc99_scanf@PLT
	cmp	DWORD PTR 32[rsp], 1
	jne	.L6
	lea	rsi, .LC9[rip]
	mov	edi, 1
	xor	eax, eax
	call	__printf_chk@PLT
	lea	rsi, 28[rsp]
	lea	rdi, .LC6[rip]
	xor	eax, eax
	call	__isoc99_scanf@PLT
	jmp	.L7
.L6:
	lea	rsi, .LC10[rip]
	mov	edi, 1
	xor	eax, eax
	call	__printf_chk@PLT
	lea	rsi, 36[rsp]
	lea	rdi, .LC6[rip]
	xor	eax, eax
	call	__isoc99_scanf@PLT
	mov	edi, DWORD PTR 36[rsp]
	call	srand@PLT
	call	rand@PLT
	mov	ecx, 2000000000
	mov	edi, 1
	lea	rsi, .LC11[rip]
	cdq
	idiv	ecx
	mov	ecx, 1000000000
	xor	eax, eax
	sub	ecx, edx
	mov	edx, ecx
	mov	DWORD PTR 28[rsp], ecx
	call	__printf_chk@PLT
.L7:
	cmp	ebp, 2
	jne	.L8
	call	clock@PLT
	mov	ebx, 2000000
	mov	rbp, rax
.L9:
	mov	edi, DWORD PTR 28[rsp]
	call	function@PLT
	dec	ebx
	jne	.L9
	movsd	QWORD PTR 8[rsp], xmm0
	call	clock@PLT
	mov	rsi, rbp
	mov	rdi, rax
	call	difftime@PLT
	mov	ecx, 1000
	mov	edi, 1
	lea	rsi, .LC12[rip]
	cvttsd2si	eax, xmm0
	cdq
	idiv	ecx
	mov	edx, eax
	xor	eax, eax
	call	__printf_chk@PLT
	movsd	xmm1, QWORD PTR 8[rsp]
	jmp	.L10
.L8:
	mov	edi, DWORD PTR 28[rsp]
	call	function@PLT
	movapd	xmm1, xmm0
.L10:
	movapd	xmm0, xmm1
	lea	rsi, .LC13[rip]
	mov	edi, 1
	mov	al, 1
	call	__printf_chk@PLT
.L11:
	mov	rax, QWORD PTR 40[rsp]
	xor	rax, QWORD PTR fs:40
	je	.L12
	call	__stack_chk_fail@PLT
.L12:
	add	rsp, 56
	xor	eax, eax
	pop	rbx
	pop	rbp
	ret
	.size	main, .-main
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
