/*
	Author: ZKB1325
	FileName: fn_InvDropItem.sqf
	Function: ZKB_fnc_InvDropItem
	Description: Runs when a player drops an item from inventory
*/
private _itemarr = (_this select 0);
if (typeName _itemarr isEqualTo typeName "") then
	{
	_itemarr = call compile _itemarr;
	};

private _itemtodrop = _itemarr select 0;
private _iteminvamount = _itemarr select 1;
private _amountdropped = floor (abs (parseNumber (_this select 1)));

if (_amountdropped < 1) exitWith {};
if !((vehicle player) == player) exitWith {["STR_Inv_NotAllowedToDropInVeh"] call ZKB_fnc_DynamicText;};
if (_amountdropped > _iteminvamount) exitWith {["STR_Inv_NotEnoughToDrop", [[_amountdropped] call ZKB_fnc_FormatNumber, [_itemtodrop] call ZKB_fnc_GetItemName]] call ZKB_fnc_DynamicText;};
if !([_itemtodrop] call ZKB_fnc_GetItemCanDrop) exitWith {["STR_Inv_NotAllowedToDrop", [[_itemtodrop] call ZKB_fnc_GetItemName]] call ZKB_fnc_DynamicText;};

closeDialog 0;
[_itemtodrop, _amountdropped] call ZKB_fnc_InvRemoveItem;

private _physItem = (getText (missionConfigFile >> "Item_Config" >> _itemtodrop >> "dropClass"));
	
if(currentWeapon player == "")then{player playmove "AmovPercMstpSnonWnonDnon_AinvPknlMstpSnonWnonDnon"}else{player playmove "AinvPknlMstpSlayWrflDnon"};
private _dropPos = (ASLToATL (player modelToWorldWorld [0,1.25,.2]));
private _object = createVehicle [_physItem,_dropPos,[],1,"CAN_COLLIDE"];
_object setVariable ["ItemData", [_itemtodrop, _amountdropped], true];
[_object, [format [localize "STR_Inv_PickUp", [_itemtodrop] call ZKB_fnc_GetItemName, [_amountdropped] call ZKB_fnc_FormatNumber], ZKB_fnc_InvPickUpItem, "", 1, true, true, "", "_var = (_target getVariable ""ItemData""); (!IsNil ""_var"")", 3]] remoteExecCall ["addAction", 0, _object];

["STR_Inv_Dropped", [[_amountdropped] call ZKB_fnc_FormatNumber, [_itemtodrop] call ZKB_fnc_GetItemName]] call ZKB_fnc_DynamicText;
["STR_Admin_PlayerLogsDropItem",name player,[_amountdropped] call ZKB_fnc_FormatNumber,[_itemtodrop] call ZKB_fnc_GetItemName] call ZKB_fnc_AdminAddPlayerLog;