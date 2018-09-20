function value=goalCheck(node)
value=0;
% check if the node is a goal or not
if sum(node==[0 0 1])== 3
    value=1;
end