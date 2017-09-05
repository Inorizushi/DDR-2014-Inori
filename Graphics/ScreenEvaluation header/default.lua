local StageIndex
local screenName = Var "LoadingScreen"
local lang = "us";
if THEME:GetCurLanguage() == "ja" then
	lang = "jp";
end;

local GetStage  = GAMESTATE:GetCurrentStage();

--this should probably be a metric
if GetStage  == "Stage_1st" then
    StageIndex = 0
elseif GetStage  == "Stage_2nd" then
  StageIndex = 1
elseif GetStage  == "Stage_3rd" then
  StageIndex = 2
elseif GetStage  == "Stage_4th" then
  StageIndex = 3
elseif GetStage  == "Stage_Final" then
  StageIndex = 4
elseif GetStage  == "Stage_Extra1" then
  StageIndex = 5
elseif GetStage  == "Stage_Extra1" then
  StageIndex = 7
elseif screenName == "ScreenEvaluationSummary" then
  StageIndex = 6
else
  StageIndex = 0
end

--Base Anchoring
local out = Def.ActorFrame{
	LoadActor("base")..{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X)
		end;
	};
}

--Text Anchoring
if StageIndex then
	table.insert(out,Def.Sprite{
    Texture = "us_Results 1x8.png";
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X):pause()
		end;
    SetCommand=function(self)
      if screenName ~= "ScreenEvaluationSummary" or screenName ~= "ScreenEvaluationNormal" then
        self:Load(THEME:GetPathG("","ScreenEvaluation header/"..lang.."_Results.png"));
      else
        self:Load(THEME:GetPathG("","ScreenEvaluation header/"..lang.."_Results 1x8.png"));
        self:setstate(StageIndex)
      end;
    end;
	})
end

return out
