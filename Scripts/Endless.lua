--This is an arbitrary-precision integer using implementation
--of the DDR X endless scoring method.
EndlessScoring = {}

local levelLookup = {3, 6, 8, 10}
setmetatable(levelLookup, {__index=function() return 10 end})

local MAX_SCORE = bn.Int(string.rep('9',30))
function EndlessScoring.Create(level)
    local score = bn.Int(bn.zero)
    local w1Counter = 0
    local noteCounter = 0
    local penaltyCounter = 0
    local tnsReverse = Enum.Reverse(PlayerNumber)
    local lastCombo = 0
    return {
    handleNoteScore = function(noteScore, stageNumber, curCombo)
        if score < MAX_SCORE then
            noteCounter = noteCounter + 1
            
            if noteScore == 'TapNoteScore_W1' then
                w1Counter = w1Counter + 1
            elseif tnsReverse[noteScore] and 
                tnsReverse[noteScore] < tnsReverse['TapNoteScore_W3']
            then
                penaltyCounter = penaltyCounter + math.floor(lastCombo/4)
            end

            local levelFactor
            if level == 1 then
                levelFactor = 2*(stageNumber^3)
            else
                levelFactor = stageNumber^3/levelLookup[level]
            end

            local effectiveNotes = noteCounter - penaltyCounter
            if noteScore == 'TapNoteScore_W1' then
                score = score + bn.Int(math.max(1, 3 * (effectiveNotes+w1Counter) * levelFactor ))
            elseif noteScore == 'TapNoteScore_W2' or noteScore == 'HoldNoteScore_Held' then
                score = score + bn.Int(math.max(1, 2 * effectiveNotes * levelFactor))
            elseif noteScore == 'TapNoteScore_W3' then
                score = score + bn.Int(math.max(1, effectiveNotes * levelFactor))
            end

            if score > MAX_SCORE then score = bn.Int(MAX_SCORE) end
            lastCombo = curCombo
        end
    end,
    getScoreString= function()
        return score:tostring()
    end
    }
end

Endless = {}

function Endless.GetSongChartBlock(stepsType, minLevel, maxLevel)
    local ret = {}
    assert(minLevel <= maxLevel)
    for _, song in pairs(SONGMAN:GetAllSongs()) do
        if UNLOCKMAN:IsSongLocked(song) == 0 then
            for _, steps in pairs(song:GetStepsByStepsType(stepsType)) do
                if not (steps:GetDifficulty() == 'Difficulty_Edit') then
                    local meter = steps:GetMeter()
                    if (meter >= minLevel) and (meter <= maxLevel) then
                        table.insert(ret, {song, steps})
                    end
                end
            end
        end
    end
    return ret
end

--The first four are Lv. 1-4, the fifth is All, and the sixth is the unlockable
--Lv. 5.
local levelToRange = {
    {1,3},
    {3,5},
    {5,7},
    {7,9},
    {1,math.huge},
    {9,math.huge}
}

function Endless.CreateState(stepsType, endlessLevel, breakStages)
    assert((breakStages > 0) and stepsType and (endlessLevel >= 1) and (endlessLevel <= 6))
    local minLevel, maxLevel = unpack(levelToRange[endlessLevel])
    return {scoring=EndlessScoring.Create(endlessLevel), 
        choiceDeck = MakeDeck(Endless.GetSongChartBlock(stepsType, minLevel, maxLevel)),
        breakAfter=breakStages}
end