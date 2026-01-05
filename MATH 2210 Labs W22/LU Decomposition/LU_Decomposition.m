clear all

%Code that takes a matrix A where the number of rows is <= the number of
%columns, and employs LU decomposition to solve a system!

A = [2 0 0 1; 1 1 1 0; -1 0 1 0; 0 0 3 1];
b = [1 2 3 4]';

numRows = size(A,1)
numCols = size(A,2)

for i = 1:numRows
  L(i,i) = 1;
end

for i = 1:numRows

  for j = numRows:-1:i+1
    
    %Creates a lower triangular matrix based on the row operation required
    %to "zero out" all the relevant terms.  This ONLY works for
    %non-singular matrices (?)
    L(j,i)=A(j,i)/A(i,i);  

    A(j,:)=A(j,:)-A(j,i)/A(i,i)*A(i,:); 

    %A(j,i)*A(i,:)-A(i,i)*A(j,:);
  end

  %if A(i,i) ~= 0
  %  A(i,:)=A(i,:)/A(i,i);
  %end
end

A
L


c = L\b
x = A\c