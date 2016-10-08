function [systems,civilizations,DestroyedSystems,DestroyedCivilizations,wars,communications,ActingC1,ActingC2,ActingC3]=Type1Action(C1,civilizations,systems,wars,communications,DestroyedSystems,DestroyedCivilizations,Round,OTCN,ActingC1,ActingC2,ActingC3)
systems(find(systems(:,5)==C1),6)=systems(find(systems(:,5)==C1),6)*2
[SIV]=FindS(C1,systems,civilizations,wars,communications,OTCN)
SIV1=SIV(find(~SIV(:,5)),:)
SIV2=SIV(find(SIV(:,5)==OTCN),:)
while ~isempty(SIV2)
    S1=SIV2(1,1)
    if and(SIV2(1,8)<civilizations(find(civilizations(:,1)==C1),16),SIV2(1,8)<=1.1*civilizations(find(civilizations(:,1)==C1),14))
        [systems,civilizations,wars,communications,DestroyedCivilizations,ActingC1,ActingC2,ActingC3]=search(S1,C1,systems,civilizations,wars,communications,Round,DestroyedCivilizations,ActingC1,ActingC2,ActingC3)
    elseif SIV2(1,8)<civilizations(find(civilizations(:,1)==C1),17)
        C2=systems(find(systems(:,1)==S1),5)
        if or(civilizations(find(civilizations(:,1)==C2),21)==2,civilizations(find(civilizations(:,1)==C2),21)==3)
            [wars,communications] = Add2war(C1,C2,civilizations,Round,wars,communications,systems)
        else
            [communications] = Add2communication(C1,C2,civilizations,communications,systems)
        end
    end
    SIV2(1,:)=[]
end
while ~isempty(SIV1)
    S1=SIV1(1,1)
    [systems,civilizations,wars,communications,DestroyedCivilizations,ActingC1,ActingC2,ActingC3]=search(S1,C1,systems,civilizations,wars,communications,Round,DestroyedCivilizations,ActingC1,ActingC2,ActingC3)
    SIV1(1,:)=[]
end