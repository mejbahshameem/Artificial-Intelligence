function k_means()
    k=5;
    c=[];
    x=csvread('data.csv');
   
    x1_min=min(x(:,1));
    x1_max=max(x(:,1));
    x2_min=min(x(:,2));
    x2_max=max(x(:,2));
    for i=1:k
        c=[c; x1_min+(rand(1)*(x1_max-x1_min))  -1*(abs(x2_max)+(rand(1)*(abs(x2_min)-abs(x2_max))))];
    end
    
    %scatter(c(:,1),c(:,2));
    while(1)
        newx=clusterAssign(x,c,k);
        c=updateCluster(newx,c,k);
       
        x=clusterAssign(newx,c,k);
        scatter(x(:,1),x(:,2));
        hold on;
        plot(c(:,1),c(:,2),'r*');
        hold off;
        pause(1);
        if x==newx
            c 
            break;
        end
        
    end
end