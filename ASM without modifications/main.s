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
	endbr64	
	push	rbp
	mov	rbp, rsp
	sub	rsp, 96
	mov	DWORD PTR -84[rbp], edi	# argc
	mov	QWORD PTR -96[rbp], rsi	# argv
# ./main.c:12:     if (argc == 3) {
	cmp	DWORD PTR -84[rbp], 3	# argc == 3
	jne	.L2 # если не равно 3, то прыгаем в другой блок кода
# ./main.c:13:         if (!strcmp(argv[1], "random")) {
	mov	rax, QWORD PTR -96[rbp]	# rax = argv
	add	rax, 8	# rax = argv[2]
# ./main.c:13:         if (!strcmp(argv[1], "random")) {
	mov	rax, QWORD PTR [rax]
	lea	rsi, .LC0[rip]	# rsi = "random"
	mov	rdi, rax	#, # rdi = rax
	call	strcmp@PLT	# вызов strcmp
# ./main.c:13:         if (!strcmp(argv[1], "random")) {
	test	eax, eax
	jne	.L3	# если argv[2] != "random", то прыгаем в L3
# ./main.c:14:             srand(time(0));
	mov	edi, 0	# edi = 0
	call	time@PLT	# вызов time
# ./main.c:14:             srand(time(0));
	mov	edi, eax	# edi = eax (результат time)
	call	srand@PLT	# вызов srand
# ./main.c:15:             x = 1000000000 - rand() % 2000000000;
	call	rand@PLT	# вызов rand
# ./main.c:15:             x = 1000000000 - rand() % 2000000000;
	movsx	rdx, eax
	imul	rdx, rdx, 1152921505
	shr	rdx, 32
	mov	ecx, edx
	sar	ecx, 29
	cdq
	sub	ecx, edx
	mov	edx, ecx
	imul	edx, edx, 2000000000
	sub	eax, edx
	mov	edx, eax
# ./main.c:15:             x = 1000000000 - rand() % 2000000000;
	mov	eax, 1000000000	# eax = 1000000000 - rand() % 2000000000
	sub	eax, edx	# eax -= rand() % 2000000000
# ./main.c:15:             x = 1000000000 - rand() % 2000000000;
	mov	DWORD PTR -60[rbp], eax	# x = eax
# ./main.c:16:             result = function(x);
	mov	eax, DWORD PTR -60[rbp]	# eax = x
	mov	edi, eax	# edi = eax = x
	call	function@PLT	# вызов function
	movq	rax, xmm0	# rax  = xmm0 (результат function)
	mov	QWORD PTR -8[rbp], rax	# result = rax
# ./main.c:18:             output = fopen(argv[2], "w");
	mov	rax, QWORD PTR -96[rbp]	# rax = argv
	add	rax, 16	# rax = argv[2]
# ./main.c:18:             output = fopen(argv[2], "w");
	mov	rax, QWORD PTR [rax]
	lea	rsi, .LC1[rip]	# rsu = "w"
	mov	rdi, rax	# rdi = rax = argv[2]
	call	fopen@PLT	# вызов fopen
	mov	QWORD PTR -56[rbp], rax	# output = rax (результат fopen)
# ./main.c:19:             fprintf(output, "Generated number: %d", x);
	mov	edx, DWORD PTR -60[rbp]	# edx = x
	mov	rax, QWORD PTR -56[rbp]	# rax = output
	lea	rsi, .LC2[rip]	# rsi = "Generated number: %d"
	mov	rdi, rax	# rdi = rax = output
	mov	eax, 0
	call	fprintf@PLT	# вызов fprintf
# ./main.c:20:             fprintf(output, "\nResult: %f", result);
	mov	rdx, QWORD PTR -8[rbp]	# rdx = result
	mov	rax, QWORD PTR -56[rbp]	# rax = output
	movq	xmm0, rdx	# xmm0 = rdx = result
	lea	rsi, .LC3[rip]	# rsi = "\nResult: %f"
	mov	rdi, rax	# rdi = rax = output
	mov	eax, 1
	call	fprintf@PLT	# вызов fprintf
# ./main.c:21:             fclose(output);
	mov	rax, QWORD PTR -56[rbp]	# rax = output
	mov	rdi, rax	# rdi = rax
	call	fclose@PLT	# вызов fclose
# ./main.c:22:             return 0;
	mov	eax, 0	#
	jmp	.L12	# в конец программы
.L3:
# ./main.c:25:             input = fopen(argv[1], "r");
	mov	rax, QWORD PTR -96[rbp]	# rax = argv
	add	rax, 8	# rax = argv[1]
# ./main.c:25:             input = fopen(argv[1], "r");
	mov	rax, QWORD PTR [rax]
	lea	rsi, .LC4[rip]	# rsi = "r"
	mov	rdi, rax	# rdi = rax = input
	call	fopen@PLT	# вызов fopen
	mov	QWORD PTR -40[rbp], rax	# input = rax (результат fopen)
