/*
	File: fn_loadoutGetData.sqf 
	Author: DeadP4xel

	Description:
	Got Data from the server.
*/

// PARSE DATA TO VARIABLES
sd_activeProfile = parseText(_this select 2);
sd_loadout_1 = _this select 3;
sd_loadout_2 = _this select 4;
sd_loadout_3 = _this select 5;
sd_loadout_4 = _this select 6;
sd_loadout_5 = _this select 7;