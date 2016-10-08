function [civilizations,systems,wars,communications,DestroyedSystems,DestroyedCivilizations,CombinedCivilizations,answer]=ActingRound(civilizations,systems,wars,communications,DestroyedSystems,DestroyedCivilizations,Round,OTCN,CombinedCivilizations)
[TSN,att]=size(systems)
[TCN,att]=size(civilizations)
NUMBER=systems(:,1)
X=systems(:,2)
Y=systems(:,3)
RS=systems(:,4)
O=systems(:,5)
systems(:,6)=systems(:,6).*(tansig(2*rand(TSN,1)-1)/20+1)
EC=systems(:,6)
systems(:,7)=tansig(systems(:,6))
systems(find(systems(:,8)),7)=1
E=systems(:,7)
systems(:,8)=0
TG=systems(:,8)

NM=civilizations(:,1)
TP=civilizations(:,2)
Malthus=find(civilizations(:,13)<1)
Normal=find(civilizations(:,13)>=1)
if ~isempty(Malthus)
    civilizations(Malthus,3)=civilizations(Malthus,3).*(1-exp(-abs(civilizations(Malthus,4))*log(10)))
    civilizations(Malthus,7)=civilizations(Malthus,7).*(1-exp(-abs(civilizations(Malthus,8))*log(10)))
end
if ~isempty(Normal)
    civilizations(Normal,3)=civilizations(Normal,3).*(1+exp(civilizations(Normal,4)*log(10)))
    civilizations(Normal,7)=civilizations(Normal,7).*(1+exp(civilizations(Normal,8)*log(10)))
end
ND=civilizations(:,3)
T=civilizations(:,7)
NIC=2*rand(TCN,1)-1
civilizations(:,4)=NIC
SN=[]
SR=[]
for ci=1:OTCN
    civil=find(civilizations(:,1)==ci)
    if civil~=0
        sn=length(find(systems(:,5)==civilizations(civil,1)))
        sr=sum(RS(find(systems(:,5)==civilizations(civil,1))))
        SN=[SN,sn]
        SR=[SR,sr]
    end
end
clear tcn
clear sn
clear sr
SN=SN'
SR=SR'
civilizations(:,5)=SN
civilizations(:,6)=SR
TRC=5*rand(TCN,1)-4
civilizations(:,8)=TRC
PL=civilizations(:,9)
PLupdate=find((civilizations(:,10)-rand(TCN,1))>0)
PL(PLupdate)=PL(PLupdate)+1
civilizations(:,9)=PL
civilizations(:,10)=logsig(10*(log(civilizations(:,7))-PL-0.5))
RC=10*atan((log(T).*PL)/100)+0.6
RC(find(RC<0.1))=0.1
civilizations(:,11)=RC
TR=SR.*RC
civilizations(:,12)=TR
RA=TR./ND
civilizations(:,13)=RA
RR=TR-ND
civilizations(:,14)=RR
V=2*log(T+1)
civilizations(:,15)=V
ER=PL
civilizations(:,16)=ER
CR=1.2*PL
civilizations(:,17)=CR
A=T.*PL
civilizations(:,18)=A
D=1.1*A
civilizations(:,19)=D
DS=2*T.*PL-2.2026e+05
civilizations(:,20)=DS
civilizations(:,21)=TP
civilizations(find(RA<=1.2),21)=3
civilizations(find(~TP),21)=0
AT=civilizations(:,21)

ActingC=civilizations(find(civilizations(:,14)>0),:)
ActingC1=ActingC(find(ActingC(:,21)==1),:)
ActingC2=ActingC(find(ActingC(:,21)==2),:)
ActingC3=ActingC(find(ActingC(:,21)==3),:)
[civilizations,systems,wars,communications,CombinedCivilizations,ActingC1,ActingC2,ActingC3]=ActingCommunication(civilizations,systems,wars,communications,CombinedCivilizations,Round,OTCN,ActingC1,ActingC2,ActingC3)
[civilizations,systems,wars,communications,DestroyedSystems,DestroyedCivilizations,ActingC1,ActingC2,ActingC3]=ActingWar(civilizations,systems,wars,communications,DestroyedSystems,DestroyedCivilizations,Round,OTCN,ActingC1,ActingC2,ActingC3)
while ~isempty(ActingC1)
    C1=ActingC1(1,1)
    [systems,civilizations,DestroyedSystems,DestroyedCivilizations,wars,communications,ActingC1,ActingC2,ActingC3]=Type1Action(C1,civilizations,systems,wars,communications,DestroyedSystems,DestroyedCivilizations,Round,OTCN,ActingC1,ActingC2,ActingC3)
    ActingC1(1,:)=[]
end
while ~isempty(ActingC2)
    C1=ActingC2(1,1)
    [systems,civilizations,DestroyedSystems,DestroyedCivilizations,wars,communications,ActingC1,ActingC2,ActingC3]=Type2Action(C1,civilizations,systems,wars,communications,DestroyedSystems,DestroyedCivilizations,Round,OTCN,ActingC1,ActingC2,ActingC3)
    ActingC2(1,:)=[]
end
while ~isempty(ActingC3)
    C1=ActingC3(1,1)
    [systems,civilizations,DestroyedSystems,DestroyedCivilizations,wars,communications,ActingC1,ActingC2,ActingC3]=Type3Action(C1,civilizations,systems,wars,communications,DestroyedSystems,DestroyedCivilizations,Round,OTCN,ActingC1,ActingC2,ActingC3)
    ActingC3(1,:)=[]
end

[TCN,att]=size(civilizations)
SN=[]
SR=[]
for ci=1:OTCN
    civil=find(civilizations(:,1)==ci)
    if civil~=0
        sn=length(find(systems(:,5)==civilizations(civil,1)))
        sr=sum(RS(find(systems(:,5)==civilizations(civil,1))))
        SN=[SN,sn]
        SR=[SR,sr]
    end
end
clear tcn
clear sn
clear sr
SN=SN'
SR=SR'
civilizations(:,5)=SN
civilizations(:,6)=SR
civilizations(:,12)=civilizations(:,6).*civilizations(:,11)
civilizations(:,13)=civilizations(:,12)./civilizations(:,3)
civilizations(:,14)=civilizations(:,12)-civilizations(:,3)

outputfile(civilizations,systems,wars,communications,DestroyedSystems,DestroyedCivilizations,CombinedCivilizations,Round)

disp(sprintf('Round %d is over. 第%d轮游戏结束。',Round,Round))
command = 'Next round? [0] Save Game. [1] 按“0”进行下一回合。按“1”存储宇宙。';
answer = input(command,'s')
while and(~isequal(answer, '0'),~isequal(answer, '1'))
    command = 'Are you kidding Great Doge? Doge said it should be "0" or "1"! 你在逗伟大的造物主单身狗玩吗？单身狗说要按“0”进行下一回合或“1”储存游戏！';
    answer = input(command,'s')
end
while isequal(answer, '1')
    command = ['Input the file name you want to save: 输入要存储的游戏：']
    savegame = input(command,'s')
    filename=[savegame,'.mat']
    save(filename)
    command = 'Next round? [0] Save Game. [1] 按“0”进行下一回合。按“1”存储宇宙。';
    answer = input(command,'s')
    while and(~isequal(answer, '0'),~isequal(answer, '1'))
        command = 'Are you kidding Great Doge? Doge said it should be "0" or "1"! 你在逗伟大的造物主单身狗玩吗？单身狗说要按“0”进行下一回合或“1”储存游戏！';
        answer = input(command,'s')
    end
end
