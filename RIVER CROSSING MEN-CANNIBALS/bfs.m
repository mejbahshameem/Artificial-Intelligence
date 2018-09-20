function steps=bfs(stateInitial)
% this function will take the nodeInitial and return steps as a vector of
% steps here 0=UP 1= DOWN 2=RIGHT 3=LEFT 

%set up the initialnode
steps=[];
field1='state';
field2='steps';
value1=stateInitial;
value2=[];
initialNode=struct(field1,value1,field2,value2);


%here we insert the initial node into the frontier
frontier=[initialNode];


% initially the closedList or the visited List is empty, later on the
% visited nodes will be inserted into this list
closedList=[];

% start of the loop - until the frontier is not empty
    % Step1: extract a solution which is in the front of the frontier, 
    %in case of BFS its the FIFO, the first one
while length(frontier) > 0    
    front=frontier(1);
       disp(frontier(1));  
    %Step 2: Delete it from the frontier
    % write code for that here:
    frontier=frontier(2:end);
    
       
    % Step 3: If this extracted node is the goal then return goal
    % write code for that here:
    if goalCheck(front.state) == 1
        steps=front.steps;
        break;
    end
    
    
    %Step 4: Add the extracted node into the closedList
    % write code for that here:
    closedList=[closedList front];
    
    
    % Step 5: Expand the extracted node and add the children to the frontier
    % before adding you must check two things, first if the child is valid
    % second the child does not exist in the closedList
    % do that for each of the actions: UP/DOWN/LEFT/rIGHT
    % write code for that here:
    upChild=m(front.state);
    if sum(upChild == [-1 -1 -1])~= 3
        % here we add the steps to the child and create  a node
       upNode=struct(field1,upChild,field2,[front.steps 0]);
       if checkClosedList(closedList,upNode) == 0
           frontier = [frontier upNode];
       end
    end
    
    
    
    downChild=mm(front.state);
    if sum(downChild == [-1 -1 -1])~= 3
        % here we add the steps to the child and create  a node
       downNode=struct(field1,downChild,field2,[front.steps 1]);
       if checkClosedList(closedList,downNode) == 0
           frontier = [frontier downNode];
       end
    end
    
    
    leftChild=c(front.state);
    if sum(leftChild == [-1 -1 -1])~= 3
        % here we add the steps to the child and create  a node
       leftNode=struct(field1,leftChild,field2,[front.steps 3]);
       if checkClosedList(closedList,leftNode) == 0
           frontier = [frontier leftNode];
       end
    end
    
    rightChild=cc(front.state);
    if sum(rightChild == [-1 -1 -1])~= 3
        % here we add the steps to the child and create  a node
       rightNode=struct(field1,rightChild,field2,[front.steps 2]);
       if checkClosedList(closedList,rightNode) == 0
           frontier = [frontier rightNode];
       end
    end
     rChild=mc(front.state);
    if sum(rChild == [-1 -1 -1])~= 3
        % here we add the steps to the child and create  a node
       rNode=struct(field1,rChild,field2,[front.steps 4]);
       if checkClosedList(closedList,rNode) == 0
           frontier = [frontier rNode];
       end
    end
end
%end of the Loop
end