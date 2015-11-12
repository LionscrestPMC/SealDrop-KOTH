/*
	File: fn_clothingShopItenList.sqf
	Author: DeadP4xel
*/
disableSerialization;
private["_controller","_actualFilter","_list","_shopConfig"];

// VARIABLES
_controller = [_this,1,-1,[2]] call BIS_fnc_param;
_actualFilter = uiNamespace getVariable ["ClothingShop",""];

// ERROR CHECKS
if(_controller isEqualTo -1 OR _actualFilter isEqualTo "") exitWith {closeDialog 0};
_list = (findDisplay 56000) displayCtrl 56005;
lbClear _list;

switch (_controller) do
{
	case 0:
	{
		_shopConfig = [(_actualFilter select 0)] call sd_fnc_shopCfg;
		{
			_clothingInfo = [_x select 0] call sd_fnc_fetchCfgDetails;
			_list lbAdd format["%1",if(isNil {_x select 1}) then {_clothingInfo select 1} else {_x select 1}];
			_list lbSetData [(lbSize _list)-1,_x select 0];
			_list lbSetValue [(lbSize _list)-1,_x select 2];
			_list lbSetPicture [(lbSize _list)-1,_clothingInfo select 2];
		} forEach (_shopConfig select 1);
	};

	case 1:
	{
		_shopConfig = [(_actualFilter select 1)] call sd_fnc_shopCfg;
		{
			_clothingInfo = [_x select 0] call sd_fnc_fetchCfgDetails;
			_list lbAdd format["%1",if(isNil {_x select 1}) then {_clothingInfo select 1} else {_x select 1}];
			_list lbSetData [(lbSize _list)-1,_x select 0];
			_list lbSetValue [(lbSize _list)-1,_x select 2];
			_list lbSetPicture [(lbSize _list)-1,_clothingInfo select 2];
		} forEach (_shopConfig select 1);
	};

	case 2:
	{
		_shopConfig = [(_actualFilter select 2)] call sd_fnc_shopCfg;
		{
			_clothingInfo = [_x select 0] call sd_fnc_fetchCfgDetails;
			_list lbAdd format["%1",if(isNil {_x select 1}) then {_clothingInfo select 1} else {_x select 1}];
			_list lbSetData [(lbSize _list)-1,_x select 0];
			_list lbSetValue [(lbSize _list)-1,_x select 2];
			_list lbSetPicture [(lbSize _list)-1,_clothingInfo select 2];
		} forEach (_shopConfig select 1);
	};

	case 3:
	{
		_shopConfig = [(_actualFilter select 3)] call sd_fnc_shopCfg;
		{
			_clothingInfo = [_x select 0] call sd_fnc_fetchCfgDetails;
			_list lbAdd format["%1",if(isNil {_x select 1}) then {_clothingInfo select 1} else {_x select 1}];
			_list lbSetData [(lbSize _list)-1,_x select 0];
			_list lbSetValue [(lbSize _list)-1,_x select 2];
			_list lbSetPicture [(lbSize _list)-1,_clothingInfo select 2];
		} forEach (_shopConfig select 1);
	};

	case 4:
	{
		_shopConfig = [(_actualFilter select 4)] call sd_fnc_shopCfg;
		{
			_clothingInfo = [_x select 0] call sd_fnc_fetchCfgDetails;
			_list lbAdd format["%1",if(isNil {_x select 1}) then {_clothingInfo select 1} else {_x select 1}];
			_list lbSetData [(lbSize _list)-1,_x select 0];
			_list lbSetValue [(lbSize _list)-1,_x select 2];
			_list lbSetPicture [(lbSize _list)-1,_clothingInfo select 2];
		} forEach (_shopConfig select 1);
	};
};
if(isNil {_this select 0}) then {_list lbSetCurSel 0;};