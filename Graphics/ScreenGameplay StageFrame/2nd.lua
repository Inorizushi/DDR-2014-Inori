local t = Def.ActorFrame{};
t[#t+1] = Def.Sprite{
  InitCommand=cmd(pause;y,-10;queuecommand,"Set");
  SetCommand=function(self)
  self:Load(THEME:GetPathG("","ScreenGameplay StageFrame/Stages 1x9"));
    local GetStage = GAMESTATE:GetCurrentStage();
    if GetStage == 'Stage_1st' then
      self:setstate(0);
    elseif GetStage == 'Stage_2nd' then
      self:setstate(1);
    elseif GetStage == 'Stage_3rd' then
      self:setstate(2);
    elseif GetStage == 'Stage_4th' then
      self:setstate(3);
    elseif GetStage == 'Stage_5th' then
      self:setstate(4);
    elseif GetStage == 'Stage_Final' then
      self:setstate(5);
    elseif GetStage == 'Stage_Extra1' then
      self:setstate(6);
    elseif GetStage == 'Stage_Extra2' then
      self:setstate(7);
    elseif GetStage == 'Stage_Event' then
      self:setstate(8);
    else
      self:visible(false)
    end;
  end;
};
t[#t+1] = LoadActor("2ndStage.png")..{
  InitCommand=cmd(y,15);
}
return t
