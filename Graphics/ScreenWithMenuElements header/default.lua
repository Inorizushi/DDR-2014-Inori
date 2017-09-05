local screenName = Var "LoadingScreen"
local headerTextImage
local lang = "us";
if THEME:GetCurLanguage() == "ja" then
	lang = "jp";
end;

--this should probably be a metric
if screenName == "ScreenSelectMusic" then
    headerTextImage = "Music.png"
elseif string.find(screenName, "Options") then
    headerTextImage = "Options.png"
elseif screenName == "ScreenMapControllers" then
	headerTextImage = "Options.png"
elseif screenName == "ScreenSelectStyle" or screenName == "ScreenSelectStyleHappy" then
    headerTextImage = "Style.png"
elseif screenName == "ScreenSelectPlayMode"
	or screenName == "ScreenSelectPlayCourseMode" then
    headerTextImage = "PlayMode.png"
	elseif screenName == "ScreenSelectGameMode" then
	    headerTextImage = "GameMode.png"
elseif screenName == "ScreenSelectCourse" then
    headerTextImage = "Course.png"
elseif screenName == "ScreenSelectProfile" then
	headerTextImage = "profile.png"
elseif screenName == "ScreenDataSaveSummary" then
	headerTextImage = "profile.png"
end

--Base Anchoring
local out = Def.ActorFrame{
	LoadActor("base")..{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X)
		end;
	};
}

--Text Anchoring
if headerTextImage then
	table.insert(out,LoadActor(lang.."_"..headerTextImage)..{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X+2)
		end;
	})
end

return out
