local t = Def.ActorFrame{};

local set;

local gpoptext = THEME:GetString("MusicWheel","CustomItemGenrePopText");
local sbpmtext = THEME:GetString("MusicWheel","CustomItemSortBPMText");

t[#t+1] = Def.ActorFrame{
  SetMessageCommand=function(self, params)
		if params.Label == gpoptext then
      set = "Animation-game";
    elseif params.Label == sbpmtext then
       set = "BPM";
		end;
	end;
  Def.Sprite {
		SetMessageCommand=function(self,params)
      if set then
				self:Load(THEME:GetPathG("","_jackets/sort/"..set..".png"))
      end;
				self:diffusealpha(1);
				self:y(-2)
		end;
	};
}

return t;
