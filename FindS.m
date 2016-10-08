function [SIV] = FindS(C1,systems,civilizations,wars,communications,OTCN)
S1=find(systems(:,5)==C1)
Xmax=max(systems(S1,2))
Xmin=min(systems(S1,2))
Ymax=max(systems(S1,3))
Ymin=min(systems(S1,3))
v=civilizations(find(civilizations(:,1)==C1),15)
ViewXmax=Xmax+v
ViewYmax=Ymax+v
ViewXmin=Xmin-v
ViewYmin=Ymin-v
s2=find(and(and(and(systems(:,2)<ViewXmax,systems(:,3)<ViewYmax),and(systems(:,2)>ViewXmin,systems(:,3)>ViewYmin)),systems(:,5)~=C1))
if length(S1)>1
    for fsi=1:length(S1)
        s1=S1(fsi)
        d=sqrt((systems(s1,2)-systems(s2,2)).^2+(systems(s1,3)-systems(s2,3)).^2)
        D(:,fsi)=d
    end
    [d,I]=min(D')
    In=find(d<v)
    I=I(In)
    D=D(In,:)
    s2=s2(In)
    d=d(In)
    SIV=[systems(s2,1:7),d',systems(S1(I),1)]
else
    d=sqrt((systems(S1,2)-systems(s2,2)).^2+(systems(S1,3)-systems(s2,3)).^2)
    In=find(d<v)
    s2=s2(In)
    d=d(In)
    OriginS=zeros(length(In),1)+systems(S1,1)
    SIV=[systems(s2,1:7),d,OriginS]
end
unknown=find(SIV(:,8)/v>SIV(:,7))
SIV(unknown,4:5)=0
known=find(SIV(:,8)/v<=SIV(:,7))
for j=1:length(known)
    C2=SIV(known(j),5)
    if CheckRelation(C1,C2,wars)*CheckRelation(C1,C2,communications)==0
        SIV(known(j),5)=OTCN
    end
end
SIV=sortrows(SIV,8)