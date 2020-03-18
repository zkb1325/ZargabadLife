#include "..\..\ConfigMacros.hpp"
/*
	Author: ZKB1325
	File: fn_Mine.sqf
	Function: ZKB_fnc_Mine
	Description: Runs when player uses shovel, pickaxe, or jack hammer
*/
private ["_item","_mineditem","_maxamount","_minedamount"];
_item = _this select 1;

if !(vehicle player == player) exitWith {["STR_Common_CantUseInVeh"] call ZKB_fnc_DynamicText;};

_mineditem = "";
_maxamount = 0;

switch (true) do
	{
	case (player inArea "IronMineArea"): {_mineditem = "Iron"; _maxamount = 8;};	
	case (player inArea "CopperMineArea"): {_mineditem = "Copper"; _maxamount = 8;};	
	case (player inArea "CoalMineArea"): {_mineditem = "Coal"; _maxamount = 12;};	
	case (player inArea "DiamondRockMineArea"): {_mineditem = "DiamondRock"; _maxamount = 6;};	
	case (player inArea "PlatinumMineArea"): {_mineditem = "Platinum"; _maxamount = 2;};	
	case (player inArea "SilverMineArea"): {_mineditem = "Silver"; _maxamount = 5;};	
	case (player inArea "GoldMineArea"): {_mineditem = "Gold"; _maxamount = 4;};	
	case ((player inArea "OilMineArea") or (player inArea "OilMineArea2")): {_mineditem = "Oil"; _maxamount = 4;};	
	case (player inArea "SandMineArea"): {_mineditem = "Sand"; _maxamount = 10;};	
	case (player inArea "SiliconMineArea"): {_mineditem = "Silicon"; _maxamount = 5;};	
	case (player inArea "SulferMineArea"): {_mineditem = "Sulfer"; _maxamount = 5;};	
	};
	
if (_mineditem == "") exitWith {["STR_ItemMisc_NotNearMine"] call ZKB_fnc_DynamicText;};

if (ZKB_PerformingAction) exitWith {["STR_Common_AlreadyPerformingAction"] call ZKB_fnc_DynamicText;};
ZKB_PerformingAction = true;
	
