function newqueen=makeChange(n,x)
    column_no= randi(n);
    value=randi(n);
    while(1)
        if value~=x(column_no)
            x(column_no)=value;
            break;
        else
            value=randi(n);
        end
    end
    newqueen=x;
end