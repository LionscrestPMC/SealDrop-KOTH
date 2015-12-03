/*
	File: fn_setTimeGlobal.sqf
	Author: DeadP4xel

	Description:
	Set the GMT Time and send to all clients..
*/
private["_fileCheck","_timeRaw","_timeArray","_time"];

// ERROR CHECKS
if(!(call sd_timeZoneMaster)) exitWith {diag_log "DATE:: REAL TIME DISABLED"};
_fileCheck = "extDB2" callExtension "9:VERSION";
if(_fileCheck isEqualTo "") exitWith {diag_log "DATE:: EXTDB2.DLL NOT FOUND!"};

// GET AND SET TIME
if(!(call sd_disableRealTime)) then {
	_timeRaw = "extDB2" callExtension format ["9:TIME:%1",(call sd_timeZone)];
	if(typeName _timeRaw isEqualTo "STRING") then {
		_timeArray = (call compile _timeRaw);
		_time = _timeArray select 1;
	};
	if(typeName _timeRaw isEqualTo "ARRAY") then {
		_timeArray = _timeRaw;
		_time = _timeArray select 1;
	};
	setDate _time;
};

if(call sd_disableRealTime) then {
	_dateRaw = "extDB2" callExtension "9:TIME";
	_dateArray = (call compile _dateRaw);
	_year = ((_dateArray select 1) select 0);
	_month = ((_dateArray select 1) select 1);
	_day = ((_dateArray select 1) select 2);

	if(call sd_timeMorning) then {
		setDate [_year,_month,_day,07,00];
	};
	if(call sd_timeNoon) then {
		setDate [_year,_month,_day,12,00];
	};
	if(call sd_timeEvening) then {
		setDate [_year,_month,_day,17,00];
	};
	if(call sd_timeNight) then {
		setDate [_year,_month,_day,21,00];
	};
};