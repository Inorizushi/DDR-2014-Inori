return Def.ActorFrame{
	Def.Quad{
		InitCommand=cmd(FullScreen;diffuse,color("1,1,1,1"));
		OnCommand=cmd(diffusealpha,0;sleep,0.8;linear,0.1;diffusealpha,1);
	};
	StartTransitioningCommand=function(self) SOUND:DimMusic(0,math.huge) end,
}
