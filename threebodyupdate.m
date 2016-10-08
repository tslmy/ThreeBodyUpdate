clc
clear
command = ['What do you want to do? 你要做什么？',char(13,10)','[N] New Universe 新的宇宙',char(13,10)','[L] Load Universe 新的宇宙',char(13,10)','You will: 你将要：']
answer = input(command,'s')
while and(~isequal(answer, 'N'),~isequal(answer, 'L'))
    clear command
    clear answer
    command = ['What do you want to do? 你要做什么？',char(13,10)','[N] New Universe 新的宇宙',char(13,10)','[L] Load Universe 新的宇宙',char(13,10)','You will: 你将要：']
    answer = input(command,'s')
    while isequal(answer, 'L')
        command = ['Input the file name you want to load: 输入要读取的游戏：']
        savegame = input(command,'s')
        filename=[savegame,'.mat']
        load(filename)
        command = 'Next round? [0] 按“0”进行下一回合。';
        answer = input(command,'s')
        while ~isequal(answer, '0')
            command = 'Are you kidding Great Doge? Doge said it should be "0"! 你在逗伟大的造物主单身狗玩吗？单身狗说要按“0”进行下一回合！';
            answer = input(command,'s')
        end
        while isequal(answer, '0')
            Round=Round+1
            [civilizations,systems,wars,communications,DestroyedSystems,DestroyedCivilizations,CombinedCivilizations,answer]=ActingRound(civilizations,systems,wars,communications,DestroyedSystems,DestroyedCivilizations,Round,OTCN,CombinedCivilizations)
        end
    end
end
while isequal(answer, 'L')
    command = ['Input the file name you want to load: 输入要读取的游戏：']
    savegame = input(command,'s')
    filename=[savegame,'.mat']
    load(filename)
    command = 'Next round? [0] 按“0”进行下一回合。';
    answer = input(command,'s')
    while ~isequal(answer, '0')
        command = 'Are you kidding Great Doge? Doge said it should be "0"! 你在逗伟大的造物主单身狗玩吗？单身狗说要按“0”进行下一回合！';
        answer = input(command,'s')
    end
    while isequal(answer, '0')
        Round=Round+1
        [civilizations,systems,wars,communications,DestroyedSystems,DestroyedCivilizations,CombinedCivilizations,answer]=ActingRound(civilizations,systems,wars,communications,DestroyedSystems,DestroyedCivilizations,Round,OTCN,CombinedCivilizations)
    end
end
while isequal(answer, 'N')
    Round=1
    r=input('Radius 宇宙半径=');
    TSN=input('Total Systems Number 星系总量=');
    TCN=input('Total Civilizations Number 文明总量=');
    while TSN<TCN
        disp('Total Civilizations Number cannot be larger than Total Systems Number. 文明总量不能大于星系总量。')
        TSN=input('Total Systems Number 星系总量=');
        TCN=input('Total Civilizations Number 文明总量=');
    end
    disp('Universe parameters setting is completed. 宇宙参数设置完成。')
    disp(sprintf('Radius 宇宙半径= %d',r))
    disp(sprintf('Total Systems Number 星系总量= %d',TSN))
    disp(sprintf('Total Civilizations Number 文明总量= %d',TCN))
    command = 'Do you want to change the setting? [Y/N] 是否更改设置？按“Y”选择是，按“N”选择否。';
    answer = input(command,'s')
    while isequal(answer, 'Y')
        r=input('Radius 宇宙半径=');
        TSN=input('Total Systems Number 星系总量=');
        TCN=input('Total Civilizations Number 文明总量=');
        while TSN<TCN
            disp('Total Civilizations Number cannot be larger than Total Systems Number. 文明总量不能大于星系总量。')
            TSN=input('Total Systems Number 星系总量=');
            TCN=input('Total Civilizations Number 文明总量=');
        end
        disp('Universe parameters setting is completed. 宇宙参数设置完成。')
        disp(sprintf('Radius 宇宙半径= %d',r))
        disp(sprintf('Total Systems Number 星系总量= %d',TSN))
        disp(sprintf('Total Civilizations Number 文明总量= %d',TCN))
        command = 'Do you want to change the setting? [Y/N] 是否更改设置？按“Y”选择是，按“N”选择否。';
        answer = input(command,'s')
    end

    while and(~isequal(answer, 'N'),~isequal(answer, 'Y'))
        clear command
        clear answer
        command = 'You need to press "Y" or "N" to change the setting. [Y/N] 你应当按Y或N进行设置。按“Y”选择是，按“N”选择否。';
        answer = input(command,'s')
        while isequal(answer, 'Y')
            r=input('Radius 宇宙半径=');
            TSN=input('Total Systems Number 星系总量=');
            TCN=input('Total Civilizations Number 文明总量=');
            while TSN<TCN
                disp('Total Civilizations Number cannot be larger than Total Systems Number. 文明总量不能大于星系总量。')
                TSN=input('Total Systems Number 星系总量=');
                TCN=input('Total Civilizations Number 文明总量=');
            end
            disp('Universe parameters setting is completed. 宇宙参数设置完成。')
            disp(sprintf('Radius 宇宙半径= %d',r))
            disp(sprintf('Total Systems Number 星系总量= %d',TSN))
            disp(sprintf('Total Civilizations Number 文明总量= %d',TCN))
            command = 'Do you want to change the setting? [Y/N] 是否更改设置？按“Y”选择是，按“N”选择否。';
            answer = input(command,'s')
        end
    end

    clear command
    clear answer

    OTCN=TCN+1
    DestroyedSystems=[]
    DestroyedCivilizations=[]
    CombinedCivilizations=[]
    wars=[]
    communications=[]
    systems=zeros(TSN,10)
    NUMBER=(1:TSN)
    systems(:,1)=NUMBER
    systems(:,4)=r*rand(TSN,1)
    systems(:,5)=2*pi*rand(TSN,1)
    X=systems(:,4).*cos(systems(:,5))
    systems(:,2)=X
    Y=systems(:,4).*sin(systems(:,5))
    systems(:,3)=Y
    RS=10*rand(TSN,1)
    systems(:,6)=RS
    systems(1:TCN,7)=(1:TCN)
    O=systems(:,7)
    EC=zeros(TSN,1)+0.1
    systems(:,8)=EC
    E=tansig(EC)
    systems(:,9)=EC
    TG=systems(:,10)

    systems(:,4:5)=[]

    civilizations=zeros(TCN,21)
    NM=(1:TCN)
    civilizations(:,1)=NM
    TP=randi([1,3],TCN,1)
    civilizations(:,2)=TP
    ND=10*rand(TCN,1)
    civilizations(:,3)=ND
    NIC=2*rand(TCN,1)-2
    civilizations(:,4)=NIC
    SN=[]
    SR=[]
    for tcn=1:TCN
        sn=length(find(O==NM(tcn)))
        sr=sum(RS(find(O==NM(tcn))))
        SN=[SN,sn]
        SR=[SR,sr]
    end
    clear tcn
    clear sn
    clear sr
    SN=SN'
    SR=SR'
    civilizations(:,5)=SN
    civilizations(:,6)=SR
    PL=randi([1,10],TCN,1)
    civilizations(:,9)=PL
    T=(rand(TCN,1)+0.5).*exp(PL)
    civilizations(:,7)=T
    TRC=5*rand(TCN,1)-4
    civilizations(:,8)=TRC
    TB=logsig(10*(log(civilizations(:,7))-PL-0.5))
    civilizations(:,10)=TB
    RC=10*atan((log(T).*PL)/100)+0.6
    RC(find(RC<0.01))=0.01
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

    outputfile(civilizations,systems,wars,communications,DestroyedSystems,DestroyedCivilizations,CombinedCivilizations,Round)

    disp('In the beginning Programming Doge created the universe. 起初编程单身狗创造宇宙。')
    disp('And the Program of Doge moved upon the systems of the universe. 单身狗的程序运行在诸星之上。')
    disp('And Doge said, Let there be civilizations: and there were civilizations. 单身狗说，要有文明，就有了文明。')
    disp('And Doge saw the civilizations, that they were crappy fakes: and Doge divided the crappy fakes from other crappy fakes. The first round. 单身狗看文明就是一堆辣鸡，就把一堆堆辣鸡分开。这是第一个回合。')
    disp('In Doge they (the people of civilizations) trust. RAmen! 他们（文明的人民）信仰单身狗。拉门！')

    command = 'Next round? [0] Save Game. [1] 按“0”进行下一回合。按“1”存储宇宙。';
    answer = input(command,'s')

    while and(~isequal(answer, '0'),~isequal(answer, '1'))
        command = 'Are you kidding Great Doge? Doge said it should be "0" or "1"! 你在逗伟大的造物主单身狗玩吗？单身狗说要按“0”进行下一回合或“1”储存游戏！';
        answer = input(command,'s')
    end
    while isequal(answer, '0')
        Round=Round+1
        [civilizations,systems,wars,communications,DestroyedSystems,DestroyedCivilizations,CombinedCivilizations,answer]=ActingRound(civilizations,systems,wars,communications,DestroyedSystems,DestroyedCivilizations,Round,OTCN,CombinedCivilizations)
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
        while isequal(answer, '0')
            Round=Round+1
            [civilizations,systems,wars,communications,DestroyedSystems,DestroyedCivilizations,CombinedCivilizations,answer]=ActingRound(civilizations,systems,wars,communications,DestroyedSystems,DestroyedCivilizations,Round,OTCN,CombinedCivilizations)
        end
    end
end