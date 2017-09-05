local t = Def.ActorFrame{
	LoadActor("newbar") .. {
		InitCommand=cmd(halign,1;valign,1;x,SCREEN_RIGHT;y,SCREEN_BOTTOM-18;draworder,40;zoom,1);
	};
};

t[#t+1] = Def.ActorFrame{
	LoadActor("base")..{
		InitCommand=cmd(halign,0;valign,0;xy,SCREEN_LEFT,SCREEN_TOP);
	};
	LoadActor("text")..{
		InitCommand=cmd(halign,0;valign,0;xy,SCREEN_LEFT+26,SCREEN_TOP+14);
	};
};

t[#t+1] = Def.ActorFrame {
	InitCommand=cmd(x,SCREEN_CENTER_X-55;y,SCREEN_CENTER_Y+250+27;draworder,45);
	-- Title
	LoadFont("_itc avant garde std bk 20px")..{
		InitCommand=cmd(horizalign,left;x,0;zoom,0.95;maxwidth,384;playcommand,"Update");
		CurrentSongChangedMessageCommand=cmd(playcommand,"Update");
		UpdateCommand=function(self)
			local title;
			local song = GAMESTATE:GetCurrentSong();
			if song then
				if song:GetDisplaySubTitle() == ""  then
					title = song:GetDisplayFullTitle();
					self:y(-0);
				else
					title = song:GetDisplayFullTitle();
					self:y(-0);
				end;
			else
				title = "???";
				self:y(-0);
			end;
			self:settext(title);
		end;
	};
	-- SubTitle
	-- LoadFont("_itc avant garde std bk 20px")..{
		-- InitCommand=cmd(horizalign,left;x,0;y,20;zoom,0.95;maxwidth,384;playcommand,"Update");
		-- CurrentSongChangedMessageCommand=cmd(playcommand,"Update");
		-- UpdateCommand=function(self)
			-- local title;
			-- local song = GAMESTATE:GetCurrentSong();
			-- if song then
				-- title = song:GetDisplaySubTitle();
			-- else
				-- title = "???";
			-- end;
			-- self:settext(title);
		-- end;
	-- };
	-- Artist
	LoadFont("_itc avant garde std bk 20px")..{
		InitCommand=cmd(horizalign,left;x,0;y,30;zoom,0.95;maxwidth,384;playcommand,"Update");
		CurrentSongChangedMessageCommand=cmd(playcommand,"Update");
		UpdateCommand=function(self)
			local title;
			local song = GAMESTATE:GetCurrentSong();
			if song then
				title = song:GetDisplayArtist();
			else
				title = "???";
			end;
			self:settext(title);
		end;
	};
};
--song jacket--
t[#t+1] = Def.ActorFrame {
 	InitCommand=cmd(x,SCREEN_CENTER_X+431+50+7;y,SCREEN_CENTER_Y+250-125+10+30-15;diffusealpha,1;draworder,100);
	Def.Sprite {
		OnCommand=function(self)
			local song = GAMESTATE:GetCurrentSong();
				if song then
					if song:HasJacket() then
						self:diffusealpha(1);
						self:LoadBackground(song:GetJacketPath());
						self:setsize(256,256);
					elseif song:HasBanner() then
						self:diffusealpha(1);
						self:LoadFromSongBanner(GAMESTATE:GetCurrentSong());
						self:setsize(256,256);
					else
						self:Load(THEME:GetPathG("","Common fallback jacket"));
						self:setsize(256,256);
					end;
				else
					self:diffusealpha(0);
			end;
		end;
	OffCommand=cmd(sleep,0.2;bouncebegin,0.175;zoomy,0);
	};
};
return t;
