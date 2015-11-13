/*
	File: fn_vehicleShopSpawn.sqf
	Author: DeadP4xel

	Description:
	Checks the SpawnPoint Marker for any vehicle and spawn the vehicle.
*/
private["_spawnPoints","_className","_spawnPoint","_vehicle"];

// VEHICLE COOLDOWN
if(sd_vehicleCooldown) exitWith {hintSilent localize "STR_Script_vehicleCD"};

// ERROR CHECKS
if((lbCurSel 57001) isEqualTo -1) exitWith {hintSilent localize "STR_Script_selectVeh"};

// VARIABLES
_className = lbData[57001,(lbCurSel 57001)];
_spawnPoints = "";
_spawnPoint = "";

// SPAWN POINT
switch(playerSide) do
{
	case west:
	{
		if(_className isKindOf "Air") then {
			_spawnPoints = "vehicle_spawn_west_air";
		} else {
			_spawnPoints = "vehicle_spawn_west";
		};
		if(_className isKindOf "Ship") then {
			_spawnPoints = "vehicle_spawn_west_ship";
		};
	};
	case independent:
	{
		if(_className isKindOf "Air") then {
			_spawnPoints = "vehicle_spawn_indep_air";
		} else {
			_spawnPoints = "vehicle_spawn_indep";
		};
		if(_className isKindOf "Ship") then {
			_spawnPoints = "vehicle_spawn_indep_ship";
		};
	};
	case opfor:
	{
		if(_className isKindOf "Air") then {
			_spawnPoints = "vehicle_spawn_east_air";
		} else {
			_spawnPoints = "vehicle_spawn_east";
		};
		if(_className isKindOf "Ship") then {
			_spawnPoints = "vehicle_spawn_east_ship";
		};
	};
};
if(count(nearestObjects[(getMarkerPos _spawnPoints),["Car","Ship","Air"],5]) isEqualTo 0) then {
	_spawnPoint = _spawnPoints;
};
if(_spawnPoint isEqualTo "") exitWith {hintSilent localize "STR_Script_spawnBlock"};

// SPAWN THE VEHICLE
_vehicle = createVehicle [_className, (getMarkerPos _spawnPoint), [], 0, "NONE"];
waitUntil {!isNil "_vehicle"};
_vehicle allowDamage false;
_vehicle setVectorUp (surfaceNormal (getMarkerPos _spawnPoint));
_vehicle setDir (markerDir _spawnPoint);
_vehicle setPos (getMarkerPos _spawnPoint);
_vehicle engineOn true;
clearItemCargoGlobal _vehicle;
clearWeaponCargoGlobal _vehicle;
clearBackpackCargoGlobal _vehicle;
clearMagazineCargoGlobal _vehicle;
_vehicle allowDamage true;
player allowDamage false;
player moveInDriver _vehicle;
player allowDamage true;
closeDialog 0;
true;
sd_vehicleCooldown = true;
uiSleep (call sd_vehicleCooldownTime);
sd_vehicleCooldown = false;