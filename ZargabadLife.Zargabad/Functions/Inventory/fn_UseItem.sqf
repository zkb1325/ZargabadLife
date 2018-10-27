/*
	Author: ZKB1325
	FileName: fn_UseItem.sqf
	Function: ZKB_fnc_UseItem
	Description: Runs when a player clicks use on an item, spawns the function for the item so suspension is allowed IE. Sleep and WaitUntil
	Passes to the item function ["Use", "Item", InventoryAmount, AmountUsed]
	Use: So you can use the same function for multiple things IE. If ((_this select 0) == "Use") then {}; ZKB_fnc_food uses this
*/
private _itemarr = param [0,"",["",[]]];
if (typeName _itemarr isEqualTo typeName "") then
	{
	_itemarr = call compile _itemarr;
	};

private _amountused = param [1,0,[0,""]];
if (typeName _amountused isEqualTo typeName "") then
	{
	_amountused = floor (abs (parseNumber _amountused));
	};

private _ignoreInvAmount = param [2,false,[false]];

private _item = _itemarr select 0;
private _iteminvamount = _itemarr select 1;

if (_amountused < 1) exitWith {};
if ((_amountused > _iteminvamount) and !_ignoreInvAmount) exitWith {["STR_Inv_DontHaveThatMany",[[_amountused] call ZKB_fnc_FormatNumber,[_item] call ZKB_fnc_GetItemName]] call ZKB_fnc_DynamicText; false;};

_function = [_item] call ZKB_fnc_GetItemFunction;

if !(typeName _function == "CODE") exitWith {["STR_Inv_NoUse", [[_item] call ZKB_fnc_GetItemName]] call ZKB_fnc_DynamicText; false;};
closeDialog 0;
["Use", _item, _iteminvamount, _amountused] spawn _function;
true;