switch _item do
	{
	case "Shovel": 
		{
		for "_i" from 1 to 3 do
			{
			if !(vehicle player isEqualTo player) exitWith {["STR_ItemMisc_CantMineInVehicle"] call ZKB_fnc_DynamicText;};
			titletext [localize "STR_ItemMisc_Mining","plain"];
			if(animationState player != "AinvPknlMstpSlayWrflDnon") then 
				{
				[player,"AinvPknlMstpSlayWrflDnon",true] remoteExecCall ["ZKB_fnc_AnimSync",0];
				player switchMove "AinvPknlMstpSlayWrflDnon";
				player playMoveNow "AinvPknlMstpSlayWrflDnon";
				};	
				
			sleep 3;
			if !(vehicle player isEqualTo player) exitWith {["STR_ItemMisc_CantMineInVehicle"] call ZKB_fnc_DynamicText;};
			if (animationState player != "normal") then 
				{
				[player,"normal",true] remoteExecCall ["ZKB_fnc_AnimSync",0];
				player switchMove "normal";
				player playMoveNow "normal";
				};
			
			_minedamount = 	round (random _maxamount) max 1;
			if ((([player] call ZKB_fnc_GetInvTotalWeight) + (([_mineditem] call ZKB_fnc_GetItemWeight)*_minedamount)) > (player getVariable ["ZKB_MaxINVWeight",SETTING(getNumber,"ZKB_MaxINVWeight")])) exitWith {["STR_Inv_MaxWeight"] call ZKB_fnc_DynamicText;};	
			
			[_mineditem, _minedamount] call ZKB_fnc_InvAddItem;
			["STR_ItemMisc_JustMined", [_minedamount, [_mineditem] call ZKB_fnc_GetItemName]] call ZKB_fnc_DynamicText;
			["STR_Admin_PlayerLogsPlayerGatherdResource",name player,[_minedamount] call ZKB_fnc_FormatNumber,[_mineditem] call ZKB_fnc_GetItemName] call ZKB_fnc_AdminAddPlayerLog;
			
			ZKB_ShovelDur = ZKB_ShovelDur - floor (random 2);
			if (ZKB_ShovelDur <=0) then
				{
				["STR_ItemMisc_ItemBroke", [[_item] call ZKB_fnc_GetItemName]] call ZKB_fnc_DynamicText;	
				[_item, 1] call ZKB_fnc_InvRemoveItem;
				ZKB_ShovelDur = 20;
				};
				
			if ([_item] call ZKB_fnc_GetInvItemAmount < 1) exitWith {["STR_ItemMisc_NoMineingTool", [[_item] call ZKB_fnc_GetItemName]] call ZKB_fnc_DynamicText;};
			};
			
		titletext [localize "STR_ItemMisc_DoneMining","plain"];
		};
		
	case "PickAxe": 
		{
		for "_i" from 1 to 3 do
			{
			if !(vehicle player isEqualTo player) exitWith {["STR_ItemMisc_CantMineInVehicle"] call ZKB_fnc_DynamicText;};
			titletext [localize "STR_ItemMisc_Mining","plain"];
			if(animationState player != "AinvPknlMstpSlayWrflDnon") then 
				{
				[player,"AinvPknlMstpSlayWrflDnon",true] remoteExecCall ["ZKB_fnc_AnimSync",0];
				player switchMove "AinvPknlMstpSlayWrflDnon";
				player playMoveNow "AinvPknlMstpSlayWrflDnon";
				};	
				
			sleep 1.5;
			if !(vehicle player isEqualTo player) exitWith {["STR_ItemMisc_CantMineInVehicle"] call ZKB_fnc_DynamicText;};
			if (animationState player != "normal") then 
				{
				[player,"normal",true] remoteExecCall ["ZKB_fnc_AnimSync",0];
				player switchMove "normal";
				player playMoveNow "normal";
				};
			
			_minedamount = 	round (random _maxamount) max 1;
			if ((([player] call ZKB_fnc_GetInvTotalWeight) + (([_mineditem] call ZKB_fnc_GetItemWeight)*_minedamount)) > (player getVariable ["ZKB_MaxINVWeight",SETTING(getNumber,"ZKB_MaxINVWeight")])) exitWith {["STR_Inv_MaxWeight"] call ZKB_fnc_DynamicText;};	
			
			[_mineditem, _minedamount] call ZKB_fnc_InvAddItem;
			["STR_ItemMisc_JustMined", [_minedamount, [_mineditem] call ZKB_fnc_GetItemName]] call ZKB_fnc_DynamicText;
			["STR_Admin_PlayerLogsPlayerGatherdResource",name player,[_minedamount] call ZKB_fnc_FormatNumber,[_mineditem] call ZKB_fnc_GetItemName] call ZKB_fnc_AdminAddPlayerLog;
			
			ZKB_PickaxeDur = ZKB_PickaxeDur - floor (random 2);
			if (ZKB_PickaxeDur <=0) then
				{
				["STR_ItemMisc_ItemBroke", [[_item] call ZKB_fnc_GetItemName]] call ZKB_fnc_DynamicText;	
				[_item, 1] call ZKB_fnc_InvRemoveItem;
				ZKB_PickaxeDur = 50;
				};
				
			if ([_item] call ZKB_fnc_GetInvItemAmount < 1) exitWith {["STR_ItemMisc_NoMineingTool", [[_item] call ZKB_fnc_GetItemName]] call ZKB_fnc_DynamicText;};
			};
			
		titletext [localize "STR_ItemMisc_DoneMining","plain"];
		};
		
	case "JackHammer": 
		{
		for "_i" from 1 to 5 do
			{
			if !(vehicle player isEqualTo player) exitWith {["STR_ItemMisc_CantMineInVehicle"] call ZKB_fnc_DynamicText;};
			titletext [localize "STR_ItemMisc_Mining","plain"];
			if(animationState player != "AmovPercMstpSnonWnonDnon_exercisekneeBendB") then 
				{
				[player,"AmovPercMstpSnonWnonDnon_exercisekneeBendB",true] remoteExecCall ["ZKB_fnc_AnimSync",0];
				player switchMove "AmovPercMstpSnonWnonDnon_exercisekneeBendB";
				player playMoveNow "AmovPercMstpSnonWnonDnon_exercisekneeBendB";
				};	
				
			sleep .8;
			
			_minedamount = 	round (random _maxamount) max 1;
			if ((([player] call ZKB_fnc_GetInvTotalWeight) + (([_mineditem] call ZKB_fnc_GetItemWeight)*_minedamount)) > (player getVariable ["ZKB_MaxINVWeight",SETTING(getNumber,"ZKB_MaxINVWeight")])) exitWith {["STR_Inv_MaxWeight"] call ZKB_fnc_DynamicText;};	
			
			[_mineditem, _minedamount] call ZKB_fnc_InvAddItem;
			["STR_ItemMisc_JustMined", [_minedamount, [_mineditem] call ZKB_fnc_GetItemName]] call ZKB_fnc_DynamicText;
			["STR_Admin_PlayerLogsPlayerGatherdResource",name player,[_minedamount] call ZKB_fnc_FormatNumber,[_mineditem] call ZKB_fnc_GetItemName] call ZKB_fnc_AdminAddPlayerLog;
			
			ZKB_JackhammerDur = ZKB_JackhammerDur - floor (random 2);
			if (ZKB_JackhammerDur <=0) then
				{
				["STR_ItemMisc_ItemBroke", [[_item] call ZKB_fnc_GetItemName]] call ZKB_fnc_DynamicText;	
				[_item, 1] call ZKB_fnc_InvRemoveItem;
				ZKB_JackhammerDur = 100;
				};
				
			if ([_item] call ZKB_fnc_GetInvItemAmount < 1) exitWith {["STR_ItemMisc_NoMineingTool", [[_item] call ZKB_fnc_GetItemName]] call ZKB_fnc_DynamicText;};
			
			sleep .8;
			
			_minedamount = 	round (random _maxamount) max 1;
			if ((([player] call ZKB_fnc_GetInvTotalWeight) + (([_mineditem] call ZKB_fnc_GetItemWeight)*_minedamount)) > (player getVariable ["ZKB_MaxINVWeight",SETTING(getNumber,"ZKB_MaxINVWeight")])) exitWith {["STR_Inv_MaxWeight"] call ZKB_fnc_DynamicText;};	
			
			[_mineditem, _minedamount] call ZKB_fnc_InvAddItem;
			["STR_ItemMisc_JustMined", [_minedamount, [_mineditem] call ZKB_fnc_GetItemName]] call ZKB_fnc_DynamicText;
			["STR_Admin_PlayerLogsPlayerGatherdResource",name player,[_minedamount] call ZKB_fnc_FormatNumber,[_mineditem] call ZKB_fnc_GetItemName] call ZKB_fnc_AdminAddPlayerLog;
			
			ZKB_JackhammerDur = ZKB_JackhammerDur - floor (random 2);
			if (ZKB_JackhammerDur <=0) then
				{
				["STR_ItemMisc_ItemBroke", [[_item] call ZKB_fnc_GetItemName]] call ZKB_fnc_DynamicText;	
				[_item, 1] call ZKB_fnc_InvRemoveItem;
				ZKB_JackhammerDur = 100;
				};
				
			if ([_item] call ZKB_fnc_GetInvItemAmount < 1) exitWith {["STR_ItemMisc_NoMineingTool", [[_item] call ZKB_fnc_GetItemName]] call ZKB_fnc_DynamicText;};
			
			sleep .8;
			
			_minedamount = 	round (random _maxamount) max 1;
			if ((([player] call ZKB_fnc_GetInvTotalWeight) + (([_mineditem] call ZKB_fnc_GetItemWeight)*_minedamount)) > (player getVariable ["ZKB_MaxINVWeight",SETTING(getNumber,"ZKB_MaxINVWeight")])) exitWith {["STR_Inv_MaxWeight"] call ZKB_fnc_DynamicText;};	
			
			[_mineditem, _minedamount] call ZKB_fnc_InvAddItem;
			["STR_ItemMisc_JustMined", [_minedamount, [_mineditem] call ZKB_fnc_GetItemName]] call ZKB_fnc_DynamicText;
			["STR_Admin_PlayerLogsPlayerGatherdResource",name player,[_minedamount] call ZKB_fnc_FormatNumber,[_mineditem] call ZKB_fnc_GetItemName] call ZKB_fnc_AdminAddPlayerLog;
			
			ZKB_JackhammerDur = ZKB_JackhammerDur - floor (random 2);
			if (ZKB_JackhammerDur <=0) then
				{
				["STR_ItemMisc_ItemBroke", [[_item] call ZKB_fnc_GetItemName]] call ZKB_fnc_DynamicText;	
				[_item, 1] call ZKB_fnc_InvRemoveItem;
				ZKB_JackhammerDur = 100;
				};
				
			if ([_item] call ZKB_fnc_GetInvItemAmount < 1) exitWith {["STR_ItemMisc_NoMineingTool", [[_item] call ZKB_fnc_GetItemName]] call ZKB_fnc_DynamicText;};
			
			waituntil{animationstate player != "amovPercMstpSnonWnonDnon_exercisekneeBendB"};
			
			if (animationState player != "normal") then 
				{
				[player,"normal",true] remoteExecCall ["ZKB_fnc_AnimSync",0];
				player switchMove "normal";
				player playMoveNow "normal";
				};
			};
			
		titletext [localize "STR_ItemMisc_DoneMining","plain"];
		};
	};

ZKB_PerformingAction = false;