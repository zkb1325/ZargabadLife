/*
	Author: ZKB1325
	FileName: fn_UpdateFacTakeSelInfo.sqf
	Function: ZKB_fnc_UpdateFacTakeSelInfo
	Description: Handles updating the take button text
*/
private ["_seletedIemArr","_selectedItem","_selectedItemPrice","_amountvalue","_display","_takebtn"];
disableserialization;

if ((_this select 0) == "") exitWith {};
_selectedItemArr = call compile (_this select 0);
_selectedItem = _selectedItemArr select 0;
_selectedItemPrice = _selectedItemArr select 1;
_amountvalue = floor (abs (parseNumber (_this select 1)));

if (_amountvalue < 1) then {_amountvalue = 0;};

_display = uiNameSpace getVariable "ZKB_ListMenu";
_takebtn = _display displayCtrl 5050;


_takebtn ctrlSetText format [localize "STR_Fac_TakeItem", ([_selectedItem] call ZKB_fnc_GetItemName), ([(([_selectedItem] call ZKB_fnc_GetItemWeight)*_amountvalue)] call ZKB_fnc_FormatNumber)];		
