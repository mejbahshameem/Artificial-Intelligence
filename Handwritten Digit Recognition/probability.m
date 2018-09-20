function prob=probability(digit,y)
    counter=0;
    for i=1:size(y,1)
        if y(i)==digit
            counter=counter+1;
        end
    end
    prob=counter/size(y,1);
end