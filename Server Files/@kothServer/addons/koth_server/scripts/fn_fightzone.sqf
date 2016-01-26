/*
	File: fn_fightzone.sqf
	Author: DeadP4xel

	Description: 
	Generate Tickets if unit is in fightzone.
*/
// VARIABLES
unitsWest = 0;
unitsEast = 0;
unitsIndep = 0;

[] spawn {
	while {true} do {
		{
			if(side _x isEqualTo west && ((getMarkerPos "fightzone") distance _x < 850)) then {
				unitsWest = unitsWest + 1;
			}
		} forEach allUnits;

		{
			if(side _x isEqualTo east && ((getMarkerPos "fightzone") distance _x < 850)) then {
				unitsEast = unitsEast + 1;
			}
		} forEach allUnits;

		{
			if(side _x isEqualTo independent && ((getMarkerPos "fightzone") distance _x < 850)) then {
				unitsIndep = unitsIndep + 1;
			}
		} forEach allUnits;
		uiSleep 0.5;
	};
};

[] spawn {
	while {true} do {
		if((unitsWest >= unitsEast) && (unitsWest >= unitsIndep)) then {
			for "_i" from 1 to 2 do {publicVariableServer "sd_westCounterToServer"};
			uiSleep 60;
		};
		if((unitsEast >= unitsWest) && (unitsEast >= unitsIndep)) then {
			for "_i" from 1 to 2 do {publicVariableServer "sd_eastCounterToServer"};
			uiSleep 60;
		};
		if((unitsIndep >= unitsWest) && (unitsIndep >= unitsEast)) then {
			for "_i" from 1 to 2 do {publicVariableServer "sd_independentCounterToServer"};
			uiSleep 60;
		};
	};
};