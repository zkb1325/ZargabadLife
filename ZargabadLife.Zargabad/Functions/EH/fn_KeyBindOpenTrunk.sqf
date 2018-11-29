#include "..\..\ConfigMacros.hpp"
/*
	Author: ZKB1325
	FileName: fn_KeyBindOpenTrunk.sqf
	Function: ZKB_fnc_KeyBindOpenTrunk
	
	Description: Key bind function for Opening a vehicle trunk
*/
if !(missionNamespace getVariable ["keysEnabled",true]) exitWith {false;};
if (dialog) exitWith {true;};
if ([player] call ZKB_fnc_IsRestrained) exitWith {true;};
if (!(driver (vehicle player) isEqualTo player) or ((vehicle player) isEqualTo player)) exitWith {["STR_Common_NotInVehDriver"] call ZKB_fnc_DynamicText; true;};
if !((vehicle player) in (player getVariable ["ZKB_Keys",[]])) exitWith {["STR_Common_VehLockNotYours"] call ZKB_fnc_DynamicText; true;};

[
[(vehicle player),"VehicleTrunk",[typeOf (vehicle player)] call ZKB_fnc_GetItemTrunkSpace,true,"STR_Vehicle_VehicleTrunk","STR_Fac_TakeItem",SETTING(getArray,"ZKB_VehicleTrunkBlacklist")],
[player,"ZKB_Inventory",player getVariable ["ZKB_MaxINVWeight",SETTING(getNumber,"ZKB_MaxINVWeight")],true,"STR_Inv_Inventory","STR_Fac_StoreItem",[],true,true]
] spawn ZKB_fnc_DualInvOpen;
true;