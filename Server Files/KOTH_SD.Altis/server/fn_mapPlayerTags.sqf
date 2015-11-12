/*
    File: fn_playerTag.sqf
    Author: Aeroson
    Modified: DeadP4xel

    Description:
    Map Player / Vehicle icons
*/
private ["_marker","_markerText","_temp","_unit","_vehicle","_markerNumber","_show","_injured","_text","_num","_getNextMarker","_getMarkerColor","_showAllSides","_showPlayers","_showAIs","_l"];                   

// ERROR CHECKS
if(!(call sd_playerTagsMap)) exitWith {};
if(!isNil {sd_playerMarkersPosition}) exitWith {};

// VARIABLES    
_showAllSides = false;
_showPlayers  = false;
_showAIs      = false;

if(count _this isEqualTo 0) then {
    _showAllSides = false;
    _showPlayers = true;
    _showAIs = !isMultiplayer;
};             
{
    _l = toLower _x;
    if(_l in ["player","players"]) then {
        _showPlayers=true;
    };
    if(_l in ["ai","ais"]) then {
        _showAIs=true;
    };
    if(_l in ["allside","allsides"]) then {
        _showAllSides=true;
    };
} forEach _this;
sd_playerMarkersPosition = [0,0];
onMapSingleClick "sd_playerMarkersPosition = _pos;";
_getNextMarker = {
    private ["_marker"]; 
    _markerNumber = _markerNumber + 1;
    _marker = format["um%1",_markerNumber]; 
    if(getMarkerType _marker isEqualTo "") then {
        createMarkerLocal [_marker, _this];
    } else {
        _marker setMarkerPosLocal _this;
    };
    _marker;
};
_getMarkerColor = { 
    [(((side _this) call BIS_fnc_sideID) call BIS_fnc_sideType),true] call BIS_fnc_sideColor;
};

while {true} do {
    waitUntil {uiSleep 0.025;true;};
    _markerNumber = 0; 
    {
        _show = false;
        _injured = false;
        _unit = _x;
        
        if(
            (
                (_showAIs && {!isPlayer _unit} && {0 isEqualTo { {_x isEqualTo _unit} count crew _x > 0} count allUnitsUav}) ||
                (_showPlayers && {isPlayer _unit})
            ) && {
                _showAllSides || side _unit isEqualTo side player
            }
        ) then {    
            if((crew vehicle _unit) select 0 isEqualTo _unit) then {
                _show = true;
            };      
            if(!alive _unit || damage _unit > 0.9) then {
                _injured = true;
            };    
            if(!isNil {_unit getVariable "hide"}) then {
                _show = false;
            };           
        };
        if(_show) then {
            _vehicle = vehicle _unit;                   
            _pos = getPosATL _vehicle;                          
            _color = _unit call _getMarkerColor;  
            _markerText = _pos call _getNextMarker;                     
            _markerText setMarkerColorLocal _color;                                         
            _markerText setMarkerTypeLocal "c_unknown";                    
            _markerText setMarkerSizeLocal [0.8,0];
            _marker = _pos call _getNextMarker;         
            _marker setMarkerColorLocal _color;
            _marker setMarkerDirLocal getDir _vehicle;
            _marker setMarkerTypeLocal "mil_triangle";
            _marker setMarkerTextLocal "";          
            if(_vehicle isEqualTo vehicle player) then {
                _marker setMarkerSizeLocal [0.8,1];
            } else {
                _marker setMarkerSizeLocal [0.5,0.7];
            };
            if(_vehicle != _unit && !(_vehicle isKindOf "ParachuteBase")) then {                                    
                _text = format["[%1]", getText(configFile >> "CfgVehicles" >> typeOf _vehicle >> "DisplayName")];
                if(!isNull driver _vehicle) then {
                    _text = format["%1 %2", name driver _vehicle, _text];   
                };                                                  
                
                if((sd_playerMarkersPosition distance getPosATL _vehicle) < 50) then {
                    sd_playerMarkersPosition = getPosATL _vehicle;
                    _num = 0;
                    {
                        if(alive _x && isPlayer _x && _x != driver _vehicle) then {                     
                            _text = format["%1%2 %3", _text, if(_num>0)then{","}else{""}, name _x];
                            _num = _num + 1;
                        };                      
                    } forEach crew _vehicle; 
                } else { 
                    _num = {alive _x && isPlayer _x && _x != driver _vehicle} count crew _vehicle;
                    if (_num>0) then {                  
                        if (isNull driver _vehicle) then {
                            _text = format["%1 %2", _text, name (crew _vehicle select 0)];
                            _num = _num - 1;
                        };
                        if (_num>0) then {
                            _text = format["%1 +%2", _text, _num];
                        };
                    };
                };                      
            } else {
                _text = name _x;            
            };
            _markerText setMarkerTextLocal _text;
        };
    } forEach allUnits;
    _markerNumber = _markerNumber + 1;
    _marker = format["um%1",_markerNumber]; 
    while {(getMarkerType _marker) != ""} do {
        deleteMarkerLocal _marker;
        _markerNumber = _markerNumber + 1;
        _marker = format["um%1",_markerNumber];
    };
};