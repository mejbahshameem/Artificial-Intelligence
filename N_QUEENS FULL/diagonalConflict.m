function d=diagonalConflict(x)
  d=0;  
    for i=1:length(x)
        for j=i+1:length(x)
            if abs(i-j)==abs(x(i)-x(j))
                d=d+1;
            end
        end
    end
end