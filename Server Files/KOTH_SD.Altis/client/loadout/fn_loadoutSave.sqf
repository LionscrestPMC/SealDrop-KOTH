/*
    File: fn_loadoutSave.sqf
    Author: Vampire
    Edited: DeadP4xel
*/
private["_return","_uItems","_bItems","_vItems","_pItems","_hItems","_uMags","_vMags","_bMags","_pMag","_hMag","_uni","_ves","_bag","_handled"];

// VARIABLES
_return = [];
_return pushBack uniform player;
_return pushBack vest player;
_return pushBack backpack player;
_return pushBack goggles player;
_return pushBack headgear player;
_return pushBack assignedITems player;
_return pushBack primaryWeapon player;
_return pushBack handgunWeapon player;
_return pushBack secondaryWeapon player;

_uItems = [];
_uMags  = [];
_bItems = [];
_bMags  = [];
_vItems = [];
_vMags  = [];
_pItems = [];
_hItems = [];
_uni = [];
_ves = [];
_bag = [];

if(uniform player != "") then
{
    {
        if (_x in (magazines player)) then {
            _uMags = _uMags + [_x];
        } else {
            _uItems = _uItems + [_x];
        };
    } forEach (uniformItems player);
};

if(backpack player != "") then
{
    {
        if (_x in (magazines player)) then {
            _bMags = _bMags + [_x];
        } else {
            _bItems = _bItems + [_x];
        };
    } forEach (backpackItems player);
};

if(vest player != "") then
{
    {
        if (_x in (magazines player)) then {
            _vMags = _vMags + [_x];
        } else {
            _vItems = _vItems + [_x];
        };
    } forEach (vestItems player);
};

if(count (primaryWeaponMagazine player) > 0 && alive player) then
{
    _pMag = ((primaryWeaponMagazine player) select 0);
    if(_pMag != "") then
    {
        _uni = player canAddItemToUniform _pMag;
        _ves = player canAddItemToVest _pMag;
        _bag = player canAddItemToBackpack _pMag;
        _handled = false;
        if(_ves) then
        {
            _vMags = _vMags + [_pMag];
            _handled = true;
        };
        if(_uni && !_handled) then
        {
            _uMags = _uMags + [_pMag];
            _handled = true;
        };
        if(_bag && !_handled) then
        {
            _bMags = _bMags + [_pMag];
            _handled = true;
        };
    };
};

if(count (handgunMagazine player) > 0 && alive player) then
{
    _hMag = ((handgunMagazine player) select 0);
    if(_hMag != "") then
    {
        _uni = player canAddItemToUniform _hMag;
        _ves = player canAddItemToVest _hMag;
        _bag = player canAddItemToBackpack _hMag;
        _handled = false;
        if(_ves) then
        {
            _vMags = _vMags + [_hMag];
            _handled = true;
        };
        if(_uni && !_handled) then
        {
            _uMags = _uMags + [_hMag];
            _handled = true;
        };
        if(_bag && !_handled) then
        {
            _bMags = _bMags + [_hMag];
            _handled = true;
        };
    };
};

if(count (secondaryWeaponMagazine player) > 0 && alive player) then
{
    _rMag = ((secondaryWeaponMagazine player) select 0);
    if(_rMag != "") then {
        _uni = player canAddItemToUniform _rMag;
        _ves = player canAddItemToVest _rMag;
        _bag = player canAddItemToBackpack _rMag;
        _handled = false;
        if(_uni && !_handled) then 
        {
            _uMag = _uMag + [_rMag];
            _handled = true;
        };
        if(_ves) then
        {
            _vMags = _vMags + [_rMag];
            _handled = true;
        };
        if(_bag && !_handled) then
        {
            _bMags = _bMags + [_rMag];
            _handled = true;
        };
    };
};

if(count (primaryWeaponItems player) > 0) then
{
    {
        _pItems = _pItems + [_x];
    } forEach (primaryWeaponItems player);
};

if(count (handGunItems player) > 0) then
{
    {
        _hItems = _hItems + [_x];
    } forEach (handGunItems player);
};

_return pushBack _uItems;
_return pushBack _uMags;
_return pushBack _bItems;
_return pushBack _bMags;
_return pushBack _vItems;
_return pushBack _vMags;
_return pushBack _pItems;
_return pushBack _hItems;
_return pushBack [];


if((lbCurSel 75004) isEqualTo 0) then {
    sd_loadout_1 = _return;
};
if((lbCurSel 75004) isEqualTo 1) then {
    sd_loadout_2 = _return;
};
if((lbCurSel 75004) isEqualTo 2) then {
    sd_loadout_3 = _return;
};
if((lbCurSel 75004) isEqualTo 3) then {
    sd_loadout_4 = _return;
};
if((lbCurSel 75004) isEqualTo 4) then {
    sd_loadout_5 = _return;
};