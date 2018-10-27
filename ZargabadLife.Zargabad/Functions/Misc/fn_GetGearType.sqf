/*
	File: fn_GetGearType.sqf
	Function: ZKB_fnc_GetGearType
	Author: ZKB1325
	Description: Gets the loot gear type
	1 = Weapon
	2 = Magazine
	3 = Item (Uniforms, scopes/suppressors)
	4 = Backpacks
*/

private ["_itemClassName","_type","_itemType"];

_itemClassName = _this;
_type = 0;
_itemType = [_itemClassName] call BIS_fnc_itemType;

switch ( _itemType select 0) do 
{
	case "Weapon":	{_type = 1;};
	case "Mine":	{_type = 2};
	case "Magazine":	{_type = 2};
	case "Item":	{_type = 3};
	case "Equipment":{ 
					if ((_itemType select 1) == "Backpack" ) then
					{
					_type = 4;
					}
					else 
					{
					_type = 3;
					};
				};
};
_type;