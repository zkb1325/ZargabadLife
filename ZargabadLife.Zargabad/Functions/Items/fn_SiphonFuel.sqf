/*
	Author: ZKB1325
	File: fn_SiphonFuel.sqf
	Function: ZKB_fnc_SiphonFuel
	Description: Removes the fuel from the nearest vehicle within 8 meters and give the player a fuel can in return
*/
private ["_item","_nearvehicles","_veh"];
closeDialog 0;
if !(vehicle player == player) exitWith {["STR_Common_CantUseInVeh"] call ZKB_fnc_DynamicText;};
_nearvehicles = (nearestObjects [player, ["motorcycle","Car","Tank","Ship","Air"], 8]);
if (count _nearvehicles < 1) exitWith {["STR_ItemMisc_NotNearVcl"] call ZKB_fnc_DynamicText;};
_veh = _nearvehicles select 0;
if (fuel _veh < .5) exitWith {["STR_ItemMisc_NotEnoughFuelSiphon"] call ZKB_fnc_DynamicText;};

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

["STR_ItemMisc_SiphoningFuel"] call ZKB_fnc_DynamicText;
sleep 5;
if (player distance _veh > 8) exitWith {["STR_ItemMisc_NotNearVcl"] call ZKB_fnc_DynamicText;};
_veh setFuel 0;
["RefuelCan", 1] call ZKB_fnc_InvAddItem;
["STR_ItemMisc_VehSiphoned"] call ZKB_fnc_DynamicText;
["STR_Admin_PlayerLogsSiphonedFuel",name player,_veh getVariable ["plate",_veh]] call ZKB_fnc_AdminAddPlayerLog;
ZKB_PerformingAction = false;