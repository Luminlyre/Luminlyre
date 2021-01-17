-----------------------------------
-- Area: Selbina
--  NPC: Yaya
-- Starts Quest: Under the sea
-- !pos -19 -2 -16 248
-----------------------------------
require("scripts/globals/quests")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    if player:getFameLevel(SELBINA) >= 2 and player:getQuestStatus(tpz.quest.log_id.OTHER_AREAS, tpz.quest.id.otherAreas.UNDER_THE_SEA) == QUEST_AVAILABLE then
        player:startEvent(31) -- Start quest "Under the sea"
    else
        player:startEvent(153) -- Standard dialog
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    if csid == 31 then
        player:addQuest(tpz.quest.log_id.OTHER_AREAS, tpz.quest.id.otherAreas.UNDER_THE_SEA)
        player:setCharVar("underTheSeaVar", 1)
    end
end

return entity
