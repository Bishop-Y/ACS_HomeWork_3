	.file	"main.c"
	.intel_syntax noprefix
	.text
	.section	.rodata
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
	.align 8
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
	.text
	.globl	main
	.type	main, @function
main:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 96
	mov	DWORD PTR -84[rbp], edi # argc
	mov	QWORD PTR -96[rbp], rsi # argv
	# mov	rax, QWORD PTR fs:40
	# mov	QWORD PTR -8[rbp], rax
	# xor	eax, eax
	cmp DWORD PTR -84[rbp], 3
	jne	.L2
	mov	rax, QWORD PTR -96[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	lea	rsi, .LC0[rip]
	mov	rdi, rax
	call	strcmp@PLT
	test	eax, eax
	jne	.L3
	mov	edi, 0
	call	time@PLT
	mov	edi, eax
	call	srand@PLT
	call	rand@PLT
	movsx	rdx, eax
	imul	rdx, rdx, 1152921505
	shr	rdx, 32
	mov	ecx, edx
	sar	ecx, 29
	# cdq
	sub	ecx, edx
	mov	edx, ecx
	imul	edx, edx, 2000000000
	sub	eax, edx
	mov	edx, eax
	mov	eax, 1000000000
	sub	eax, edx
	# mov DWORD PTR -72[rbp], eax # x = eax
	mov r12d, eax #
	# mov eax, DWORD PTR -72[rbp]
	mov eax, r12d #
	mov	edi, eax
	call	function@PLT
	movq	rax, xmm0
	mov	QWORD PTR -56[rbp], rax # result = rax (результат function)
	mov	rax, QWORD PTR -96[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	lea	rsi, .LC1[rip]
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -16[rbp], rax # output = rax (результат fopen)
	# mov edx, DWORD PTR -72[rbp]
	mov edx, r12d #
	mov	rax, QWORD PTR -16[rbp]
	lea	rsi, .LC2[rip]
	mov	rdi, rax
	mov	eax, 0
	call	fprintf@PLT
	mov	rdx, QWORD PTR -56[rbp]
	mov	rax, QWORD PTR -16[rbp]
	movq	xmm0, rdx
	lea	rsi, .LC3[rip]
	mov	rdi, rax
	mov	eax, 1
	call	fprintf@PLT
	mov	rax, QWORD PTR -16[rbp]
	mov	rdi, rax
	call	fclose@PLT
	mov	eax, 0
	# jmp	.L12
    jmp .L13
.L3:
	mov	rax, QWORD PTR -96[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	lea	rsi, .LC4[rip]
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -32[rbp], rax # input = rax (результат fopen)
	cmp	QWORD PTR -32[rbp], 0
	jne	.L5
	lea	rdi, .LC5[rip]
	call	puts@PLT
	mov	rax, QWORD PTR -32[rbp]
	mov	rdi, rax
	call	fclose@PLT
	mov	eax, 0
	# jmp	.L12
    jmp .L13
.L5:
	mov DWORD PTR -72[rbp], r12d #
	lea	rdx, -72[rbp]
	mov	rax, QWORD PTR -32[rbp]
	lea	rsi, .LC6[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_fscanf@PLT
	mov	rax, QWORD PTR -32[rbp]
	mov	rdi, rax
	call	fclose@PLT
	# mov eax, DWORD PTR -72[rbp]
	mov eax, r12d #
	mov	edi, eax
	call	function@PLT
	movq	rax, xmm0
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR -96[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	lea	rsi, .LC1[rip]
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -24[rbp], rax
	mov	rdx, QWORD PTR -56[rbp]
	mov	rax, QWORD PTR -24[rbp]
	movq	xmm0, rdx
	lea	rsi, .LC7[rip]
	mov	rdi, rax
	mov	eax, 1
	call	fprintf@PLT
	mov	rax, QWORD PTR -24[rbp]
	mov	rdi, rax
	call	fclose@PLT
	mov	eax, 0
	# jmp	.L12
    jmp .L13
.L2:
	lea	rdi, .LC8[rip]
	mov	eax, 0
	call	printf@PLT
	lea	rax, -68[rbp]
	mov	rsi, rax
	lea	rdi, .LC6[rip]
	mov	eax, 0
	call	__isoc99_scanf@PLT
	mov	eax, DWORD PTR -68[rbp] # eax = inputType
	cmp	eax, 1
	jne	.L6
	lea	rdi, .LC9[rip]
	mov	eax, 0
	call	printf@PLT
	lea	rax, -72[rbp]
	mov	rsi, rax
	lea	rdi, .LC6[rip]
	mov	eax, 0
	call	__isoc99_scanf@PLT
	mov r12d, DWORD PTR -72[rbp] #
	jmp	.L7
.L6:
	lea	rdi, .LC10[rip]
	mov	eax, 0
	call	printf@PLT
	lea	rax, -64[rbp]
	mov	rsi, rax
	lea	rdi, .LC6[rip]
	mov	eax, 0
	call	__isoc99_scanf@PLT
	mov	eax, DWORD PTR -64[rbp] # eax = seed
	mov	edi, eax
	call	srand@PLT
	call	rand@PLT
	movsx	rdx, eax
	imul	rdx, rdx, 1152921505
	shr	rdx, 32
	mov	ecx, edx
	sar	ecx, 29
	# cdq
	sub	ecx, edx
	mov	edx, ecx
	imul	edx, edx, 2000000000
	sub	eax, edx
	mov	edx, eax
	mov	eax, 1000000000
	sub	eax, edx
	# mov DWORD PTR -72[rbp], eax
	mov r12d, eax #
	# mov eax, DWORD PTR -72[rbp]
	# mov esi, eax
	mov esi, r12d #
	lea	rdi, .LC11[rip]
	mov	eax, 0
	call	printf@PLT
.L7:
	cmp	DWORD PTR -84[rbp], 2
	jne	.L8
	call	clock@PLT
	mov	QWORD PTR -48[rbp], rax # start_time = rax
	# mov	DWORD PTR -60[rbp], 0 # i = 0
	mov r11d, 0
	jmp	.L9
.L10:
	# mov eax, DWORD PTR -72[rbp]
	# mov edi, eax
	mov edi, r12d #
	call	function@PLT
	movq	rax, xmm0
	mov	QWORD PTR -56[rbp], rax
	# add	DWORD PTR -60[rbp], 1
	add r11d, 1
.L9:
	# cmp	DWORD PTR -60[rbp], 1999999
	cmp r11d, 1999999
	jle	.L10
	call	clock@PLT
	mov	QWORD PTR -40[rbp], rax # end_time = rax
	mov	rdx, QWORD PTR -48[rbp]
	mov	rax, QWORD PTR -40[rbp]
	mov	rsi, rdx
	mov	rdi, rax
	call	difftime@PLT
	cvttsd2si	eax, xmm0
	movsx	rdx, eax
	imul	rdx, rdx, 274877907
	shr	rdx, 32
	sar	edx, 6
	sar	eax, 31
	sub	edx, eax
	mov	eax, edx
	mov	esi, eax
	lea	rdi, .LC12[rip]
	mov	eax, 0
	call	printf@PLT
	jmp	.L11
.L8:
	# mov eax, DWORD PTR -72[rbp]
	mov eax, r12d #
	mov	edi, eax
	call	function@PLT
	movq	rax, xmm0
	mov	QWORD PTR -56[rbp], rax
.L11:
	mov	rax, QWORD PTR -56[rbp]
	movq	xmm0, rax
	lea	rdi, .LC13[rip]
	mov	eax, 1
	call	printf@PLT
	mov	eax, 0
# .L12:
	# mov	rsi, QWORD PTR -8[rbp]
	# xor	rsi, QWORD PTR fs:40
	# je	.L13
	# call	__stack_chk_fail@PLT
.L13:
	leave
	ret
	.size	main, .-main
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
