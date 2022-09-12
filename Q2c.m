syms f(x1,x2) 
f(x1,x2) = x1^2 - 10*x2*cos(0.2*pi*x1) + x2^2 - 15*x1*cos(0.4*pi*x2);             %It is our main function
x = [0,0];
x0 = x;
ff = double(f(x(1),x(2)));
f0 = ff;
n = 100;
j = 0;
while j < n
   T = (j)/n*100;
   for i = 0:1000
       N = normrnd(x,T);
       xx = x + N;
       ftemp = double(f(xx(1),xx(2)));
       diff = ftemp - ff;
       if exp(-diff/T) > rand(1)
           x = xx;
           ff = ftemp;
       end
       if ftemp < f0
           xfinal = xx;
           f0 = ftemp;
       end
   end
    j = j + 1;
end
disp('optimization done')
disp(['If initial point is x1 = ' num2str(x(1)) ' and x2 = ' num2str(x(2))])
disp([' we have: X1 = ' num2str(xfinal(1)) ' X2 = ' num2str(xfinal(2))])
disp(['Value of function is ' num2str(f0) ])