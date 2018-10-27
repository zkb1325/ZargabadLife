/*
	Author: ZKB1325
	File: fn_ItemBag.sqf
	Function: ZKB_fnc_ItemBag
	Description: Removes all virtual items from the ground within a 10 meter radius
*/
private ["_item","_nearobjs"];
closeDialog 0;
if !(vehicle player == player) exitWith {["STR_Common_CantUseInVeh"] call ZKB_fnc_DynamicText;};

_item = _this select 1;

	
_nearobjs = (nearestObjects [player, ["Land_Money_F","Land_Suitcase_F","Land_PainKillers_F","Land_ButaneTorch_F","Land_CanisterFuel_F","Land_MetalBarrel_F","Land_Sleeping_bag_folded_F","Land_MultiMeter_F","Land_File1_F","Explosive","Land_Tablet_02_F","Land_TinContainer_F","Land_Ammobox_rounds_F","Land_Bucket_F","Land_MetalCase_01_small_F","Land_Bag_EP1"], 10]);

if (count _nearobjs > 0) then
	{
	{
	deleteVehicle _x;	
	}forEach _nearobjs;
	
	["STR_ItemMisc_ItemBagItemRemoved", [count _nearobjs]] call ZKB_fnc_DynamicText;
	[_item, 1] call ZKB_fnc_InvRemoveItem;
	};