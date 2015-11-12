/*
	File: fn_weaponShopFilter.sqf
	Author: DeadP4xel
*/
private["_itemList","_shop","_itemInfo","_index","_config","_listedItems","_priceTag"];
_index = [_this,1,-1,[2]] call BIS_fnc_param;
_shop = uiNamespace getVariable ["WeaponShop",""];
if(_index isEqualTo -1 OR _shop isEqualTo "") exitWith {closeDialog 0};

uiNamespace setVariable["WeaponShopFilter",_index];

_priceTag = ((findDisplay 55000) displayCtrl 55404);
_priceTag ctrlSetStructuredText parseText "";
_itemList = ((findDisplay 55000) displayCtrl 55003);
lbClear _itemList;

switch(_index) do
{
	case 0:
	{
		_config = [(_shop select 0)] call sd_fnc_shopCfg;
		{
			_itemInfo = [_x select 0] call sd_fnc_fetchCfgDetails;
			_itemList lbAdd format["%1",if(isNil {_x select 1}) then {_itemInfo select 1} else {_x select 1}];
			_itemList lbSetData[(lbSize _itemList)-1,_itemInfo select 0];
			_itemList lbSetPicture[(lbSize _itemList)-1,_itemInfo select 2];
			_itemList lbSetValue[(lbSize _itemList)-1,_x select 2];
		} foreach (_config select 1);
		((findDisplay 55000) displayCtrl 55002) ctrlSetText localize "STR_Global_Equip";
	};
	case 1:
	{
		_config = [(_shop select 1)] call sd_fnc_shopCfg;
		{
			_itemInfo = [_x select 0] call sd_fnc_fetchCfgDetails;
			_itemList lbAdd format["%1",if(isNil {_x select 1}) then {_itemInfo select 1} else {_x select 1}];
			_itemList lbSetData[(lbSize _itemList)-1,_itemInfo select 0];
			_itemList lbSetPicture[(lbSize _itemList)-1,_itemInfo select 2];
			_itemList lbSetValue[(lbSize _itemList)-1,_x select 2];
		} foreach (_config select 1);
		((findDisplay 55000) displayCtrl 55002) ctrlSetText localize "STR_Global_Equip";
	};
	case 2:
	{
		_config = [(_shop select 2)] call sd_fnc_shopCfg;
		{
			_itemInfo = [_x select 0] call sd_fnc_fetchCfgDetails;
			_itemList lbAdd format["%1",if(isNil {_x select 1}) then {_itemInfo select 1} else {_x select 1}];
			_itemList lbSetData[(lbSize _itemList)-1,_itemInfo select 0];
			_itemList lbSetPicture[(lbSize _itemList)-1,_itemInfo select 2];
			_itemList lbSetValue[(lbSize _itemList)-1,_x select 2];
		} foreach (_config select 1);
		((findDisplay 55000) displayCtrl 55002) ctrlSetText localize "STR_Global_Equip";
	};
	case 3:
	{
		_config = [(_shop select 3)] call sd_fnc_shopCfg;
		{
			_itemInfo = [_x select 0] call sd_fnc_fetchCfgDetails;
			_itemList lbAdd format["%1",if(isNil {_x select 1}) then {_itemInfo select 1} else {_x select 1}];
			_itemList lbSetData[(lbSize _itemList)-1,_itemInfo select 0];
			_itemList lbSetPicture[(lbSize _itemList)-1,_itemInfo select 2];
			_itemList lbSetValue[(lbSize _itemList)-1,_x select 2];
		} foreach (_config select 1);
		((findDisplay 55000) displayCtrl 55002) ctrlSetText localize "STR_Global_Equip";
	};
	case 4:
	{
		private["_listedItems"];
		_config = [];
		_listedItems = [];
		if(primaryWeapon player != "") then {_config set[count _config,primaryWeapon player]};
		if(secondaryWeapon player != "") then {_config set[count _config,secondaryWeapon player]};
		if(handgunWeapon player != "") then {_config set[count _config,handgunWeapon player]};
		_config = _config + primaryWeaponItems player;
		_config = _config + (assignedItems player);
		_config = _config + (uniformItems player);
		_config = _config + (vestItems player);
		_config = _config + (backPackItems player);
		((findDisplay 55000) displayCtrl 55002) ctrlSetText "Remove";
		{
			if(!(_x in _listedItems) && _x != "") then
			{
				_itemInfo = [_x] call sd_fnc_fetchCfgDetails;
				_listedItems set[count _listedItems,_x];
				
				_itemCount = {_x == (_itemInfo select 0)} count _config;
				if(_itemCount > 1) then
				{
					_itemList lbAdd format["[%2] %1",_itemInfo select 1,_itemCount];
				}
					else
				{
					_itemList lbAdd format["%1",_itemInfo select 1];
				};
				_itemList lbSetData[(lbSize _itemList) - 1,_itemInfo select 0];
				_itemList lbSetPicture[(lbSize _itemList) - 1,_itemInfo select 2];
			};
		} foreach _config;
	};
};
if(isNil {_this select 0}) then {_itemList lbSetCurSel 0;};