function [systems,civilizations,wars,communications,DestroyedCivilizations,ActingC1,ActingC2,ActingC3]=search(S1,C1,systems,civilizations,wars,communications,Round,DestroyedCivilizations,ActingC1,ActingC2,ActingC3)
[d,S2]=DC2S(S1,C1,systems)
if and(d<=civilizations(find(civilizations(:,1)==C1),14),1.1*d<=civilizations(find(civilizations(:,1)==C1),16))
    C2=systems(find(systems(:,1)==S1),5)
    if C2==0
        systems(find(systems(:,1)==S1),5)=C1
        civilizations(find(civilizations(:,1)==C1),14)=civilizations(find(civilizations(:,1)==C1),14)-1.1*d
        systems(find(systems(:,1)==S1),6)=1.1*systems(find(systems(:,1)==S1),6)
        systems(find(systems(:,1)==S2),6)=1.1*systems(find(systems(:,1)==S2),6)
    elseif or(civilizations(find(civilizations(:,1)==C2),21)==2,civilizations(find(civilizations(:,1)==C2),21)==3)
        [wars,communications] = Add2war(C1,C2,civilizations,Round,wars,communications,systems)
        if civilizations(find(civilizations(:,1)==C1),18)>civilizations(find(civilizations(:,1)==systems(find(systems(:,1)==S1),5)),19)
            systems(find(systems(:,1)==S1),5)=C1
            civilizations(find(civilizations(:,1)==C1),14)=civilizations(find(civilizations(:,1)==C1),14)-1.1*d
            systems(find(systems(:,1)==S1),6)=1.1*systems(find(systems(:,1)==S1),6)
            systems(find(systems(:,1)==S2),6)=1.1*systems(find(systems(:,1)==S2),6)
            [civilizations,DestroyedCivilizations,wars,communications,systems,ActingC1,ActingC2,ActingC3] = CheckDC(C2,systems,civilizations,DestroyedCivilizations,Round,wars,communications,ActingC1,ActingC2,ActingC3)
            if CheckRelation(C1,C2,wars)~=0
                wars(CheckRelation(C1,C2,wars),13)=C1
            end
        else
            civilizations(find(civilizations(:,1)==C1),14)=civilizations(find(civilizations(:,1)==C1),14)-1.1*d
            systems(find(systems(:,1)==S1),6)=1.1*systems(find(systems(:,1)==S1),6)
            systems(find(systems(:,1)==S2),6)=1.1*systems(find(systems(:,1)==S2),6)
            if CheckRelation(C1,C2,wars)~=0
                wars(CheckRelation(C1,C2,wars),13)=C2
            end
        end
    else
        [communications] = Add2known(C1,C2,civilizations,communications,systems)
        civilizations(find(civilizations(:,1)==C1),14)=civilizations(find(civilizations(:,1)==C1),14)-0.1*d
        systems(find(systems(:,1)==S1),6)=1.1*systems(find(systems(:,1)==S1),6)
        systems(find(systems(:,1)==S2),6)=1.1*systems(find(systems(:,1)==S2),6)
    end
end