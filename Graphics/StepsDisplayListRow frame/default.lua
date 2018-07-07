local DiffToNum = {
	["Difficulty_Beginner"] = 0;
	["Difficulty_Easy"] = 1;
	["Difficulty_Medium"] = 2;
	["Difficulty_Hard"] = 3;
	["Difficulty_Challenge"] = 4;
}

local t = Def.ActorFrame{
	InitCommand=cmd(draworder,30);
	Def.Sprite{
		InitCommand=cmd(visible,true);
		SetCommand=function(self,param)
			if param.CustomDifficulty and param.CustomDifficulty ~= "" then
				self:Load(THEME:GetPathG("","StepsDisplayListRow frame/bases/"..param.CustomDifficulty));
			end;
		end;
	};
	Def.Quad{
		InitCommand=cmd(xy,-187,-30;setsize,374,55;halign,0;cropright,1);
		SetCommand=function(self,param)
			if param.CustomDifficulty and param.CustomDifficulty ~= "" then
				self:diffuse(CustomDifficultyToColor(param.CustomDifficulty) );
			else
				self:diffuse(color('1,1,1,1'));
			end;
		end;
	};
	Def.Sprite{
		InitCommand=cmd(halign,0;x,-140;y,-30);
		SetCommand=function(self,param)
			if param.CustomDifficulty and param.CustomDifficulty ~= "" then
				self:Load(THEME:GetPathG("","StepsDisplayListRow frame/titles/"..param.CustomDifficulty));
			end;
		end;
	};
	LoadFont("_itc avant garde std bk 50px")..{
		InitCommand=cmd(zoom,0.8;halign,1;x,174;y,-30);
		SetCommand=function(self,param)
			self:diffuse(color("#000000"))
			self:strokecolor(color("#FFFFFF"))
			self:settext(param.Meter)
		end;
	};
	--[[LoadActor("dark")..{
		SetCommand=function(self,param)
			if param.HasFocus then
				self:diffusealpha(0)
			else
				self:diffusealpha(1)
			end;
		end;
	}]]--
};

return t;
