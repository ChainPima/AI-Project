function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples
n = size(X, 2); % number of features

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta
hypothesis = sigmoid(X * theta); % mx1 matrix
J = J - (y' * log(hypothesis) + (ones(m, 1) - y)' * log(ones(m, 1) - hypothesis)) / m + (lambda / (2 * m)) * (theta(2:n)' * theta(2:n));
grad(1) = grad(1) + (1 / m) * ((hypothesis - y)' * X(:,1))';
grad(2:n) = grad(2:n) + (1 / m) * ((hypothesis - y)' * X(:,2:n))' + (lambda / m) * theta(2:n);
% =============================================================

end
