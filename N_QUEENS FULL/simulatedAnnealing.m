function success=simulatedAnnealing(n,max)
    i=0;
    t=10000;
    alpha=.95;
    success=0;
    queen=generateRandom(n);
    if getQuality(queen)== 0
            success=success+1;
            return;
           
    end
    while(i<max)
        newqueen=makeChange(n,queen);
        if getQuality(newqueen)== 0
           success=success+1;
           return;
        end
        if getQuality(newqueen)<getQuality(queen)
            queen=newqueen;
        else
            p=rand(1);
            dq=abs(getQuality(queen)-getQuality(newqueen));
            power=-(dq/t);
            wp=exp(power);
            if p<wp
                queen=newqueen; 
                t=alpha*t;
            end
        end
        i=i+1;
   
    end
end