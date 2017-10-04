local group;

local t = Def.ActorFrame{
	Def.Sprite {
		SetMessageCommand=function(self,params)
		group = params.Text;
		local so = GAMESTATE:GetSortOrder();
			if group then
				if group_name[group] ~= nil then
					self:Load(THEME:GetPathG("","_jackets/group/"..group_name[group]..".png"))
					self:diffusealpha(1);
					self:y(-2)
				else
					self:Load(THEME:GetPathG("","MusicWheelItem SectionCollapsed NormalPart/Backing.png"));
					self:y(-2)
					self:diffusealpha(1):setsize(174,210)
				end;
			end;
		end;
	};
	Def.Sprite{
		SetMessageCommand=function(self,params)
		group = params.Text;
		local so = GAMESTATE:GetSortOrder();
		local group_extender1 = group_name[group];
		local group_extender2 = group_extend[group_extender1];
			if group then
				if so == "SortOrder_Group" then
					if group_name[group] ~= nil then
						self:Load(THEME:GetPathG("","_jackets/group/_extend/"..group_extender2..".png"))
						self:diffusealpha(1)
						self:x(73):y(-2)
					else
						self:Load(THEME:GetPathG("","MusicWheelItem SectionExpanded NormalPart/Backing.png"));
						self:x(0):y(-2)
						self:diffusealpha(1)
					end;
				end;
			end;
		end;
	};
			Def.Quad{
				InitCommand=cmd(scaletoclipped,128,138;addx,-4;addy,4;diffusealpha,0;diffuse,color("0,0,0,1"));
				SetMessageCommand=function(self,params)
						group = params.Text;
				if group then
					if group_name[group] ~= nil then
						self:diffusealpha(0);
					else
						self:diffusealpha(1);
						self:fadebottom(0.75)
					end;
				else
					-- call fallback
					self:diffusealpha(0.5);
				end;

			end;
			};
			Def.Banner {
			Name="SongBanner";
			InitCommand=cmd(scaletoclipped,128,128;addx,-4;addy,2;diffusealpha,0);
			SetMessageCommand=function(self,params)
				local pt_text = params.Text;
				local	group = params.Text;
				if group then
					if params.HasFocus then
						setenv("getgroupname",pt_text);
					end;
					if group_name[group] ~= nil then
						self:Load( THEME:GetPathG("","_No banner") );
						self:diffusealpha(0);
					else
						self:LoadFromSongGroup(group);
						self:diffusealpha(1);
					end;
				else
					-- call fallback
					self:Load( THEME:GetPathG("","_No banner") );
					self:diffusealpha(1);
				end;

			end;
		};
		LoadFont("_itc avant garde std bk 20px")..{
		InitCommand=cmd(y,-84;addx,-5;maxwidth,150);
		SetMessageCommand=function(self, params)
			local song = params.Song;
			group = params.Text;
		local so = GAMESTATE:GetSortOrder();
		if group_name[group] ~= nil then
			self:settext("");
		else
			if so == "SortOrder_Group" then
			self:settext(group);
			self:strokecolor(color("#000000"))
			self:diffuse(color("#000000"));
			else
			self:settext("");
			end;
		end;
		end;
	};
			LoadFont("_itc avant garde std bk 20px")..{
			InitCommand=cmd(y,-86;addx,-5;maxwidth,150);
			SetMessageCommand=function(self, params)
				local song = params.Song;
				group = params.Text;
			local so = GAMESTATE:GetSortOrder();
			if group_name[group] ~= nil then
				self:settext("");
			else
				if so == "SortOrder_Group" then
				self:settext(group);
				self:strokecolor(color("#000000"))
				self:diffuse(color("#FFFFFF"));
				else
				self:settext("");
				end;
			end;
			end;
		};
	};
	return t;
