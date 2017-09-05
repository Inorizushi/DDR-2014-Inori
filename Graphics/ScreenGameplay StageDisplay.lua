-- Base from DDR 5thMix by AJ 187

local stages = Def.ActorFrame {
	BeginCommand=cmd(playcommand,"Set";);
	CurrentSongChangedMessageCommand=cmd(finishtweening;playcommand,"Set";);
};

local ScreenName = Var "LoadingScreen";

function MakeBitmapText()
	return LoadFont("_arial Bold 24px") .. {
		InitCommand=cmd(zoomx,2;zoomy,1;maxwidth,144);
	};
end

local sStage = GAMESTATE:GetCurrentStage();
local song = GAMESTATE:GetCurrentSong();

local tRemap = {
	Stage_1st		= 1,
	Stage_2nd		= 2,
	Stage_3rd		= 3,
	Stage_4th		= 4,
	Stage_5th		= 5,
	Stage_6th		= 6,
};

-- Long or Marathon for Final
if tRemap[sStage] == PREFSMAN:GetPreference("SongsPerPlay") then
	sStage = "Stage_Final";
elseif not GAMESTATE:IsEventMode() and song:IsLong() and tRemap[sStage]+1 == PREFSMAN:GetPreference("SongsPerPlay") then
	sStage = "Stage_Final";
elseif not GAMESTATE:IsEventMode() and song:IsMarathon() and tRemap[sStage]+2 == PREFSMAN:GetPreference("SongsPerPlay") then
	sStage = "Stage_Final";
else
	sStage = sStage;
end;

if not Is2ndMIX() then
for s in ivalues(Stage) do
	stages[#stages+1] = MakeBitmapText() .. {
		SetCommand=function(self, params)
			local curStage = GAMESTATE:GetCurrentStage();
			self:visible( curStage == s );

			local stageColor, stageText;
			if GAMESTATE:IsEventMode() and not GAMESTATE:IsCourseMode() then
				local iStage = GAMESTATE:GetCurrentStageIndex()+1
				stageText = FormatNumberAndSuffix(iStage)
				if iStage < 3 then
					stageColor = StageToColor('Stage_'..stageText)
				else
					stageColor = StageToColor('Stage_Next')
				end;

--			elseif GAMESTATE:GetPlayMode() == 'PlayMode_Nonstop' then

--[[
			elseif GAMESTATE:IsCourseMode() then
				local iStage = GAMESTATE:GetCurrentStageIndex()+1
				stageText = FormatNumberAndSuffix(iStage)
				if iStage < 3 then
					stageColor = StageToColor('Stage_'..stageText)
				else
					stageColor = StageToColor('Stage_Next')
				end;
--]]

			-- コースモードのステージ数のカウントがされない。とりあえず表示させないでおく。対応できたら表示させる↑上の奴
			elseif GAMESTATE:IsCourseMode() then
				stageText = "";

			else
				stageText = StageToLocalizedString(sStage);
				stageColor = StageToColor(curStage);
			end;
			self:settext( stageText );

		end;

	}
end
end;

return stages;
