/*
	File: fn_setTimeGlobal.sqf
	Author: DeadP4xel

	Description:
	Set the GMT Time and send to all clients..
*/
// ERROR CHECKS
if(!(call sd_timeZoneMaster)) exitWith {diag_log "DATE:: REAL TIME DISABLED"};

_dllCheckExtDB = "extDB2" callExtension "9:VERSION";

//NEW TIME SYSTEM (extDB Version >67)
if((parseNumber _dllCheckExtDB) >= 68) then {
	private ["_timeRaw","_dateRaw","_time","_timeArray","_year","_month","_day"];

	// DLL CHECK EXTDB
	if(_dllCheckExtDB isEqualTo "") exitWith {diag_log "DATE:: EXTDB2.DLL NOT FOUND"};

	// GET TIME AND DATE
	_timeRaw = "extDB2" callExtension format ["9:TIME:%1",(call sd_timeZone)];
	_dateRaw = "extDB2" callExtension "9:TIME";

	// GET AND SET TIME
	if(!(call sd_disableRealTime)) then {
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
};

// OLD DATE SYSTEM
if(((parseNumber _dllCheckExtDB) < 68) && (call sd_disableRealTime)) then {
	private ["_timeDate","_year","_month","_day"];

	// DLL CHECK DATE
	_dllCheckDate = "date" callExtension "GMT";
	if(_dllCheckDate isEqualTo "") exitWith {diag_log "DATE:: DATE.DLL NOT FOUND"};

	// GET TIME AND DATE
	_timeDate = "date" callExtension "GMT";
	_timeCompiled = (call compile _timeDate);

	_year = _timeCompiled select 0;
	_month = _timeCompiled select 1;
	_day = _timeCompiled select 2;

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

if(((parseNumber _dllCheckExtDB) < 68) && !(call sd_disableRealTime)) then {
	private ["_timeDate","_timeDateCompiled","_time","_year","_month","_day","_hour","_minute"];
	_timeDate = "date" callExtension "GMT";
	_timeDateCompiled = call compile _timeDate;

	if((call sd_timeZone) <= 0) then {
		_time = _timeDateCompiled;
		setDate _time;
	} else {
		_year = _timeDateCompiled select 0;
		_month = _timeDateCompiled select 1;
		_day = _timeDateCompiled select 2;
		_hour = _timeDateCompiled select 3;
		_minute = _timeDateCompiled select 4;

		_hour = _hour + (call sd_timeZone);
		_time = [_year,_month,_day,_hour,_minute];
		setDate _time;
	};
};