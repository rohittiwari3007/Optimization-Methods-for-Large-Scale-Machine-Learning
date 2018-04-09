#include<stdio.h>
#include<math.h>
// Returns 2D vector
Hv_product_C( int m , int n, float **x , float **h , float **X ) {
	float ax[n][1] ;
	int i , j , k ;
	for( i = 0 ; i < n ; i++ ) {
		ax[i][0] = 0 ;
	}
	for( j = 0 ; j < n ; j++ ) {
		float ax_j = 0 ;
		for( k = 0 ; k < n ; k++ ) {
			float sum1 = 0 ;
			for( i = 0 ; i < m ; i++ ) {
				sum1 + = ( h[i][0] * ( 1 - h[i][0] ) * X[i][j] * X[i][k] ) ;
			}
			ax_j + = ( 1 / m ) * sum1 * x[k][0] ;
		}
		ax[j][0] = ax_j ;
	}
}