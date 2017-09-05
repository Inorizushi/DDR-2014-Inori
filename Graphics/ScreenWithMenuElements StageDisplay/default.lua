local StageDisplay = Def.ActorFrame{
	BeginCommand=cmd(playcommand,"Set";);
	CurrentSongChangedMessageCommand=cmd(finishtweening;playcommand,"Set";);
};

local StageIndex = {
	Stage_1st		= 0,
	Stage_2nd		= 1,
	Stage_3rd		= 2,
	Stage_4th		= 3,
	Stage_Final	= 4,
	Stage_Extra1	= 5,
	Stage_Extra2	= 6,
}

for s in ivalues(Stage) do

if not PREFSMAN:GetPreference("EventMode") then
	StageDisplay[#StageDisplay+1] = Def.Sprite{
		Texture = "Stage 1x7.png";
		SetCommand=function(self, params)
			local Stage = GAMESTATE:GetCurrentStage();
			local StageIndex = GAMESTATE:GetCurrentStageIndex();
			local screen = SCREENMAN:GetTopScreen();
			if screen and screen.GetStageStats then
				local ss = screen:GetStageStats();
				Stage = ss:GetStage();
				StageIndex = ss:GetStageIndex();
			end
			self:pause()
			if Stage == 'Stage_Final' then
				self:setstate(4);
			elseif Stage == 'Stage_Extra1' then
				self:setstate(5);
			elseif Stage == 'Stage_Extra2' then
				self:setstate(6);
			else
				self:setstate(StageIndex);
			end;
			self:visible( Stage == s );
		end;
	};
end;

end;

return StageDisplay;
