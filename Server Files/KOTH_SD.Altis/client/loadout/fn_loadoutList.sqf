/*
	File: fn_loadoutList.sqf 
	Author: DeadP4xel

	Description:
	Init for the Listbox and the dropdown Menu
*/
private ["_itemListCurrentCurrent","_itemListSavedItems","_arrayPacket","_listedItems","_itemCount","_itemInfo"];

// VARIABLES
_itemListCurrent = ((findDisplay 75000) displayCtrl 75005);
_itemListSavedItems = ((findDisplay 75000) displayCtrl 75006);

sd_activeProfile = (lbCurSel 75004);

// CURRENT ITEMS LIST
lbClear _itemListCurrent;
_arrayPacket = [];
_listedItems = [];
if(primaryWeapon player != "") then {_arrayPacket set[count _arrayPacket,primaryWeapon player]};
if(secondaryWeapon player != "") then {_arrayPacket set[count _arrayPacket,secondaryWeapon player]};
if(handgunWeapon player != "") then {_arrayPacket set[count _arrayPacket,handgunWeapon player]};
_arrayPacket = _arrayPacket + primaryWeaponItems player;
_arrayPacket = _arrayPacket + (assignedItems player);
_arrayPacket = _arrayPacket + (uniformItems player);
_arrayPacket = _arrayPacket + (vestItems player);
_arrayPacket = _arrayPacket + (backPackItems player);
_arrayPacket = _arrayPacket + [(uniform player)] + [(vest player)] + [(backpack player)] + [(headgear player)] + [(goggles player)];
{
	if(!(_x in _listedItems) && _x != "") then
	{
		_itemInfo = [_x] call sd_fnc_fetchCfgDetails;
		_listedItems set[count _listedItems,_x];	
		_itemCount = {_x == (_itemInfo select 0)} count _arrayPacket;
		if(_itemCount > 1) then
		{
			_itemListCurrent lbAdd format["[%2] %1",_itemInfo select 1,_itemCount];
		} else {
			_itemListCurrent lbAdd format["%1",_itemInfo select 1];
		};
		_itemListCurrent lbSetData[(lbSize _itemListCurrent) - 1,_itemInfo select 0];
		_itemListCurrent lbSetPicture[(lbSize _itemListCurrent) - 1,_itemInfo select 2];
	};
} foreach _arrayPacket;

// SAVED ITEMS IN PROFILE LIST
_curSelect = [];
if((lbCurSel 75004) isEqualTo 0) then {
	_curSelect = sd_loadout_1;
};
if((lbCurSel 75004) isEqualTo 1) then {
	_curSelect = sd_loadout_2;
};
if((lbCurSel 75004) isEqualTo 2) then {
	_curSelect = sd_loadout_3;
};
if((lbCurSel 75004) isEqualTo 3) then {
	_curSelect = sd_loadout_4;
};
if((lbCurSel 75004) isEqualTo 4) then {
	_curSelect = sd_loadout_5;
};
_listedItemsSaved = [];
_arrayPacketSaved = [];
_arrayPacketSaved = [_curSelect] call sd_fnc_mArrayToSArray;
lbClear _itemListSavedItems;
{
	if(!(_x in _listedItemsSaved) && _x != "") then {
		_itemInfoSaved = [_x] call sd_fnc_fetchCfgDetails;
		_listedItemsSaved set[count _listedItemsSaved,_x];
		_itemCountSaved = {_x == (_itemInfoSaved select 0)} count _arrayPacketSaved;
		if(_itemCountSaved > 1) then {
			_itemListSavedItems lbAdd format ["[%2] %1",_itemInfoSaved select 1,_itemCountSaved];
		} else {
			_itemListSavedItems lbAdd format ["%1",_itemInfoSaved select 1];
		};
		_itemListSavedItems lbSetData [(lbSize _itemListSavedItems) - 1,_itemInfoSaved select 0];
		_itemListSavedItems lbSetPicture [(lbSize _itemListSavedItems) - 1,_itemInfoSaved select 2];
	};
} forEach _arrayPacketSaved;