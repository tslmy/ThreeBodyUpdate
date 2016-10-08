function [civilizations,systems,wars,communications,CombinedCivilizations,ActingC1,ActingC2,ActingC3]=ActingCommunication(civilizations,systems,wars,communications,CombinedCivilizations,Round,OTCN,ActingC1,ActingC2,ActingC3)
actingC=communications
while ~isempty(actingC)
    if actingC(1,4)>=actingC(1,5)
        C1=actingC(1,1)
        C2=actingC(1,2)
    else
        C1=actingC(1,2)
        C2=actingC(1,1)
    end
    if and(civilizations(find(civilizations(:,1)==C1),21)~=0,civilizations(find(civilizations(:,1)==C2),21)~=0)
        [communications]=Add2communication(C1,C2,civilizations,communications,systems)
        if communications(CheckRelation(C1,C2,communications),9)>=1
            [civilizations,CombinedCivilizations,wars,communications,systems,ActingC1,ActingC2,ActingC3] = CheckCC(C2,C1,systems,civilizations,CombinedCivilizations,Round,wars,communications,ActingC1,ActingC2,ActingC3)
        end
    end
    actingC(1,:)=[]
end