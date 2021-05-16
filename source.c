#include <stdio.h>

#define STRLEN 4
#define STRCNT 4

void process(int strlen, int strnum, int matrix [STRCNT][STRLEN], int *result)
{
    result = 0;
    for (int i = 0; i < strlen; i++) {
        result += matrix[strnum][i];
    }
}

int main(int argc, char** argv)
{
    int matrix[STRCNT][STRLEN];
    int strnum;
    int result;
    
    // printf("Input matrix[%d][%d]:\n", STRCNT, STRLEN);
    for (int i = 0; i < STRCNT; ++i) {
        for (int j = 0; j < STRLEN; ++j) {
            scanf("%d", &matrix[i][j]);
        }
    }

    // printf("Input string number: ");
    scanf("%d", strnum);

    process(STRLEN, strnum, matrix, &result);

    // printf("Sum of elements in %d row equal %d\n", strnum, result);
    printf("%d ", result);

    return 0;
}
