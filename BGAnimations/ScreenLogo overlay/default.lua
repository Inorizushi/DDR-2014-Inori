return Def.ActorFrame{
	-- SPONSOR GAMECENTER ETC ---------
	LoadActor( "sponsor.png" )..{
	    InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;),
		OnCommand=cmd(diffusealpha,1);
	};
	-- eamusement titre --
    LoadActor( "eam2.png" )..{
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y);
		OnCommand=cmd(diffusealpha,0;playcommand,"Animate");
		AnimateCommand=cmd(sleep,1;diffusealpha,1;sleep,2;diffusealpha,0;queuecommand,"Animate");

	};
	LoadActor( "eam2.png" )..{
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;blend,'BlendMode_Add');
		OnCommand=cmd(diffusealpha,0;glowshift;effectperiod,0.6;playcommand,"Animate");
		AnimateCommand=cmd(sleep,1;diffusealpha,0.25;sleep,2;diffusealpha,0;queuecommand,"Animate");

	};
	LoadActor( "eam1.png" )..{
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;),
		OnCommand=cmd(diffusealpha,0;playcommand,"Animate");
		AnimateCommand=cmd(sleep,1;diffusealpha,0;sleep,2;diffusealpha,1;queuecommand,"Animate");

	};
    LoadActor( "eam1.png" )..{
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;blend,'BlendMode_Add');
		OnCommand=cmd(diffusealpha,0;glowshift;effectperiod,0.6;playcommand,"Animate");
		AnimateCommand=cmd(sleep,1;diffusealpha,0;sleep,2;diffusealpha,0.25;queuecommand,"Animate");

	};
};
