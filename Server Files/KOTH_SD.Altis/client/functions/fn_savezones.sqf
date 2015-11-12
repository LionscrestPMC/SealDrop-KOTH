/*
	File: fn_savezones.sqf
	Author: DeadP4xel

	Description:
	Master Savezones for Bases
*/
#define SAFEZONES [["base_blufor", 600],["base_opfor", 600],["base_independent", 600]]

// ERROR CHECK
waitUntil {!isNull player};

// CREATE pEH
switch (playerSide) do
{
	case west:
	{
		player addEventHandler ["Fired",{if ({(_this select 0) distance getMarkerPos (_x select 0) < _x select 1} count SAFEZONES > 0) then {deleteVehicle (_this select 6);};}];
		if({(_this select 0) distance getMarkerPos (_x select 0) < _x select 1} count SAFEZONES > 0) then {
			player allowDamage false;
			if(vehicle player != player) then {
				vehicle player allowDamage false;
				player allowDamage false;
			};
		};
	};
	case opfor:
	{
		player addEventHandler ["Fired",{if ({(_this select 0) distance getMarkerPos (_x select 0) < _x select 1} count SAFEZONES > 0) then {deleteVehicle (_this select 6);};}];
		if({(_this select 0) distance getMarkerPos (_x select 0) < _x select 1} count SAFEZONES > 0) then {
			player allowDamage false;
			if(vehicle player != player) then {
				vehicle player allowDamage false;
				player allowDamage false;
			};
		};
	};
	case independent:
	{
		player addEventHandler ["Fired",{if ({(_this select 0) distance getMarkerPos (_x select 0) < _x select 1} count SAFEZONES > 0) then {deleteVehicle (_this select 6);};}];
		if({(_this select 0) distance getMarkerPos (_x select 0) < _x select 1} count SAFEZONES > 0) then {
			player allowDamage false;
			if(vehicle player != player) then {
				vehicle player allowDamage false;
				player allowDamage false;
			};
		};
	};
};