/*
  File: fn_syncData.sqf
  Author: DeadP4xel

  Description:
  Sync Player data to server..
*/
private["_cooldown","_sender","_uid"];

_sender = profileName;
_uid = getPlayerUID player;

// Error checks
if(!alive player) exitWith {diag_log format[localize "STR_Script_SyncError",_sender,_uid];};
if(!sd_clientLoad) exitWith {};

if(sd_syncedData) then {
  hintSilent format[localize "STR_Script_SyncCD"];
} else {
  [] call BASIS_fnc_updateData;
  hintSilent format[localize "STR_Script_SyncSuccess",_sender,_uid];
  sd_syncedData = true;
};

if(sd_syncedData) then {
  uiSleep (call sd_syncDataCooldown);
  sd_syncedData = false;
};
