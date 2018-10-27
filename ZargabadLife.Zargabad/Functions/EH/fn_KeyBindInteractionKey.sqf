#include "..\..\ConfigMacros.hpp"
/*
	Author: ZKB1325
	FileName: fn_KeyBindInteractionKey.sqf
	Function: ZKB_fnc_KeyBindInteractionKey
	
	Description: Key bind function for interacting
*/
if !(missionNamespace getVariable ["keysEnabled",true]) exitWith {false;};
if (Dialog) exitWith {true;};
if ([player] call ZKB_fnc_IsRestrained) exitWith {true;};
if ([player] call ZKB_fnc_IsSurrending) exitWith {true;};
if ([player] call ZKB_fnc_IsKnockedOut) exitWith {true;};

if ((isPlayer cursorObject) and IsCop and (side cursorObject isEqualTo civilian) and (player distance cursorObject < 3)) exitWith
	{
	if (dialog) then {closeDialog 0;};
	[cursorObject] spawn ZKB_fnc_CivInteractionMenu;
	true;
	};
	
if ((isPlayer cursorObject) and IsCiv and (player distance cursorObject < 3)) exitWith
	{
	if (dialog) then {closeDialog 0;};
	[cursorObject] spawn ZKB_fnc_InteractionMenu;
	true;
	};
	
if ((vehicle player == player) and ((locked cursorObject) == 0) and (!isNil {cursorObject getVariable "plate"}) and (player distance cursorObject < 5)) exitWith
	{
	_vcl = cursorObject;	
	if(_vcl emptyPositions "Driver" > 0)exitwith {player action ["getInDriver", _vcl]; true;};
	if(_vcl emptyPositions "Gunner" > 0)exitwith {player action ["getInGunner", _vcl]; true;};
	if(_vcl emptyPositions "Commander" > 0)exitwith {player action ["getInCommander", _vcl]; true;};
	if(_vcl emptyPositions "Cargo" > 0)exitwith {player action ["getInDriver", _vcl];_vcl spawn {sleep 0.5;player moveincargo _this;}; true;};
	true;
	};
	
if (!(vehicle player == player)) exitWith 
	{
	_vcl = (vehicle player);
	if((locked _vcl) == 2) exitwith {["STR_Common_VehIsLocked"] call ZKB_fnc_DynamicText; true;};
	if((speed _vcl) > 30) exitwith {["STR_Common_VehMovingToFast"] call ZKB_fnc_DynamicText; true;};
	player action ["getOut", _vcl];	
	true;
	};
	
if ((count (cursorObject getVariable ["ShopData",[]]) > 0) and (player distance cursorObject < 5)) exitWith 
	{
	if ((str cursorObject) in SETTING(getArray,"ZKB_GangAreas")) exitWith {true;};
	if (cursorObject in [CocaineShop,MarijuanaShop,LSDShop,HeroinShop] and IsCop) exitWith
		{
		[cursorObject] call ZKB_fnc_SearchShop;
		true;
		};
	[cursorObject] spawn ZKB_fnc_OpenShop;
	true;
	};

if ((str cursorObject)in SETTING(getArray,"ZKB_ATMArray")) exitWith {[] spawn ZKB_fnc_OpenBank; true;};
