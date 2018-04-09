function [h] = predict (theta, X)

% Predict output values based on given theta
h = sigmoid(X * theta);
end

#include<stdio.h>
#include<math.h>
predict( float **theta , int row_theta , int col_theta , float **X ,int row_X , int col_X ){
	float tempValue[row_X][col_theta] ;
	int i , j , k ;
    for ( i = 0 ; i < row_X ; i++)
    {
        for ( j = 0 ; j < col_X ; j++)
        {
            tempValue[i][j] = 0 ;
            for ( k = 0 ; k < col_theta ; k++ )
                tempValue[i][j] + = X[i][k] * theta[k][j] ;
        }
    }

}

