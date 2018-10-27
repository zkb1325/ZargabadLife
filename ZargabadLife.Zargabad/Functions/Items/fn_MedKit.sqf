/*
	Author: ZKB1325
	File: fn_MedKit.sqf
	Function: ZKB_fnc_MedKit
	Description: Heals the player to 100%
*/
private ["_item"];
closeDialog 0;
if !(vehicle player == player) exitWith {["STR_Common_CantUseInVeh"] call ZKB_fnc_DynamicText;};

if (ZKB_PerformingAction) exitWith {["STR_Common_AlreadyPerformingAction"] call ZKB_fnc_DynamicText;};
ZKB_PerformingAction = true;

_item = _this select 1;
[_item, 1] call ZKB_fnc_InvRemoveItem;

if(animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then 
	{
	[player,"AinvPknlMstpSnonWnonDnon_medic_1",true] remoteExecCall ["ZKB_fnc_AnimSync",0];
	player switchMove "AinvPknlMstpSnonWnonDnon_medic_1";
	player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
	};
	
sleep 5;
player setDamage 0;
["STR_ItemMisc_HealedSelf"] call ZKB_fnc_DynamicText;

ZKB_PerformingAction = false;