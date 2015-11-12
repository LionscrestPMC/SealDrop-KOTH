/*
  File: onPlayerRespawn.sqf
  Author: DeadP4xel
*/
private["_player","_corpse"];
_player = _this select 0;
_corpse = _this select 1;

closeDialog 7500;
switch(playerSide) do
{
    case west:
    {
        [] spawn sd_fnc_initWest;
        [] call sd_fnc_hudCreate;
    };
    case opfor:
    {
        [] spawn sd_fnc_initOpfor;
        [] call sd_fnc_hudCreate;
    };
    case independent:
    {
        [] spawn sd_fnc_initIndep;
        [] call sd_fnc_hudCreate;
    };
};
_player addRating 999999;
sd_isDead = false;