function [systems,civilizations,wars,communications,DestroyedCivilizations,ActingC1,ActingC2,ActingC3] = Attack(S1,C1,systems,civilizations,wars,communications,Round,DestroyedCivilizations,ActingC1,ActingC2,ActingC3)
[d,S2]=DC2S(S1,C1,systems)
if and(d<=civilizations(find(civilizations(:,1)==C1),14),d<=civilizations(find(civilizations(:,1)==C1),16))
    if systems(find(systems(:,1)==S1),5)==0
        systems(find(systems(:,1)==S1),5)=C1
        civilizations(find(civilizations(:,1)==C1),14)=civilizations(find(civilizations(:,1)==C1),14)-d
        systems(find(systems(:,1)==S1),6)=1.1*systems(find(systems(:,1)==S1),6)
        systems(find(systems(:,1)==S2),6)=1.1*systems(find(systems(:,1)==S2),6)
    elseif systems(find(systems(:,1)==S1),5)~=0
        C2=systems(find(systems(:,1)==S1),5)
        [wars,communications] = Add2war(C1,C2,civilizations,Round,wars,communications,systems)
        if civilizations(find(civilizations(:,1)==C1),18)>civilizations(find(civilizations(:,1)==systems(find(systems(:,1)==S1),5)),19)
            systems(find(systems(:,1)==S1),5)=C1
            civilizations(find(civilizations(:,1)==C1),14)=civilizations(find(civilizations(:,1)==C1),14)-d
            systems(find(systems(:,1)==S1),6)=1.1*systems(find(systems(:,1)==S1),6)
            systems(find(systems(:,1)==S2),6)=1.1*systems(find(systems(:,1)==S2),6)
            [civilizations,DestroyedCivilizations,wars,communications,systems,ActingC1,ActingC2,ActingC3] = CheckDC(C2,systems,civilizations,DestroyedCivilizations,Round,wars,communications,ActingC1,ActingC2,ActingC3)
            if CheckRelation(C1,C2,wars)~=0
                wars(CheckRelation(C1,C2,wars),13)=C1
            end
        else
            civilizations(find(civilizations(:,1)==C1),14)=civilizations(find(civilizations(:,1)==C1),14)-d
            systems(find(systems(:,1)==S1),6)=1.1*systems(find(systems(:,1)==S1),6)
            systems(find(systems(:,1)==S2),6)=1.1*systems(find(systems(:,1)==S2),6)
            if CheckRelation(C1,C2,wars)~=0
                wars(CheckRelation(C1,C2,wars),13)=C2
            end
        end
    end
end