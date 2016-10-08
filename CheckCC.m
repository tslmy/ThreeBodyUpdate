function [civilizations,CombinedCivilizations,wars,communications,systems,ActingC1,ActingC2,ActingC3] = CheckCC(C1,C2,systems,civilizations,CombinedCivilizations,Round,wars,communications,ActingC1,ActingC2,ActingC3)
dc(1,1)=C1
dc(1,2)=civilizations(find(civilizations(:,1)==C1),2)
dc(1,3)=civilizations(find(civilizations(:,1)==C1),3)
dc(1,4)=civilizations(find(civilizations(:,1)==C1),7)
dc(1,5)=civilizations(find(civilizations(:,1)==C1),9)
dc(1,6)=civilizations(find(civilizations(:,1)==C1),11)
dc(1,7)=civilizations(find(civilizations(:,1)==C1),15)
dc(1,8)=civilizations(find(civilizations(:,1)==C1),16)
dc(1,9)=civilizations(find(civilizations(:,1)==C1),17)
dc(1,10)=civilizations(find(civilizations(:,1)==C1),18)
dc(1,11)=civilizations(find(civilizations(:,1)==C1),19)
dc(1,12)=civilizations(find(civilizations(:,1)==C1),20)
dc(1,13)=Round
dc(1,14)=C2
CombinedCivilizations=[CombinedCivilizations;dc]

systems(find(systems(:,5)==C1),5)=C2
civilizations(find(civilizations(:,1)==C2),3)=civilizations(find(civilizations(:,1)==C2),3)+civilizations(find(civilizations(:,1)==C1),3)
civilizations(find(civilizations(:,1)==C2),5)=civilizations(find(civilizations(:,1)==C2),5)+civilizations(find(civilizations(:,1)==C1),5)
civilizations(find(civilizations(:,1)==C2),6)=civilizations(find(civilizations(:,1)==C2),6)+civilizations(find(civilizations(:,1)==C1),6)
civilizations(find(civilizations(:,1)==C2),7)=civilizations(find(civilizations(:,1)==C2),7)+(civilizations(find(civilizations(:,1)==C1),7).^2)./civilizations(find(civilizations(:,1)==C2),7)
civilizations(find(civilizations(:,1)==C2),9)=max(civilizations(find(civilizations(:,1)==C2),9),civilizations(find(civilizations(:,1)==C1),9))
civilizations(find(civilizations(:,1)==C2),10)=logsig(log(civilizations(find(civilizations(:,1)==C2),7))-civilizations(find(civilizations(:,1)==C2),9))
civilizations(find(civilizations(:,1)==C2),11)=10*atan((log(civilizations(find(civilizations(:,1)==C2),7)).*civilizations(find(civilizations(:,1)==C2),9))/100)+0.6
if civilizations(find(civilizations(:,1)==C2),11)<0.01
    civilizations(find(civilizations(:,1)==C2),11)=0.01
end
civilizations(find(civilizations(:,1)==C2),12)=civilizations(find(civilizations(:,1)==C2),11).*civilizations(find(civilizations(:,1)==C2),6)
civilizations(find(civilizations(:,1)==C2),13)=civilizations(find(civilizations(:,1)==C2),12)./civilizations(find(civilizations(:,1)==C2),3)
civilizations(find(civilizations(:,1)==C2),14)=civilizations(find(civilizations(:,1)==C2),12)-civilizations(find(civilizations(:,1)==C2),3)
civilizations(find(civilizations(:,1)==C2),15)=2*log(civilizations(find(civilizations(:,1)==C2),7)+1)
civilizations(find(civilizations(:,1)==C2),16)=civilizations(find(civilizations(:,1)==C2),9)
civilizations(find(civilizations(:,1)==C2),17)=1.2*civilizations(find(civilizations(:,1)==C2),9)
civilizations(find(civilizations(:,1)==C2),18)=(10*log(civilizations(find(civilizations(:,1)==C2),7)+1)).^(civilizations(find(civilizations(:,1)==C2),9).^0.5)
civilizations(find(civilizations(:,1)==C2),19)=1.1*civilizations(find(civilizations(:,1)==C2),18)
civilizations(find(civilizations(:,1)==C2),20)=civilizations(find(civilizations(:,1)==C2),7).*civilizations(find(civilizations(:,1)==C2),9)

civilizations(find(civilizations(:,1)==C1),:)=[]
if ~isempty(wars)
    wars(find(wars(:,1)==C1),:)=[]
    wars(find(wars(:,2)==C1),:)=[]
end
if ~isempty(communications)
    communications(find(communications(:,1)==C1),:)=[]
    communications(find(communications(:,2)==C1),:)=[]
end
if ~isempty(ActingC1)
    ActingC1(find(ActingC1(:,1)==C1),:)=[]
end
if ~isempty(ActingC2)
    ActingC2(find(ActingC2(:,1)==C1),:)=[]
    end
if ~isempty(ActingC3)
    ActingC3(find(ActingC3(:,1)==C1),:)=[]
end
