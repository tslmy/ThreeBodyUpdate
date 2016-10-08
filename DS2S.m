function d = DS2S(S1,S2,S)
s1=find(S(:,1)==S1)
s2=find(S(:,1)==S2)
d=sqrt((S(s1,2)-S(s2,2))^2+(S(s1,3)-S(s2,3))^2)