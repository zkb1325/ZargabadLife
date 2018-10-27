#include "..\..\ConfigMacros.hpp"
/*
	Author: ZKB1325
	File: fn_TakeRabbitMeat.sqf
	Function: ZKB_fnc_TakeRabbitMeat
	Description: Runs when the player uses the addaction to pick up rabbit meat
*/
private ["_rabbit","_ranamount"];
_rabbit = (nearestObjects [player, ["Goat_random_F"],3]) select 0;
if (isNil "_rabbit") exitWith {};
if (isNull _rabbit) exitWith {};
_ranamount = ceil(random 7);
if ((([player] call ZKB_fnc_GetInvTotalWeight) + ((["Rabbit"] call ZKB_fnc_GetItemWeight)*_ranamount)) > (player getVariable ["ZKB_MaxINVWeight",SETTING(getNumber,"ZKB_MaxINVWeight")])) exitWith {["STR_Inv_MaxWeight"] call ZKB_fnc_DynamicText;};
deleteVehicle _rabbit;
ZKB_PerformingAction = true;
if(animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then 
	{
	[player,"AinvPknlMstpSnonWnonDnon_medic_1",true] remoteExecCall ["ZKB_fnc_AnimSync",0];
	player switchMove "AinvPknlMstpSnonWnonDnon_medic_1";
	player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
	};
	
sleep 5;
	
["STR_ItemMisc_CollectedRabbiMeat", [_ranamount]] call ZKB_fnc_DynamicText;
["Rabbit", _ranamount] call ZKB_fnc_InvAddItem;
ZKB_PerformingAction = false;
