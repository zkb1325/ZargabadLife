/*
	File: fn_HasRequiredLicenses.sqf
	Function: ZKB_fnc_HasRequiredLicenses
	Author: ZKB1325
	Description: Returns if the player has all the required licenses for given item
*/
private ["_itemtocheck","_return","_playerslicense"];
_itemtocheck = param [0,"",[""]];

_return = true;
_playerslicense = (player getVariable ["ZKB_Licenses",[]]);
_neededLicense = [];

switch true do
	{
	case (IsCop): {_neededLicense pushBack ([_itemtocheck] call ZKB_fnc_GetItemLicenseCop);};	
	case (IsCiv): {_neededLicense pushBack ([_itemtocheck] call ZKB_fnc_GetItemLicenseCiv);};	
	};
_neededLicense pushBack ([_itemtocheck] call ZKB_fnc_GetItemLicenseBoth);

{
if (!(_x in _playerslicense) and !(_x == "")) exitWith {_return = false;};	
}forEach _neededLicense;

_return;