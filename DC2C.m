function [d,c1,c2] = DC2C(C1,C2,systems)
S1=find(systems(:,5)==C1)
s2=find(systems(:,5)==C2)
if and(~isempty(S1),~isempty(s2))
    for cci=1:length(S1)
        s1=S1(cci)
        d=sqrt((systems(s1,2)-systems(s2,2)).^2+(systems(s1,3)-systems(s2,3)).^2)
        D(cci,:)=d
    end
    d=min(min(D))
    [c1,c2]=find(D==d)
    c1=systems(S1(c1),1)
    c2=systems(s2(c2),1)
end