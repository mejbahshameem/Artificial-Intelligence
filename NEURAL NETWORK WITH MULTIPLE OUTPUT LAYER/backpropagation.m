function backpropagation(x,y,eta,iteration)
    h=4;
    k=2;
    epsilon=.1;
    [m,n]=size(x);
    wh=rand(n+1,h)* 2 * epsilon - epsilon;
    wo=rand(h+1,k)*2 * epsilon - epsilon;
    delh=[];
    delk=[];
    newdimx=[ones(m,1),x];
    oh=[];
    ok=[];
    sum=0;
    it=0;
    ij=0;
    while(it<iteration)
        for i=1:m  
            for j=1:h
                for p=1:(n+1)
                    ij=ij+newdimx(i,p)*wh(p,j);
                end
                oh=[oh sigmoid2(ij)];
                ij=0;
            end
            newdimoh=[1 oh];
            for j=1:k
                for p=1:(n+1)
                    ij=ij+newdimoh(1,p)*wo(p,j);
                end
                ok=[ok sigmoid2(ij)];
                ij=0;
            end
            
            for j=1:k
                delk(j)=ok(j)*(1-ok(j))*(y(i,j)-ok(j));
            end
            
            for j=1:h
                delh(j)=oh(j)*(1-oh(j));
                in=j+1;
                for p=1:k
                   sum=sum+(delk(p)*wo(in,p));
                end
                delh(j)=delh(j)*sum;
                sum=0;
            end
            for j=1:size(wh,2)
                for p=1:size(wh,1)
                    wh(p,j)=wh(p,j)+(eta*delh(j)*newdimx(i,p));
                end
            end
            for j=1:size(wo,2)
                for p=1:size(wo,1)
                  wo(p,j)=wo(p,j)+(eta*delk(j)*newdimoh(p));
                end
            end
            ok=[];
            newdimoh=[];
            oh=[];    
        end
        it=it+1;
    end
    disp('weights');
    wh
    wo
    %for two test data
    disp('Output of test data')
    x=[1 1 0;1 1 1];
    newdimx=[ones(2,1),x];
    for i=1:2
            for j=1:h
                for p=1:(n+1)
                    ij=ij+newdimx(i,p)*wh(p,j);
                end
                oh=[oh sigmoid2(ij)];
                ij=0;
            end
            newdimoh=[1 oh];
            for j=1:k
                for p=1:(n+1)
                    ij=ij+newdimoh(1,p)*wo(p,j);
                end
                ok=[ok sigmoid2(ij)];
                ij=0;
            end
            ok
            ok=[];
            newdimoh=[];
            oh=[]; 
    end
        
end