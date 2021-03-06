function steps=astar(stateInitial)
% this function will take the nodeInitial and return steps as a vector of
% steps here 0=UP 1= DOWN 2=RIGHT 3=LEFT 

%set up the initialnode
steps=[];
field1='state';
field2='steps';
field3='cost';
value1=stateInitial;
value2=[];
value3=0;
initialNode=struct(field1,value1,field2,value2,field3,pathCostGx(stateInitial)+manhattanDistance(stateInitial));

%here we insert the initial node into the frontier
frontier=[initialNode];
v=0;
% initially the closedList or the visited List is empty, later on the
% visited nodes will be inserted into this list
closedList=[];
 %length(frontier) > 0    
% start of the loop - until the frontier is not empty
    % Step1: extract a solution which is in the front of the frontier, 
    %in case of BFS its the FIFO, the first one
while length(frontier) > 0 
    min=frontier(1).cost;
    i=1;
    counter=1;
   while i<=length(frontier)
        if frontier(i).cost<min
            min=frontier(i).cost;
            counter=i;
        end
        i=i+1;
   end
    temp1=frontier(counter);
    frontier(counter)=frontier(1);
    frontier(1)=temp1;
    front=frontier(1);     
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
    upChild=up(front.state);
    if sum(upChild == [0 0 0 0 0 0 0 0 0])~= 9
        % here we add the steps to the child and create  a node
       upNode=struct(field1,upChild,field2,[front.steps 0],field3,pathCostGx([front.steps 0])+manhattanDistance(upChild));
       if checkClosedList(closedList,upNode) == 0
          frontier = [frontier upNode];
       end
    end
    
    
    
    downChild=down(front.state);
    if sum(downChild == [0 0 0 0 0 0 0 0 0])~= 9
        % here we add the steps to the child and create  a node
       downNode=struct(field1,downChild,field2,[front.steps 1],field3,pathCostGx([front.steps 1])+manhattanDistance(downChild));
       if checkClosedList(closedList,downNode) == 0
           frontier = [frontier downNode];
       end
    end
    
    
    leftChild=left(front.state);
    if sum(leftChild == [0 0 0 0 0 0 0 0 0])~= 9
        % here we add the steps to the child and create  a node
       leftNode=struct(field1,leftChild,field2,[front.steps 3],field3,pathCostGx([front.steps 3])+manhattanDistance(leftChild));
       if checkClosedList(closedList,leftNode) == 0         
           frontier = [frontier leftNode];
       end
    end
    
    rightChild=right(front.state);
    if sum(rightChild == [0 0 0 0 0 0 0 0 0])~= 9
        % here we add the steps to the child and create  a node
       rightNode=struct(field1,rightChild,field2,[front.steps 2],field3,pathCostGx([front.steps 2])+manhattanDistance(rightChild));
       if checkClosedList(closedList,rightNode) == 0
           frontier = [frontier rightNode];
       end
    end
   
    v=v+1;
end
 
%end of the Loop
end