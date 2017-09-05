local t = LoadFallbackB()

setenv("MIXMODE",false);

t[#t+1] = StandardDecorationFromFile("Version","Version")

--if Endless mode didn't get a chance to clean up after itself properly,
--ComboContinuesBetweenSongs will still be set. IMO it's not commonly used enough
--that just forcing it off will be a problem. Maybe it could be a theme pref.
if PREFSMAN:GetPreference("ComboContinuesBetweenSongs") then
	print("ComboContinuesBetweenSongs was disabled.")
	PREFSMAN:SetPreference("ComboContinuesBetweenSongs", false)
end

local counter = 0;
local t = Def.ActorFrame{};


t[#t+1] = Def.ActorFrame {
	Def.BitmapText{
	Font="Common normal",
	Text=themeInfo["Name"] .. " " .. themeInfo["Version"] .. " by " .. themeInfo["Author"] .. (SN3Debug and " (debug mode)" or "") ,
	InitCommand=cmd(halign,0;valign,0;x,SCREEN_LEFT+40;y,SCREEN_TOP+5;shadowlength,1; zoom, 0.6;diffusealpha,0.5)
	};
}

if PROFILEMAN:GetNumLocalProfiles() <1 then
	t[#t+1] = Def.ActorFrame{
		LoadActor("../profile")..{
			InitCommand=cmd(Center);
			OnCommand=cmd(bob;effectmagnitude,0,5,0);
			OffCommand=cmd(sleep,0.2;linear,0.3;zoomy,0;diffusealpha,0);
		};
	};
end

t[#t+1] = Def.ActorFrame{
	LoadActor( "../ScreenLogo overlay/sponsor.png" )..{
	    InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;),
		OnCommand=cmd(diffusealpha,1);
	};
};

return t
