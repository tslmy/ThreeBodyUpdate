function [DestroyedSystems, systems]=CheckDS(S1, DestroyedSystems, systems, Round)
Dsystems(1,1)=S1
Dsystems(1,2)=systems(find(systems(:,1)==S1),2)
Dsystems(1,3)=systems(find(systems(:,1)==S1),3)
Dsystems(1,4)=systems(find(systems(:,1)==S1),4)
Dsystems(1,5)=systems(find(systems(:,1)==S1),5)
Dsystems(1,6)=systems(find(systems(:,1)==S1),7)
Dsystems(1,7)=Round
systems(find(systems(:,1)==S1),:)=[]
DestroyedSystems=[DestroyedSystems;Dsystems]