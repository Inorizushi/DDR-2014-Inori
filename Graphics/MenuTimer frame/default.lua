local t = Def.ActorFrame{}

t[#t+1] = Def.ActorFrame{
  LoadActor( "normal" )..{
    OnCommand=function(self)
      self:zoom(1)
      if PREFSMAN:GetPreference("MenuTimer") then
        self:queuecommand("Tick")
      end;
    end;
    TickCommand=cmd(zoom,1.2;linear,0.3;zoom,1;sleep,0.7;queuecommand,"Tick");
		OffCommand=cmd(stoptweening;);
	};
  LoadActor( "numbers" )..{
    OnCommand=function(self)
      self:zoom(1.2)
      self:diffusealpha(0)
      if PREFSMAN:GetPreference("MenuTimer") then
        self:queuecommand("Tick")
      else
      	return
      end;
    end;
    TickCommand=cmd(diffusealpha,1;sleep,0.2;linear,0.2;diffusealpha,0;sleep,0.6;queuecommand,"Tick");
		OffCommand=cmd(stoptweening;);
	};
  LoadActor("red")..{
    OnCommand=cmd(diffusealpha,0;queuecommand,"Update");
    UpdateCommand=function(self)
      local timer = SCREENMAN:GetTopScreen():GetChild "Timer";
      local time = timer:GetSeconds()
      if PREFSMAN:GetPreference("MenuTimer") then
        if time <= 6 then
          self:diffusealpha(1):zoom(1.2):linear(0.3):zoom(1):diffusealpha(0):sleep(0.7):queuecommand("Update")
        else
        	self:sleep(1):queuecommand("Update")
        end
      end
    end;
  };
};

return t;
