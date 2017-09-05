local t = Def.ActorFrame{};

t[#t+1] = StandardDecorationFromFileOptional("StageFrame","StageFrame");
t[#t+1] = StandardDecorationFromFile("LifeFrame","LifeFrame")
t[#t+1] = StandardDecorationFromFile("ScoreFrame","ScoreFrame")

-- stage display (normal)
t[#t+1] = StandardDecorationFromFile("StageDisplay","StageDisplay")

local ScoringPlayers = {}

local SecondInfo = {}

local tns_reverse = Enum.Reverse(TapNoteScore)

t[#t+1] = Def.Actor{
    Name="ScoringController",
    JudgmentMessageCommand = function(_,params)
		SN2Scoring.PrepareScoringInfo(IsStarterMode())
        if not ScoringPlayers[params.Player] then
            ScoringPlayers[params.Player] = true
        end
		--worstJudge is used by the combo code
		if not ScoringInfo.worstJudge then
			ScoringInfo.worstJudge = {}
		end
		local wj = ScoringInfo.worstJudge[params.Player]
		if (not wj) or tns_reverse[params.TapNoteScore] < tns_reverse[wj] then
			ScoringInfo.worstJudge[params.Player] = params.TapNoteScore
		end
        local es = (GAMESTATE:Env()).EndlessState
        if es then
            local pss = STATSMAN:GetCurStageStats():GetPlayerStageStats(params.Player)
            es.scoring.handleNoteScore(params.HoldNoteScore or params.TapNoteScore,
                GAMESTATE:GetCurrentStageIndex()+1,
                pss:GetCurrentCombo())
            --SCREENMAN:SystemMessage(es.scoring.getScoreString())
        end
    end,
}

local function ScoreUpdate()
    for pn, _ in pairs(ScoringPlayers) do
        local info = ScoringInfo[pn]
        local stage = GAMESTATE:IsCourseMode() and GAMESTATE:GetCourseSongIndex() + 1 or nil
        local pss = STATSMAN:GetCurStageStats():GetPlayerStageStats(pn)
        local score = info.GetCurrentScore(pss, stage)
        pss:SetScore(score)
        local scoreDisplay = SCREENMAN:GetTopScreen():GetChild("Score"..ToEnumShortString(pn))
        if scoreDisplay and scoreDisplay:GetChild("Text") then
            scoreDisplay:GetChild("Text"):targetnumber(score)
        end
        pss:SetCurMaxScore(info.GetCurrentMaxScore(pss, stage))
    end
end

t[#t+1] = Def.ActorFrame{
    Name = "ScoringController2",
    InitCommand = function(s) s:SetUpdateFunction(ScoreUpdate) end
}

local xPosPlayer = {
    P1 = (THEME:GetMetric(Var "LoadingScreen","PlayerP1OnePlayerOneSideX")),
    P2 = (THEME:GetMetric(Var "LoadingScreen","PlayerP2OnePlayerOneSideX"))
}

if Is2ndMIX() then
  for _, pn in pairs(GAMESTATE:GetEnabledPlayers()) do
    t[#t+1] = Def.RollingNumbers {
      Font="2ndMIXScore";
      InitCommand=function(self)
        local short = ToEnumShortString(pn)
        self:y(SCREEN_BOTTOM-40);
        self:x(xPosPlayer[short]):Load("RollingNumbers2ndGameplay")
        self:draworder(200)
      end;
      JudgmentMessageCommand=function(s)
        local info = SecondInfo[pn]
        if not info then
        	info = OldScoring.MakeScoringFunctions()
        	SecondInfo[pn] = info
        end
        local pss = STATSMAN:GetCurStageStats():GetPlayerStageStats(pn)
        info.Update(pss)
        local score = info.GetCurrentScore()
        s:targetnumber(score);
      end,
    };
  end;
end;

--options--
if not getenv("OLDMIX") then
t[#t+1] = LoadActor( THEME:GetPathB("","optionicon_P1") ) .. {
		InitCommand=cmd(player,PLAYER_1;zoomx,2;zoomy,1.5;x,WideScale(SCREEN_CENTER_X-221,SCREEN_CENTER_X-296);draworder,1);
		OnCommand=function(self)
			if GAMESTATE:PlayerIsUsingModifier(PLAYER_1,'reverse') then
				self:y(SCREEN_CENTER_Y-276);
			else
				self:y(SCREEN_CENTER_Y+252);
			end;
		end;
	};
t[#t+1] = LoadActor( THEME:GetPathB("","optionicon_P2") ) .. {
	InitCommand=cmd(player,PLAYER_2;zoomx,2;zoomy,1.5;x,WideScale(SCREEN_CENTER_X+221,SCREEN_CENTER_X+296);draworder,1);
	OnCommand=function(self)
		if GAMESTATE:PlayerIsUsingModifier(PLAYER_2,'reverse') then
			self:y(SCREEN_CENTER_Y-276);
		else
			self:y(SCREEN_CENTER_Y+252);
		end;
	end;
};
t[#t+1] = LoadActor("Frame")..{
  InitCommand=cmd(player,PLAYER_1;halign,0;x,SCREEN_LEFT;draworder,100);
  OnCommand=function(self)
    if GAMESTATE:PlayerIsUsingModifier(PLAYER_1,'reverse') then
      self:y(SCREEN_CENTER_Y-301.5);
      self:rotationx(180);
    else
      self:y(SCREEN_CENTER_Y+275);
    end;
  end;
};

t[#t+1] = LoadActor("Frame")..{
  InitCommand=cmd(player,PLAYER_2;halign,0;x,SCREEN_RIGHT;zoomx,-1);
  OnCommand=function(self)
    if GAMESTATE:PlayerIsUsingModifier(PLAYER_2,'reverse') then
      self:y(SCREEN_CENTER_Y-301.5);
      self:rotationx(180);
    else
      self:y(SCREEN_CENTER_Y+275);
    end;
  end;
};
end;

return t
