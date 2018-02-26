function [theta, i] = theta_min(X , y, theta, m)

	n_itr = 100;
	alph = 0.3;
	% total_cost = zeros(n_itr, 1);
	n= size(X,2);
	% all_theta = zeros(n_itr, n);
	prev_cost = 100000;

	tol = 0.000001;

	i = 1;
	% while (1)
	while (i < 10)
		i
		% cost gradient h
		[cost grad h] = costFunction(theta, X, y, m);

		% % Parameters for conjugate gradient
		b = (-1) * grad;

		% f = @(x)Hv_product(x, h, X, m, n);
		f = Hv_product(1, h, X, m, n)
		% [s, fl, rr, it, rv] = pcg(f, b);

		% % total_cost(i) = cost;

		alph = get_alpha (theta, X, y, m, h, cost, grad, s);
		% alph

		theta = theta + (alph .* s);
		% all_theta(i , :) = theta;

		

		if (abs(cost - prev_cost) < tol) || (i > 10)
			break;		
		end

		prev_cost = cost;

		i++;

	end

	
end