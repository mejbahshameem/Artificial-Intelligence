function m=manhattanDistance(stateIn)
goal=[0 1 2;3 4 5;6 7 8];
newState=[0 0 0;0 0 0;0 0 0];
flag=0;
m=0;
newState=[stateIn(1) stateIn(4) stateIn(7);stateIn(2) stateIn(5) stateIn(8);stateIn(3) stateIn(6) stateIn(9)];
for i=1:3
    for j=1:3
        for k=1:3
            for l=1:3
                if newState(i,j)==goal(k,l)
                    m=m+abs((i-k)+(j-l));
                    flag=1;
                    break;
                end
            end
            if flag==1
                flag=0;
                break;
            end
        end
        
    end
end

end
