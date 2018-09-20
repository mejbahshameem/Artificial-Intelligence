function ca=clusterAssign(x,c,k)
ca=[];

    for i=1:size(x,1)
        min=intmax;
        for j=1:size(c,1)
            if Distance(x(i,1:2),c(j,:))<min
                min= Distance(x(i,1:2),c(j,:));
                rem=j;
            end
        end
        ca=[ca; x(i,1:2) c(rem,:)];
    end
end