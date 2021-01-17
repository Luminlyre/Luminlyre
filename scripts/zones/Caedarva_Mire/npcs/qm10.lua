-----------------------------------
-- Area: Caedarva Mire
--  NPC: qm10
-- Involved in quest: Operation Teatime
-- !pos 473 -31 75 79
-----------------------------------
local ID = require("scripts/zones/Caedarva_Mire/IDs")
require("scripts/globals/npc_util")
require("scripts/globals/quests")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local OperationTeatime = player:getQuestStatus(tpz.quest.log_id.AHT_URHGAN, tpz.quest.id.ahtUrhgan.OPERATION_TEATIME)
    local OperationTeatimeProgress = player:getCharVar("OperationTeatimeProgress")

    if OperationTeatime == QUEST_ACCEPTED and OperationTeatimeProgress == 3 then
        player:startEvent(15)
    else
        player:messageSpecial(ID.text.NOTHING_OUT_OF_ORDINARY)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    if csid == 15 then
        npcUtil.completeQuest(player, AHT_URHGAN, tpz.quest.id.ahtUrhgan.OPERATION_TEATIME, {item=15602, var="OperationTeatimeProgress"})
    end
end

return entity
