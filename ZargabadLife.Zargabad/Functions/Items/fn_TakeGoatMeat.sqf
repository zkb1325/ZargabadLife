#include "..\..\ConfigMacros.hpp"
/*
	Author: ZKB1325
	File: fn_TakeGoatMeat.sqf
	Function: ZKB_fnc_TakeGoatMeat
	Description: Runs when the player uses the addaction to pick up goat meat
*/
private ["_goat","_ranamount"];
_goat = (nearestObjects [player, ["Goat_random_F"],3]) select 0;
if (isNil "_goat") exitWith {};
if (isNull _goat) exitWith {};
_ranamount = ceil(random 7);
if ((([player] call ZKB_fnc_GetInvTotalWeight) + ((["Goat"] call ZKB_fnc_GetItemWeight)*_ranamount)) > (player getVariable ["ZKB_MaxINVWeight",SETTING(getNumber,"ZKB_MaxINVWeight")])) exitWith {["STR_Inv_MaxWeight"] call ZKB_fnc_DynamicText;};
deleteVehicle _goat;
ZKB_PerformingAction = true;
if(animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then 
	{
	[player,"AinvPknlMstpSnonWnonDnon_medic_1",true] remoteExecCall ["ZKB_fnc_AnimSync",0];
	player switchMove "AinvPknlMstpSnonWnonDnon_medic_1";
	player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
	};
	
sleep 5;
	
["STR_ItemMisc_CollectedGoatMeat", [_ranamount]] call ZKB_fnc_DynamicText;
["Goat", _ranamount] call ZKB_fnc_InvAddItem;
ZKB_PerformingAction = false;
