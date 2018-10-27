#include "..\..\ConfigMacros.hpp"
/*
    File: fn_RobBank.sqf
	Function: ZKB_fnc_RobBank
    Author: ZKB1325

    Description:
    Function for Bank robbing
	
	this addAction[localize "STR_Common_Rob" + " " + localize "STR_Bank_Bank",ZKB_fnc_RobBank,"",0,false,false,"",'(playerSide isEqualTo civilian)',7];

*/

private _safe = param [0, objNull, [objNull]];

if (currentWeapon player == "") exitWith {["STR_Bank_RobNoWeapon"] call ZKB_fnc_DynamicText;};
if ((serverTime - (_safe getVariable ["lastRobbed",0])) < 1200) exitWith {["STR_Bank_SafeRecent"] call ZKB_fnc_DynamicText;};
if (ZKB_PerformingAction) exitWith {["STR_Common_AlreadyPerformingAction"] call ZKB_fnc_DynamicText;};
ZKB_PerformingAction = true;

private _robamount = 0;

for "_i" from 1 to (floor ((serverTime - (_safe getVariable ["lastRobbed",0])) / 40)) do //Get total seconds passed since last robbery and add money for every 40 seconds passed
	{
	_robamount = _robamount + round (1000 + (random 1000));
	};
_safe setVariable ["LastRobbed",servertime,true];
_robAmount = round (_robamount min SETTING(getNumber,"ZKB_MaxVaultMoney"));

["STR_Bank_RobbingBank"] call ZKB_fnc_DynamicText;
[0,[localize "STR_Bank_RobbingBankGlobal","PLAIN",1,true,true]] remoteExecCall ["cutText",0,false];
private _soundPath = [(str missionConfigFile), 0, -15] call BIS_fnc_trimString; 
private _soundToPlay = _soundPath + "sounds\BankAlarm.ogg"; 
playSound3D [_soundToPlay, _safe, false, getPosASL _safe, 15, 1, 0];

//About 23 seconds of animations for a 23 second rob timer
private _animation = if (primaryWeapon player != "" and currentWeapon player isEqualTo primaryWeapon player) then {"AinvPknlMstpSnonWrflDnon_medic4"}else{"AinvPknlMstpSnonWnonDnon_medic4"};
player playMove _animation; 
sleep 4; 
waitUntil {animationState player != _animation};
if (!alive player) exitWith {ZKB_PerformingAction = false;};
if (currentWeapon player isEqualTo primaryWeapon player) then {player switchMove "AmovPknlMstpSlowWrflDnon";};
if (currentWeapon player isEqualTo handgunWeapon player) then {player switchMove "AmovPknlMstpSrasWpstDnon";};
//If its to long then delete the next 7 lines
sleep .5; 
player playMove _animation; 
sleep 4; 
waitUntil {animationState player != _animation};
if (!alive player) exitWith {ZKB_PerformingAction = false;};
if (currentWeapon player isEqualTo primaryWeapon player) then {player switchMove "AmovPknlMstpSlowWrflDnon";};
if (currentWeapon player isEqualTo handgunWeapon player) then {player switchMove "AmovPknlMstpSrasWpstDnon";};

["Money", _robAmount] call ZKB_fnc_InvAddItem;
["STR_Bank_RobbedBank"] call ZKB_fnc_DynamicText;
[_robAmount] remoteExecCall ["ZKB_fnc_RobBankLoss",0,false];

ZKB_PerformingAction = false;

["BlueInk", _robAmount] call ZKB_fnc_InvAddItem;
private _atmLockOutTime = serverTime + ((_robAmount/25000)*60);
waitUntil {serverTime > _atmLockOutTime or !alive player};
["BlueInk",_robAmount] call ZKB_fnc_InvRemoveItem;