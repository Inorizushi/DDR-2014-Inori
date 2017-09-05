local t = Def.ActorFrame{};

if Is2ndMIX() then
  t[#t+1] = Def.ActorFrame{
    LoadActor("2nd");
  };
else
  t[#t+1] = Def.ActorFrame{
    LoadActor("X3");
  };
end;

return t
