function  L = LinearSystemGenerator(sol,k)
%sol is a column vector
%k is a positive integer; |A_{ij}| \leq k

[n,~] = size(sol);
rng('shuffle')

A=0;
while det(A) == 0
A = randi([-k,k],n); %While loop needed to avoid the singular case
end

y = A*sol;
y = strtrim(rats(y)); %strtrim trims the strings in rats(y)

if n==2
    fprintf('%dx + %dy = %s \n',A(1,1),A(1,2),y(1,:));
    fprintf('%dx + %dy = %s. \n',A(2,1),A(2,2),y(2,:));
elseif n==3
    fprintf('%dx + %dy + %dz = %s \n',A(1,1),A(1,2),A(1,3),y(1,:));
    fprintf('%dx + %dy + %dz = %s \n',A(2,1),A(2,2),A(2,3),y(2,:));
    fprintf('%dx + %dy + %dz = %s \n',A(3,1),A(3,2),A(3,3),y(3,:));
else
   fprintf('Oh man, you''re mean! \n') 
end
    
