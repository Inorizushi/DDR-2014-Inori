-- BeforeLoadingNextCourseSongMessageCommand
-- StartCommand
-- ChangeCourseSongInMessageCommand
-- ChangeCourseSongOutMessageCommand
-- FinishCommand

local sStage = GAMESTATE:GetCurrentStage();
local tRemap = {
	Stage_1st		= 1,
	Stage_2nd		= 2,
	Stage_3rd		= 3,
	Stage_4th		= 4,
	Stage_5th		= 5,
	Stage_6th		= 6,
};

if tRemap[sStage] == PREFSMAN:GetPreference("SongsPerPlay") then
	sStage = "Stage_Final";
else
	sStage = sStage;
end;

return Def.ActorFrame {
	LoadActor(("failed"))..{
		ChangeCourseSongInMessageCommand=cmd(queuecommand,("Play"));
		PlayCommand=cmd(play;);
	};
	-- song banner
	Def.Banner{
		Name="SongBanner";
		InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y-130;scaletoclipped,256,80);
		StartCommand=function(self)
			local course = GAMESTATE:GetCurrentCourse()
			local entry = course:GetCourseEntry(GAMESTATE:GetLoadingCourseSongIndex())
			self:LoadFromSong(entry:GetSong())
			self:zoomy(0):sleep(0.099):sleep(0.396):linear(0.099):zoomy(1)
		end;
		FinishCommand=cmd(sleep,2;linear,0.099;zoomy,0);
	};
	LoadActor( THEME:GetPathG("_stages/ScreenStageInformation", "Stage " .. ToEnumShortString(sStage) ) ) .. {
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y);
		ChangeCourseSongInMessageCommand=cmd(diffusealpha,0;sleep,0.396;diffusealpha,1);
		FinishCommand=cmd(sleep,1;diffusealpha,0);
	};
};
