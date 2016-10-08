function outputfile(civilizations,systems,wars,communications,DestroyedSystems,DestroyedCivilizations,CombinedCivilizations,Round)
SYSTEMS={'Number 编号','x','y','Resource 资源','Owner 所有者','Evident Coefficient 瞩目系数','Evident 瞩目度','Target	标记'}
CIVILIZATIONS={'Name 名称','Type 类型','Need 需求','Need Increasing Coefficient 需求增长系数','Systems Number 星系数量','System Resource 星系资源','Technique 科技','Technique Revolution Coefficient 技术革命系数','Physics Level 物理等级','Technique Break 技术突破','Resource Coefficient 资源系数','Total Resource 资源总量','Resource Adequacy 资源充裕度','Remaining Resource 剩余资源','View 视野','Expansion Range 扩张范围','Communication Range 交流范围','Attack 攻击','Defence 防御','Destroy 毁灭','Acting Type 行动类型'}
COMMUNICATIONS={'Civilization 1 文明1','Civilization 2 文明2','Distance 距离','Technique 1 科技1','Technique 2 科技2','Communication Range 1 交流范围1','Communication Range 2 交流范围2','Communication Progress 交流进展','Completeness of Communication 交流完成度'}
WARS={'Civilization 1 文明1','Civilization 2 文明2','Distance 距离','System 1 星系1','System 2 星系2','Start Time 开战时间','Attack 1 攻击1','Defence 1 防御1','Destroy 1 毁灭1','Attack 2 攻击2','Defence 2 防御2','Destroy 2 毁灭2','Winning Side 胜方'}
DC={'Destroyed Civilization 被毁灭文明','Type 类型','Need 需求','Technique 科技','Physics Level 物理等级','Resource Coefficient 资源系数','View 视野','Expansion Range 扩张范围','Communication Range 交流范围','Attack 攻击','Defence 防御','Destroy 毁灭','Destroyed Time 被毁灭时间'}
DS={'Destroyed Number 被毁灭星系','x x坐标','y y坐标','Resource 资源','Owner 所有者','Evident 瞩目度','Destroyed Time 被毁灭时间'}
CC={'Civilization 被合并文明','Type 类型','Need 需求','Technique 科技','Physics Level 物理等级','Resource Coefficient 资源系数','View 视野','Expansion Range 扩张范围','Communication Range 交流范围','Attack 攻击','Defence 防御','Destroy 毁灭','Combined Time 合并时间','New Civilization 新文明'}

excelname=strcat('Universe_Round_',num2str(Round),'.xlsx')
xlswrite(excelname, SYSTEMS, 'Systems', 'A1');
xlswrite(excelname,CIVILIZATIONS , 'Civilizations', 'A1'); 
xlswrite(excelname,COMMUNICATIONS , 'Communications', 'A1'); 
xlswrite(excelname,WARS , 'Wars', 'A1');
xlswrite(excelname,DC , 'Destroyed Civilizations', 'A1');
xlswrite(excelname,DS , 'Destroyed Systems', 'A1');
xlswrite(excelname,CC , 'Combined Civilizations', 'A1');
if ~isempty(systems)
    xlswrite(excelname, systems, 'Systems', 'A2'); 
end
if ~isempty(civilizations)
    xlswrite(excelname,civilizations , 'Civilizations', 'A2'); 
end
if ~isempty(communications)
    xlswrite(excelname,communications , 'Communications', 'A2'); 
end
if ~isempty(wars)
    xlswrite(excelname,wars , 'Wars', 'A2');
end
if ~isempty(DestroyedCivilizations)
    xlswrite(excelname,DestroyedCivilizations , 'Destroyed Civilizations', 'A2');
end
if ~isempty(DestroyedSystems)
    xlswrite(excelname,DestroyedSystems , 'Destroyed Systems', 'A2');
end
if ~isempty(CombinedCivilizations)
    xlswrite(excelname,CombinedCivilizations , 'Combined Civilizations', 'A2');
end