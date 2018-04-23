%% Machine Learning Online Class - Exercise 2: Logistic Regression
%
%  Instructions
%  ------------
% 
%  This file contains code that helps you get started on the logistic
%  regression exercise. You will need to complete the following functions 
%  in this exericse:
%
%     sigmoid.m
%     costFunction.m
%     predict.m
%     costFunctionReg.m
%
%  For this exercise, you will not need to change any code in this file,
%  or any other files other than those mentioned above.
%

%% Initialization
clear ; close all; clc

%% Load Data
%  The first two columns contains the exam scores and the third column
%  contains the label.

% data = load('diabetes.txt');
% X = data(:, [1:8]); y = data(:, 9);

data = load('ex2data1.txt');
X = data(:, [1, 2]); y = data(:, 3);

% data = load('sonar.txt');
% X = data(:, [1:60]); y = data(:, 61);

% data = load('bank_note_authentication.txt');
% X = data(:, [1:4]); y = data(:, 5);


[~,colind] = rref(X);
X = X(:, colind); 


%  Setup the data matrix appropriately, and add ones for the intercept term
[m, n] = size(X);

% Add intercept term to x and X_test
X = [ones(m, 1) X];

% Initialize fitting parameters
initial_theta = zeros(n + 1, 1);

tic;

% [theta, total_cost, all_theta, itr] = theta_min(X, y, initial_theta, m);
[theta, cost] = theta_optimize(X, y, initial_theta, m);
% [theta, cost, itr] = theta_min(X, y, initial_theta, m);
% theta
% total_cost
% all_theta

% plot(all_theta(:,1), total_cost)

time_elapsed = toc;

[cost grad h] = costFunction(theta, X, y, m);

fprintf('Time elapsed by our code: %f\n\n\n', time_elapsed);

% fprintf('No of iterations by our code: %d\n\n\n', itr);


% fprintf('Cost\n');
% fprintf('\n');
% total_cost([1:itr],:)

fprintf('Cost at theta found by our code: %f\n\n\n', cost);	

fprintf('theta: \n');
fprintf(' %f \n', theta);


p = predict_output(theta, X);

fprintf('\nTrain Accuracy: %f\n', mean(double(p == y)) * 100);
% fprintf('Expected accuracy (approx): 89.0\n');
fprintf('\n');


% Plot Boundary
% plotDecisionBoundary(theta, X, y);



% Plot the convergence graph
% figure;
% plot(1:itr, total_cost([1:itr],:)	, '-b', 'LineWidth', 2);
% xlabel('Number of iterations');
% ylabel('Cost J');

