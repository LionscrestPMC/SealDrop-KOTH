/*
	File: fn_getData.sqf
	Author: DeadP4xel

	Description:
	SELECT Data from the database
*/
private["_uid","_side","_query","_result","_ownerID"];

// CONVERT DATA
_uid = 		[_this,0,"",[""]] call BIS_fnc_param;
_side = 	[_this,1,sideUnknown,[west]] call BIS_fnc_param;
_ownerID = 	[_this,2,ObjNull,[ObjNull]] call BIS_fnc_param;

// ERROR CHECKS
if(isNull _ownerID) exitWith {};

// QUERY REQUEST
_ownerID = owner _ownerID;
_query = switch(_side) do {
	case west: {
		format ["SELECT playerid, name, side, level, kills, banned, teamkills, xp, deaths FROM players WHERE playerid='%1'",_uid];
	};
	case opfor: {	
		format ["SELECT playerid, name, side, level, kills, banned, teamkills, xp, deaths FROM players WHERE playerid='%1'",_uid];
	};
	case independent: {		
		format ["SELECT playerid, name, side, level, kills, banned, teamkills, xp, deaths FROM players WHERE playerid='%1'",_uid];
	};
};

// SEND DATA TO EXTDB HANDLER
_result = [_query,2] call DB_fnc_queryHandler;

// REQUEST GET => WORK WITH THE DATA AND SELECT
if(typeName _result isEqualTo "STRING") exitWith {[[],"BASIS_fnc_sendNewData",_ownerID,false,true] spawn BIS_fnc_MP;};
if(count _result isEqualTo 0) exitWith {[[],"BASIS_fnc_sendNewData",_ownerID,false,true] spawn BIS_fnc_MP;};

// SELECT DATA AND SEND TO CLIENT
private["_temp"];
_temp = _result select 3;
_result set[3,[_temp] call HELPER_fnc_numberSafe];
_temp = _result select 4;
_result set[4,[_temp] call HELPER_fnc_numberSafe];
_temp = _result select 5;
_result set[5,[_temp] call HELPER_fnc_numberSafe];
_temp = _result select 6;
_result set[6,[_temp] call HELPER_fnc_numberSafe];
_temp = _result select 7;
_result set[7,[_temp] call HELPER_fnc_numberSafe];
_temp = _result select 8;
_result set[8,[_temp] call HELPER_fnc_numberSafe];

// SEND DATA TO CLIENT
[_result,"BASIS_fnc_receiveData",_ownerID,false] spawn BIS_fnc_MP;