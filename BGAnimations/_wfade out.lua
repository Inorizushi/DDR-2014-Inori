return Def.ActorFrame{
	Def.Quad{
		InitCommand=cmd(FullScreen);
		OnCommand=cmd(diffusealpha,0;linear,0.1;diffusealpha,1;sleep,1);
	}
}
