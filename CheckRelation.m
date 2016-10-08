function [CRL]=CheckRelation(C1,C2,A)
if ~isempty(A)
    posibleC2=find(A(:,1)==C1)
    CRL1=posibleC2(find(A(posibleC2,2)==C2))
    if isempty(CRL1)
        CRL1=0
    end
    posibleC1=find(A(:,1)==C2)
    CRL2=posibleC1(find(A(posibleC1,2)==C1))
    if isempty(CRL2)
        CRL2=0
    end
    CRL=CRL1+CRL2
else
    CRL=0
end