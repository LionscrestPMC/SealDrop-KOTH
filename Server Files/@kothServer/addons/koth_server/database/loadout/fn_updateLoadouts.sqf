/*
	File: fn_updateLoadouts.sqf
	Author: DeadP4xel

	Description:
	UPDATE Data to the database
*/
private["_name","_uid","_active","_ld1","_ld2","_ld3","_ld4","_ld5","_queryResult","_query"];

// CONVERT DATA
_name = 			[_this,0,"",[""]] call BIS_fnc_param;
_uid = 				[_this,1,"",[""]] call BIS_fnc_param;
_active = 			[_this,2,"",[""]] call BIS_fnc_param;
_ld1 = 				[_this,3,[],[[]]] call BIS_fnc_param;
_ld2 = 				[_this,4,[],[[]]] call BIS_fnc_param;
_ld3 = 				[_this,5,[],[[]]] call BIS_fnc_param;
_ld4 =				[_this,6,[],[[]]] call BIS_fnc_param;
_ld5 =				[_this,7,[],[[]]] call BIS_fnc_param;

// ERROR CHECKS
if((_uid isEqualTo "") OR (_name isEqualTo "")) exitWith {};

// CONVERT DATA
_name 		= [_name] call HELPER_fnc_mresString;
_active		= [_active] call HELPER_fnc_mresString;
_ld1 		= [_ld1] call HELPER_fnc_mresArray;
_ld2 		= [_ld2] call HELPER_fnc_mresArray;
_ld3 		= [_ld3] call HELPER_fnc_mresArray;
_ld4 		= [_ld4] call HELPER_fnc_mresArray;
_ld5 		= [_ld5] call HELPER_fnc_mresArray;

// QUERY REQUEST
_query = format["UPDATE loadouts SET name='%1', active='%2', loadout_1='%3',loadout_2='%4',loadout_3='%5',loadout_4='%6',loadout_5='%7' WHERE playerid='%8'",_name,_active,_ld1,_ld2,_ld3,_ld4,_ld5,_uid];

// SEND DATA FINAL
_queryResult = [_query,1] call DB_fnc_queryHandler;