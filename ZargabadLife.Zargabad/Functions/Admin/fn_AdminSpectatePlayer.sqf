/*
	Author: ZKB1325
	FileName: fn_AdminSpectatePlayer.sqf
	Function: ZKB_fnc_AdminSpectatePlayer
	Description: Changes the camera to spectate selected player

*/
private _spectatePlayer = param [0,objNull,[objNull]];
if (isnull _spectatePlayer) exitWith {["STR_Bank_TransferPlayerNotInGame"] call ZKB_fnc_DynamicText; player switchCamera cameraView; hint localize "STR_Admin_SpectateSelf"; ["STR_Admin_AdminLogSpectateStop",name player] call ZKB_fnc_AdminAddAdminLog;};

if (_spectatePlayer isEqualTo player) exitWith {player switchCamera cameraView; hint localize "STR_Admin_SpectateSelf"; ["STR_Admin_AdminLogSpectateStop",name player] call ZKB_fnc_AdminAddAdminLog;};

vehicle _spectatePlayer switchCamera cameraView;
hint format [localize "STR_Admin_SpectateOther",name _spectatePlayer];

["STR_Admin_AdminLogSpectatePlayer",name player,name _spectatePlayer] call ZKB_fnc_AdminAddAdminLog;

[_spectatePlayer] spawn
	{
	_spectatePlayer = param [0];
	waitUntil {(isNull _spectatePlayer) or (!alive _spectatePlayer) or (cameraOn isEqualTo player)};
	if (cameraOn isEqualTo player) exitWith {};
	sleep 2;
	player switchCamera cameraView; 
	hint localize "STR_Admin_SpectateSelf";
	["STR_Admin_AdminLogSpectateStop",name player] call ZKB_fnc_AdminAddAdminLog;
	};
