#define __SVAR__(var1,var2) var1 = compileFinal (if(typeName var2 isEqualTo "STRING") then {var2} else {str(var2)})
/*
    File: init.sqf
    Author: DeadP4xel

    Description:
    Init file for the KOTH client.
*/
private["_handle","_startTime"];
waitUntil {!isNull player && player isEqualTo player};

diag_log "#--------------------------------------------------------------------------------#";
diag_log "#------------------------------ KOTH CLIENT API ---------------------------------#";
diag_log "#--------------------------------------------------------------------------------#";
_startTime = diag_tickTime;

diag_log "SD_CLIENT:: PLAYER READY -> INITIALIZE SCRIPTS";
[] call compile PreProcessFileLineNumbers "client\config.sqf";
diag_log "SD_CLIENT:: CONFIG LOADED";

diag_log "SD_CLIENT:: LOADING PLAYER EVENT HANDLERS";
player addEventHandler["Killed",{_this call sd_fnc_onPlayerKilled}];
player addEventHandler["InventoryOpened",{_this call sd_fnc_inventoryLock}];
player addEventHandler["Respawn",{_this call sd_fnc_onPlayerRespawn}];
diag_log "SD_CLIENT:: PLAYER EVENT HANDLERS LOADED";

diag_log "SD_CLIENT:: LOADING PUBLIC VARIABLE EVENT HANDLERS";
[] call sd_fnc_eventHandler;
diag_log "SD_CLIENT:: PUBLIC VARIABLE EVENT HANDLERS LOADED";

diag_log "SD_CLIENT:: SETTING GRID,VIEWDISTANCE AND OBJECTVIEWDISTANCE";
setTerrainGrid (call sd_terrainGrid);
setViewDistance (call sd_viewDistance);
setObjectViewDistance [(call sd_objectViewDistance),(call sd_shadowRendering)];
diag_log "SD_CLIENT:: GEO DATA SUCCESSFULLY LOADED";

diag_log "SD_CLIENT:: LOADING VEHICLE UNSCRIPT";
[] spawn sd_fnc_unflip;
diag_log "SD_CLIENT:: UNFLIP VEHICLE LOADED";

diag_log "SD_CLIENT:: SETTING UP SAVEZONES";
[] spawn sd_fnc_savezones;
diag_log "SD_CLIENT:: SAVEZONES LOADED";

diag_log "SD_CLIENT:: LOAD POSTPROCESS SCRIPT";
[] call sd_fnc_postProcessing;
diag_log "SD_CLIENT:: HUD EFFECTS LOADED ON PLAYER";

diag_log "SD_CLIENT:: SETTING UP CUSTOM ESCAPE MENU";
[] spawn sd_fnc_escMenu;
diag_log "SD_CLIENT:: ESCAPE MENU SUCCESSFULLY LOADED";

diag_log "SD_CLIENT:: INITIALIZE NO VOICE IN CHAT SCRIPT";
[] spawn sd_fnc_noVoiceChats;
diag_log "SD_CLIENT:: NO VOICE IN SIDE CHAT LOADED";

diag_log "SD_CLIENT:: LOADING BRIEFING";
[] spawn sd_fnc_briefing;
diag_log "SD_CLIENT:: BRIEFING LOADED";

diag_log "SD_CLIENT:: SEARCHING DISPLAY 46 TO LOAD BUTTONS";
waitUntil {!isNull (findDisplay 46)};
(findDisplay 46) displayAddEventHandler ["KeyDown","_this call sd_fnc_buttons"];
diag_log "SD_CLIENT:: KEYBOARD BUTTONS LOADED";

// PLAYER TAGS MAP
if(call sd_playerTagsMap) then {
    diag_log "SD_CLIENT:: SETTING UP PLAYER MAP TAGS";
    ["players"] spawn sd_fnc_mapPlayerTags;
    diag_log "SD_CLIENT:: MAP PLAYER TAGS SCRIPT LOADED";
} else {
    diag_log "SD_CLIENT:: MAP PLAYER TAGS DISABLED";
};

// REAL TIME SCRIPT (GMT)
if(call sd_realTime) then {
    diag_log "SD_CLIENT:: REAL TIME (GMT) ENABLED";
    setDate call compile ("date" callExtension "GMT");
} else {
    diag_log "SD_CLIENT:: REAL TIME (GMT) DISABLED";
};

// FATIGUE SYSTEM
if(call sd_fatigue) then {
    player enableFatigue true;
    diag_log "SD_CLIENT:: FATIGUE SYSTEM ENABLED";
} else {
    player enableFatigue false;
    diag_log "SD_CLIENT:: FATIGUE SYSTEM DISABLED";
};

// AUTO SAVE SYSTEM
if(call sd_autoSaveMaster) then {
    diag_log "SD_CLIENT:: AUTO SAVE ENABLED";
    [] spawn sd_fnc_autoSave;
} else {
    diag_log "SD_CLIENT:: AUTO SAVE DISABLED";
};

// CLIENT IS READY
waitUntil{!isNil "sd_server_isReady"};
[] call BASIS_fnc_sendData;
waitUntil {sd_clientLoad};

if(call sd_loadoutMaster) then {
    [] call LOUT_fnc_loadoutSendRequest;
    diag_log "SD_CLIENT:: LOADOUT SYSTEM ENABLED";
} else {
    diag_log "SD_CLIENT:: LOADOUT SYSTEM DISABLED";
};

diag_log format["SD_CLIENT:: LOADING COMPLETE! TIME ELAPSED %1 SECONDS",(diag_tickTime) - _startTime];
diag_log "#--------------------------------------------------------------------------------#";
diag_log "#---------------------------- KOTH CLIENT FINISHED ------------------------------#";
diag_log "#--------------------------------------------------------------------------------#";

switch(playerSide) do
{
    case west:
    {
        _handle = [] spawn sd_fnc_initWest;
        waitUntil{scriptDone _handle};
    };
    case opfor:
    {
        _handle = [] spawn sd_fnc_initOpfor;
        waitUntil{scriptDone _handle};
    };
    case independent:
    {
        _handle = [] spawn sd_fnc_initIndep;
        waitUntil{scriptDone _handle};
    };
};