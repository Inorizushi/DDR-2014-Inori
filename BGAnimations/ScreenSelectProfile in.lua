return Def.ActorFrame{
	Def.Quad{
		InitCommand=cmd(FullScreen);
		OnCommand=cmd(diffusealpha,1;linear,0.3;diffusealpha,0);
	};
	LoadActor(THEME:GetPathS("","Profile_Start"))..{
		OnCommand=cmd(sleep,3.15;queuecommand,"Play");
		PlayCommand=cmd(play);
	};
	LoadActor(THEME:GetPathS("","Profile_Start"))..{
		OnCommand=cmd(sleep,5;queuecommand,"Play");
		PlayCommand=cmd(play);
	};
}
