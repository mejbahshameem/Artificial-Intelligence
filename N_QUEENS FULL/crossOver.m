function c=crossOver(queen,row)
    c=[];
    len=length(queen(1,:));
    j=ceil(row/2);
    p1=[];
    p2=[];
    c1=[];
    c2=[];
    r1=randi(row);
    r2=randi(row);
    for i=1:j
         r1=randi(row);
         r2=randi(row);
         point=randi(len-1);
         while(1)
            if r1~=r2
                break;
            else
                r2=randi(row);
            end
         end
         p1=queen(r1,:);
         p2=queen(r2,:);
         c1=[p1(1:point) p2(point+1:end)];
         c2=[p2(1:point) p1(point+1:end)];
         c=[c;c1;c2];
         
    end
   
    
end