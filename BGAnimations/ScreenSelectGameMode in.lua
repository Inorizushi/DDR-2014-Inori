return Def.ActorFrame{
	Def.Quad{
		InitCommand=cmd(FullScreen;diffuse,color("0,0,0,1"));
		OnCommand=cmd(diffusealpha,1;linear,0.2;diffusealpha,0);
	};
	LoadActor(THEME:GetPathS("","_swoosh in"))..{
		OnCommand=cmd(sleep,0.3;queuecommand,"play");
		playCommand=cmd(play);
	};
}
