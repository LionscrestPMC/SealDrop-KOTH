/*
  File: fn_mArrayToSArray.sqf
  Author: IT07
  Edit: DeadP4xel

  Description:
  Convert a multi-array to a single-array.
*/

// VARIABLE
_input = _this select 0;
_return = [];

// CONVERT DATA TO SINGLE ARRAY
{
  if(typeName _x isEqualTo "STRING") then {
    _return pushBack _x;
  };
  if(typeName _x isEqualTo "ARRAY") then {
    _sub = _x;
    {
      _return pushBack _x;
    } forEach _sub;
  };
} forEach _input;
_return = _return - [""];

_return;