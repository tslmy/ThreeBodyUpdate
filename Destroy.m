function [systems,civilizations,DestroyedSystems,DestroyedCivilizations,wars,communications,ActingC1,ActingC2,ActingC3] = Destroy(S1,C1,systems,civilizations,DestroyedSystems,DestroyedCivilizations,Round,wars,communications,ActingC1,ActingC2,ActingC3)
[d]=DC2S(S1,C1,systems)
if civilizations(find(civilizations(:,1)==C1),20)>civilizations(find(civilizations(:,1)==C1),18)
    C2=systems(find(systems(:,1)==S1),5)
    if C2==0
        [DestroyedSystems, systems]=CheckDS(S1, DestroyedSystems, systems, Round)
    elseif civilizations(find(civilizations(:,1)==C1),20)>civilizations(find(civilizations(:,1)==C2),19)
        [DestroyedSystems, systems]=CheckDS(S1, DestroyedSystems, systems, Round)
        [civilizations,DestroyedCivilizations,wars,communications,systems,ActingC1,ActingC2,ActingC3] = CheckDC(C2,systems,civilizations,DestroyedCivilizations,Round,wars,communications,ActingC1,ActingC2,ActingC3)
        if CheckRelation(C1,C2,wars)~=0
            wars(CheckRelation(C1,C2,wars),13)=C1
        end
    elseif civilizations(find(civilizations(:,1)==C1),20)<civilizations(find(civilizations(:,1)==C2),19)
        if CheckRelation(C1,C2,wars)~=0
            wars(CheckRelation(C1,C2,wars),13)=C2
        end
    end
end

