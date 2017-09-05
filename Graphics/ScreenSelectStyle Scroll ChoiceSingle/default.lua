local lang = "us";
local t = Def.ActorFrame {};

if THEME:GetCurLanguage() == "ja" then
	lang = "jp";
end;

local path = THEME:GetAbsolutePath("Graphics/ScreenSelectStyle Scroll ChoiceSingle/")

--Info
t[#t+1] = Def.ActorFrame{
  InitCommand=cmd(x,244;y,-134;);
  LoadActor(THEME:GetPathG("","_sharedX3/SelectStyle/infomiddle"))..{
    OnCommand=function(self)
      if GAMESTATE:GetNumPlayersEnabled() == 1 then
        self:queuecommand("On1");
      else
        self:diffusealpha(0);
      end;
    end;
    On1Command=cmd(diffusealpha,0;zoomy,0;sleep,0.5;smooth,0.2;zoomy,1;diffusealpha,0.5);
    OffCommand=cmd(smooth,0.1;zoomy,0;diffusealpha,0);
    GainFocusCommand=cmd(diffusealpha,0;zoomy,0;smooth,0.2;zoomy,1;diffusealpha,0.5);
    LoseFocusCommand=cmd(queuecommand,"Off");
  };
	Def.Sprite{
		InitCommand=cmd(y,-24;playcommand,"Set");
		OnCommand=function(self)
      if GAMESTATE:GetNumPlayersEnabled() == 1 then
        self:queuecommand("On1");
      else
        self:diffusealpha(0);
      end;
    end;
		SetCommand=function(self)
			if lang == "us" then
				self:Load(path.."e_text.png");
			else
				self:Load(path.."j_text.png")
			end;
		end;
		On1Command=cmd(diffusealpha,0;sleep,0.55;smooth,0.2;diffusealpha,1);
    OffCommand=cmd(smooth,0.1;diffusealpha,0);
    GainFocusCommand=cmd(diffusealpha,0;sleep,0.1;smooth,0.2;diffusealpha,1);
    LoseFocusCommand=cmd(queuecommand,"Off");
	};
  LoadActor("infoPad")..{
    InitCommand=cmd(xy,189,34);
    OnCommand=function(self)
      if GAMESTATE:GetNumPlayersEnabled() == 1 then
        self:queuecommand("On1");
      else
        self:diffusealpha(0);
      end;
    end;
    On1Command=cmd(diffusealpha,0;sleep,0.55;smooth,0.2;diffusealpha,1);
    OffCommand=cmd(smooth,0.1;diffusealpha,0);
    GainFocusCommand=cmd(diffusealpha,0;sleep,0.1;smooth,0.2;diffusealpha,1);
    LoseFocusCommand=cmd(queuecommand,"Off");
  };
  Def.ActorFrame{
    InitCommand=cmd(y,-94);
    OnCommand=function(self)
      if GAMESTATE:GetNumPlayersEnabled() == 1 then
        self:queuecommand("On1");
      else
        self:diffusealpha(0);
      end;
    end;
    On1Command=cmd(diffusealpha,0;y,0;sleep,0.5;smooth,0.2;y,-94;diffusealpha,1);
    OffCommand=cmd(smooth,0.1;y,0;diffusealpha,0);
    GainFocusCommand=cmd(diffusealpha,0;y,0;smooth,0.2;y,-94;diffusealpha,1);
    LoseFocusCommand=cmd(queuecommand,"Off");
    LoadActor(THEME:GetPathG("","_sharedX3/SelectStyle/infotop"));
    Def.Sprite{
      InitCommand=cmd(x,-50;playcommand,"Set");
      SetCommand=function(self)
        if lang == "us" then
          self:Load(path.."e_title.png");
        else
          self:Load(path.."j_title.png")
        end;
      end;
    }
  };
  LoadActor(THEME:GetPathG("","_sharedX3/SelectStyle/infobottom"))..{
    InitCommand=cmd(y,72);
    OnCommand=function(self)
      if GAMESTATE:GetNumPlayersEnabled() == 1 then
        self:queuecommand("On1");
      else
        self:diffusealpha(0);
      end;
    end;
    On1Command=cmd(diffusealpha,0;y,0;sleep,0.5;smooth,0.2;y,72;diffusealpha,1);
    OffCommand=cmd(smooth,0.1;y,0;diffusealpha,0);
    GainFocusCommand=cmd(diffusealpha,0;y,0;smooth,0.2;y,72;diffusealpha,1);
    LoseFocusCommand=cmd(queuecommand,"Off");
  };
};

