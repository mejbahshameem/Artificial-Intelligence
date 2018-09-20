function m=mutation(queen,row)
   m=[];
   m1=[];
   len=length(queen(1,:));
   for i=1:row
       flip_pos=randi(len);
       flip_value=randi(len);
       m1=[queen(i,:)];
       while(1)
            if m1(flip_pos)~=flip_value;
                m1(flip_pos)=flip_value;
                break;
            else
               flip_value=randi(len);
            end
       end
       m=[m;m1];
   end
   
end