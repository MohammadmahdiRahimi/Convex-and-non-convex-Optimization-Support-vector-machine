syms f(x1,x2) g(x1,x2) 
f(x1,x2) = x1^2 - 10*x2*cos(0.2*pi*x1) + x2^2 - 15*x1*cos(0.4*pi*x2);             %It is our main function
initials = {[10;7] [0;0]};         %It is starting points 
percision = 2;          %percision of showing number in table which is show in command window
max_iteration = 200;
alpha = zeros(2,1);            %array of alpha
alpha(1,1) = 2;
alpha(2,1) = 2;
beta = 0.05;
c1 = 0.5;
p = zeros(2,max_iteration);         %direction of gradient
g(x1,x2) = [diff(f,x1);diff(f,x2)];         %calculate gradient            %first direction for starting point
 for j = 1:2
    xx = cell2mat(initials(j)); 
    p = -g(xx(1),xx(2));
    i = 1;
    while f(xx(1,i)+alpha(j,i)*p(1,i),xx(2,i)+alpha(j,i)*p(2,i)) > f(xx(1,i),xx(2,i)) + c1 * alpha(j,i) * g(xx(1,i),xx(2,i))' * p(:,i) || i > max_iteration 
        i = i+1;
        alpha(j,i) = beta * alpha(j,i-1);
        xx(:,i) = xx(:,i-1) +alpha(j,i)* p(:,i-1);
        p(:,i) = -g(xx(1,i),xx(2,i));
        disp("   i    x1    x2   alpha   f(x)")
        disp(vpa([i xx(1,i) xx(2,i) alpha(j,i) f(xx(1,i),xx(2,i))],percision))
    end
    r(:,j) = xx(:,i);
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
    disp(alpha(k,:))
end