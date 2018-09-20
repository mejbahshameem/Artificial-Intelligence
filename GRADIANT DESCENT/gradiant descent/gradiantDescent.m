function gradiantDescent()
    x=[1;2;3;4;5];
    y=[2;4;6;6;10];
    w0=5;
    w1=5;
    del0=0;
    del1=0;
    fx=0;
    d=0;
    d1=0;
    newdw0=0;
    newdw1=0;
    alpha=.01;
    r=0;
    c=Cost(x,y,w0,w1);
    while(r<1000)
         for i=1:size(x,1)
            fx=w1*x(i)+w0;
            d=d+(y(i)-fx);
         end 
      
        for j=1:size(x,1)
            fx=w1*x(j)+w0;
            d1=d1+2*(y(j)-fx)*x(j);
        end 
        newdw0=w0+d*alpha;
        newdw1=w1+d1*alpha;    
        c=Cost(x,y,newdw0,newdw1);
        w0=newdw0;
        w1=newdw1;
        r=r+1;
        d=0;
        d1=0;
        r=r+1;
    end
    c
    newdw0
    newdw1
end