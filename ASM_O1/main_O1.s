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
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC8:
	.string	"Enter type of filling: manual (1) or random (number != 1): "
	.section	.rodata.str1.1
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
	.text
	.globl	main
	.type	main, @function
main:
	push	r12
	push	rbp
	push	rbx
	sub	rsp, 48
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR 40[rsp], rax
	xor	eax, eax
	cmp	edi, 3
	jne	.L2
	mov	rbp, rsi
	mov	rbx, QWORD PTR 8[rsi]
	lea	rsi, .LC0[rip]
	mov	rdi, rbx
	call	strcmp@PLT
	test	eax, eax
	je	.L15
	lea	rsi, .LC4[rip]
	mov	rdi, rbx
	call	fopen@PLT
	mov	rbx, rax
	test	rax, rax
	je	.L16
	lea	rdx, 28[rsp]
	lea	rsi, .LC6[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_fscanf@PLT
	mov	rdi, rbx
	call	fclose@PLT
	mov	edi, DWORD PTR 28[rsp]
	call	function@PLT
	movsd	QWORD PTR 8[rsp], xmm0
	mov	rdi, QWORD PTR 16[rbp]
	lea	rsi, .LC1[rip]
	call	fopen@PLT
	mov	rbx, rax
	movsd	xmm0, QWORD PTR 8[rsp]
	lea	rdx, .LC7[rip]
	mov	esi, 1
	mov	rdi, rax
	mov	eax, 1
	call	__fprintf_chk@PLT
	mov	rdi, rbx
	call	fclose@PLT
	jmp	.L11
.L15:
	mov	edi, 0
	call	time@PLT
	mov	rdi, rax
	call	srand@PLT
	call	rand@PLT
	mov	ecx, 2000000000
	cdq
	idiv	ecx
	mov	edi, 1000000000
	sub	edi, edx
	mov	DWORD PTR 28[rsp], edi
	call	function@PLT
	movsd	QWORD PTR 8[rsp], xmm0
	mov	rdi, QWORD PTR 16[rbp]
	lea	rsi, .LC1[rip]
	call	fopen@PLT
	mov	rbx, rax
	mov	ecx, DWORD PTR 28[rsp]
	lea	rdx, .LC2[rip]
	mov	esi, 1
	mov	rdi, rax
	mov	eax, 0
	call	__fprintf_chk@PLT
	movsd	xmm0, QWORD PTR 8[rsp]
	lea	rdx, .LC3[rip]
	mov	esi, 1
	mov	rdi, rbx
	mov	eax, 1
	call	__fprintf_chk@PLT
	mov	rdi, rbx
	call	fclose@PLT
	jmp	.L11
.L16:
	lea	rdi, .LC5[rip]
	call	puts@PLT
	mov	edi, 0
	call	fclose@PLT
	jmp	.L11
.L2:
	mov	ebx, edi
	lea	rsi, .LC8[rip]
	mov	edi, 1
	mov	eax, 0
	call	__printf_chk@PLT
	lea	rsi, 32[rsp]
	lea	rdi, .LC6[rip]
	mov	eax, 0
	call	__isoc99_scanf@PLT
	cmp	DWORD PTR 32[rsp], 1
	je	.L17
	lea	rsi, .LC10[rip]
	mov	edi, 1
	mov	eax, 0
	call	__printf_chk@PLT
	lea	rsi, 36[rsp]
	lea	rdi, .LC6[rip]
	mov	eax, 0
	call	__isoc99_scanf@PLT
	mov	edi, DWORD PTR 36[rsp]
	call	srand@PLT
	call	rand@PLT
	mov	ecx, 2000000000
	cdq
	idiv	ecx
	mov	ecx, 1000000000
	sub	ecx, edx
	mov	edx, ecx
	mov	DWORD PTR 28[rsp], ecx
	lea	rsi, .LC11[rip]
	mov	edi, 1
	mov	eax, 0
	call	__printf_chk@PLT
.L7:
	cmp	ebx, 2
	je	.L18
	mov	edi, DWORD PTR 28[rsp]
	call	function@PLT
	movq	rbp, xmm0
.L10:
	movq	xmm0, rbp
	lea	rsi, .LC13[rip]
	mov	edi, 1
	mov	eax, 1
	call	__printf_chk@PLT
.L11:
	mov	rax, QWORD PTR 40[rsp]
	xor	rax, QWORD PTR fs:40
	jne	.L19
	mov	eax, 0
	add	rsp, 48
	pop	rbx
	pop	rbp
	pop	r12
	ret
.L17:
	lea	rsi, .LC9[rip]
	mov	edi, 1
	mov	eax, 0
	call	__printf_chk@PLT
	lea	rsi, 28[rsp]
	lea	rdi, .LC6[rip]
	mov	eax, 0
	call	__isoc99_scanf@PLT
	jmp	.L7
.L18:
	call	clock@PLT
	mov	r12, rax
	mov	ebx, 2000000
.L9:
	mov	edi, DWORD PTR 28[rsp]
	call	function@PLT
	movq	rbp, xmm0
	sub	ebx, 1
	jne	.L9
	call	clock@PLT
	mov	rdi, rax
	mov	rsi, r12
	call	difftime@PLT
	cvttsd2si	eax, xmm0
	mov	ecx, 1000
	cdq
	idiv	ecx
	mov	edx, eax
	lea	rsi, .LC12[rip]
	mov	edi, 1
	mov	eax, 0
	call	__printf_chk@PLT
	jmp	.L10
.L19:
	call	__stack_chk_fail@PLT
	.size	main, .-main
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
