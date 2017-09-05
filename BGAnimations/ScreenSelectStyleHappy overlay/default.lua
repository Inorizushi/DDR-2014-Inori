local t = Def.ActorFrame{};

t[#t+1] = Def.ActorFrame{
  LoadActor("pad")..{
    InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y+250);
    OnCommand=cmd(zoom,0;sleep,0.5;linear,0.1;diffusealpha,1.0;zoom,1;smooth,0.1;zoom,0.9;smooth,0.1;zoom,1);
    OffCommand=cmd(smooth,0.2;zoom,0;diffuse,color("0,0,0,0");diffusealpha,0);
  };
}

--Dancers
t[#t+1] = Def.ActorFrame{
  LoadActor("1p dancer")..{
    InitCommand=cmd(xy,SCREEN_CENTER_X-100,SCREEN_CENTER_Y-16;visible,false;zoomx,1;diffusealpha,0;playcommand,"Show");
    OnCommand=cmd(sleep,0.6;linear,0.1;diffusealpha,1;zoomy,0.8;linear,0.1;zoomy,1;zoomx,1.2;linear,0.1;zoomx,1);
    OffCommand=cmd(smooth,0.2;zoom,0;diffuse,color("0,0,0,0");diffusealpha,0);
    ShowCommand=function(self)
      if GAMESTATE:IsPlayerEnabled(PLAYER_1) then
        self:visible(true)
      else
        self:visible(false)
      end;
    end;
    PlayerJoinedMessageCommand=function(self,param)
      if param.Player == PLAYER_1 then
        self:queuecommand("Show")
      end;
      self:diffusealpha(0)
      self:queuecommand("On");
    end;
  };
  LoadActor("2p dancer")..{
    InitCommand=cmd(xy,SCREEN_CENTER_X+108,SCREEN_CENTER_Y+08;visible,false;zoomx,1;diffusealpha,0;playcommand,"Show");
    OnCommand=cmd(sleep,0.6;linear,0.1;diffusealpha,1;zoomy,0.8;linear,0.1;zoomy,1;zoomx,1.2;linear,0.1;zoomx,1);
    OffCommand=cmd(smooth,0.2;zoom,0;diffuse,color("0,0,0,0");diffusealpha,0);
    ShowCommand=function(self)
      if GAMESTATE:IsPlayerEnabled(PLAYER_2) then
        self:visible(true)
      else
        self:visible(false)
      end;
    end;
    PlayerJoinedMessageCommand=function(self,param)
      if param.Player == PLAYER_2 then
        self:queuecommand("Show")
      end;
      self:diffusealpha(0)
      self:queuecommand("On");
    end;
  };
}

--OK Boxes
t[#t+1] = Def.ActorFrame{
  LoadActor("1p OK")..{
    InitCommand=cmd(xy,SCREEN_CENTER_X-332,SCREEN_CENTER_Y-130;visible,false);
    OnCommand=cmd(diffusealpha,0;sleep,0.5;linear,0.1;diffusealpha,1;queuecommand,"Show");
    OffCommand=cmd(finishtweening;smooth,0.2;zoom,0;diffuse,color("0,0,0,0");diffusealpha,0);
    AnimateCommand=cmd(linear,0.05;rotationz,3;linear,0.05;rotationz,-3;linear,0.05;rotationz,3;linear,0.05;rotationz,-3;linear,0.05;rotationz,0;sleep,1.5;queuecommand,"Animate");
    ShowCommand=function(self)
      if GAMESTATE:IsPlayerEnabled(PLAYER_1) then
        self:visible(true)
        self:playcommand("Animate");
      else
        self:visible(false)
      end;
    end;
    PlayerJoinedMessageCommand=function(self,param)
      if param.Player == PLAYER_1 then
        self:playcommand("Show")
      end;
    end;
  };
  LoadActor("2p OK")..{
    InitCommand=cmd(xy,SCREEN_CENTER_X+332,SCREEN_CENTER_Y-130;visible,false);
    OnCommand=cmd(diffusealpha,0;sleep,0.5;linear,0.1;diffusealpha,1;queuecommand,"Show");
    OffCommand=cmd(finishtweening;smooth,0.2;zoom,0;diffuse,color("0,0,0,0");diffusealpha,0);
    AnimateCommand=cmd(linear,0.05;rotationz,3;linear,0.05;rotationz,-3;linear,0.05;rotationz,3;linear,0.05;rotationz,-3;linear,0.05;rotationz,0;sleep,1.5;queuecommand,"Animate");
    ShowCommand=function(self)
      if GAMESTATE:IsPlayerEnabled(PLAYER_2) then
        self:visible(true)
        self:playcommand("Animate");
      else
        self:visible(false)
      end;
    end;
    PlayerJoinedMessageCommand=function(self,param)
      if param.Player == PLAYER_2 then
        self:playcommand("Show")
      end;
    end;
  };
}

