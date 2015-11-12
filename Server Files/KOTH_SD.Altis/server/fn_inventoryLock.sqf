/*
	File: fn_inventoryLock.sqf
	Author: DeadP4xel

	Description:
	Close all Vehicle Inventorys
*/
private["_vehicle","_unit"];
if(count _this isEqualTo 1) exitWith {false};
_vehicle = _this select 1;

// ERROR CHECKS
if(!(call sd_disableVehInv)) exitWith {};

// CLOSE ALL VEHICLE INVENTORYS (LAND AND AIR)
if(_vehicle isKindOf "LandVehicle" OR _vehicle isKindOf "Air") exitWith 
{
	[] spawn {
		0 cutRsc ["vehicleAccess","PLAIN"]; 
		waitUntil {!isNull (findDisplay 602)};
		closeDialog 0;
	};
};