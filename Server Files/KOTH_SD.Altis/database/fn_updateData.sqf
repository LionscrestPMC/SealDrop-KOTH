/*
	File: fn_updateData.sqf
	Author: DeadP4xel

	Description:
	Update the player informations in the database
*/
private["_query","_array"];

// GET DATA AND COMPILE
_query = [getPlayerUID player,(profileName),playerSide,sd_level,sd_kills,sd_punishBan,sd_punish_warnings,sd_xp,sd_deaths];
_array = [];
_query pushBack _array;

// SEND REQUEST TO SERVER
[_query,"DB_fnc_updateData",false,false] spawn BIS_fnc_MP;