local t = Def.ActorFrame{};

t[#t+1] = Def.ActorFrame{
  LoadActor("base");
  LoadActor("hl")..{
    InitCommand=cmd(diffusealpha,0);
    OnCommand=cmd(smooth,0.3;diffusealpha,1;diffuseshift;effectcolor1,color("1,1,1,1");effectcolor2,color("1,1,1,0");effectclock,'beatnooffset');
  };
};

return t;
