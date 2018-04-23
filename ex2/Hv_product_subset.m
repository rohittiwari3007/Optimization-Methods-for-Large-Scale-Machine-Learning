function ax = Hv_product(x, h, X, m, n)

	% R = randperm(length(X));
 %    indices = R(1:100);
 %    X = X(indices);

    % X = datasample(X,100)

    % nrows = size(x,1);
	nrand = 100; % Choose 1000 rows
	% assert(nrand<=nrows, 'You cannot choose more rows than exist in the matrix');
	rand_rows = randperm(m, nrand);
	X = X(rand_rows,:); 

	ax = zeros(n,1);
	
    for j = 1 : n 
    	ax_j = 0;
    	j
		for k = 1: n
			sum1 = 0;
			
			for i = 1 : 100
				sum1 = sum1 + (h(i) * (1-h(i)) * X(i,j) * X(i,k));
			end

			% H(j,k) = sum1;
			ax_j = ax_j + (1 / m) * sum1 * x(k);

		end

		ax(j) = ax_j;
	end

end