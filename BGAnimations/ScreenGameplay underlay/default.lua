local t = Def.ActorFrame{
        Def.Quad{
                BeginCommand=function(self)
                        if IsSMOnlineLoggedIn('PlayerNumber_P1') then
                                self:visible(true):x(SCREEN_CENTER_X*1.5);
                        else
                                self:visible(false);
                        end;
                end;
                InitCommand=function(self)
                        self:setsize(280,SCREEN_HEIGHT):CenterY():diffuse(color("0,0,0,0.5"));
                end;
        };
};

local show_cutins = GAMESTATE:GetCurrentSong() and (not GAMESTATE:GetCurrentSong():HasBGChanges()) or true;

local style = GAMESTATE:GetCurrentStyle():GetStyleType()
local st = GAMESTATE:GetCurrentStyle():GetStepsType();
local x_table = {
  PlayerNumber_P1 = {SCREEN_CENTER_X-340, SCREEN_CENTER_X+285},
  PlayerNumber_P2 = {SCREEN_CENTER_X+340, SCREEN_CENTER_X-285}
}
--toasty loader
if show_cutins then
--use ipairs here because i think it expects P1 is loaded before P2
for _, pn in ipairs(GAMESTATE:GetEnabledPlayers()) do
t[#t+1] = Def.ActorFrame{
  LoadActor("Cutin.lua", pn)..{
    OnCommand=cmd(setsize,300,SCREEN_HEIGHT);
    InitCommand=function(self)
      self:CenterY()
        if style == "StyleType_TwoPlayersTwoSides" or GAMESTATE:GetPlayMode() == 'PlayMode_Rave' then
  				self:x(SCREEN_CENTER_X);
        elseif IsUsingCenter1Player then
          if st == "StepsType_Dance_Double" then
            if GetScreenAspectRatio() < 1.7 then
							self:visible(false);
						else
							self:x(x_table[pn][1]);
						end;
          end;
        else
          self:x(x_table[pn][2]);
        end;
      end;
    };
};
end;
end;

return t;
