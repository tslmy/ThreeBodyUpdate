function [systems,civilizations,DestroyedSystems,DestroyedCivilizations,wars,communications,ActingC1,ActingC2,ActingC3]=Type3Action(C1,civilizations,systems,wars,communications,DestroyedSystems,DestroyedCivilizations,Round,OTCN,ActingC1,ActingC2,ActingC3)
[SIV]=FindS(C1,systems,civilizations,wars,communications,OTCN)
SIV1=SIV(find(~SIV(:,5)),:)
SIV2=SIV(find(SIV(:,5)==OTCN),:)
while ~isempty(SIV2)
    S1=SIV2(1,1)
    if civilizations(find(civilizations(:,1)==C1),18)<civilizations(find(civilizations(:,1)==C1),20)
        [systems,civilizations,DestroyedSystems,DestroyedCivilizations,wars,communications,ActingC1,ActingC2,ActingC3] = Destroy(S1,C1,systems,civilizations,DestroyedSystems,DestroyedCivilizations,Round,wars,communications,ActingC1,ActingC2,ActingC3)
    elseif and(SIV2(1,8)<civilizations(find(civilizations(:,1)==C1),16),SIV2(1,8)<=civilizations(find(civilizations(:,1)==C1),14))
        [systems,civilizations,wars,communications,DestroyedCivilizations,ActingC1,ActingC2,ActingC3] = Attack(S1,C1,systems,civilizations,wars,communications,Round,DestroyedCivilizations,ActingC1,ActingC2,ActingC3)
    else
        [systems,civilizations]=Target(S1,C1,systems,civilizations)
    end
    SIV2(1,:)=[]
end
while ~isempty(SIV1)
    S1=SIV1(1,1)
    [systems,civilizations,wars,communications,DestroyedCivilizations,ActingC1,ActingC2,ActingC3] = Attack(S1,C1,systems,civilizations,wars,communications,Round,DestroyedCivilizations,ActingC1,ActingC2,ActingC3)
    SIV1(1,:)=[]
end