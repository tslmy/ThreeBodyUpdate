function [answer]=LoadGame(answer)
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