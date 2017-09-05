return Def.ActorFrame{
	LoadActor(THEME:GetPathS("","_swoosh in"))..{
		StartTransitioningCommand=cmd(play);
	};
};
