local t = Def.ActorFrame{};

if not Is2ndMIX() then
  t[#t+1] = LoadActor("normal");
else
  t[#t+1] = LoadActor("2nd.lua");
end;

return t;
