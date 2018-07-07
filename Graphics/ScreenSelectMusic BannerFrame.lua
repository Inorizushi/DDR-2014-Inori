local t = Def.ActorFrame{}

t[#t+1] = Def.ActorFrame {
 	InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y-110-5-15-8;diffusealpha,1;draworder,1);
	OffCommand=cmd(sleep,0.2;bouncebegin,0.175;zoomy,0);
	Def.Quad{
	 InitCommand=cmd(diffuse,color("#000000");setsize,310,310);
	};
	Def.Banner {
		SetCommand=function(self,params)
		if not GAMESTATE:IsCourseMode() then
		local song = GAMESTATE:GetCurrentSong();
				if song then
					if song:HasJacket() then
						self:diffusealpha(1);
						self:LoadBackground(song:GetJacketPath());
						self:zoomtowidth(304);
						self:zoomtoheight(304);
					elseif song:HasBackground() then
						self:diffusealpha(1);
						self:LoadFromSongBackground(GAMESTATE:GetCurrentSong());
						self:zoomtowidth(304);
						self:zoomtoheight(304);
					else
						self:Load(THEME:GetPathG("","Common fallback jacket"));
						self:zoomtowidth(304);
						self:zoomtoheight(304);
					end;
				else
						self:diffusealpha(0);
						self:Load(THEME:GetPathG("","Common fallback jacket"));
						self:zoomtowidth(304);
						self:zoomtoheight(304);
				end;
		else
			self:diffusealpha(0);
		end;
	end;
	CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
	};
	Def.Banner {
		SetCommand=function(self)
	  local course = GAMESTATE:GetCurrentCourse();
		if course then
			self:LoadFromCourse(GAMESTATE:GetCurrentCourse());
			self:zoomtowidth(304);
			self:zoomtoheight(304);
		end;
	end;
	CurrentCourseChangedMessageCommand=cmd(playcommand,"Set");
	};
};

t[#t+1] = Def.ActorFrame{
  InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y-110-5-15-8;diffusealpha,1;draworder,1);
	OffCommand=cmd(sleep,0.2;bouncebegin,0.175;zoomy,0);
  Def.Banner {
    SetCommand=function(self,params)
    if not GAMESTATE:IsCourseMode() then
    local song = GAMESTATE:GetCurrentSong();
      if not song then
        local group = getenv("getgroupname");
        if group==group_name[group] then
          self:diffusealpha(0)
        else
          self:LoadFromSongGroup(group);
          self:diffusealpha(1)
          self:zoomtowidth(304);
          self:zoomtoheight(304);
        end;
      else
          self:diffusealpha(0);
          self:Load(THEME:GetPathG("","Common fallback jacket"));
          self:zoomtowidth(304);
          self:zoomtoheight(304);
      end;
  else
    self:diffusealpha(0);
  end;
  end;
  CurrentSongChangedMessageCommand=function(self, params)
    self:playcommand("Set", params);
  end;
  };
  Def.Sprite {
    SetCommand=function(self,params)
    if not GAMESTATE:IsCourseMode() then
    local song = GAMESTATE:GetCurrentSong();
      if not song then
        local group = getenv("getgroupname");
        if group==group_name[group] then
          self:Load(THEME:GetPathG("","_jackets/group/big jacket/"..group_name[group]..".png"))
          self:diffusealpha(1)
				else
					self:diffusealpha(0)
        end;
      else
        self:diffusealpha(0);
        self:Load(THEME:GetPathG("","Common fallback jacket"));
        self:zoomtowidth(304);
        self:zoomtoheight(304);
      end;
    else
      self:diffusealpha(0);
    end;
    end;
    CurrentSongChangedMessageCommand=function(self, params)
      self:playcommand("Set", params);
    end;
  };
	--[[Def.Sprite {
    SetCommand=function(self,params)
    	local song = GAMESTATE:GetCurrentSong();
      if SCREENMAN:GetTopScreen():GetChild('MusicWheel'):GetSelectedType() == 'WheelItemDataType_Random' then
        self:Load(THEME:GetPathG("","_jackets/random.png"))
        self:diffusealpha(1)
				self:zoomtowidth(304);
				self:zoomtoheight(304);
			else
				self:diffusealpha(0)
      end;
    end;
    CurrentSongChangedMessageCommand=function(self, params)
      self:playcommand("Set", params);
    end;
  };]]--
}

return t;
