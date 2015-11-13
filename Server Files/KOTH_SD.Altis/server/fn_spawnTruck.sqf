/*
	File: fn_spawnTruck.sqf
	Author: Unknown
	Modified: DeadP4xel

	Description:
	Spawns the truck.
*/
private["_side"];
_side = _this;

if(isServer) then {	
	if(_side isEqualTo "bluf") then
	{
		spawntruck_blu = "O_Truck_03_medical_F" createVehicle (getMarkerPos "vehicle_spawn_spawntruck_west");
		spawntruck_blu setPos (getMarkerPos "vehicle_spawn_spawntruck_west");
		spawntruck_blu setDir (markerDir "vehicle_spawn_spawntruck_west");
		spawntruck_blu lock 1;
		spawntruck_blu engineOn true;
		clearItemCargoGlobal spawntruck_blu;
		spawntruck_blu addMPEventHandler ["mpkilled",{"blu" spawn respawnTruck}];
		spawntruck_blu setVariable ["persistent",true];
		publicVariable "spawntruck_blu";
	};
	if(_side isEqualTo "blu") then
	{
		_del = spawntruck_blu;
		spawntruck_blu = 0;
		publicVariable "spawntruck_blu";
		uiSleep 60;
		deleteVehicle _del;
		uiSleep 300;
		spawntruck_blu = "O_Truck_03_medical_F" createVehicle (getMarkerPos "vehicle_spawn_spawntruck_west");
		spawntruck_blu setPos (getMarkerPos "vehicle_spawn_spawntruck_west");
		spawntruck_blu setDir (markerDir "vehicle_spawn_spawntruck_west");
		spawntruck_blu lock 1;
		spawntruck_blu engineOn true;
		clearItemCargoGlobal spawntruck_blu;
		spawntruck_blu addMPEventHandler ["mpkilled",{"blu" spawn respawnTruck}];
		spawntruck_blu setVariable ["persistent",true];
		publicVariable "spawntruck_blu";
	};
	if(_side isEqualTo "redf") then
	{
		spawntruck_red = "O_Truck_03_medical_F" createVehicle (getMarkerPos "vehicle_spawn_spawntruck_east");
		spawntruck_red setDir (markerDir "vehicle_spawn_spawntruck_east");
		spawntruck_red lock 1;
		spawntruck_red engineOn true;
		clearItemCargoGlobal spawntruck_red;
		spawntruck_red addMPEventHandler ["mpkilled",{"red" spawn respawnTruck}];
		spawntruck_red setVariable ["persistent",true];
		publicVariable "spawntruck_red";
	};
	if(_side isEqualTo "red") then
	{
		_del = spawntruck_red;
		spawntruck_red = 0;
		publicVariable "spawntruck_red";
		uiSleep 60;
		deleteVehicle _del;
		uiSleep 300;
		spawntruck_red = "O_Truck_03_medical_F" createVehicle (getMarkerPos "vehicle_spawn_spawntruck_east");
		spawntruck_red setPos (getMarkerPos "vehicle_spawn_spawntruck_east");
		spawntruck_red lock 1;
		spawntruck_red engineOn true;
		clearItemCargoGlobal spawntruck_red;
		spawntruck_red setDir (markerDir "vehicle_spawn_spawntruck_east");
		spawntruck_red addMPEventHandler ["mpkilled",{"red" spawn respawnTruck}];
		spawntruck_red setVariable ["persistent",true];
		publicVariable "spawntruck_red";
	};
	if(_side isEqualTo "indf") then
	{
		spawntruck_ind = "O_Truck_03_medical_F" createVehicle (getMarkerPos "vehicle_spawn_spawntruck_indep");
		spawntruck_ind setPos (getMarkerPos "vehicle_spawn_spawntruck_indep");
		spawntruck_ind lock 1;
		spawntruck_ind engineOn true;
		clearItemCargoGlobal spawntruck_ind;
		spawntruck_ind setDir (markerDir "vehicle_spawn_spawntruck_indep");
		spawntruck_ind addMPEventHandler ["mpkilled",{"ind" spawn respawnTruck}];
		spawntruck_ind setVariable ["persistent",true];
		publicVariable "spawntruck_ind";
	};
	if(_side isEqualTo "ind") then
	{
		_del = spawntruck_ind;
		spawntruck_ind = 0;
		publicVariable "spawntruck_ind";
		uiSleep 60;
		deleteVehicle _del;
		uiSleep 300;
		spawntruck_ind = "O_Truck_03_medical_F" createVehicle (getMarkerPos "vehicle_spawn_spawntruck_indep");
		spawntruck_ind setPos (getMarkerPos "vehicle_spawn_spawntruck_indep");
		spawntruck_ind setDir (markerDir "vehicle_spawn_spawntruck_indep");
		spawntruck_ind lock 1;
		spawntruck_ind engineOn true;
		clearItemCargoGlobal spawntruck_ind;
		spawntruck_ind addMPEventHandler ["mpkilled",{"ind" spawn respawnTruck}];
		spawntruck_ind setVariable ["persistent",true];
		publicVariable "spawntruck_ind";
	};
};