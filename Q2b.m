syms f(x1,x2) g(x1,x2) ff(a) temp(a)
f(x1,x2) = x1^2 - 10*x2*cos(0.2*pi*x1) + x2^2 - 15*x1*cos(0.4*pi*x2);             %It is our main function
initials = {[0;0] [1;1]};         %It is starting points 
n = 100;         %Number of iteration 
error = 0.01;        %threshold for error to stop loop
percision = 5;          %percision of showing number in table which is show in command window      
aa = zeros(2,1);            %array of alpha
p = zeros(2,n);         %direction of gradient
er = zeros(1,n);            %array of errors
g(x1,x2) = [diff(f,x1);diff(f,x2)];         %calculate gradient            %first direction for starting point
 for j = 1:2
    xx = cell2mat(initials(j)); 
    p = -g(xx(1),xx(2));
    for i = 1:n
        ff(a) = f(xx(1,i)+a*p(1,i),xx(2,i)+a*p(2,i));
        temp(a) = diff(ff,a);
        eq = temp(a) == 0;
        aa(j,i) = vpasolve(eq);
        xx(:,i+1) = xx(:,i)+aa(j,i)*p(:,i);
        p(:,i+1) = -g(xx(1,i+1),xx(2,i+1));
        er(i) = double(norm(p(:,i))); %this error find norm of gradient
        %er(i) = norm(xx(:,i+1)-xx(:,i));%this error find differnce between two x
        disp("   i       x1       x2      alpha     error")
        disp(vpa([i xx(1,i) xx(2,i) aa(j,i) er(i)],percision))
        if er(i) <= error
            r(:,j) = xx(:,i+1);
            disp(['If initial point is x1 = ' num2str(xx(1,1)) ' and x2 = ' num2str(xx(2,1))])
            disp(['With maximum error ' num2str(er(i)) ' in ' num2str(i) 'th iteration we have: X1 = ' num2str(xx(1,i+1)) ' X2 = ' num2str(xx(2,i+1))])  
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
for k = 1:2
    xx = cell2mat(initials(k));
    disp(['And array of alpha for initial point  x1 = ' num2str(xx(1,1)) ' and x2 = ' num2str(xx(2,1))])
    disp(aa(k,:))
end