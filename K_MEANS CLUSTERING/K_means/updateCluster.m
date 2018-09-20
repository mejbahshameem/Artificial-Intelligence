function cu=updateCluster(newx,c,k)
    cu=[];
    counter=0;
    sum_x=0;
    sum_y=0;
    for j=1:size(c,1) 
       for i=1:size(newx,1)
            if c(j,:)==newx(i,3:end)
              counter=counter+1;
              sum_x=sum_x+newx(i,1);
              sum_y=sum_y+newx(i,2);
            end
       end
       if counter~=0
       cu=[cu; sum_x/counter  sum_y/counter];
       counter=0;
       sum_x=0;
       sum_y=0;
       end
    end
end