--Arrows
t[#t+1] = Def.ActorFrame{
  LoadActor("1p arrow")..{
    InitCommand=cmd(xy,SCREEN_CENTER_X-248,SCREEN_CENTER_Y+72;visible,false;playcommand,"Show");
    OnCommand=cmd(diffusealpha,0;sleep,0.5;linear,0.1;diffusealpha,1;bob;effectmagnitude,0,5,0;effectperiod,0.75);
    OffCommand=cmd(smooth,0.2;zoom,0;diffuse,color("0,0,0,0");diffusealpha,0);
    ShowCommand=function(self)
      if GAMESTATE:IsPlayerEnabled(PLAYER_1) then
        self:visible(false)
      else
        self:visible(true)
      end;
    end;
    PlayerJoinedMessageCommand=function(self,param)
      if param.Player == PLAYER_1 then
        self:queuecommand("Show")
      end;
    end;
  };
  LoadActor("2p arrow")..{
    InitCommand=cmd(xy,SCREEN_CENTER_X+240,SCREEN_CENTER_Y+72;visible,false;playcommand,"Show");
    OnCommand=cmd(diffusealpha,0;sleep,0.5;linear,0.1;diffusealpha,1;bob;effectmagnitude,0,5,0;effectperiod,0.75);
    OffCommand=cmd(smooth,0.2;zoom,0;diffuse,color("0,0,0,0");diffusealpha,0);
    ShowCommand=function(self)
      if GAMESTATE:IsPlayerEnabled(PLAYER_2) then
        self:visible(false)
      else
        self:visible(true)
      end;
    end;
    PlayerJoinedMessageCommand=function(self,param)
      if param.Player == PLAYER_2 then
        self:queuecommand("Show")
      end;
    end;
  };
}


--TextBox P1
t[#t+1] = Def.ActorFrame{
  InitCommand=cmd(visible,false;queuecommand,"Show");
  OnCommand=cmd(visible,false;queuecommand,"Show");
  ShowCommand=function(self)
    if GAMESTATE:IsPlayerEnabled(PLAYER_1) then
      self:visible(false)
    else
      self:visible(true)
    end;
  end;
  PlayerJoinedMessageCommand=function(self,param)
    if param.Player == PLAYER_1 then
      self:queuecommand("Show")
    end;
  end;
  InitCommand=cmd(xy,SCREEN_CENTER_X-240,SCREEN_CENTER_Y-54;zoom,1);
  PlayerJoinedMessageCommand=cmd(queuecommand,"Off");
  Def.ActorFrame{
    LoadActor("box mid")..{
      OnCommand=cmd(diffusealpha,0;zoomy,0;sleep,0.5;smooth,0.2;zoomy,1;diffusealpha,1);
      OffCommand=cmd(smooth,0.2;zoomy,0;diffusealpha,0);
    };
    LoadActor("../EAmuse/Load 2x2")..{
      InitCommand=cmd(xy,-170,20);
    	OnCommand=cmd(diffusealpha,0;zoomy,0;sleep,0.5;smooth,0.2;zoomy,1;diffusealpha,1;animate,true;);
    	OffCommand=cmd(linear,0.15;diffusealpha,0);
    };
  };
  Def.ActorFrame{
    InitCommand=cmd(y,-94);
    OnCommand=cmd(diffusealpha,0;y,0;sleep,0.5;smooth,0.2;y,-94;diffusealpha,1);
    OffCommand=cmd(smooth,0.2;y,0;diffusealpha,0);
    LoadActor("box top");
  };
  LoadActor("box bottom")..{
    InitCommand=cmd(y,72);
    OnCommand=cmd(diffusealpha,0;y,0;sleep,0.5;smooth,0.2;y,72;diffusealpha,1);
    OffCommand=cmd(smooth,0.2;y,0;diffusealpha,0);
  };
  LoadActor("1p icon")..{
    InitCommand=cmd(x,124;y,-26);
    OnCommand=cmd(diffusealpha,0;zoomy,0;sleep,0.5;smooth,0.2;zoomy,1;diffusealpha,1);
    OffCommand=cmd(smooth,0.2;zoomy,0;diffusealpha,0);
  };
  LoadActor("1p join text")..{
    InitCommand=cmd(y,-94);
    OnCommand=cmd(diffusealpha,0;y,0;sleep,0.5;smooth,0.2;y,-94;diffusealpha,1);
    OffCommand=cmd(smooth,0.2;y,0;diffusealpha,0);
  };
  LoadActor("join exp")..{
    InitCommand=cmd(xy,-48,-46);
    OnCommand=cmd(diffusealpha,0;zoomy,0;sleep,0.5;smooth,0.2;zoomy,1;diffusealpha,1);
    OffCommand=cmd(smooth,0.2;zoomy,0;diffusealpha,0);
  };
  LoadActor("wait")..{
    InitCommand=cmd(xy,-34,20);
    OnCommand=cmd(diffusealpha,0;zoomy,0;sleep,0.5;smooth,0.2;zoomy,1;diffusealpha,1);
    OffCommand=cmd(smooth,0.2;zoomy,0;diffusealpha,0);
  };
};

