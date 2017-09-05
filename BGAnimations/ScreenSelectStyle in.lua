local t = Def.ActorFrame{};

t[#t+1] = Def.ActorFrame{
	LoadActor(THEME:GetPathS("","_swoosh in.ogg"))..{
		OnCommand=cmd(queuecommand,"Play");
		PlayCommand=cmd(play)
	};
};

return t;
