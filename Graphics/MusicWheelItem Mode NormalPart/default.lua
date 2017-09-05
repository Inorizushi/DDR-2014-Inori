return Def.ActorFrame {
	Def.Sprite{
		InitCommand=cmd(setsize,174,210);
		SetMessageCommand=function(self,params)
			local so = GAMESTATE:GetSortOrder();
			local label = params.Label;
		--	if label then
			if so == "SortOrder_ModeMenu" then
				self:Load( THEME:GetPathG("MusicWheelItem","Sort ColorPart/SortBanner/"..label) );
				self:setsize(174,210)
			end;
		end;
	};
};
