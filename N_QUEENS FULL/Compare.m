function Compare()
    q=input('Enter no. of queens: ');
    max=input('Enter Trial: ');
    max1=1000;
    mn=0;
     
    hd=0;
    wp=0;
    sa=0;
    ga=0;
    for o=1:max
                     if monteCarlo(q,max1)==1
                        mn=mn+1;
                     end
                     if hillDescent(q,max1)==1
                        hd=hd+1;
                     end
                     if wphillDescent(q,max1)==1
                        wp=wp+1;
                     end
                     if simulatedAnnealing(q,max1)==1
                        sa=sa+1;
                     end
                      if geneticAlgorithm(q,max1)==1
                        ga=ga+1;
                      end
    end
    fprintf('\nqueen: %d \n',q);
    fprintf('\nTrial: %d \n',max);
    fprintf('\nmonteCarlo: %d \n',mn);
    fprintf('\nhillDescent: %d \n',hd);
    fprintf('\nwphillDescent: %d \n',wp);
    fprintf('\nsimulatedAnnealing: %d \n',sa);
    fprintf('\ngeneticAlgo: %d\n',ga);                 
    
end