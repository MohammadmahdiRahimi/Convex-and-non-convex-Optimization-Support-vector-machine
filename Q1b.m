syms f(x1,x2) g(x1,x2) ff(a) temp(a)
f(x1,x2) = 3*x1^2 + 12*x1 + 8*x2^2 + 8*x2 + 6*x1*x2;            %It is our main function
xx = [1;1];         %It is starting point
n = 30;         %Number of iteration 
error = 0.0001;        %threshold for error to stop loop
precision = 6;          %precision of showing number in table which is show in command window      
aa = zeros(1,n);            %array of alpha
p = zeros(2,n);         %direction of gradient
er = zeros(1,n);            %array of errors
g(x1,x2) = [diff(f,x1);diff(f,x2)];         %calculate gradient
p = -g(xx(1),xx(2));            %first direction for starting point
for i = 1:n
    ff(a) = f(xx(1,i)+a*p(1,i),xx(2,i)+a*p(2,i));
    temp(a) = diff(ff,a);
    eq = temp(a) == 0;
    aa(i) = solve(eq);
    xx(:,i+1) = xx(:,i)+aa(i)*p(:,i);
    p(:,i+1) = -g(xx(1,i+1),xx(2,i+1));
    er(i) = double(norm(p(:,i))); %this error find norm of gradient
    %er(i) = norm(xx(:,i+1)-xx(:,i));%this error find differnce between two x
    disp("   i        x1        x2      alpha      error")
    disp(vpa([i xx(1,i) xx(2,i) aa(i) er(i)],precision))
    if er(i) <= error
        disp(['With maximum error ' num2str(er(i)) ' in ' num2str(i) 'th iteration we have: X1 = ' num2str(xx(1,i)) ' X2 = ' num2str(xx(2,i))])  
        break
    end
end

