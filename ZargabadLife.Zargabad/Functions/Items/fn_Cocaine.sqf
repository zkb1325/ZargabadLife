#include "..\..\ConfigMacros.hpp"
/*

	Author: ZKB1325
	File: fn_Cocaine.sqf
	Function: ZKB_fnc_Cocaine
	Description: Effect the happens when the player uses Cocaine
	
*/
private _item = param [1,""];
[_item, 1] call ZKB_fnc_InvRemoveItem;

if ((player getVariable ["cocaineInSystem",0]) > 0) exitWith
	{
	player setVariable ["cocaineInSystem",(player getVariable ["cocaineInSystem",0])+1];
	player setVariable ["ZKB_MaxINVWeight",SETTING(getNumber,"ZKB_MaxINVWeight") + (30*(player getVariable ["cocaineInSystem",0])),true];
	["STR_ItemMisc_TakenMoreDrugs"] call ZKB_fnc_DynamicText;
	};
player setVariable ["cocaineInSystem",(player getVariable ["cocaineInSystem",0])+1];
player setVariable ["ZKB_MaxINVWeight",SETTING(getNumber,"ZKB_MaxINVWeight") + (30*(player getVariable ["cocaineInSystem",0])),true];
private _effectDuration = 180;
private _effectTime = serverTime;

while {(_effectTime + (_effectDuration*(player getVariable ["cocaineInSystem",0]))) > serverTime} do  
	{
	if !(alive player) exitWith {};
	
	_force = random 10;
	"chromAberration" ppEffectEnable true;
	"chromAberration" ppEffectAdjust [_force / 24, _force / 24, true];
	"chromAberration" ppEffectCommit (0.3 + random 0.1);
	enableCamShake true; 
	addCamShake [20,5,1+((player getVariable ["cocaineInSystem",0])/2)];
	waitUntil {ppEffectCommitted "chromAberration"};
	sleep 0.6;
			
		
	};
	
player setVariable ["cocaineInSystem",0];
player setVariable ["ZKB_MaxINVWeight",SETTING(getNumber,"ZKB_MaxINVWeight"),true];
["STR_ItemMisc_DrugEffectDiminish"] call ZKB_fnc_DynamicText;

"chromAberration" ppEffectEnable false;