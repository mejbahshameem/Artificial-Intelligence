function c=columnConflict(queen)
     u=unique(queen);
     c=abs(length(u)-length(queen));
end