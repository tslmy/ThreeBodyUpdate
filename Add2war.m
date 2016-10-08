function [wars,communications] = Add2war(C1,C2,civilizations,Round,wars,communications,systems)
if and(~isempty(find(systems(:,5)==C1)),~isempty(find(systems(:,5)==C2)))
    add(1,1)=C1
    add(1,2)=C2
    [d,S1,S2] = DC2C(C1,C2,systems)
    add(1,3)=d
    add(1,4)=S1
    add(1,5)=S2
    add(1,6)=Round
    add(1,7)=civilizations(find(civilizations(:,1)==C1),18)
    add(1,8)=civilizations(find(civilizations(:,1)==C1),19)
    add(1,9)=civilizations(find(civilizations(:,1)==C1),20)
    add(1,10)=civilizations(find(civilizations(:,1)==C2),18)
    add(1,11)=civilizations(find(civilizations(:,1)==C2),19)
    add(1,12)=civilizations(find(civilizations(:,1)==C2),20)
    add(1,13)=0
    if CheckRelation(C1,C2,wars)==0
        wars=[wars;add]
    else
        wars(CheckRelation(C1,C2,wars),1:12)=add(1:12)
    end
    if CheckRelation(C1,C2,communications)~=0
        communications(CheckRelation(C1,C2,communications),:)=[]
    end
end