--TextBox P2
t[#t+1] = Def.ActorFrame{
  InitCommand=cmd(visible,false;queuecommand,"Show");
  OnCommand=cmd(visible,false;queuecommand,"Show");
  ShowCommand=function(self)
    if GAMESTATE:IsPlayerEnabled(PLAYER_2) then
      self:visible(false)
    else
      self:visible(true)
    end;
  end;
  PlayerJoinedMessageCommand=function(self,param)
    if param.Player == PLAYER_2 then
      self:queuecommand("Show")
    end;
  end;
  InitCommand=cmd(xy,SCREEN_CENTER_X+240,SCREEN_CENTER_Y-54;zoom,1);
  PlayerJoinedMessageCommand=cmd(queuecommand,"Off");
  Def.ActorFrame{
    LoadActor("box mid")..{
      OnCommand=cmd(diffusealpha,0;zoomy,0;sleep,0.5;smooth,0.2;zoomy,1;diffusealpha,1);
      OffCommand=cmd(smooth,0.2;zoomy,0;diffusealpha,0);
    };
    LoadActor("join exp")..{
      InitCommand=cmd(xy,-48,-46);
      OnCommand=cmd(diffusealpha,0;zoomy,0;sleep,0.5;smooth,0.2;zoomy,1;diffusealpha,1);
      OffCommand=cmd(smooth,0.2;zoomy,0;diffusealpha,0);
    };
    LoadActor("wait")..{
      InitCommand=cmd(xy,-34,20);
      OnCommand=cmd(diffusealpha,0;zoomy,0;sleep,0.5;smooth,0.2;zoomy,1;diffusealpha,1);
      OffCommand=cmd(smooth,0.2;zoomy,0;diffusealpha,0);
    };
    LoadActor("../EAmuse/Load 2x2")..{
      InitCommand=cmd(xy,-170,20);
    	OnCommand=cmd(diffusealpha,0;zoomy,0;sleep,0.5;smooth,0.2;zoomy,1;diffusealpha,1;animate,true;);
    	OffCommand=cmd(linear,0.15;diffusealpha,0);
    };
  };
  Def.ActorFrame{
    InitCommand=cmd(y,-94);
    OnCommand=cmd(diffusealpha,0;y,0;sleep,0.5;smooth,0.2;y,-94;diffusealpha,1);
    OffCommand=cmd(smooth,0.2;y,0;diffusealpha,0);
    LoadActor("box top");
  };
  LoadActor("box bottom")..{
    InitCommand=cmd(y,72);
    OnCommand=cmd(diffusealpha,0;y,0;sleep,0.5;smooth,0.2;y,72;diffusealpha,1);
    OffCommand=cmd(smooth,0.2;y,0;diffusealpha,0);
  };
  LoadActor("2p icon")..{
    InitCommand=cmd(x,146;y,-20);
    OnCommand=cmd(diffusealpha,0;zoomy,0;sleep,0.5;smooth,0.2;zoomy,1;diffusealpha,1);
    OffCommand=cmd(smooth,0.2;zoomy,0;diffusealpha,0);
  };
  LoadActor("2p join text")..{
    InitCommand=cmd(y,-94);
    OnCommand=cmd(diffusealpha,0;y,0;sleep,0.5;smooth,0.2;y,-94;diffusealpha,1);
    OffCommand=cmd(smooth,0.2;y,0;diffusealpha,0);
  };
};

t[#t+1] = Def.Actor{
	OnCommand=function(self)
		if GAMESTATE:GetNumPlayersEnabled() == 2 then
			self:queuecommand("Delay1")
		end
	end;
  PlayerJoinedMessageCommand=function(self)
    self:queuecommand("Delay1")
  end;
  Delay1Command=function(self)
    self:sleep(2)
    self:queuecommand("SetScreen")
  end;
  SetScreenCommand=function(self)
    GAMESTATE:SetCurrentStyle("versus")
    SCREENMAN:GetTopScreen():SetNextScreenName("ScreenSelectMusicHappy"):StartTransitioningScreen("SM_GoToNextScreen")
  end;
};

return t;
