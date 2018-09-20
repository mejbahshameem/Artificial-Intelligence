function ret=predict(img,y,X)
    mul=0;
    rem=[];
    total_p=[];
    counter=0;
    matched=0;
    for i=0:9
        
        for k=1:size(y,1)
            if i==y(k)
                rem = [rem k];
                counter=counter+1;
            end
            
        end
        
        for j=1:400
            a=img(j);
            
            for l=1:counter
                if X(rem(l),j)==a 
                    matched=matched+1;
                end
                
            end
            
            if matched==0
                matched=matched+.0001;
            end
            
            mul=mul+log10(matched/counter);
            matched=0;
        end
        
        p_digit=probability(i,y);  
        mul=mul+log10(p_digit);
        total_p=[total_p mul];
        rem=[];
        counter=0;
        mul=0;
        
    end
    
    [val idx]=max(total_p);
    ret=idx-1;
end