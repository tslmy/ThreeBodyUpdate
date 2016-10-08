function [civilizations,DestroyedCivilizations,wars,communications,systems,ActingC1,ActingC2,ActingC3] = CheckDC(C1,systems,civilizations,DestroyedCivilizations,Round,wars,communications,ActingC1,ActingC2,ActingC3)
S1=find(systems(:,5)==C1)
if isempty(S1)
    dc(1,1)=C1
    dc(1,2)=civilizations(find(civilizations(:,1)==C1),2)
    dc(1,3)=civilizations(find(civilizations(:,1)==C1),3)
    dc(1,4)=civilizations(find(civilizations(:,1)==C1),7)
    dc(1,5)=civilizations(find(civilizations(:,1)==C1),9)
    dc(1,6)=civilizations(find(civilizations(:,1)==C1),11)
    dc(1,7)=civilizations(find(civilizations(:,1)==C1),15)
    dc(1,8)=civilizations(find(civilizations(:,1)==C1),16)
    dc(1,9)=civilizations(find(civilizations(:,1)==C1),17)
    dc(1,10)=civilizations(find(civilizations(:,1)==C1),18)
    dc(1,11)=civilizations(find(civilizations(:,1)==C1),19)
    dc(1,12)=civilizations(find(civilizations(:,1)==C1),20)
    dc(1,13)=Round
    DestroyedCivilizations=[DestroyedCivilizations;dc]
    civilizations(find(civilizations(:,1)==C1),:)=[]
    if ~isempty(wars)
        wars(find(wars(:,1)==C1),:)=[]
        wars(find(wars(:,2)==C1),:)=[]
    end
    if ~isempty(communications)
        communications(find(communications(:,1)==C1),:)=[]
        communications(find(communications(:,2)==C1),:)=[]
    end
    if ~isempty(ActingC1)
        ActingC1(find(ActingC1(:,1)==C1),:)=[]
    end
    if ~isempty(ActingC2)
        ActingC2(find(ActingC2(:,1)==C1),:)=[]
        end
    if ~isempty(ActingC3)
        ActingC3(find(ActingC3(:,1)==C1),:)=[]
    end
end
