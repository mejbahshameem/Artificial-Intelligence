function makeComparison()
j=0;
i=1;
a=[];
    while(1)
        
        disp('----press 1 for making comparison between 5 algorithims----');
        disp('----press 2 for exit----');
        n = input('Enter a choice: ');
        switch n
            case 1
                 q = input('Enter no. of queens: ');
                 max = input('Enter Trial: ');
                 disp('queen          trial          monteCarlo          hillDescent         wphillDescent          simulatedAnnealing          geneticAlgorithm');
                 max1=1000;
                 mn=0;
                 hd=0;
                 wp=0;
                 sa=0;
                 ga=0;
                 for o=1:max
                     if monteCarlo(q,max1)==1
                        mn=mn+1;
                     end
                     if hillDescent(q,max1)==1
                        hd=hd+1;
                     end
                     if wphillDescent(q,max1)==1
                        wp=wp+1;
                     end
                     if simulatedAnnealing(q,max1)==1
                        sa=sa+1;
                     end
                      if geneticAlgorithm(q,max1)==1
                        ga=ga+1;
                     end
                 end
                 a=[a q];
                 a=[a max];
                 a=[a mn];
                 a=[a hd];
                 a=[a wp];
                 a=[a sa];
                 a=[a ga];
                 for i=1:length(a)
                     if j==0
                        fprintf('%d',a(i));
                           
          
                     end
                     if j==1
                         len=numel(num2str(a(i-1)));
                         if len==1
                         fprintf('              %d',a(i));
                         elseif len==2
                         fprintf('             %d',a(i));
                         elseif len==3
                         fprintf('            %d',a(i));
                          
                         end
                         
                     end
                       if j==2
                        
                         len=numel(num2str(a(i-1)));
                         if len==1
                         fprintf('              %d',a(i));
                         elseif len==2
                         fprintf('             %d',a(i));
                         elseif len==3
                         fprintf('            %d',a(i));
                         elseif len==4
                         fprintf('           %d',a(i));
                           
                         end
                       
                       end
                      if j==3
                        
                         len=numel(num2str(a(i-1)));
                         if len==1
                         fprintf('                   %d',a(i));
                         elseif len==2
                         fprintf('                  %d',a(i));
                         elseif len==3
                         fprintf('                 %d',a(i));
                          
                         end
                        
                      end
                      if j==4
                        
                         len=numel(num2str(a(i-1)));
                         
                         if len==1
                         fprintf('                   %d',a(i));
                         elseif len==2
                         fprintf('                  %d',a(i));
                         elseif len==3
                         fprintf('                 %d',a(i));
                           
                         end
                        
                      end
                       if j==5
                        
                         len=numel(num2str(a(i-1)));
                         
                         if len==1
                         fprintf('                      %d',a(i));
                         elseif len==2
                         fprintf('                     %d',a(i));
                         elseif len==3
                         fprintf('                    %d',a(i));
                          
                         end
                       
                       end
                      if j==6
                        
                         len=numel(num2str(a(i-1)));
                         
                         if len==1
                         fprintf('                           %d',a(i));
                         elseif len==2
                         fprintf('                          %d',a(i));
                         elseif len==3
                         fprintf('                         %d',a(i));
                           
                         end
                        
                      end
                      
                      j=j+1;
                     if rem(i,7)==0
                         fprintf('\n');
                         j=0;
                       
                     end
                    
                    
                 end
             
            case 2
                exit;
            otherwise
                disp('wrong input!!')
        end
         fprintf('\n');
    end
end