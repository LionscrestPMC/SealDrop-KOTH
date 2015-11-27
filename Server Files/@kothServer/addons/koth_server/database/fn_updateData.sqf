/*
	File: fn_updateData.sqf
	Author: DeadP4xel

	Description:
	UPDATE Data to the database
*/
private["_uid","_side","_xp","_banned","_kills","_teamkills","_level","_queryResult","_name","_query"];

// CONVERT DATA
_uid = 				[_this,0,"",[""]] call BIS_fnc_param;
_name = 			[_this,1,"",[""]] call BIS_fnc_param;
_side = 			[_this,2,sideUnknown,[west]] call BIS_fnc_param;
_level = 			[_this,3,0,[0]] call BIS_fnc_param;
_kills = 			[_this,4,0,[0]] call BIS_fnc_param;
_banned = 			[_this,5,0,[0]] call BIS_fnc_param;
_teamkills =		[_this,6,0,[0]] call BIS_fnc_param;
_xp =				[_this,7,0,[0]] call BIS_fnc_param;
_deaths =			[_this,8,0,[0]] call BIS_fnc_param;

// ERROR CHECKS
if((_uid isEqualTo "") OR (_name isEqualTo "")) exitWith {};

// CONVERT DATA
_name 		= [_name] call HELPER_fnc_mresString;
_level 		= [_level] call HELPER_fnc_numberSafe;
_kills 		= [_kills] call HELPER_fnc_numberSafe;
_banned 	= [_banned] call HELPER_fnc_numberSafe;
_teamkills 	= [_teamkills] call HELPER_fnc_numberSafe;
_xp 		= [_xp] call HELPER_fnc_numberSafe;
_deaths 	= [_deaths] call HELPER_fnc_numberSafe;

// QUERY REQUEST
switch (_side) do {
	case west: {_query = format["UPDATE players SET name='%1', side='%2', level='%3', kills='%4', banned='%5', teamkills='%6', xp='%7', deaths='%8' WHERE playerid='%9'",_name,_side,_level,_kills,_banned,_teamkills,_xp,_deaths,_uid];};
	case opfor: {_query = format["UPDATE players SET name='%1', side='%2', level='%3', kills='%4', banned='%5', teamkills='%6', xp='%7', deaths='%8' WHERE playerid='%9'",_name,_side,_level,_kills,_banned,_teamkills,_xp,_deaths,_uid];};
	case independent: {_query = format["UPDATE players SET name='%1', side='%2', level='%3', kills='%4', banned='%5', teamkills='%6', xp='%7', deaths='%8' WHERE playerid='%9'",_name,_side,_level,_kills,_banned,_teamkills,_xp,_deaths,_uid];};
};

// SEND DATA FINAL
_queryResult = [_query,1] call DB_fnc_queryHandler;