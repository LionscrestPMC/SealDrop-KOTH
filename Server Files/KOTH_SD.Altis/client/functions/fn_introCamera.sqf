/*
  File: fn_introCam.sqf
  Author: DeadP4xel

  Description:
  IntroCam
*/
private ["_camera","_hndl","_range","_handle"];
_range = 1400;

// FIRST SPAWN CHECK
waitUntil {!isNull player && alive player};
playSound ["intro",true];
_handle =
  [] spawn {
      _hndl = ppEffectCreate ["colorCorrections", 1501];
      _hndl ppEffectEnable true;
      _hndl ppEffectAdjust [1, 1, -0.01, [10, 0.7, 0.0, 0.7],[1, 1, 1, 1], [0, 0, 0, 1]];
      _hndl ppEffectCommit 0;
      uiSleep 3;
      _hndl ppEffectEnable true;
      _hndl ppEffectAdjust
      [1, 1,  -0.01, [0, 0, 0, 0], [1, 1, 1, 1],[0, 0, 0, 1]];
      _hndl ppEffectCommit 10;
      waitUntil {ppEffectCommitted _hndl};
      ppEffectDestroy _hndl;
  };
showCinemaBorder TRUE;
camUseNVG FALSE;
for "_x" from 0 to 20 do {
  _x cutRsc ["spawnIntro","PLAIN"];
};
_camera = "camera" camCreate [(position player select 0) + 5,(position player select 1),(position player select 2) + _range];
_camera cameraEffect ["internal","back"];
_camera camSetTarget vehicle player;
_camera camSetFOV 1.000;
_camera camCommit 2;
waitUntil {camCommitted _camera};
_camera camSetFOV 4.000;
_camera camSetTarget vehicle player;
_camera camSetRelPos [0,-10,20];
_camera camCommit 5;
waitUntil {camCommitted _camera};
_camera camSetFOV 2.000;
_camera camSetTarget vehicle player;
_camera camSetRelPos [0,-1.5,2];
_camera camCommit 1;
waitUntil {camCommitted _camera};
_camera camSetTarget vehicle player;
_camera camSetRelPos [0,-1,1.85];
_camera camCommit 2;
waitUntil {camCommitted _camera};
_camera camSetTarget vehicle player;
_camera camSetRelPos [0,-0.05,1.85];
_camera camCommit 0.15;
waitUntil {camCommitted _camera};
_camera cameraEffect ["terminate","back"];
camDestroy _camera;
waitUntil {scriptDone _handle};