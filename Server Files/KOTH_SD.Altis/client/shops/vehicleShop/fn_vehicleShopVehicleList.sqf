/*
	File: fn_vehicleShopVehicleList
	Author: DeadP4xel

	Description:
	Handle the Vehicles in the List.
*/
private ["_index","_shop","_vehicleList","_vehicleInfo"];

// VARIABLES 
_index = [_this,1,-1,[2]] call BIS_fnc_param;
_shop = uiNamespace getVariable ["VehicleShop",""];
if(_index isEqualTo -1 OR _shop isEqualTo "") exitWith {closeDialog 0};
_levelTag = ((findDisplay 57000) displayCtrl 57004);
_levelTag ctrlSetStructuredText parseText "";
_vehicleList = ((findDisplay 57000) displayCtrl 57001);
lbClear _vehicleList;

switch(_index) do
{
	case 0:
	{
		_config = [(_shop select 0)] call sd_fnc_shopCfg;
		{
			_vehicleInfo = [_x select 0] call sd_fnc_fetchVehicleCfg;
			_vehicleList lbAdd format["%1",if(isNil {_x select 3}) then {_vehicleInfo select 3} else {_x select 3}];
			_vehicleList lbSetData[(lbSize _vehicleList)-1,_vehicleInfo select 0];
			_vehicleList lbSetPicture[(lbSize _vehicleList)-1,_vehicleInfo select 2];
			_vehicleList lbSetValue[(lbSize _vehicleList)-1,_x select 2];
		} foreach (_config select 1);
		((findDisplay 57000) displayCtrl 57005) ctrlSetText localize "STR_Global_Spawn";
	};
	case 1:
	{
		_config = [(_shop select 1)] call sd_fnc_shopCfg;
		{
			_vehicleInfo = [_x select 0] call sd_fnc_fetchVehicleCfg;
			_vehicleList lbAdd format["%1",if(isNil {_x select 3}) then {_vehicleInfo select 3} else {_x select 3}];
			_vehicleList lbSetData[(lbSize _vehicleList)-1,_vehicleInfo select 0];
			_vehicleList lbSetPicture[(lbSize _vehicleList)-1,_vehicleInfo select 2];
			_vehicleList lbSetValue[(lbSize _vehicleList)-1,_x select 2];
		} foreach (_config select 1);
		((findDisplay 57000) displayCtrl 57005) ctrlSetText localize "STR_Global_Spawn";
	};
	case 2:
	{
		_config = [(_shop select 2)] call sd_fnc_shopCfg;
		{
			_vehicleInfo = [_x select 0] call sd_fnc_fetchVehicleCfg;
			_vehicleList lbAdd format["%1",if(isNil {_x select 3}) then {_vehicleInfo select 3} else {_x select 3}];
			_vehicleList lbSetData[(lbSize _vehicleList)-1,_vehicleInfo select 0];
			_vehicleList lbSetPicture[(lbSize _vehicleList)-1,_vehicleInfo select 2];
			_vehicleList lbSetValue[(lbSize _vehicleList)-1,_x select 2];
		} foreach (_config select 1);
		((findDisplay 57000) displayCtrl 57005) ctrlSetText localize "STR_Global_Spawn";
	};
	case 3:
	{
		_config = [(_shop select 3)] call sd_fnc_shopCfg;
		{
			_vehicleInfo = [_x select 0] call sd_fnc_fetchVehicleCfg;
			_vehicleList lbAdd format["%1",if(isNil {_x select 3}) then {_vehicleInfo select 3} else {_x select 3}];
			_vehicleList lbSetData[(lbSize _vehicleList)-1,_vehicleInfo select 0];
			_vehicleList lbSetPicture[(lbSize _vehicleList)-1,_vehicleInfo select 2];
			_vehicleList lbSetValue[(lbSize _vehicleList)-1,_x select 2];
		} foreach (_config select 1);
		((findDisplay 57000) displayCtrl 57005) ctrlSetText localize "STR_Global_Spawn";
	};
};