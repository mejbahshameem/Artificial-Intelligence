function nodeOut=mc(nodeIn)
% find the position of 0 and move it up or swap with the element in the
% above position to it 
%first copy nodeIn to nodeOut
%If there is not above position then return a zero matrix
nodeOut=nodeIn;
a=nodeIn;
c=[0 0];

if a(3)==0
p=abs(a(1)-3);
p1=abs(a(2)-3);
a=[a(1)-1 a(2)-1 a(3)+1];
c=[p+1 p1+1];
if (a(2)>a(1)&& a(1)~=0) || (c(2)>c(1) && c(1)~=0)
  nodeOut=[-1 -1 -1];  
else
    nodeOut=a;
end

elseif a(3)==1
        p=abs(a(1)-3);
        p1=abs(a(2)-3);
        b=[a(1)+1 a(2)+1 a(3)-1];
        c=[p-1 p1-1];
   
        if (b(2)>b(1)&& b(1)~=0) || (c(2)>c(1) && c(1)~=0)|| b(2)>3 || b(1)>3
            nodeOut=[-1 -1 -1];
        
        else
            nodeOut=b;
        end
end
            


    

    
%positionZero=find(~nodeOut);
%if positionZero==1 || positionZero==4 || positionZero==7
 %   nodeOut=zeros(size(nodeIn));
%else
   % temp=nodeOut(positionZero-1);
  %  nodeOut(positionZero-1)=0;
 %   nodeOut(positionZero)=temp;
end