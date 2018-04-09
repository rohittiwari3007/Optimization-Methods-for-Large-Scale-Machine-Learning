function ax = Hv_product(x, h, X, m, n)
	ax = zeros(n,1);
	
    for j = 1 : n 
    	ax_j = 0;
		for k = 1: n
			sum1 = 0;
			
			for i = 1 : m
				sum1 = sum1 + (h(i) * (1-h(i)) * X(i,j) * X(i,k));
			end

			% H(j,k) = sum1;
			ax_j = ax_j + (1 / m) * sum1 * x(k);

		end

		ax(j) = ax_j;
	end

end