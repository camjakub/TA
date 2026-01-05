clear all

%Code that takes a matrix A where the number of rows is <= the number of
%columns, and puts it in RREF with leading digits being ones.

A = [3 1 5 9; 4 3 2 1; 2 4 8 -5; 1 2 3 3]

numRows = size(A,1)
numCols = size(A,2)

for i = 1:numRows % indicates what column we're in

  for j = numRows:-1:i+1 % indicates what row we're in
    A(j,:) = A(i,i)*A(j,:) - A(j,i)*A(i,:);
  end

  if A(i,i) ~= 0
    A(i,:)=A(i,:)/A(i,i);
  end
end

round(A)