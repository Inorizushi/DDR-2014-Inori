return Def.ActorFrame {
	OnCommand=cmd(sleep,1);
	LoadActor("../_evalOut")..{
		OffCommand=cmd(play);
	};
	StartTransitioningCommand=function(self) SOUND:DimMusic(0,0.5) end,
};
