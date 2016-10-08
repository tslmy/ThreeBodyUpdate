function [systems,civilizations,DestroyedSystems,DestroyedCivilizations,wars,communications,ActingC1,ActingC2,ActingC3]=Type2Action(C1,civilizations,systems,wars,communications,DestroyedSystems,DestroyedCivilizations,Round,OTCN,ActingC1,ActingC2,ActingC3)
[SIV]=FindS(C1,systems,civilizations,wars,communications,OTCN)
SIV1=SIV(find(~SIV(:,5)),:)
while ~isempty(SIV1)
    S1=SIV1(1,1)
    [systems,civilizations,wars,communications,DestroyedCivilizations,ActingC1,ActingC2,ActingC3] = Attack(S1,C1,systems,civilizations,wars,communications,Round,DestroyedCivilizations,ActingC1,ActingC2,ActingC3)
    SIV1(1,:)=[]
end