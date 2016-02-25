/*
	File: fn_initWest.sqf
	Author: DeadP4xel

	Description:
	Master Init for Blufor sides
*/
private["_player","_handle"];
_player = player;

// TEAMKILL BAN CHECK
if((sd_punishBan isEqualTo 1) OR (sd_punish_warnings >= (call sd_punish_warningsMax))) exitWith {["Teamkill",false,true] call BIS_fnc_endMission};

// BLACKLIST CHECK
_blacklistCheck = [_player] call sd_fnc_blacklistCheck;
if(_blacklistCheck) exitWith {["Blacklisted",false,true] call BIS_fnc_endMission};

_handle = [] spawn sd_fnc_removeGear;
waitUntil {scriptDone _handle};
// ADD DEFAULT GEAR
_player forceAddUniform "U_B_CombatUniform_mcam";
_player addVest "V_PlateCarrier1_rgr";
for "_i" from 1 to 5 do {_player addItemToVest "16Rnd_9x21_Mag";};
for "_i" from 1 to 6 do {_player addItemToVest "30Rnd_65x39_caseless_mag";};
for "_i" from 1 to 3 do {_player addItemToVest "Chemlight_blue";};
_player addBackpack "B_AssaultPack_mcamo";
_player addHeadgear "H_Booniehat_mcamo";
_player addGoggles "G_Combat";
_player addWeapon "arifle_MX_F";
_player addPrimaryWeaponItem "acc_flashlight";
_player addPrimaryWeaponItem "optic_Holosight";
_player addWeapon "hgun_P07_F";
_player linkItem "ItemMap";
_player linkItem "ItemCompass";
_player linkItem "ItemWatch";
_player linkItem "ItemGPS";
_player linkItem "NVGoggles";

// SET POSITION
if(!sd_firstSpawn) then {
	_player setPos (getMarkerPos "respawn_west");
	_player setDir (markerDir "respawn_west");
};
_handle = [] spawn sd_fnc_introCamera;
waitUntil {scriptDone _handle};
sd_spawned = true;
if(sd_spawned) then {
	diag_log format["SD_CLIENT:: PLAYER %1 (UID: %2) SPAWNED AS %3 ON GRID: %4 (POSITION: %5)",profileName,getPlayerUID player,side player,mapGridPosition player,getPos player];
};

[] call sd_fnc_hudCreate;

//Dynamic Groups - Bohemia Interactive
["Initialize"] call BIS_fnc_dynamicGroups;