/*
	File: fn_loadoutChange.sqf
	Author: DeadP4xel

	Description:
	Load gear after pressing on change gear button
*/
disableSerialization;
// ERROR CHECKS
if(isNull player OR !alive player) exitWith {};
if(isNull (findDisplay 75000)) exitWith {};

if((lbCurSel 75004) isEqualTo -1) exitWith {hintSilent "Please select a loadout slot!"};

if((lbCurSel 75004) isEqualTo 0) then {
	if(sd_loadout_1 isEqualTo []) exitWith {hintSilent "Empty Slot!"};
	[sd_loadout_1] spawn LOUT_fnc_loadoutWear;
};
if((lbCurSel 75004) isEqualTo 1) then {
	if(sd_loadout_2 isEqualTo []) exitWith {hintSilent "Empty Slot!"};
	[sd_loadout_2] spawn LOUT_fnc_loadoutWear;
};
if((lbCurSel 75004) isEqualTo 2) then {
	if(sd_loadout_3 isEqualTo []) exitWith {hintSilent "Empty Slot!"};
	[sd_loadout_3] spawn LOUT_fnc_loadoutWear;
};
if((lbCurSel 75004) isEqualTo 3) then {
	if(sd_loadout_4 isEqualTo []) exitWith {hintSilent "Empty Slot!"};
	[sd_loadout_4] spawn LOUT_fnc_loadoutWear;
};
if((lbCurSel 75004) isEqualTo 4) then {
	if(sd_loadout_5 isEqualTo []) exitWith {hintSilent "Empty Slot!"};
	[sd_loadout_5] spawn LOUT_fnc_loadoutWear;
};