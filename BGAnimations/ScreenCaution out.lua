return Def.ActorFrame{
	Def.Quad{
		InitCommand=cmd(FullScreen;diffuse,color("1,1,1,1"));
		OnCommand=cmd(diffusealpha,0;linear,0.15;diffusealpha,1);
	};
}
