local screenName = Var "LoadingScreen"
local lang = "us";
if THEME:GetCurLanguage() == "ja" then
	lang = "jp";
end;

--Base Anchoring
local t = Def.ActorFrame{
	LoadActor("base")..{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X)
		end;
	};
}

--Text Anchoring
t[#t+1] = Def.Sprite{
  Texture = "us_Results 1x8.png";
	InitCommand=function(self)
		self:x(SCREEN_CENTER_X):pause():queuecommand("Set")
	end;
  SetCommand=function(self)
    if not screenName == "ScreenEvaluationSummary" or not screenName == "ScreenEvaluationNormal" then
      self:Load(THEME:GetPathG("","ScreenEvaluation header/"..lang.."_Results.png"));
    else
      self:Load(THEME:GetPathG("","ScreenEvaluation header/"..lang.."_Results 1x8.png"));
			local screen = SCREENMAN:GetTopScreen();
			local ss = screen:GetStageStats();
			local GetStage = ss:GetStage();
		   if GetStage == 'Stage_1st' then
		     self:setstate(0);
		   elseif GetStage == 'Stage_2nd' then
		     self:setstate(1);
		   elseif GetStage == 'Stage_3rd' then
		     self:setstate(2);
		   elseif GetStage == 'Stage_4th' then
		     self:setstate(3);
		   elseif GetStage == 'Stage_Final' then
		     self:setstate(4);
		   elseif GetStage == 'Stage_Extra1' then
		     self:setstate(5);
		   elseif GetStage == 'Stage_Extra2' then
		     self:setstate(7);
		   elseif screenName == "ScreenEvaluationSummary" then
		     self:setstate(6);
		   else
		     self:visible(false)
		   end;
    end;
  end;
};

return t;