# ./main.c:26:             if (input == NULL) {
	cmp	QWORD PTR -40[rbp], 0	# input == NULL
	jne	.L5	# если input нормальный, то прыгаем в L5
# ./main.c:27:                 printf("File does not exist\n");
	lea	rdi, .LC5[rip]	# rdi = "File does not exist\n"
	call	puts@PLT	# вызов fprintf
# ./main.c:28:                 fclose(input);
	mov	rax, QWORD PTR -40[rbp]	# rax = input
	mov	rdi, rax	# rdi = rax
	call	fclose@PLT	# вызов fclose
# ./main.c:29:                 return 0;
	mov	eax, 0	#
	jmp	.L12	# в конец программы
.L5:
# ./main.c:31:                 fscanf(input, "%d", &x);
	lea	rdx, -60[rbp]	# rdx = x
	mov	rax, QWORD PTR -40[rbp]	# rax = input
	lea	rsi, .LC6[rip]	# rsi = "%d"
	mov	rdi, rax	# rdi = rax = input
	mov	eax, 0
	call	__isoc99_fscanf@PLT	# вызов fscanf
# ./main.c:33:             fclose(input);
	mov	rax, QWORD PTR -40[rbp]	# rax = input
	mov	rdi, rax	# rdi = rax = input
	call	fclose@PLT	# вызов fclose
# ./main.c:35:             result = function(x);
	mov	eax, DWORD PTR -60[rbp]	# eax = x
	mov	edi, eax	# edi = eax = x
	call	function@PLT	# вызов function
	movq	rax, xmm0	# rax = xmm0 (результат function)
	mov	QWORD PTR -8[rbp], rax	# result = rax
# ./main.c:38:             output = fopen(argv[2], "w");
	mov	rax, QWORD PTR -96[rbp]	# rax = argv
	add	rax, 16	# rax = argv[2]
# ./main.c:38:             output = fopen(argv[2], "w");
	mov	rax, QWORD PTR [rax]
	lea	rsi, .LC1[rip]	# rsi = "w"
	mov	rdi, rax	# rdi = rax = argv[2]
	call	fopen@PLT	# вызов fopen
	mov	QWORD PTR -48[rbp], rax	# output, tmp136
# ./main.c:39:             fprintf(output, "%f", result);
	mov	rdx, QWORD PTR -8[rbp]	# rdx = result
	mov	rax, QWORD PTR -48[rbp]	# rax = output
	movq	xmm0, rdx	# xmm0 = rdx = result
	lea	rsi, .LC7[rip]	# rsi = "%f"
	mov	rdi, rax	# rdi = rax = output
	mov	eax, 1
	call	fprintf@PLT	# вызов fprintf
# ./main.c:40:             fclose(output);
	mov	rax, QWORD PTR -48[rbp]	# rax = output
	mov	rdi, rax	# rdi = rax
	call	fclose@PLT	# вызов fclose
# ./main.c:41:             return 0;
	mov	eax, 0
	jmp	.L12	# в конец программы
.L2:
# ./main.c:45:     printf("Enter type of filling: manual (1) or random (number != 1): ");
	lea	rdi, .LC8[rip]	# rdi = (то, что написано на строке выше :D)
	mov	eax, 0
	call	printf@PLT	# вызов printf
# ./main.c:47:     scanf("%d", &inputType);
	lea	rax, -64[rbp]	# rax = inputType
	mov	rsi, rax	# rsi = rax = inputType
	lea	rdi, .LC6[rip]	# rdi = "%d"
	mov	eax, 0
	call	__isoc99_scanf@PLT	# вызов scanf
# ./main.c:49:     if (inputType == 1) {
	mov	eax, DWORD PTR -64[rbp]	# eax = inputType
# ./main.c:49:     if (inputType == 1) {
	cmp	eax, 1	# eax == 1
	jne	.L6	# если не равно, то прыгаем в L6
# ./main.c:50:         printf("\nEnter your number: ");
	lea	rdi, .LC9[rip]	# rdi = "\nEnter your number: "
	mov	eax, 0
	call	printf@PLT	# вызов printf
# ./main.c:51:         scanf("%d", &x);
	lea	rax, -60[rbp] # rax = x
	mov	rsi, rax	# rsi = rax
	lea	rdi, .LC6[rip]	# rdi = "%d"
	mov	eax, 0
	call	__isoc99_scanf@PLT	# вызов scanf
	jmp	.L7	# прыгаем в L7
.L6:
# ./main.c:54:         printf("\nEnter seed: ");
	lea	rdi, .LC10[rip]	# rdi = "\nEnter seed: "
	mov	eax, 0
	call	printf@PLT	# вызов printf
# ./main.c:55:         scanf("%d", &seed);
	lea	rax, -68[rbp]	# rax = seed
	mov	rsi, rax	# rsi = rax = seed
	lea	rdi, .LC6[rip]	# rdi = "%d"
	mov	eax, 0
	call	__isoc99_scanf@PLT	# вызов scanf
