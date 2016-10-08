function [civilizations,systems,wars,communications,DestroyedSystems,DestroyedCivilizations,ActingC1,ActingC2,ActingC3]=ActingWar(civilizations,systems,wars,communications,DestroyedSystems,DestroyedCivilizations,Round,OTCN,ActingC1,ActingC2,ActingC3)
actingW=wars
while ~isempty(actingW)
    if actingW(1,9)>=actingW(1,12)
        C1=actingW(1,1)
        C2=actingW(1,2)
    else
        C1=actingW(1,2)
        C2=actingW(1,1)
    end
    if civilizations(find(civilizations(:,1)==C1),21)~=0
        [systems,civilizations,DestroyedSystems,DestroyedCivilizations,wars,communications,ActingC1,ActingC2,ActingC3]=WarAction(C1,C2,civilizations,systems,wars,communications,DestroyedSystems,DestroyedCivilizations,Round,OTCN,ActingC1,ActingC2,ActingC3)
    end
    if and(civilizations(find(civilizations(:,1)==C2),21)~=0,~isempty(find(systems(:,5)==C2)))
        [systems,civilizations,DestroyedSystems,DestroyedCivilizations,wars,communications,ActingC1,ActingC2,ActingC3]=WarAction(C2,C1,civilizations,systems,wars,communications,DestroyedSystems,DestroyedCivilizations,Round,OTCN,ActingC1,ActingC2,ActingC3)
    end
    [wars,communications]=Add2war(C1,C2,civilizations,Round,wars,communications,systems)
    actingW(1,:)=[]
end