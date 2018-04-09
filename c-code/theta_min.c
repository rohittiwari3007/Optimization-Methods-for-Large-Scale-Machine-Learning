#include <stdio.h>
#include <math.h>

int n;

double sigmoid(double z)
{
	double e = exp(-1 * z);
	return (1.0 / (1.0 + e));
}

double ** matrix_mul (double ** mat1, double ** mat2, int m, int n, int p)
{
	long i;
	double sum = 0;
	double product[m][p];

	for ( i = 0; i < m; i++)
	{
		for ( j = 0; j < n; j++)
        {
           for (k = 0; k < p; k++)
            	sum += ( mat1[i][j] * mat2[k][i] );
        	
            product[i][j] = sum;
        	sum = 0;
        }
    }

    return product;
}


double * matrix_vector_product (double ** mat1, double * vec, int m, int n)
{
	long i;
	double sum = 0;
	double product[m];

	for ( i = 0; i < m; i++)
	{
		for ( j = 0; j < n; j++)
        {
            sum += ( mat1[i][j] * vec[j] );
            	
        }
        product[i] = sum;
        sum = 0;
    }
    return product;
}


double predict_current_sample (double * theta, double * x)
{
	long i;
	double result = 0;

	for (i = 0; i < n; i++)
	{
		result = x[i] * theta[i];
	}
}

double * predict (double * theta, double ** X)
{

}


int main()
{
	n = 5;
	double z;
	scanf("%lf",  &z);

	printf("\n%lf", sigmoid(z));

	return 0;
}