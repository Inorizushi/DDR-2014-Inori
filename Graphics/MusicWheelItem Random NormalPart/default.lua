--main backing
local t = Def.ActorFrame {
	LoadActor("Item")..{
		InitCommand=cmd(y,-2);
	};
};
return t;