# ./main.c:56:         srand(seed);
	mov	eax, DWORD PTR -68[rbp]	# eax = seed
	mov	edi, eax	# edi = eax
	call	srand@PLT	# вызов srand
# ./main.c:57:         x = 1000000000 - rand() % 2000000000;
	call	rand@PLT	# вызов rand
# ./main.c:57:         x = 1000000000 - rand() % 2000000000;
	movsx	rdx, eax	# rdx = eax (результат rand)
	imul	rdx, rdx, 1152921505
	shr	rdx, 32
	mov	ecx, edx
	sar	ecx, 29
	cdq
	sub	ecx, edx
	mov	edx, ecx
	imul	edx, edx, 2000000000
	sub	eax, edx
	mov	edx, eax
# ./main.c:57:         x = 1000000000 - rand() % 2000000000;
	mov	eax, 1000000000	# eax = 1000000000
	sub	eax, edx	# eax -= rand() % 2000000000
# ./main.c:57:         x = 1000000000 - rand() % 2000000000;
	mov	DWORD PTR -60[rbp], eax	# x = eax
# ./main.c:58:         printf("Generated number: %d\n", x);
	mov	eax, DWORD PTR -60[rbp]	# eax = x
	mov	esi, eax	# esi = eax = x
	lea	rdi, .LC11[rip]	# rdi = "Generated number: %d\n"
	mov	eax, 0
	call	printf@PLT	# вызов printf
.L7:
# ./main.c:61:     if (argc == 2) {
	cmp	DWORD PTR -84[rbp], 2	# argc == 2
	jne	.L8	# если argc != 2, то прыгаем в L8
# ./main.c:62:         time_t start_time = clock();
	call	clock@PLT	# вызов clock
	mov	QWORD PTR -24[rbp], rax	# start_time = rax (результат clock)
# ./main.c:64:         for (i = 0; i < 2000000; ++i) {
	mov	DWORD PTR -12[rbp], 0	# i = 0
# ./main.c:64:         for (i = 0; i < 2000000; ++i) {
	jmp	.L9	# заходим в цикл
.L10:
# ./main.c:65:             result = function(x);
	mov	eax, DWORD PTR -60[rbp]	# eax = x
	mov	edi, eax	# edi = eax = x
	call	function@PLT	# вызов function
	movq	rax, xmm0	# rax  = xmm0 (результат function)
	mov	QWORD PTR -8[rbp], rax	# result = rax
# ./main.c:64:         for (i = 0; i < 2000000; ++i) {
	add	DWORD PTR -12[rbp], 1	# ++i
.L9:
# ./main.c:64:         for (i = 0; i < 2000000; ++i) {
	cmp	DWORD PTR -12[rbp], 1999999	# i < 2000000
	jle	.L10	# если i < 2000000, то продолжаем цикл
# ./main.c:67:         time_t end_time = clock();
	call	clock@PLT	# вызов clock
	mov	QWORD PTR -32[rbp], rax	# end_time = rax (результат clock)
# ./main.c:68:         printf("\nTime: %d\n", (int) difftime(end_time, start_time) / 1000);
	mov	rdx, QWORD PTR -24[rbp]	# rdx = start_time
	mov	rax, QWORD PTR -32[rbp]	# rax = end_time
	mov	rsi, rdx	# rsi = rdx = start_time
	mov	rdi, rax	# rdi = rax = end_time
	call	difftime@PLT	# вызов difftime
# ./main.c:68:         printf("\nTime: %d\n", (int) difftime(end_time, start_time) / 1000);
	cvttsd2si	eax, xmm0	# eax = xmm0
# ./main.c:68:         printf("\nTime: %d\n", (int) difftime(end_time, start_time) / 1000);
	movsx	rdx, eax
	imul	rdx, rdx, 274877907
	shr	rdx, 32
	sar	edx, 6
	sar	eax, 31
	sub	edx, eax
	mov	eax, edx
	mov	esi, eax # esi = eax = (int) difftime(end_time, start_time) / 1000
	lea	rdi, .LC12[rip]	# rdi = "\nTime: %d\n"
	mov	eax, 0
	call	printf@PLT	# вызов printf
	jmp	.L11
.L8:
# ./main.c:70:         result = function(x);
	mov	eax, DWORD PTR -60[rbp]	# eax = x
	mov	edi, eax	# edi = eax = x
	call	function@PLT	# вызов function
	movq	rax, xmm0	# rax = xmm0 (результат function)
	mov	QWORD PTR -8[rbp], rax	# result = rax
.L11:
# ./main.c:73:     printf("Result: %f\n", result);
	mov	rax, QWORD PTR -8[rbp]	# rax = result
	movq	xmm0, rax	# xmm0 = rax
	lea	rdi, .LC13[rip]	# rdi = "Result: %f\n"
	mov	eax, 1
	call	printf@PLT	# вызов printf
	mov	eax, 0
.L12: # конец программы
# ./main.c:74: }
	leave
	ret	
	.size	main, .-main
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
