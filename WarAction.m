function [systems,civilizations,DestroyedSystems,DestroyedCivilizations,wars,communications,ActingC1,ActingC2,ActingC3]=WarAction(C1,C2,civilizations,systems,wars,communications,DestroyedSystems,DestroyedCivilizations,Round,OTCN,ActingC1,ActingC2,ActingC3)
if and(~isempty(find(systems(:,5)==C1)),~isempty(find(systems(:,5)==C2)))
    SIV=FindS(C1,systems,civilizations,wars,communications,OTCN)
    [d,c1,c2] = DC2C(C1,C2,systems)
    if find(SIV(:,1)==c2)~=0
        SIV(find(SIV(:,1)==c2),5)=C2
        SIV(find(SIV(:,1)==c2),7)=1
    end
    SIV=SIV(find(SIV(:,5)==C2),:)
    while ~isempty(SIV)
        if wars(CheckRelation(C1,C2,wars),13)==C2
            [systems,civilizations]=Target(SIV(1,1),C1,systems,civilizations)
        elseif civilizations(find(civilizations(:,1)==C1),18)<civilizations(find(civilizations(:,1)==C1),20)
            [systems,civilizations,DestroyedSystems,DestroyedCivilizations,wars,communications,ActingC1,ActingC2,ActingC3]=Destroy(SIV(1,1),C1,systems,civilizations,DestroyedSystems,DestroyedCivilizations,Round,wars,communications,ActingC1,ActingC2,ActingC3)
        else
            [systems,civilizations,wars,communications,DestroyedCivilizations,ActingC1,ActingC2,ActingC3]=Attack(SIV(1,1),C1,systems,civilizations,wars,communications,Round,DestroyedCivilizations,ActingC1,ActingC2,ActingC3)
        end
        SIV(1,:)=[]
    end
end