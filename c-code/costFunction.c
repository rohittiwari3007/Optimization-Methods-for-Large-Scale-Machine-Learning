#include <math.h>

costfunction(float **theta, float **X, float **y, float m, float size_theta_row, float size_theta_col , float size_X_row, float size_X_col , float size_y_col)
{
	float  log_h[size_y_col], log_1_h[size_y_col], mul1[size_y_col], mul2[size_y_col],1_y[size_y_col];
	float mul1_mul2[size_y_col],h_y[size_y_col],grad[size_y_col];
	float temp=0,sum_overall=0,cost;
	float **vector_product, **h, **x_transpose;
	float i,j;

	h = predict(theta, X);

	for(i=0;i<size_y_col;i++)
	{
		log_h[i]=log(h[i][0]);
	}


	for(i=0;i<size_y_col;i++)
	{
		log_1_h[i]=log(1-h[i][0]);
	}

	

	//temp=1-h;

	//log_1_h=log(temp);

	vector_product= get_scalar_vector_product(y, 1 , size_y_col , -1); //yaha dekhna hai, int and float ki bakchodi ho skti hai

	for(i=0;i<size_y_col;i++)
	{
		1_y[i]=1-y[i][0];
	}

	for(i=0;i<size_y_col;i++)
	{
		mul1[i]=vector_product[i][0]*log_h[i];
	}

	for(i=0;i<size_y_col;i++)
	{
		mul2[i]=1_y[i]*log_1_h[i];
	}

	for(i=0;i<size_y_col;i++)
	{
		mul1_mul2[i]=mul1[i]-mul2[i];
	}

	for(i=0;i<size_y_col;i++)
	{
		sum_overall+=mul1_mul2[i];
	}

	cost=(1/m)*sum_overall;

	for(i=0;i<size_y_col;i++)
	{
		h_y[i]=h[i][0]-y[i][0];
	}

	get_vector_transpose(X, x_transpose, size_X_row, size_X_col);

	
	for(i=0;i<size_X_col;i++)
	{
		temp=0;
		for(j=0;j<size_X_row;j++)
		{
			temp+=x_transpose[i][j]*h_y[i];
		}
		grad[i]=temp;
	}
	for(i=0;i<size_y_col;i++)
	{
		grad[i]*=(1/m);
	}

	//return cost grad h

}