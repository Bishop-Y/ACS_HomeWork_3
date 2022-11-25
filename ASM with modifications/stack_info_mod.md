# main_mod.s
* -16 = указатель на output (при рандомной генерации с командной строки)
* -40 = end_time
* -48 = start_time
* -24 = указатель на output (при считывании данных с файла)
* -32 = указатель на input
* -56 = result (при замене на регистр segmentation fault)
* -60 = i (итерируемая переменная) (заменена на r11d)
* -64 = seed
* -68 = inputType
* -72 = x (заменено на r12d)
* -84 = argc
* -96 = указатель на argv <br/>

# function_mod.s
* -8 = eps (при замене на регистр segmentation fault)
* -24 = difference (при замене на регистр segmentation fault)
* -16 = res (заменено на r13)
* -32 = guess (при замене на регистр segmentation fault)
* -36 = x (заменено на r12d)