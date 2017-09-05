local t = Def.ActorFrame{};

if GAMESTATE:IsPlayerEnabled('PlayerNumber_P1') then
--P1 Score Frame
t[#t+1]=Def.ActorFrame{
	InitCommand=cmd(addy,-14);
	LoadActor("MIXScoreFrame")..{
		InitCommand=cmd(x,THEME:GetMetric(Var "LoadingScreen","PlayerP1OnePlayerOneSideX"));
	};
};
end;

if GAMESTATE:IsPlayerEnabled('PlayerNumber_P2') then
t[#t+1]=Def.ActorFrame{
	InitCommand=cmd(addy,-14);
	LoadActor("MIXScoreFrame")..{
		InitCommand=cmd(x,THEME:GetMetric(Var "LoadingScreen","PlayerP2OnePlayerOneSideX"));
	};
};
end;
local PLAYER = GAMESTATE:GetMasterPlayerNumber();
t[#t+1] = Def.Sprite{
	Texture="DIFF";
	InitCommand=cmd(pause;setstate,0;addy,-40;CenterX;queuecommand,"Set");
	SetCommand=function(self)
    local diff = GAMESTATE:GetCurrentSteps(PLAYER):GetDifficulty();
		if diff == 'Difficulty_Easy' then
			self:visible(true)
			self:setstate(0);
		elseif diff == 'Difficulty_Medium' then
			self:visible(true)
			self:setstate(1);
		elseif diff == 'Difficulty_Hard' then
			self:visible(true)
			self:setstate(2);
		else
			self:visible(false)
		end;
	end;
};

t[#t+1] = Def.Sprite{
  InitCommand=cmd(CenterX;queuecommand,"Set");
  SetCommand=function(s)
    local style = GAMESTATE:GetCurrentStyle():GetStyleType()
    if style == 'StyleType_OnePlayerOneSide' then
      s:Load(THEME:GetPathG("","_shared2ndMIX/Styles/single"));
    elseif style == 'StyleType_TwoPlayersTwoSides' then
      s:Load(THEME:GetPathG("","_shared2ndMIX/Styles/versus"));
    elseif style == 'StyleType_OnePlayerTwoSides' then
      s:Load(THEME:GetPathG("","_shared2ndMIX/Styles/double"));
    elseif style == 'StyleType_TwoPlayersSharedSides' then
      s:Load(THEME:GetPathB("","_shared2ndMIX/Styles/couple"));
    end;
  end;
};

return t;
