#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

double function(int x);

int main(int argc, char *argv[]) {
    int x;
    double result;
    
    if (argc == 3) {
        if (!strcmp(argv[1], "random")) {
            srand(time(0));
            x = 1000000000 - rand() % 2000000000;
            result = function(x);
            FILE *output;
            output = fopen(argv[2], "w");
            fprintf(output, "Generated number: %d", x);
            fprintf(output, "\nResult: %f", result);
            fclose(output);
            return 0;
        } else {
            FILE *input;
            input = fopen(argv[1], "r");
            if (input == NULL) {
                printf("File does not exist\n");
                fclose(input);
                return 0;
            } else {
                fscanf(input, "%d", &x);
            }
            fclose(input);

            result = function(x);

            FILE *output;
            output = fopen(argv[2], "w");
            fprintf(output, "%f", result);
            fclose(output);
            return 0;
        }
    }

    printf("Enter type of filling: manual (1) or random (number != 1): ");
    int inputType;
    scanf("%d", &inputType);

    if (inputType == 1) {
        printf("\nEnter your number: ");
        scanf("%d", &x);
    } else {
        int seed;
        printf("\nEnter seed: ");
        scanf("%d", &seed);
        srand(seed);
        x = 1000000000 - rand() % 2000000000;
        printf("Generated number: %d\n", x);
    }

    if (argc == 2) {
        time_t start_time = clock();
        int i;
        for (i = 0; i < 2000000; ++i) {
            result = function(x);
        }
        time_t end_time = clock();
        printf("\nTime: %d\n", (int) difftime(end_time, start_time) / 1000);
    } else {
        result = function(x);
    }

    printf("Result: %f\n", result);
}
