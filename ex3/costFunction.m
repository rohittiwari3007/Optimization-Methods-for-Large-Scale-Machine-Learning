function [cost, grad, h] = costFunction(theta, X, y, m)

% number of training examples
% m = length(y); 

% You need to return the following variables correctly 

h = predict(theta, X);

cost = ((1/m) * sum(((-1*y) .* log(h)) - ((1 - y) .* log(1 - h)) ));

grad = ((1/m) * X' * ( h - y ) );

end
