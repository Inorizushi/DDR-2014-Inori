local sBannerPath = THEME:GetPathG("Common", "fallback jacket");
local sJacketPath = THEME:GetPathG("Common", "fallback jacket");
local bAllowJackets = true
local song;
local group;
local getOn = 0;
local getOff = 0;

--main backing
local t = Def.ActorFrame {
	--[[SetCommand=function(self,params)
		local song = params.Song
		local index = params.DrawIndex
		if song then
			if getOn == 0 then
				if index == 8 then
					self:zoom(0):decelerate(0.2):zoom(1)
				elseif index < 8 then
					self:addx(-SCREEN_WIDTH):decelerate(0.2):addx(SCREEN_WIDTH)
				elseif index > 8 then
					self:addx(SCREEN_WIDTH):decelerate(0.2):addx(-SCREEN_WIDTH)
				end;
			end;
		end;
		self:queuecommand("SetOn");
	end;
	SetOnCommand=function(self)
		getOn = 1;
	end;]]--
	Def.Sprite {
		OnCommand=function(self)
			self:diffusealpha(1):setsize(174,210)
			self:y(-2)
		end;
		SetMessageCommand=function(self,params)
		group = params.Text;
		local so = GAMESTATE:GetSortOrder();
			if group then
				if group == group_name[group] then
					local group_extender1 = group_name[group];
					local group_extender2 = group_extend[group_extender1];
					self:Load(THEME:GetPathG("","_jackets/backing/full/"..group_extender2..".png"))

					self:diffusealpha(1):setsize(174,210)
					self:y(-2)
				else
					self:Load(THEME:GetPathG("","MusicWheelItem Song NormalPart/Backing.png"));
					self:y(-2):setsize(174,210)
					self:diffusealpha(1);
				end;
			end;
		end;
	};
--border default
LoadActor("title")..{
	InitCommand=function(self)
		self:y(-20)
	end;
};
Def.Sprite{
	InitCommand=cmd(scaletoclipped,140,140);
	SetMessageCommand=function(self,params)
	local song = params.Song;
	local pssp1 = STATSMAN:GetCurStageStats(params.Song):GetPlayerStageStats("PlayerNumber_P1")
	local staw1 = STATSMAN:GetCurStageStats(params.Song):GetPlayerStageStats("PlayerNumber_P1"):GetStageAward();
	local pssp2 = STATSMAN:GetCurStageStats(params.Song):GetPlayerStageStats("PlayerNumber_P2")
		if song then
			if not PROFILEMAN:IsSongNew(params.Song) then
			self:Load(THEME:GetPathG("MusicWheelItem Song","NormalPart/Borders/cleared.png"));
			self:diffusealpha(1);
			self:draworder(1);
			else
			self:diffusealpha(0);
			end;
		end;
	end;
};
--title part
	Def.BitmapText{
		Font="_@dfgW7 36px";
		InitCommand=cmd(zoom,0.7;maxwidth,140/0.7;wrapwidthpixels,2^24);
		SetMessageCommand=function(self, param)
			local Song = param.Song;
			local Course = param.Course;
			if Song then
				self:y(86)
				self:settext(Song:GetDisplayMainTitle());
				self:diffuse(color("#FFFFFF"));
			end
		end;
	};
Def.Quad {
	InitCommand=cmd(setsize,130,130;diffuse,color("#000000"));
};
--banner
	Def.Sprite {
		Name="Banner";
		InitCommand=cmd(scaletoclipped,128,128);
		BannerCommand=cmd(scaletoclipped,128,128);
		JacketCommand=cmd(scaletoclipped,128,128);
		SetMessageCommand=function(self,params)
			local Song = params.Song;
			local Course = params.Course;
			if Song then
				if ( Song:GetJacketPath() ~=  nil ) and ( bAllowJackets ) then
					self:Load( Song:GetJacketPath() );
					self:playcommand("Jacket");
				elseif ( Song:GetBackgroundPath() ~= nil ) and ( bAllowJackets ) then
					self:Load( Song:GetBackgroundPath() );
					self:playcommand("Jacket");
				elseif ( Song:GetBannerPath() ~= nil ) then
					self:Load( Song:GetBannerPath() );
					self:playcommand("Banner");
				else
				  self:Load( bAllowJackets and sBannerPath or sJacketPath );
				  self:playcommand( bAllowJackets and "Jacket" or "Banner" );
				end;
			elseif Course then
				if ( Course:GetBackgroundPath() ~= nil ) and ( bAllowJackets ) then
					self:Load( Course:GetBackgroundPath() );
					self:playcommand("Jacket");
				elseif ( Course:GetBannerPath() ~= nil ) then
					self:Load( Course:GetBannerPath() );
					self:playcommand("Banner");
				else
					self:Load( sJacketPath );
					self:playcommand( bAllowJackets and "Jacket" or "Banner" );
				end
			else
				self:Load( bAllowJackets and sJacketPath or sBannerPath );
				self:playcommand( bAllowJackets and "Jacket" or "Banner" );
			end;
		end;
	};
--new song
	LoadActor("NEW") .. {
		InitCommand=cmd(y,-84;finishtweening;draworder,1;zoom,1;bob;effectmagnitude,0,5,0);
		SetCommand=function(self,param)
			if param.Song then
				if PROFILEMAN:IsSongNew(param.Song) then
					self:visible(true);
				else
					self:visible(false);
				end
			else
				self:visible(false);
			end
		end;
	};
};

if GAMESTATE:IsPlayerEnabled(PLAYER_1) then
	t[#t+1] = LoadActor("diff1.lua")
end;

if GAMESTATE:IsPlayerEnabled(PLAYER_2) then
	t[#t+1] = LoadActor("diff2.lua")
end;

return t;
