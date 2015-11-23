/*
	File: fn_loadoutUpdate.sqf 
	Author: DeadP4xel

	Description:
	Insert Loadout to database
*/
private["_packet"];
disableSerialization;

// ERROR CHECKS
if(!alive player OR isNull player) exitWith {};
if(sd_loadoutSyncCooldown) exitWith {};


// PREPARE THE PACKET
_packet = [(profileName),getPlayerUID player,(str sd_activeProfile),sd_loadout_1,sd_loadout_2,sd_loadout_3,sd_loadout_4,sd_loadout_5];

// SEND PACKET TO SERVER 
[_packet,"LOUTS_fnc_updateLoadouts",false,false] spawn BIS_fnc_MP;

sd_loadoutSyncCooldown = true;
((findDisplay 75000) displayCtrl 75002) ctrlEnable false;
((findDisplay 75000) displayCtrl 75002) ctrlSetText "COOLDOWN";
uiSleep 180;
sd_loadoutSyncCooldown = false;