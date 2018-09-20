function s=Select(p,pc,pm,psize)
    s=[];
    r=[];
    r=[p;pc;pm];
    for i=1:psize
        min=intmax;
        for j=1:size(r,1)
            quality=getQuality(r(j,:));
            if quality<min
                min=quality;
                rem=j;
            end
        end
        s=[s;r(rem,:)];
        r=r([1:rem-1,rem+1:end] , : );
    end
end