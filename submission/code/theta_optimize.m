function [theta, cost] = theta_optimize(X , y, theta, m)

	n_itr = 100;
	alph = 1;
	% total_cost = zeros(n_itr, 1);
	n= size(X,2);
	% all_theta = zeros(n_itr, n);
	prev_cost = 100000;

	tol = 0.000001;

	i = 1;
	
		%  calculate hessian first time
		[cost grad h] = costFunction(theta, X, y, m);

		% Parameters for conjugate gradient
		b = (-1) * grad;

		% if (mod(i,5) == 1)
			f = @(x)Hv_product(x, h, X, m, n);
			[s, fl, rr, it, rv] = pcg(f, b);

			% total_cost(i) = cost;

			% alph = get_alpha (theta, X, y, m, h, cost, grad, s);
			% alph

			theta = theta + (alph .* s);



		% using this theta, calculate optimum theta


		% options = optimset('GradObj', 'on', 'MaxIter', 400);

		% [theta, cost] = ...
		% fminunc(@(t)(costFunction(theta, X, y, m)), theta, options);

		% [theta, cost,exitflag,output] = ...
		% fminunc(@(t)(costFunction(theta, X, y, m)), theta, options);

		% fprintf('No of iterations by fminunc: %d\n\n\n', output.iterations);


		

		% else
		% 	theta = theta + (alph .* b);

		% end



		% all_theta(i , :) = theta;

		

	% 	if ((abs(cost - prev_cost) < tol) || i > 10)
	% 		break;		
	% 	end

	% 	prev_cost = cost;

	% 	i++;

	% end

	
end