/*
	File: fn_insertData.sqf
	Author: DeadP4xel

	Description:
	INSERT Data to the database
*/
private["_uid","_xp","_name","_side","_banned","_sender","_kills","_level","_result","_query"];

// CONVERT DATA
_uid = 				[_this,0,"",[""]] call BIS_fnc_param;
_name = 			[_this,1,"",[""]] call BIS_fnc_param;
_side = 			[_this,2,"",[""]] call BIS_fnc_param;
_level = 			[_this,3,"",[""]] call BIS_fnc_param;
_kills = 			[_this,4,"",[""]] call BIS_fnc_param;
_banned = 			[_this,5,"",[""]] call BIS_fnc_param;
_teamkills = 		[_this,6,"",[""]] call BIS_fnc_param;
_xp =				[_this,7,"",[""]] call BIS_fnc_param;
_deaths =			[_this,8,"",[""]] call BIS_fnc_param;
_sender = 			[_this,9,ObjNull,[ObjNull]] call BIS_fnc_param;
_result = 			"";

// ERROR CHECKS
if((_uid isEqualTo "") OR (_name isEqualTo "")) exitWith {};
if(isNull _sender) exitWith {};

// QUERY REQUEST
_query = format["SELECT playerid, name FROM players WHERE playerid='%1'",_uid];
_result = [_query,2] call DB_fnc_queryHandler;

// ERROR CHECKS 2
if(typeName _result isEqualTo "STRING") exitWith {[[],"BASIS_fnc_sendData",(owner _sender),false] spawn BIS_fnc_MP};
if(count _result != 0) exitWith {[[],"BASIS_fnc_sendData",(owner _sender),false] spawn BIS_fnc_MP;};

// CONVERT DATA
_name 		= 	[_name] call HELPER_fnc_mresString;
_side 		= 	[_side] call HELPER_fnc_mresString;
_level 		= 	[_level] call HELPER_fnc_numberSafe;
_kills 		= 	[_kills] call HELPER_fnc_numberSafe;
_banned 	= 	[_banned] call HELPER_fnc_numberSafe;
_teamkills 	=	[_teamkills] call HELPER_fnc_numberSafe;
_xp 		= 	[_xp] call HELPER_fnc_numberSafe;
_deaths 	= 	[_deaths] call HELPER_fnc_numberSafe;

// INSERT DATA FINAL
_query = format["INSERT INTO players (playerid, name, side, level, kills, banned, teamkills, xp, deaths) VALUES('%1', '%2', '%3', '%4', '%5', '%6', '%7', '%8', '%9')",_uid,_name,_side,_level,_kills,_banned,_teamkills,_xp,_deaths];
[_query,1] call DB_fnc_queryHandler;

// SEND TO CLIENT
[[],"BASIS_fnc_sendData",(owner _sender),false] spawn BIS_fnc_MP;