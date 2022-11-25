# Для модификации была применена команда 
>     gcc -O0 -Wall -masm=intel -S -fno-asynchronous-unwind-tables -fcf-protection=none name.c -o name.s
После чего все файлы были отредактированы вручную:
# main_mod.s
*     Удалены cdq
###   Удалена канарейка и весь блок .L12, в программе jmp .L12 заменено на jmp .L13: 
*     - mov rax, QWORD PTR fs:40
      - mov QWORD PTR -8[rbp], rax 
      - xor eax, eax
*     В конце:
      - .L19:
      - mov rsi, QWORD PTR -8[rbp]
      - xor rsi, QWORD PTR fs:40
      - je .L13
      - call __stack_chk_fail@PLT
###     Регистры:
*      r11d вместо i (итерируемая переменная)
*      r12d вместо x
# function_mod.s
### Сокращено сравнение index и size:
      - mov eax, DWORD PTR -8[rbp]
      - cmp eax, DWORD PTR -28[rbp]
      + cmp r12d, r13d
###     Регистры:
*      r12d вместо x
*      r13 вместо res
*      Замена остальных переменных приводила к segmentation fault
