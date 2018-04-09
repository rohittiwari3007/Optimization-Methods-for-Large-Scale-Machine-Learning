#include <stdio.h>
#include <stdlib.h>

// function declarations
float **declare_array(int row, int col);
void free_array(float **array, int row, int col);
void initialize_vector(float **vector, int row, int col, float value);
void get_scalar_vector_product(float **input, float **output, int row, int col, float value);
void get_vector_transpose(float **input, float **output, int row, int col);
void get_metrix_multiplication(float **input1, int row1, int col1, float **input2, int row2, int col2, float **output, int row, int col);
void get_vector_sum(float **input1, float **input2, float **output, int row, int col);
void get_vector_difference(float **input1, float **input2, float **output, int row, int col);

int main()
{
	int i, j;
	int row = 5, col = 1;
	

	float **initial_theta = declare_array(row, col);
	initialize_vector(initial_theta, row, col, 1);
	for(i = 0; i < 5; i++)
	{
		for(j = 0; j < 1; j++)
		{
			printf("%f\t", initial_theta[i][j]);
		}

		printf("\n");
	}
	printf("\n\n\n");

	float **new_theta = declare_array(row, col);
	get_scalar_vector_product(initial_theta, new_theta, row, col, 2);
	for(i = 0; i < 5; i++)
	{
		for(j = 0; j < 1; j++)
		{
			printf("%f\t", new_theta[i][j]);
		}

		printf("\n");
	}
	printf("\n\n\n");

	float **trans_theta = declare_array(col, row);
	get_vector_transpose(initial_theta, trans_theta, row, col);
	for(i = 0; i < col; i++)
	{
		for(j = 0; j < row; j++)
		{
			printf("%f\t", trans_theta[i][j]);
		}

		printf("\n");
	}
	printf("\n\n\n");

	float **mul_theta = declare_array(col, col);
	get_metrix_multiplication(trans_theta, col, row, initial_theta, row, col, mul_theta, row, row);
	for(i = 0; i < col; i++)
	{
		for(j = 0; j < col; j++)
		{
			printf("%f\t", mul_theta[i][j]);
		}

		printf("\n");
	}
	printf("\n\n\n");

	float **sum_theta = declare_array(row, col);
	get_vector_sum(initial_theta, new_theta, sum_theta, row, col);
	for(i = 0; i < row; i++)
	{
		for(j = 0; j < col; j++)
		{
			printf("%f\t", sum_theta[i][j]);
		}

		printf("\n");
	}
	printf("\n\n\n");

	float **diff_theta = declare_array(row, col);
	get_vector_difference(initial_theta, new_theta, diff_theta, row, col);
	for(i = 0; i < row; i++)
	{
		for(j = 0; j < col; j++)
		{
			printf("%f\t", diff_theta[i][j]);
		}

		printf("\n");
	}
	printf("\n\n\n");

	return 0;	
}

// ##################################### Utility Functions #############################################

float **declare_array(int row, int col)
{
	int i;
	float **vector = (float **)malloc(row * sizeof(float *));
    for (i = 0; i < row; i++)
         vector[i] = (float *)malloc(col * sizeof(float));

     return vector;
}

void free_array(float **array, int row, int col)
{
	int i;
	for(i = 0; i < row; i++)
    	free(array[i]);
	free(array);
}

void initialize_vector(float **vector, int row, int col, float value)
{
	int i, j;
	for(i = 0; i < row; i++)
	{
		for(j = 0; j < col; j++)
			vector[i][j] = value;
	}
}

void get_scalar_vector_product(float **input, float **output, int row, int col, float value)
{
	int i, j;
	for(i = 0; i < row; i++)
	{
		for(j = 0; j < col; j++)
			output[i][j] = input[i][j] * value;
	}
}

void get_vector_transpose(float **input, float **output, int row, int col)
{
	int i, j;
	for(i = 0; i < col; i++)
	{
		for(j = 0; j < row	; j++)
			output[i][j] = input[j][i];
	}
}

void get_metrix_multiplication(float **input1, int row1, int col1, float **input2, int row2, int col2, float **output, int row, int col)
{
	int i, j, k;
	for(i = 0; i < row1; i++)
	{
		for(j = 0; j < col2; j++)
		{
			output[i][j] = 0;
			for(k = 0; k < col1; k++)
			{
				output[i][j] += input1[i][k] * input2[k][j];
			}
		}
	}
}

void get_vector_sum(float **input1, float **input2, float **output, int row, int col)
{
	int i, j;
	for(i = 0; i < row; i++)
	{
		for(j = 0; j < col; j++)
			output[i][j] = input1[i][j] + input2[i][j];
	}
}

void get_vector_difference(float **input1, float **input2, float **output, int row, int col)
{
	int i, j;
	for(i = 0; i < row; i++)
	{
		for(j = 0; j < col; j++)
			output[i][j] = input1[i][j] - input2[i][j];
	}
}