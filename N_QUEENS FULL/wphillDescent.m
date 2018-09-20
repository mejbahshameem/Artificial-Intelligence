function success=wphillDescent(n,max)
    wp=0.05;
    i=0;
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
            if p<wp
                queen=newqueen; 
            end
        end
        i=i+1;
   
    end
end