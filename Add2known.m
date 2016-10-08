function [communications] = Add2known(C1,C2,civilizations,communications,systems)
[d,S1,S2] = DC2C(C1,C2,systems)
if and(~isempty(find(systems(:,5)==C1)),~isempty(find(systems(:,5)==C2)))
    add(1,1)=C1
    add(1,2)=C2
    add(1,3)=d
    add(1,4)=civilizations(find(civilizations(:,1)==C1),7)
    add(1,5)=civilizations(find(civilizations(:,1)==C2),7)
    add(1,6)=civilizations(find(civilizations(:,1)==C1),17)
    add(1,7)=civilizations(find(civilizations(:,1)==C2),17)
    add(1,8)=exp(-(log(add(1,4))-log(add(1,5))).^2)
    add(1,9)=0.1
    systems(find(systems(:,1)==S1),6)=2*systems(find(systems(:,1)==S1),6)
    systems(find(systems(:,1)==S2),6)=2*systems(find(systems(:,1)==S2),6)
    if CheckRelation(C1,C2,communications)==0
        communications=[communications;add]
    else
        communications(CheckRelation(C1,C2,communications),1:8)=add(1:8)
        communications(CheckRelation(C1,C2,communications),9)=communications(CheckRelation(C1,C2,communications),9)+add(1,8)
    end
end