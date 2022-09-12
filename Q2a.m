syms f(x1,x2) g(x1,x2)
f(x1,x2) = x1^2 - 10*x2*cos(0.2*pi*x1) + x2^2 - 15*x1*cos(0.4*pi*x2);            %It is our main function
initials = {[7;0] [9;6]};         %It is starting points 
n = 1000;         %Number of iteration 
error = 0.01;        %threshold for error to stop loop
precision = 6;          %precision of showing number in table which is show in command window      
a = 0.005;            % alpha
r = zeros(2,2);
p = zeros(2,n);         %direction of gradient
er = zeros(1,n);            %array of errors
g(x1,x2) = [diff(f,x1);diff(f,x2)];         %calculate gradient    
for j = 1:2
    xx = cell2mat(initials(j)); 
    p = -g(xx(1),xx(2));    %first direction for starting point
    for i = 1:n
        xx(:,i+1) = xx(:,i) + a*p(:,i);
        p(:,i+1) = -g(xx(1,i+1),xx(2,i+1));
        er(i) = double(norm(-p(:,i+1))); %this error find norm of gradient
        %er(i) = norm(xx(:,i+1)-xx(:,i));%this error find differnce between two x
        disp("   i      x1        x2       error")
        disp(vpa([i xx(1,i) xx(2,i) er(i)],precision))
        if er(i) <= error
            r(:,j) = xx(:,i+1);
            disp(['If initial point is x1 = ' num2str(xx(1,1)) ' and x2 = ' num2str(xx(2,1))])
            disp(['With maximum error ' num2str(er(i)) ' in ' num2str(i) 'th iteration we have: X1 = ' num2str(xx(1,i+1)) ' X1 = ' num2str(xx(2,i+1))])  
            break
        end
    end
end
disp('optimization done')
for k = 1:2
    xx = cell2mat(initials(k));
   disp(['If initial point is x1 = ' num2str(xx(1,1)) ' and x2 = ' num2str(xx(2,1))])
   disp([' we have: X1 = ' num2str(r(1,k)) ' X2 = ' num2str(r(2,k))]) 
   disp(['Value of function is ' num2str(double(f(r(1,k),r(2,k)))) ])  
end
