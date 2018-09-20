function val=geneticAlgorithm(n,max)
    val=0;
    psize=20;
    p=[];
   
    pc=[];
    for i=1:psize
      p=[p;generateRandom(n)];
      if getQuality(p(i,:))== 0
            val=1;
            return;
      end
     
    end
    t=0;
    
    while(t<max)
       pc=crossOver(p,psize);
       pm=mutation(p,psize);
       p=Select(p,pc,pm,psize);
       for i=1:psize
            if getQuality(p(i,:))== 0
                val=1;
                return;
            end
     
       end
       t=t+1;
    end
    
    
end
 