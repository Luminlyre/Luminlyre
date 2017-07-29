---------------------------------------------------------------------------------------------------
-- func: completemission <logID> <missionID> <player>
-- desc: Completes the given mission for the target player, if that mission is currently active.
---------------------------------------------------------------------------------------------------

require("scripts/globals/missions");

cmdprops =
{
    permission = 1,
    parameters = "sss"
};

function onTrigger(player, logId, missionId, target)
    if (missionId == nil or logId == nil) then
        player:PrintToPlayer( "You must enter a valid log id and mission id!" );
        player:PrintToPlayer( "@completemission <logID> <missionID> <player>" );
        return;
    end

    local logName;
    logId = tonumber(logId) or _G[string.upper(logId)];
    if ((type(logId) == "table")) then
        logName = logId.full_name;
        logId = logId.mission_log;
    end

    missionId = tonumber(missionId) or _G[string.upper(missionId)];

    local targ;
    if (target == nil) then
        targ = player;
    else
        targ = GetPlayerByName(target);
    end

    if (targ ~= nil) then
        targ:completeMission( logId, missionId );
        if (logName) then
            player:PrintToPlayer( string.format( "Completed %s Mission with ID %u for %s", logName, missionId, target ) );
        else
            player:PrintToPlayer( string.format( "Completed Mission for log %u with ID %u for %s", logId, missionId, target ) );
        end
    else
        player:PrintToPlayer( string.format( "Player named '%s' not found!", target ) );
        player:PrintToPlayer( "@completemission <logID> <missionID> <player>" );
    end
end;
