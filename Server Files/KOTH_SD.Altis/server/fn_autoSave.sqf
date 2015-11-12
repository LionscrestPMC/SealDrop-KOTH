/*
	File: fn_autoSave.sqf
	Author: DeadP4xel

	Description:
	Auto Save System
*/
while {true} do {
    uiSleep (call sd_autoSaveTime);
    [] call BASIS_fnc_updateData;
};