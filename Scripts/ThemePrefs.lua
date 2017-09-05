local Prefs =
{
	ConvertHighScores =
	{
		Default = false,
		Choices = {"No", "Yes"},
		Values = {false, true}
	},
	ArcadeColorMode =
	{
		Default = true,
		Choices = {"Arcade Style", "Wii Style"},
		Values = {true, false}
	},
};

ThemePrefs.InitAll(Prefs)

function InitUserPrefs()
	local Prefs = {
		UserPrefGameplayShowStepsDisplay = true,
		UserPrefGameplayShowStepsDisplay = true,
		UserPrefGameplayShowScore = false,
		UserPrefShowLotsaOptions = true,
		UserPrefAutoSetStyle = false,
		UserPrefLongFail = false,
		UserPrefNotePosition = true,
		UserPrefComboOnRolls = false,
		UserPrefProtimingP1 = false,
		UserPrefProtimingP2 = false,
		FlashyCombos = false,
		UserPrefComboUnderField = true,
		UserPrefFancyUIBG = true,
		UserPrefTimingDisplay = true
	}
	for k, v in pairs(Prefs) do
		-- kind of xxx
		local GetPref = type(v) == "boolean" and GetUserPrefB or GetUserPref
		if GetPref(k) == nil then
			SetUserPref(k, v)
		end
	end

	-- screen filter
	setenv("ScreenFilterP1",0)
	setenv("ScreenFilterP2",0)
end

function OptionRowScreenFilter()
	--we use integers equivalent to the alpha value multiplied by 10
	--to work around float precision issues
	local choiceToAlpha = {0, 3, 6, 9}
	local alphaToChoice = {[0]=1, [3]=2, [6]=3, [9]=4}
	local t = {
		Name="Filter",
		LayoutType = "ShowAllInRow",
		SelectType = "SelectOne",
		OneChoiceForAllPlayers = false,
		ExportOnChange = false,
		Choices = { THEME:GetString('OptionNames','Off'),
			THEME:GetString('OptionTitles', 'FilterDark'),
			THEME:GetString('OptionTitles', 'FilterDarker'),
			THEME:GetString('OptionTitles', 'FilterDarkest'),
		 },
		LoadSelections = function(self, list, pn)
			local pName = ToEnumShortString(pn)
			local filterValue = getenv("ScreenFilter"..pName)

			if filterValue ~= nil then
				local val = alphaToChoice[filterValue] or 1
				list[val] = true
			else
				setenv("ScreenFilter"..pName,0)
				list[1] = true
			end
		end,
		SaveSelections = function(self, list, pn)
			local pName = ToEnumShortString(pn)
			local found = false
			for i=1,#list do
				if not found then
					if list[i] == true then
						setenv("ScreenFilter"..pName,choiceToAlpha[i])
						found = true
					end
				end
			end
		end,
	};
	setmetatable(t, t)
	return t
end
local judgmentTransformYs = {
	Standard={normal=-76, reverse=67},
	Old={normal=-30, reverse=30}
}
setmetatable(judgmentTransformYs, {__index=function(this, _) return this.Standard end})

function JudgmentTransformCommand( self, params )
	self:x( 0 )
	self:y( judgmentTransformYs
		[ThemePrefs.Get("JudgmentHeight")]
		[params.bReverse and "reverse" or "normal"] )
end

-- Target Score
function FirstReMIX_TargetScore()
	local t = {
		Name = "FirstReMIX_TargetScore",
		LayoutType = "ShowAllInRow",
		SelectType = "SelectOne",
		OneChoiceForAllPlayers = false,
		ExportOnChange = false,
		Choices = { THEME:GetString('OptionNames','Off'),THEME:GetString('OptionNames','Machine'),THEME:GetString('OptionNames','Personal') },
		LoadSelections = function(self, list, pn)
			local pname = ToEnumShortString(pn);
			local profileGUID = PROFILEMAN:GetProfile(pn):GetGUID();
			if PROFILEMAN:IsPersistentProfile(pn) then
				if ReadPrefFromFile("FirstReMIX_TargetScore_"..profileGUID) ~= nil then
					if GetUserPref("FirstReMIX_TargetScore_" .. profileGUID)=='off' then
						list[1] = true
					elseif GetUserPref("FirstReMIX_TargetScore_" .. profileGUID)=='machine' then
						list[2] = true
					elseif GetUserPref("FirstReMIX_TargetScore_" .. profileGUID)=='personal' then
						list[3] = true
					end
				else
					WritePrefToFile("FirstReMIX_TargetScore_"..profileGUID, 'off');
					list[1] = true
				end;
			else
				if ReadPrefFromFile("FirstReMIX_TargetScore_" .. pname) ~= nil then
					if GetUserPref("FirstReMIX_TargetScore_" .. pname)=='off' then
						list[1] = true
					elseif GetUserPref("FirstReMIX_TargetScore_" .. pname)=='machine' then
						list[2] = true
					elseif GetUserPref("FirstReMIX_TargetScore_" .. pname)=='personal' then
						list[3] = true
					end
				else
					WritePrefToFile("FirstReMIX_TargetScore_" .. pname, 'off')
					list[1] = true
				end
			end;
		end,
		SaveSelections = function(self, list, pn)
			local val;
			local pname = ToEnumShortString(pn);
			local profileGUID = PROFILEMAN:GetProfile(pn):GetGUID();
			if list[1] then
				val='off';
			elseif list[2] then
				val='machine';
			elseif list[3] then
				val='personal';
			end;
			if PROFILEMAN:IsPersistentProfile(pn) then
				WritePrefToFile("FirstReMIX_TargetScore_"..profileGUID, val);
			else
				WritePrefToFile("FirstReMIX_TargetScore_"..pname, val);
			end;
		end
	}
	setmetatable(t, t)
	return t
end

-- Target Score (no profile)
function FirstReMIX_TargetScore_NoProfile()
	local t = {
		Name = "FirstReMIX_TargetScore_NoProfile",
		LayoutType = "ShowAllInRow",
		SelectType = "SelectOne",
		OneChoiceForAllPlayers = false,
		ExportOnChange = false,
		Choices = { THEME:GetString('OptionNames','Off'),THEME:GetString('OptionNames','On')},
		LoadSelections = function(self, list, pn)
			local pname = ToEnumShortString(pn);
			if ReadPrefFromFile("FirstReMIX_TargetScore_" .. pname) ~= nil then
				if GetUserPref("FirstReMIX_TargetScore_" .. pname)=='off' then
					list[1] = true
				elseif GetUserPref("FirstReMIX_TargetScore_" .. pname)=='machine' then
					list[2] = true
				elseif GetUserPref("FirstReMIX_TargetScore_" .. pname)=='personal' then
					list[2] = true
				end
			else
				WritePrefToFile("FirstReMIX_TargetScore_" .. pname, 'off')
				list[1] = true
			end
		end,
		SaveSelections = function(self, list, pn)
			local val;
			local pname = ToEnumShortString(pn);
			if list[1] then
				val='off';
			elseif list[2] then
				val='machine';
			end;
			WritePrefToFile("FirstReMIX_TargetScore_"..pname, val);
		end
	}
	setmetatable(t, t)
	return t
end
