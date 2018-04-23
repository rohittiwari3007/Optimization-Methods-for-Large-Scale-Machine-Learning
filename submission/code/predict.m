function [h] = predict (theta, X)

% Predict output values based on given theta
h = sigmoid(X * theta);
end
