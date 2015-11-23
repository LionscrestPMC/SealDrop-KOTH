/*
	File: fn_playerActions.sqf
	Author: DeadP4xel
*/

sd_playerActions = "";
switch(playerSide) do 
{
	case west:
	{
		// REPAIR VEHICLE
		sd_playerActions = sd_playerActions + [player addAction [localize "STR_Global_Repair",sd_fnc_repairVehicle,cursorTarget,false,false,"",'((damage cursorTarget) > 0) && cursorTarget isKindOf "Car" OR cursorTarget isKindOf "Ship" OR cursorTarget isKindOf "air"']];
	};

	case opfor:
	{
	};

	case independent:
	{
	};
};