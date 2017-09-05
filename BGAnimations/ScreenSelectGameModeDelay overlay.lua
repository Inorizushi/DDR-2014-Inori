local t = Def.ActorFrame{};

if Is2ndMIX() then
  t[#t+1] = Def.Actor{
    OnCommand=function(self)
      SOUND:StopMusic()
    end;
  };
  t[#t+1] = LoadActor("_2ndDoorsclose");
  t[#t+1] = LoadActor("failed")..{
    OnCommand=cmd(play);
  };
end;

return t;
