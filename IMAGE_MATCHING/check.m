function check
    i1=imread('cricketteam.png');
    [y,x,d]=size(i1);
    m=imread('mushfiq.png');
    [y1,x1,d]=size(m);
    x2=1;
    y2=1;
    row_match=0;
    flag_y=0;
    cx=1;
    xc=1;
    xc1=1;
    counter=0;
    counter1=0;
    msg=0;
    s_loop=x-x1;
    k=0;
    first=0;
    s_loop= s_loop+1;
    for i=1:y
       cx=xc;
        for j=cx:x
            if j==s_loop && row_match==0
                break;
            end
            f=impixel(m,x2,y2);
            
            ma=impixel(i1,j,i);
            
            if ma==f
                 if  row_match == 0 && first == 0
                     xc=cx;
                     first=first+1;
                 end
                row_match=row_match+1;
                x2=x2+1;
               
            else
                 
                  flag_y=0;
                  row_match=0;
                  y2=1;
                  x2=1;
                  
            end
            if row_match==x1
                  flag_y=flag_y+1;
               
                  row_match=0;
                  y2=y2+1;
                  x2=1;
                  break;
            end
            if  flag_y==y1
                disp('Image Matched')
                break;
            end 
          
           cx=cx+1;
        end
     
         if  flag_y==y1
            disp('Image Matched')
            msg=1;
            break;
         end
   
    end
    if  msg==0
        disp('Image did not match')
    end
     
end

