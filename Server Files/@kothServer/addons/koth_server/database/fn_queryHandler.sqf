/*
	File: fn_queryHandler.sqf
	Modified: DeadP4xel

	Description:
	Calls an async request to extDB
*/
private["_queryStmt","_result","_key","_mode","_return","_loop"];

// CONVERT DATA
_queryStmt = 		[_this,0,"",[""]] call BIS_fnc_param;
_mode = 			[_this,1,1,[0]] call BIS_fnc_param;
_multiarr = 		[_this,2,false,[false]] call BIS_fnc_param;
_return = 			false;
_result = 			"";

// SEND EXTDB REQUEST AND COLLECT DATA
_key = "extDB2" callExtension format["%1:%2:%3",_mode,(call sd_sql_id),_queryStmt];
if(_mode isEqualTo 1) exitWith {true};
_key = call compile format ["%1",_key];
_key = _key select 1;

// DATA COLLECTED NOW SEND MULTI / SOLO DATA
_loop = true;
while{_loop} do {
	_result = "extDB2" callExtension format ["4:%1",_key];
	if(_result isEqualTo "[5]") then {
		_result = "";
		while {true} do {
			_pipe = "extDB2" callExtension format ["5:%1",_key];
			if(_pipe isEqualTo "") exitWith {_loop = false};
			_result = _result + _pipe;
		};
	} else {
		if(_result isEqualTo "[3]") then {
			uiSleep 0.1;
		} else {
			_loop = false;
		};
	};
};

// DATA CONVERTED FROM QUERY REQUEST
_result = call compile _result;
if(count (_result select 1) == 0) exitWith {[]};
_return = ((_result select 1) select 0);
if(!(_return isEqualTo [])) then {
	_return;
} else {
	_return = "";
	_return;
};
