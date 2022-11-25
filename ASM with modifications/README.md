# Для модификации была применена команда 
>     gcc -O0 -Wall -masm=intel -S -fno-asynchronous-unwind-tables -fcf-protection=none name.c -o name.s
После чего все файлы были отредактированы вручную:
# main_mod.s
*     Удалены cdqe
###   Удалена канарейка и весь блок .L19, в программе jmp .L19 заменено на jmp .L20: 
*     - mov rax, QWORD PTR fs:40
      - mov QWORD PTR -8[rbp], rax 
      - xor eax, eax
*     В конце:
      - .L19:
      - mov rsi, QWORD PTR -8[rbp]
      - xor rsi, QWORD PTR fs:40
      - je .L20
      - call __stack_chk_fail@PLT
###     Регистры:
*      r13d вместо size
*      r14d вместо result
*      r15d вместо index (итерируемая переменная)
# function_mod.s
### Сокращено сравнение index и size:
      - mov eax, DWORD PTR -8[rbp]
      - cmp eax, DWORD PTR -28[rbp]
      + cmp r12d, r13d
###     Регистры:
*      r11d вместо counter
*      r12d вместо index
*      r13d вместо size
