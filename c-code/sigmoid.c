#include <math.h>


double sigmoid(double z)
{
	double e = exp(-1 * z);
	return (1.0 / (1.0 + e));
}

