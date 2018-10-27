/*
	Author: ZKB1325
	File: fn_PlaceObject.sqf
	Function: ZKB_fnc_PlaceObject
	Description: Handles placing of static objects currently only set up to work with the static M2 adding any other object such as barriers or bargates will not work
*/
private ["_item","_physobject","_createditem"];
if !(vehicle player == player) exitWith {["STR_Common_CantUseInVeh"] call ZKB_fnc_DynamicText;};

_item = _this select 1;

_physobject = switch _item do
	{
	case "M2StaticMG": {"CUP_B_M2StaticMG_US";};	
	};	
	
_createditem = _physobject createVehicle [0,0,0];
_pos = [(position player select 0) + (sin(getdir player)*2), (position player select 1) + (cos(getdir player)*2), 0];
_createditem setdir getdir player;
_createditem setpos _pos;

[_item, 1] call ZKB_fnc_InvRemoveItem;
[["True",_createditem, [format [localize "STR_ItemMisc_PickUpCreatedObject", [_item] call ZKB_fnc_GetItemName], {if ([((_this select 3) select 0), 1] call ZKB_fnc_InvAddItem) then {deleteVehicle ((_this select 3) select 1);};}, [_item, _createditem], 1, true, true, "", "isNull (gunner _target)", 4]]] remoteExecCall ["ZKB_fnc_AddAction", 0, _createditem];
