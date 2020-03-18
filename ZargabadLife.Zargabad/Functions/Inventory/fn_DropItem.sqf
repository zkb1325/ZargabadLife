/*
	Author: ZKB1325
	FileName: fn_DropItem.sqf
	Function: ZKB_fnc_DropItem
	Description: Generic drop item function mainly for when players die and drop items or get robbed
*/

private _itemarr = (_this select 0);
if (typeName _itemarr isEqualTo typeName "") then
	{
	_itemarr = call compile _itemarr;
	};

private _itemtodrop = _itemarr select 0;
private _iteminvamount = _itemarr select 1;
private _amountdropped = (_this select 1);

if (_amountdropped < 1) exitWith {};
if !([_itemtodrop] call ZKB_fnc_GetItemCanDrop) exitWith {};
if (_amountdropped > _iteminvamount) then {_amountdropped = _iteminvamount;};

[_itemtodrop, _amountdropped] call ZKB_fnc_InvRemoveItem;

private _physItem = (getText (missionConfigFile >> "Item_Config" >> _itemtodrop >> "dropClass"));

private _dropPos = (ASLToATL (player modelToWorldWorld [0,1.25,.2]));
private _object = createVehicle [_physItem,_dropPos,[],1,"CAN_COLLIDE"];
_object setVariable ["ItemData", [_itemtodrop, _amountdropped], true];
[_object, [format [localize "STR_Inv_PickUp", [_itemtodrop] call ZKB_fnc_GetItemName, [_amountdropped] call ZKB_fnc_FormatNumber], ZKB_fnc_InvPickUpItem, "", 1, true, true, "", "_var = (_target getVariable ""ItemData""); (!IsNil ""_var"")", 3]] remoteExecCall ["addAction", 0, _object];