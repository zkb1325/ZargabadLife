/*
	File: fn_KnockedOut.sqf
	Function: ZKB_fnc_KnockedOut
	Author: ZKB1325
	Description: Handles the ragdoll/tazed getting knocked out
*/
private _knockedOutBy = param [0,"",[""]];
if (player getVariable ["knockedOut",false]) exitWith {};
if !(alive player) exitWith {};


if (!(vehicle player isEqualTo player) and (speed (vehicle player) > 10)) exitWith {};
if !(vehicle player isEqualTo player)  then {moveOut player;waitUntil {(isNull objectParent player)};};
closeDialog 0;
titleText[format [localize "STR_Cop_KnockedOutBy",_knockedOutBy],"PLAIN"];

[] spawn 
	{
	"dynamicBlur" ppEffectEnable true; 
	"dynamicBlur" ppEffectAdjust [10]; 
	"dynamicBlur" ppEffectCommit 0; 
	waitUntil {ppEffectCommitted "dynamicBlur"}; 
	"dynamicBlur" ppEffectEnable true; 
	"dynamicBlur" ppEffectAdjust [0]; 
	"dynamicBlur" ppEffectCommit 8;
	};

player setVariable ["knockedOut",true,true];
player setVariable ["restrained",false,true];
player setVariable ["surrendering",false,true]; 
detach player;

private _rag = "Land_Can_V3_F" createVehicleLocal [0,0,0];
_rag setMass 1e10;
_rag attachTo [player, [0,0,0], "Spine3"];
_rag setVelocity [0,0,6];
player allowDamage false;
detach _rag;
0 = _rag spawn {
	deleteVehicle _this;
	player allowDamage true;
};

private _knockouttime = serverTime + 15;
waitUntil {(animationState player) find "unconscious" > -1 or ((serverTime - _knockouttime) > 0)};
waitUntil {(animationState player) find "unconscious" < 0};

player setVariable ["knockedOut",false,true];