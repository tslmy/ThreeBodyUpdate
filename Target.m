function [systems,civilizations]=Target(S1,C1,systems,civilizations)
[d,c1] = DC2S(S1,C1,systems)
if 0.2*civilizations(find(civilizations(:,1)==C1),17)<=civilizations(find(civilizations(:,1)==C1),14)
    civilizations(find(civilizations(:,1)==C1),14)=civilizations(find(civilizations(:,1)==C1),14)-0.2*civilizations(find(civilizations(:,1)==C1),17)
    systems(find(civilizations(:,1)==S1),8)=1
    systems(find(civilizations(:,1)==c1),6)=systems(find(civilizations(:,1)==c1),6)*2
end