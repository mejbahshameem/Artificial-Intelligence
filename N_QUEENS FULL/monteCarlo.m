function success=monteCarlo(n,max)
    success=0;
    i=0;
    while(i<max)
       queen=generateRandom(n);
        if getQuality(queen)== 0
            success=success+1;
            return;
        end
        i=i+1;
        queen=[];
    end
end