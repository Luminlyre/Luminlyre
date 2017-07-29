---------------------------------------------------------------------------------------------------
-- func: delkeyitem
-- desc: Deletes the given key item from the player.
---------------------------------------------------------------------------------------------------

require("scripts/globals/keyitems");

cmdprops =
{
    permission = 1,
    parameters = "ss"
};

function onTrigger(player, keyId, target)
    if (keyId == nil or keyId == 0) then
        player:PrintToPlayer("You must enter a valid keyitem ID.");
        player:PrintToPlayer( "@delkeyitem <ID> <player>" );
        return;
    end

    keyId = tonumber(keyId) or _G[string.upper(keyId)];

    local targ;
    if (target == nil) then
        targ = player;
    else
        targ = GetPlayerByName(target);
    end

    if (targ ~= nil) then
        -- Load needed text ids for players current zone..
        local TextIDs = "scripts/zones/" .. targ:getZoneName() .. "/TextIDs";
        package.loaded[TextIDs] = nil;
        require(TextIDs);

        targ:delKeyItem( keyId );
        targ:messageSpecial(KEYITEM_OBTAINED + 1, keyId);
        player:PrintToPlayer( string.format( "Keyitem ID '%s' deleted from player '%s'.", keyId, target));
    else
        player:PrintToPlayer( string.format( "Player named '%s' not found!", target ) );
        player:PrintToPlayer( "@delkeyitem <ID> <player>" );
    end
end;
