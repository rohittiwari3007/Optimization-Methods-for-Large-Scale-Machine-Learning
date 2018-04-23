function [alph] = get_alpha(theta, X, y, m, h_init, cost_init, grad_init, s)

% number of training examples
% m = length(y); 

% You need to return the following variables correctly 

eta = 0.2;
gama = 0.9;
alph = 1;

theta = theta + (alph .* s);

[cost grad h] = costFunction(theta, X, y, m);


while ( cost > (cost_init + eta * alph * grad_init' * s))
	alph = alph * gama;
	theta = theta + (alph .* s);

	cost_init = cost;
	grad_init = grad;
	h_init = h;

	[cost grad h] = costFunction(theta, X, y, m);
end
