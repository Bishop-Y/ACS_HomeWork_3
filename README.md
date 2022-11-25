# ACS_HomeWork_3 <br/> Работу выполнил Епифанов Артём, группа БПИ 217, Вариант 19
# Введение:
## Условие задачи
> * Разработать программу вычисления корня кубического из заданного числа согласно быстро сходящемуся итерационному алгоритму определения корня n-ной степени с точностью не хуже 0,05%.
## Программы на C и на ассемблере на 9 баллов:
> * Чтобы использовать ручной ввод, следуйте инструкциям в консоли.
> * Чтобы использовать ввод с файла, надо использовать командную строку и прописать в ней имя файла с входными данными, и имя файла, куда нужно сохранить результат (пример ввода "input.txt output.txt").
> * Чтобы использовать рандомную генерацию данных, вы можете прописат в командной строке 2 аргумента: random output.txt, где заместо output.txt напишите любой файл для записи результата. В файле буду написаны сгенерированное число и результат вычислений. Либо можно использовать ручной ввод в программе, но в таком случае результат будет выведен в консоль, а не в файл.
> * Чтобы использовать замер времени работы программы, введите только один аргумент в командную строку (не важно, число ли это, или строка), затем следуйте инструкциям в командной строке. Результат будет выводиться в командную строку. (Замер времени осуществляется только для ручного ввода/генерации данных)
> * [Программа на C](https://github.com/Bishop-Y/ACS_HomeWork_2/tree/main/Program%20on%20C) <br/>
> * [Программа на ассемблере без модификаций](https://github.com/Bishop-Y/ACS_HomeWork_2/tree/main/ASM%20without%20modifications) <br/>
> * [Программа на ассемблере с ручными модификациями](https://github.com/Bishop-Y/ACS_HomeWork_2/tree/main/ASM%20with%20modifications) <br/>
# На 4 балла:
## Приведено решение задачи на C: <br/>
> * [Программа на C](https://github.com/Bishop-Y/ACS_HomeWork_2/tree/main/Program%20on%20C) <br/>
## Ассемблерная программа без модификаций: <br/>
> * [Программа на ассемблере без модификаций](https://github.com/Bishop-Y/ACS_HomeWork_2/tree/main/ASM%20without%20modifications) <br/>
> * [Информация о переменных на стеке в разных файлах](https://github.com/Bishop-Y/ACS_HomeWork_2/blob/main/ASM%20without%20modifications/stack_info.md) <br/>
## Ассемблерная программа с модификациями: <br/>
> * [Программа на ассемблере с ручными модификациями](https://github.com/Bishop-Y/ACS_HomeWork_2/tree/main/ASM%20with%20modifications) <br/>
## Тесты: <br/>
> * [Тесты](https://github.com/Bishop-Y/ACS_HomeWork_2/blob/main/Tests.md) <br/>
## Отчёт: <br/>
> * [Отчёт](https://github.com/Bishop-Y/ACS_HomeWork_2/tree/main/ASM%20with%20modifications#readme) <br/>
---- 
# На 5 баллов:
##  Программа на C с передачей данных через параметры + использованы локальные переменные: <br/>
> * [Программа на C](https://github.com/Bishop-Y/ACS_HomeWork_2/tree/main/Program%20on%20C) <br/>
## Модифицированная ассемблерная программа с передачей данных через параметры, с комментариями + комментарии, показывающие связь между параметрами языка C и стеком: <br/>
> * [Программа на ассемблере с ручными модификациями](https://github.com/Bishop-Y/ACS_HomeWork_2/tree/main/ASM%20with%20modifications) <br/>
> * [Информация о переменных на стеке в разных модифицированных файлах](https://github.com/Bishop-Y/ACS_HomeWork_2/blob/main/ASM%20with%20modifications/stack_mod_info.md)
## Отчёт: <br/>
> * Вызовы уже существующих функций были прокомментированны. Была прокоментированна связь между параметрами языка Си и регистрами по правилам:
> * eax/rax - для запоминания/копирования данных
> * rdi/edi - первый аргумент в функции
> * rsi/esi - второй аргумент в функции
> * rdx/edx - третий аргумент в функции
> * rcx - счётчик
> * [Отчёт](https://github.com/Bishop-Y/ACS_HomeWork_2/tree/main/ASM%20with%20modifications#readme) <br/>
---- 
# На 6 баллов:
## Модифицированная ассемблерная программа с проведенным рефакторингом + с поясняющими комментариями: <br/>
> * [Программа на ассемблере с ручными модификациями](https://github.com/Bishop-Y/ACS_HomeWork_2/tree/main/ASM%20with%20modifications) <br/>
> * [Информация о переменных на стеке в разных модифицированных файлах](https://github.com/Bishop-Y/ACS_HomeWork_2/blob/main/ASM%20with%20modifications/stack_mod_info.md)
## Тесты: <br/>
> * [Тесты](https://github.com/Bishop-Y/ACS_HomeWork_2/blob/main/Tests.md) <br/>
## Отчёт: <br/>
> * [Отчёт](https://github.com/Bishop-Y/ACS_HomeWork_2/tree/main/ASM%20with%20modifications#readme) <br/>
----
# На 7 баллов:
## Модифицированная программа на ассемблере, в виде 2 единиц компиляции: <br/>
> * [Программа на ассемблере с ручными модификациями](https://github.com/Bishop-Y/ACS_HomeWork_2/tree/main/ASM%20with%20modifications) <br/>
## Модифицированная программа на ассемблере, с поддержкой ввода с файла и вывода в файл: <br/>
> * [Программа на ассемблере с ручными модификациями](https://github.com/Bishop-Y/ACS_HomeWork_2/tree/main/ASM%20with%20modifications) <br/>
## Тесты ввода с файла и вывод в файл: <br/>
> * [Тесты](https://github.com/Bishop-Y/ACS_HomeWork_2/blob/main/Tests.md) <br/>
## Отчёт: <br/>
> * [Отчёт](https://github.com/Bishop-Y/ACS_HomeWork_2/tree/main/ASM%20with%20modifications#readme) <br/>
----
# На 8-9 баллов:
## Программы с замером времени и генерацией данных: <br/>
> * [Программа на C](https://github.com/Bishop-Y/ACS_HomeWork_2/tree/main/Program%20on%20C) <br/>
> * [Программа на ассемблере без модификаций](https://github.com/Bishop-Y/ACS_HomeWork_2/tree/main/ASM%20without%20modifications) <br/>
> * [Программа на ассемблере с ручными модификациями](https://github.com/Bishop-Y/ACS_HomeWork_2/tree/main/ASM%20with%20modifications) <br/>
## Тесты замера времени с отчётом: <br/>
> * function (проверка корректности скобочной последовательности) прокручивается 20000000 раз для увеличение времени работы программы.
> * В программе на ассемблере итерируемые переменные были заменены на регистры r11d ,r12d, r13d, и r15d, а также переменная, в которую каждый раз записывался результат, была заменена на r14d. За счёт этого программа стала работать в среднем быстрее в ~2 раза.
> * Так же были откомпилированы дополнительные модификации (O1, O2, O3, Ofast, Os):
> * [Программа на ассемблере O1](https://github.com/Bishop-Y/ACS_HomeWork_2/tree/main/ASM_O1)
> * [Программа на ассемблере O2](https://github.com/Bishop-Y/ACS_HomeWork_2/tree/main/ASM_O2)
> * [Программа на ассемблере O3](https://github.com/Bishop-Y/ACS_HomeWork_2/tree/main/ASM_O3)
> * [Программа на ассемблере Ofast](https://github.com/Bishop-Y/ACS_HomeWork_2/tree/main/ASM_Ofast)
> * [Программа на ассемблере Os](https://github.com/Bishop-Y/ACS_HomeWork_2/tree/main/ASM_Os) <br/>
## Тесты: <br/>
> * [Тесты](https://github.com/Bishop-Y/ACS_HomeWork_2/blob/main/Tests.md) <br/>
