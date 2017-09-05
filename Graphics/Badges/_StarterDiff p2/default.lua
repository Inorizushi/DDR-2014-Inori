local t = Def.ActorFrame{};

t[#t+1] = Def.ActorFrame{
  LoadActor("base")..{
    InitCommand=cmd(y,-60);
  };
  LoadActor("text sel")..{
    InitCommand=cmd(x,5);
  };
};

return t;
