#include "..\..\ConfigMacros.hpp"
/*
    File: fn_KilledEH.sqf
	Function: ZKB_fnc_KilledEH
    Author: ZKB1325

    Description:
    Killed EventHandler Function
*/

private _unit = param [0,player];
private _killer = param [1,objNull];
private _instigator = param [2,objNull];
if ((isNull _instigator) or !(isPlayer _instigator)) then {_instigator = UAVControl vehicle _killer select 0;};
if (isNull _instigator) then {_instigator = driver _killer;};
if !(isPlayer _instigator) then {_instigator = player};
closeDialog 0;
player setVariable ["respawning",true,true];
player setVariable ["restrained",false,true];

if (IsCop) then
	{
	if (SETTING(getNumber,"ZKB_CopsOnlyLoseWeapons") isEqualTo 1) exitWith 
		{
		private _uniform = uniform player;
		private _vest = vest player;
		private _backPack = backpack player;
		private _helmet = headgear player;
		private _uniformArray = ZKB_RespawnLoadOut select 3;
		private _vestArray = ZKB_RespawnLoadOut select 4;
		private _backPackArray = ZKB_RespawnLoadOut select 5;
		if (_uniformArray isEqualTo []) then
			{
			_uniformArray = [_uniform,[]];
			}
			else
			{
			_uniformArray set [0,_uniform];
			};
		if (_vestArray isEqualTo []) then
			{
			_vestArray = [_vest,[]];
			}
			else
			{
			_vestArray set [0,_vest];
			};
		if (_backPackArray isEqualTo []) then
			{
			_backPackArray = [_backPack,[]];
			}
			else
			{
			_backPackArray set [0,_backPack];
			};
		ZKB_RespawnLoadOut set [6,_helmet];
		ZKB_RespawnLoadOut set [3,_uniformArray];
		ZKB_RespawnLoadOut set [4,_vestArray];
		ZKB_RespawnLoadOut set [5,_backPackArray];
		};
		
	if (SETTING(getNumber,"ZKB_CopsLoseNothing") isEqualTo 1) exitWith
		{
		ZKB_RespawnLoadOut = getUnitLoadout player;
		};
	};

ZKB_Deaths = ZKB_Deaths + 1;
player setVariable ["Deaths",ZKB_Deaths,true];

if !(_instigator == player) then
	{
	ZKB_LastKilledBy = _instigator;
	ZKB_Suicides = 0;
	player setVariable ["Suicides",ZKB_Suicides,true];
	}
	else
	{
	
	["STR_Killed_PlayerSuicide"] call ZKB_fnc_DynamicText;
	["STR_Killed_PlayerDied",name _unit] call ZKB_fnc_AdminAddPlayerLog;
	ZKB_Suicides = ZKB_Suicides + 1;
	player setVariable ["Suicides",ZKB_Suicides,true];
	
	switch (true) do
		{
		case (ZKB_Hunger >= 100): {["STR_Killed_PlayerStarved", [name _unit]] remoteExecCall ["ZKB_fnc_DynamicText",0,false];};
		default {["STR_Killed_PlayerDied", [name _unit]] remoteExecCall ["ZKB_fnc_DynamicText",0,false];};
		};
	};
	
if (call ZKB_fnc_IsMayor) then
	{
	missionNamespace setVariable ["currentMayor","",true];
	["STR_Killed_MayorDied"] remoteExecCall ["ZKB_fnc_DynamicText",0,false];
	ZKB_TaxArray = [5,5,5,5,5];
	publicVariable "ZKB_TaxArray";
	if (SETTING(getNumber,"ZKB_StatSaveEnabled") isEqualTo 1) then
		{
		["mayor",""] remoteExecCall ["ZKB_fnc_ServerSaveStats",2,false];
		["taxes",ZKB_TaxArray] remoteExecCall ["ZKB_fnc_ServerSaveStats",2,false];
		};
	};	

ZKB_Hunger = 5;
player setVariable ["Hunger",ZKB_Hunger,true];

{
[_x,(_x select 1)] call ZKB_fnc_DropItem;
}forEach (player getVariable ["ZKB_Inventory",[]]);
["BlueInk",(["BlueInk"] call ZKB_fnc_GetInvItemAmount)] call ZKB_fnc_InvRemoveItem;