local t = Def.ActorFrame{};

local function setDiffBG(self,param)
  local st = GAMESTATE:GetCurrentStyle():GetStepsType()
  if self.ParamSong then
    local steps = GAMESTATE:GetCurrentSteps(PLAYER_2)
    if steps then
      local sDiff = steps:GetDifficulty()
			 local diff = self.ParamSong:GetOneSteps( st, sDiff)
      local diffname = GAMESTATE:GetCurrentSteps(PLAYER_2):GetDifficulty()
      if diff then
  			self:diffuse(CustomDifficultyToColor(diffname));
  		else
  			self:diffuse(color("1,1,1,0"))
  		end;
  	else
  		self:diffuse(color("1,1,1,0"))
  	end;
  end;
end;

local function setDiff(self,param)
	local st = GAMESTATE:GetCurrentStyle():GetStepsType()
	if self.ParamSong then
		local steps = GAMESTATE:GetCurrentSteps(PLAYER_2)
		if steps then
			local sDiff = steps:GetDifficulty()
			local diff = self.ParamSong:GetOneSteps( st, sDiff)
			local diffname = GAMESTATE:GetCurrentSteps(PLAYER_2):GetDifficulty()
			if diff then
				if self:GetName() == diffname then
						self:settext( diff:GetMeter() )
						self:visible(true)
				else
					self:visible(false)
				end;
			else
				self:settext("")
			end;
		else
			self:settext("")
		end;
	end;
end;



t[#t+1] = Def.ActorFrame{
	InitCommand=function(self)
		self:x(62)
		self:y(-86)
	end;
	Def.ActorFrame{
		InitCommand=cmd(draworder,1);
		Def.Quad{
			Name = "Difficulty_Beginner";
      InitCommand=cmd(setsize,24,24);
			SetCommand=function(self,param)
				self.ParamSong = param.Song
				setDiffBG(self)
			end;
			CurrentStepsP2ChangedMessageCommand=function(self) setDiffBG(self) end;
			CurrentSongChangedMessageCommand=function(self) setDiffBG(self) end;
		};
		Def.Quad{
			Name = "Difficulty_Easy";
      InitCommand=cmd(setsize,24,24);
			SetCommand=function(self,param)
				self.ParamSong = param.Song
				setDiffBG(self)
			end;
			CurrentStepsP2ChangedMessageCommand=function(self) setDiffBG(self) end;
			CurrentSongChangedMessageCommand=function(self) setDiffBG(self) end;
		};
		Def.Quad{
			Name = "Difficulty_Medium";
      InitCommand=cmd(setsize,24,24);
			SetCommand=function(self,param)
				self.ParamSong = param.Song
				setDiffBG(self)
			end;
			CurrentStepsP2ChangedMessageCommand=function(self) setDiffBG(self) end;
			CurrentSongChangedMessageCommand=function(self) setDiffBG(self) end;
		};
		Def.Quad{
			Name = "Difficulty_Hard";
      InitCommand=cmd(setsize,24,24);
			SetCommand=function(self,param)
				self.ParamSong = param.Song
				setDiffBG(self)
			end;
			CurrentStepsP2ChangedMessageCommand=function(self) setDiffBG(self) end;
			CurrentSongChangedMessageCommand=function(self) setDiffBG(self) end;
		};
		Def.Quad{
			Name = "Difficulty_Challenge";
      InitCommand=cmd(setsize,24,24);
			SetCommand=function(self,param)
				self.ParamSong = param.Song
				setDiffBG(self)
			end;
			CurrentStepsP2ChangedMessageCommand=function(self) setDiffBG(self) end;
			CurrentSongChangedMessageCommand=function(self) setDiffBG(self) end;
		};
	};
	Def.ActorFrame{
		InitCommand=cmd(zoom,0.7;draworder,2);
		Def.BitmapText{
			InitCommand=cmd(diffuse,color("#FFFFFF");strokecolor,color("#000000"));
			Font="Common Normal";
			Name = "Difficulty_Beginner";
			SetCommand=function(self,param)
				self.ParamSong = param.Song
				setDiff(self)
			end;
			CurrentStepsP2ChangedMessageCommand=function(self) setDiff(self) end;
			CurrentSongChangedMessageCommand=function(self) setDiff(self) end;
		};
		Def.BitmapText{
			Font="Common Normal";
			Name = "Difficulty_Easy";
			InitCommand=cmd(diffuse,color("#FFFFFF");strokecolor,color("#000000"));
			SetCommand=function(self,param)
				self.ParamSong = param.Song
				setDiff(self)
			end;
			CurrentStepsP2ChangedMessageCommand=function(self) setDiff(self) end;
			CurrentSongChangedMessageCommand=function(self) setDiff(self) end;
		};
		Def.BitmapText{
			Font="Common Normal";
			Name = "Difficulty_Medium";
			InitCommand=cmd(diffuse,color("#FFFFFF");strokecolor,color("#000000"));
			SetCommand=function(self,param)
				self.ParamSong = param.Song
				setDiff(self)
			end;
			CurrentStepsP2ChangedMessageCommand=function(self) setDiff(self) end;
			CurrentSongChangedMessageCommand=function(self) setDiff(self) end;
		};
		Def.BitmapText{
			Font="Common Normal";
			Name = "Difficulty_Hard";
			InitCommand=cmd(diffuse,color("#FFFFFF");strokecolor,color("#000000"));
			SetCommand=function(self,param)
				self.ParamSong = param.Song
				setDiff(self)
			end;
			CurrentStepsP2ChangedMessageCommand=function(self) setDiff(self) end;
			CurrentSongChangedMessageCommand=function(self) setDiff(self) end;
		};
		Def.BitmapText{
			Font="Common Normal";
			Name = "Difficulty_Challenge";
			InitCommand=cmd(diffuse,color("#FFFFFF");strokecolor,color("#000000"));
			SetCommand=function(self,param)
				self.ParamSong = param.Song
				setDiff(self)
			end;
			CurrentStepsP2ChangedMessageCommand=function(self) setDiff(self) end;
			CurrentSongChangedMessageCommand=function(self) setDiff(self) end;
		};
	};
};
return t;
