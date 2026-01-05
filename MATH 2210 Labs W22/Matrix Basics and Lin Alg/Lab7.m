%% LAB 7

% Recent Labs
%% Display Assignment 3

% Common places people lost marks
% QUESTION 1
% 
% - pointed out that some students were using weird string-concatenation code
%   they probably yoinked from online, which is not really the spirit of what
%   we were looking for, and in some cases was not compatible with the symbolic
%   "x" that they would declare beforehand to begin with.
%
% - not making the code general!! Needs to work for every student number
%
% - keep it simple; that all the tools they need to do any of the code should not
%   require extensive research beyond the things we talk about in labs, lectures,
%   and the course notes
%
% - If you feel like you need a ton of outside resources to complete an
%   assignment, talk to me or matt. Chances are there is something you're
%   missing
%
%
% QUESTION 2
%
% - Not reading the stopping criterion correctly: read the problems
%   carefully!
%
% - Making the convergence criterion by using the correct root! This is
%   counterintuitive, the software you used to find the root uses numerical
%   methods!
%
% - the while loop problem using both conditions!!
%
%% Display Assignment 4
%
% - Choose unique numbers!! Avoid 420 and 69
%
% - In the plot, we expect to SEE both functions: choose a suitable range
% and display the functions on top of each other

syms x;
syms f(x) g(x);
f(x) = x^2;
g(x) = 2*x;

fplot(f)
hold on
fplot(g)

legend('true function', 'approximation')

%% MATRIX BASICS

% Define a matrix 
M = [1 2 3; 4 5 6; 8 8 8; 4 3 2];

% Extract a specific entry of M
M(2,3)

% Extract a specific row of M
M(3,:)

% Extract a specific column of M
M(:,2)

% Find the size of a matrix
size(M)

% Find number of rows of matrix
size(M, 1)

% Find number of columns of matrix
size(M, 2)

%% LINEAR ALGEBRA
% Find matrix transpose 
M_transpose = M'

% Find inverse
% M_inv = inv(M)
A = [1 2 3; 4 5 1; 1 2 4]
inv(A)

% Matrix operations
A = [1 2; 3 4]
B = [2 1; 4 3]

% Matrix addition
A+B

% Scalar multiplication
4*A

% Matrix multiplication
M*M'
M'*M

%% Solving systems of equations
% Ax = b
A = [4 3 2; 5 3 1; 3 2 4]
b = [1 2 3]

%x = A\b

x = A\b'

% or just define b as a column vector using semicolons

%% Det, eig, poly

% Find determinant of matrix
det(A)

B = [0 1 0; 1 0 2; 0 1 0]
det(B)
inv(B)

% Find eigenvalues
eig(A)

% Find coefficients of the characteristic polynomial
poly(A)
% spits it out in decreasing order of lambda - last number is the constant

%% GAUSSIAN ELIMINATION ALG
clear all

%Code that takes a matrix A where the number of rows is <= the number of
%columns, and puts it in RREF with leading digits being ones.

A = [3 1 5 9; 4 3 2 1; 2 4 8 -5; 1 2 3 3]

numRows = size(A,1)
numCols = size(A,2)

for i = 1:numRows % indicates what column we're in 

  for j = numRows:-1:i+1 % indicates what row we're in
    A(j,:) = A(i,i)*A(j,:) - A(j,i)*A(i,:); % performs operation on jth row
  end
  
 
  if A(i,i) ~= 0
    A(i,:)=A(i,:)/A(i,i); % Sets leading coefficient to 1
  end
end

round(A)











