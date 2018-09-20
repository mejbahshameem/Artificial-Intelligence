function  d = digitRecog(digit)
    load ex3data1;
    
    for i=1:size(X,1)
        
        X(i,:)=convToBin(X(i,:));
       
        if y(i)==10
           
            y(i)=0;
            
        end
        
    end
    
    %d=predict(convToBin(digit),y,X);
    d=predict(X(digit,:),y,X);
   
end