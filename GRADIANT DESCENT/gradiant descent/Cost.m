function c=Cost(x,y,w0,w1)
   c=0;  
   fx=0;
   for i=1:size(x,1)
        fx=w1*x(i)+w0;
        c=c+(y(i)-fx)^2;
   end
end