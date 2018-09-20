function bin=convToBin(x)
bin=x;
    for i=1:length(x)
        if abs(x(i))>.3
            bin(i)=1;
        else
            bin(i)=0;
        end    
    end
end