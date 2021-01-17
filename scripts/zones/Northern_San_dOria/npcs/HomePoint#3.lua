-----------------------------------
-- Area: Northern San dOria
--  NPC: HomePoint#3
-- !pos 70 -0.2 10 231
-----------------------------------
require("scripts/globals/homepoint")
-----------------------------------
local entity = {}

local hpEvent = 8702
local hpIndex = 5

entity.onTrigger = function(player, npc)
    tpz.homepoint.onTrigger(player, hpEvent, hpIndex)
end

entity.onEventUpdate = function(player, csid, option)
    tpz.homepoint.onEventUpdate(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    tpz.homepoint.onEventFinish(player, csid, option, hpEvent)
end

return entity
