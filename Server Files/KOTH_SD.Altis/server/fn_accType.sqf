/*
	File: fn_accType.sqf
	Author: Tonic

	0: Unknown Error
	1: Primary
	2: Secondary
	3: Handgun
*/
private["_item","_type","_tmp","_ret","_weaponArray"];
_item = [_this,0,"",[""]] call BIS_fnc_param;
_type = [_this,1,0,[0]] call BIS_fnc_param;
if(_item isEqualTo "" || _type isEqualTo 0) exitWith {0};
_ret = 0;

_weaponArray = [primaryWeapon player, secondaryWeapon player, handgunWeapon player];
{
	if(_ret != 0) exitWith {};
	if(_x != "") then
	{
		_weapon = _x;
		_cfgInfo = [_weapon,"CfgWeapons"] call sd_fnc_fetchCfgDetails;
		_legacyItems = ((_cfgInfo select 10) + (_cfgInfo select 11) + (_cfgInfo select 12));
		_newItems = _cfgInfo select 14;
		if(count _legacyItems > 0) then
		{
			for "_i" from 0 to (count _legacyItems)-1 do
			{
				_legacyItems set[_i,toLower(_legacyItems select _i)];
			};
			
			if((toLower _item) in _legacyItems) exitWith {_ret = switch(_weapon) do {case (primaryWeapon player): {1};case (secondaryWeapon player) : {2};case (handgunWeapon player): {3};default {0};};};
		};
		if(count _newItems > 0) then
		{
			{
				if(_ret != 0) exitWith {};
				_cfg = getNumber(configFile >> "CfgWeapons" >> _weapon >> "WeaponSlotsInfo" >> _x >> "compatibleItems" >> _item);
				if(isNil "_cfg") then {_cfg = 0;};
				if(_cfg isEqualTo 1) exitWith
				{
					_ret = switch(_weapon) do {case (primaryWeapon player): {1};case (secondaryWeapon player) : {2};case (handgunWeapon player): {3};default {0};};
				};
			} foreach _newItems;
			if(_ret != 0) exitWith {};
		};
	};
} foreach _weaponArray;

_ret;