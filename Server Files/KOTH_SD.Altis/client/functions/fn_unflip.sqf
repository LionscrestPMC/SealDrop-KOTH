/*
	File: fn_unflip.sqf
	Creator: Aeroson
	Modded: DeadP4xel

	Description:
	Unflip Vehicles
*/
private["_vehicle","_radius","_newPos","_pos","_objs"];
sd_unflip_unflipVehicle = {
	_vehicle = _this;
	if(owner _vehicle != owner player) exitWith {[_vehicle, "sd_unflip_unflipVehicle", _vehicle] call BIS_fnc_MP;};
	_vehicle allowDamage false;
	_newPos = getPos _vehicle;
	_vehicle setVectorUp (surfaceNormal _newPos);
	_newPos set[2, 0];
	_vehicle setPos _newPos;
	uiSleep 1;
	_vehicle setVelocity [0,0,0];
	_vehicle allowDamage true;
};
sd_unflip_canShow = {
	_radius = 2;
	_pos = (getPos player) vectorAdd ((eyeDirection player) vectorMultiply _radius);
	_objs = nearestObjects[_pos, ["Car","Tank"], _radius * 2];
	sd_unflip_unitargetVehicle = 
	{
		if(({alive _x} count crew _x isEqualTo 0) && ((vectorUp _x) vectorDotProduct (surfaceNormal (getpos _x)) < 0.5)) exitWith {_x};
	} forEach _objs;
	!isNil{sd_unflip_unitargetVehicle}
};
sd_unflip_addAction = {
	if(!isNil{sd_unflip_handle_addAction}) then {
		(sd_unflip_handle_addAction select 0) removeAction (sd_unflip_handle_addAction select 1);
	};
	sd_unflip_handle_addAction = [player,player addAction [localize "STR_Script_Unflip",{sd_unflip_unitargetVehicle call sd_unflip_unflipVehicle;}, [], 1000,false,true,"","[] call sd_unflip_canShow"]];
};
[] call sd_unflip_addAction;
player addEventHandler ["respawn",{[] call sd_unflip_addAction; }];