t[#t+1] = Def.ActorFrame {
  GainFocusCommand=cmd(stoptweening;smooth,0.3;y,0;zoom,1);
  LoseFocusCommand=cmd(stoptweening;smooth,0.3;y,100;zoom,1);
  Def.ActorFrame{
    OnCommand=cmd(zoom,0;sleep,0.5;linear,0.1;diffusealpha,1.0;zoom,1;smooth,0.1;zoom,0.9;smooth,0.1;zoom,1);
    LoadActor("offPad.png")..{
      InitCommand=cmd(x,18;y,90);
      OffCommand=cmd(smooth,0.2;zoom,0;diffuse,color("0,0,0,0");diffusealpha,0);
    };
    LoadActor("Pad.png")..{
      InitCommand=cmd(x,18;y,90);
      OffCommand=cmd(smooth,0.2;zoom,0;diffuse,color("0,0,0,0");diffusealpha,0);
      GainFocusCommand=cmd(smooth,0.3;diffusealpha,1;diffuseshift;effectcolor1,color("1,1,1,1");effectcolor2,color("1,1,1,0");effectperiod,2);
      LoseFocusCommand=cmd(diffusealpha,0;stopeffect);
    };
  };
  LoadActor("Character") .. {
    InitCommand=cmd(diffusealpha,0;zoomx,1;x,-8);
    OffCommand=cmd(smooth,0.2;zoom,0;diffuse,color("0,0,0,0");diffusealpha,0);
    OnCommand=cmd(sleep,0.6;linear,0.1;diffusealpha,1;zoomy,0.8;linear,0.1;zoomy,1;zoomx,1.2;linear,0.1;zoomx,1);
  };
};

t[#t+1] = Def.ActorFrame{
  Def.Sprite{
    InitCommand=cmd(diffusealpha,0;x,158;y,-190;zoom,1.75;playcommand,"Set");
    SetCommand=function(self)
      if lang == "us" then
        self:Load(path.."e_title small.png");
      else
        self:Load(path.."j_title small.png")
      end;
    end;
    MenuLeftP1MessageCommand=cmd(playcommand,"Change1");
    MenuLeftP2MessageCommand=cmd(playcommand,"Change1");
    MenuRightP1MessageCommand=cmd(playcommand,"Change1");
    MenuRightP2MessageCommand=cmd(playcommand,"Change1");
    MenuUpP1MessageCommand=cmd(playcommand,"Change1");
    MenuUpP2MessageCommand=cmd(playcommand,"Change1");
    MenuDownP1MessageCommand=cmd(playcommand,"Change1");
    MenuDownP2MessageCommand=cmd(playcommand,"Change1");
    OnCommand=function(self)
      if GAMESTATE:GetNumPlayersEnabled() == 2 then
        local env = GAMESTATE:Env()
        env.SINGLESELECT = false
        self:playcommand("Change1")
      else
        self:queuecommand("GainFocus")
      end;
    end;
    Change1Command=function(self)
      local env = GAMESTATE:Env()
      if env.SINGLESELECT then
        self:queuecommand("GainFocus")
      else
        self:finishtweening():linear(0.1):cropright(1):sleep(0.3):queuecommand("Change2")
      end;
    end;
    Change2Command=cmd(zoomy,1.75;cropright,1;diffusealpha,1;linear,0.2;cropright,0;queuecommand,"Animate");
    GainFocusCommand=function(self)
      local env = GAMESTATE:Env()
      env.SINGLESELECT = true
      self:stoptweening():linear(0.1):zoomy(0)
    end;
    LoseFocusCommand=function(self)
      local env = GAMESTATE:Env()
      env.SINGLESELECT = false
    end;
    AnimateCommand=cmd(linear,0.1;rotationz,3;linear,0.1;rotationz,-3;linear,0.1;rotationz,3;linear,0.1;rotationz,-3;linear,0.1;rotationz,0;sleep,1;queuecommand,"Animate");
    OffCommand=cmd(stoptweening;smooth,0.2;zoom,0;diffusealpha,0;);
  };
};

return t;
