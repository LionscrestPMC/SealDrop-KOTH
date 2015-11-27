/*
	File: fn_loadoutHandler.sqf
	Author: DeadP4xel

	Description:
	SELECT Data from the database
*/
private["_uid","_loadout","_query","_result","_ownerID"];

// CONVERT DATA
_uid = 		[_this,0,"",[""]] call BIS_fnc_param;
_ownerID = 	[_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;

// ERROR CHECKS
if(isNull _ownerID) exitWith {};

// QUERY REQUEST
_ownerID = owner _ownerID;
_query = format["SELECT name, playerid, active, loadout_1, loadout_2, loadout_3, loadout_4, loadout_5 FROM loadouts WHERE playerid='%1'",_uid];


// SEND DATA TO EXTDB HANDLER
_result = [_query,2] call DB_fnc_queryHandler;

// REQUEST GET => WORK WITH THE DATA AND SELECT
if(typeName _result isEqualTo "STRING") exitWith {[[],"LOUT_fnc_loadoutInsertPlayer",_ownerID,false,true] spawn BIS_fnc_MP};
if(count _result isEqualTo 0) exitWith {[[],"LOUT_fnc_loadoutInsertPlayer",_ownerID,false,true] spawn BIS_fnc_MP};

// SELECT DATA AND SEND TO CLIENT
private["_temp","_loadout"];
_temp = _result select 2;
_result set[2,[_temp] call HELPER_fnc_numberSafe];

_loadout = [(_result select 3)] call HELPER_fnc_mresToArray;
if(typeName _loadout == "STRING") then {_loadout = call compile format["%1",_loadout]};
_result set[3,_loadout];

_loadout = [(_result select 4)] call HELPER_fnc_mresToArray;
if(typeName _loadout == "STRING") then {_loadout = call compile format["%1",_loadout]};
_result set[4,_loadout];

_loadout = [(_result select 5)] call HELPER_fnc_mresToArray;
if(typeName _loadout == "STRING") then {_loadout = call compile format["%1",_loadout]};
_result set[5,_loadout];

_loadout = [(_result select 6)] call HELPER_fnc_mresToArray;
if(typeName _loadout == "STRING") then {_loadout = call compile format["%1",_loadout]};
_result set[6,_loadout];

_loadout = [(_result select 7)] call HELPER_fnc_mresToArray;
if(typeName _loadout == "STRING") then {_loadout = call compile format["%1",_loadout]};
_result set[7,_loadout];


// SEND DATA TO CLIENT
[_result,"LOUT_fnc_loadoutGetData",_ownerID,false] spawn BIS_fnc_MP;