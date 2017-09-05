LoadFromProfilePrefs()
return Def.ActorFrame{
	StartTransitioningCommand=function(self) self:sleep(0.5):queuecommand("Mute") end,
	MuteCommand=function(self) SOUND:DimMusic(0,math.huge) end,
};
