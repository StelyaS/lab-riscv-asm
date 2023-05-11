#include <stdio.h>

#define N 4
#define M 4

int count(int column, int matrix[M][N])
{
	int Sum = 0;
	for (int i = 0; i < N; i++)
	{
		Sum += matrix[i][column-1];
	}
	return Sum;
}

int main(int argc)
{
    int matrix[M][N] = { {1, 2, 3, 4},
                     {5, 6, 7, 8},
                     {9, 10, 11, 12},
                     {13, 14, 15, 16} };

	int column = 0;
	scanf("%d", &column);
    int res = count(column, &matrix[0]);

    printf("\nSum of numbers in %d column is %d\n", column, res);

    return 0;
}

