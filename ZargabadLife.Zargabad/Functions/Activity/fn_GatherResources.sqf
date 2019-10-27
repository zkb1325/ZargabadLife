#include "..\..\ConfigMacros.hpp"
/*
	Author: ZKB1325
	File: fn_GatherResources.sqf
	Function: ZKB_fnc_GatherResources
*/
_this spawn //Need to spawn because the trigger didn't let me put spawn in it
	{
	if (missionNameSpace getVariable ["InResourceArea", false]) exitWith {};
	missionNameSpace setVariable ["InResourceArea", true];
	private _resourcearea = _this select 0;
	private _resource = _this select 1;

	if (_resource == "UnProcessedCocaine") exitWith
		{
		while {player inArea _resourcearea}	do
			{
			if (40 > (random 100)) then
				{
				if (((vehicle player) == player) and ((speed (vehicle player)) > 2)) then
					{
					_amount = ceil (random 4);
					if ((([player] call ZKB_fnc_GetInvTotalWeight) + (([_resource] call ZKB_fnc_GetItemWeight)*_amount)) > (player getVariable ["ZKB_MaxINVWeight",SETTING(getNumber,"ZKB_MaxINVWeight")])) exitWith {["STR_Inv_MaxWeight"] call ZKB_fnc_DynamicText;};	
					[_resource, _amount] call ZKB_fnc_InvAddItem;	
					["STR_ItemMisc_Gathered", [_amount, [_resource] call ZKB_fnc_GetItemName]] call ZKB_fnc_DynamicText;
					["STR_Admin_PlayerLogsPlayerGatherdResource",name player,[_amount] call ZKB_fnc_FormatNumber,[_resource] call ZKB_fnc_GetItemName] call ZKB_fnc_AdminAddPlayerLog;
					};
				};
			sleep 1.5;	
			};
		missionNameSpace setVariable ["InResourceArea", false];
		};
		
	if (_resource == "UnProcessedMarijuana") exitWith
		{
		while {player inArea _resourcearea}	do
			{
			if (50 > (random 100)) then
				{
				if (((vehicle player) == player) and ((speed (vehicle player)) > 2)) then
					{
					_amount = ceil (random 7);
					if ((([player] call ZKB_fnc_GetInvTotalWeight) + (([_resource] call ZKB_fnc_GetItemWeight)*_amount)) > (player getVariable ["ZKB_MaxINVWeight",SETTING(getNumber,"ZKB_MaxINVWeight")])) exitWith {["STR_Inv_MaxWeight"] call ZKB_fnc_DynamicText;};	
					[_resource, _amount] call ZKB_fnc_InvAddItem;	
					["STR_ItemMisc_Gathered", [_amount, [_resource] call ZKB_fnc_GetItemName]] call ZKB_fnc_DynamicText;
					["STR_Admin_PlayerLogsPlayerGatherdResource",name player,[_amount] call ZKB_fnc_FormatNumber,[_resource] call ZKB_fnc_GetItemName] call ZKB_fnc_AdminAddPlayerLog;
					};
				};
			sleep 1.5;	
			};
		missionNameSpace setVariable ["InResourceArea", false];
		};
	
	if (_resource == "UnProcessedLSD") exitWith
		{
		while {player inArea _resourcearea}	do
			{
			if (35 > (random 100)) then
				{
				if (((vehicle player) == player) and ((speed (vehicle player)) > 2)) then
					{
					_amount = ceil (random 4);
					if ((([player] call ZKB_fnc_GetInvTotalWeight) + (([_resource] call ZKB_fnc_GetItemWeight)*_amount)) > (player getVariable ["ZKB_MaxINVWeight",SETTING(getNumber,"ZKB_MaxINVWeight")])) exitWith {["STR_Inv_MaxWeight"] call ZKB_fnc_DynamicText;};	
					[_resource, _amount] call ZKB_fnc_InvAddItem;	
					["STR_ItemMisc_Gathered", [_amount, [_resource] call ZKB_fnc_GetItemName]] call ZKB_fnc_DynamicText;
					["STR_Admin_PlayerLogsPlayerGatherdResource",name player,[_amount] call ZKB_fnc_FormatNumber,[_resource] call ZKB_fnc_GetItemName] call ZKB_fnc_AdminAddPlayerLog;
					};
				};
			sleep 1.5;	
			};
		missionNameSpace setVariable ["InResourceArea", false];
		};
		
	if (_resource == "UnProcessedHeroin") exitWith
		{
		while {player inArea _resourcearea}	do
			{
			if (40 > (random 100)) then
				{
				if (((vehicle player) == player) and ((speed (vehicle player)) > 2)) then
					{
					_amount = ceil (random 4);
					if ((([player] call ZKB_fnc_GetInvTotalWeight) + (([_resource] call ZKB_fnc_GetItemWeight)*_amount)) > (player getVariable ["ZKB_MaxINVWeight",SETTING(getNumber,"ZKB_MaxINVWeight")])) exitWith {["STR_Inv_MaxWeight"] call ZKB_fnc_DynamicText;};	
					[_resource, _amount] call ZKB_fnc_InvAddItem;	
					["STR_ItemMisc_Gathered", [_amount, [_resource] call ZKB_fnc_GetItemName]] call ZKB_fnc_DynamicText;
					["STR_Admin_PlayerLogsPlayerGatherdResource",name player,[_amount] call ZKB_fnc_FormatNumber,[_resource] call ZKB_fnc_GetItemName] call ZKB_fnc_AdminAddPlayerLog;
					};
				};
			sleep 1.5;	
			};
		missionNameSpace setVariable ["InResourceArea", false];
		};
	};