/*
  File: fn_volumeBalancerHigh.sqf
  Author: DeadP4xel

  Description:
  Will increase the player volume ..
*/
if(soundVolume isEqualTo 1) exitWith {};
if(!alive player) exitWith {};

if(soundVolume isEqualTo 0) exitWith {
  1 fadeSound 0.1;
};
if(soundVolume isEqualTo 0.1) exitWith {
  1 fadeSound 0.2;
};
if(soundVolume isEqualTo 0.2) exitWith {
  1 fadeSound 0.3;
};
if(soundVolume isEqualTo 0.3) exitWith {
  1 fadeSound 0.4;
};
if(soundVolume isEqualTo 0.4) exitWith {
  1 fadeSound 0.5;
};
if(soundVolume isEqualTo 0.5) exitWith {
  1 fadeSound 0.6;
};
if(soundVolume isEqualTo 0.6) exitWith {
  1 fadeSound 0.7;
};
if(soundVolume isEqualTo 0.7) exitWith {
  1 fadeSound 0.8;
};
if(soundVolume isEqualTo 0.8) exitWith {
  1 fadeSound 0.9;
};
if(soundVolume isEqualTo 0.9) exitWith {
  1 fadeSound 1;
};
