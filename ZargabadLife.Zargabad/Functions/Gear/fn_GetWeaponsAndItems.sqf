/*
	File: fn_GetWeaponsAndItems.sqf
	Function: ZKB_fnc_GetWeaponsAndItems
	Author: ZKB1325
	Description: Gets the player weapons and items for each weapon returns an array of arrays
	0: Object
		Player to get weapon info of
*/

private ["_unit","_return","_primaryweapon","_primaryweaponitems","_primaryweaponmagazine","_primary","_secondaryweapon","_secondaryweaponitems","_secondaryweaponmagazine","_secondary","_handgunweapon","_handgunweaponitems","_handgunweaponmagazine","_handgun"];
_unit = param [0,player];

_return = [];


_primaryweapon = (primaryWeapon _unit);
_primaryweaponitems = (primaryWeaponItems _unit);
_primaryweaponmagazine = (primaryWeaponMagazine _unit);

_primary = [_primaryweapon];
{
_primary pushBack _x;
}forEach _primaryweaponitems + _primaryweaponmagazine;


_secondaryweapon = (secondaryWeapon _unit);
_secondaryweaponitems = (secondaryWeaponItems _unit);
_secondaryweaponmagazine = (secondaryWeaponMagazine _unit);

_secondary = [_secondaryweapon];
{
_secondary pushBack _x;
}forEach _secondaryweaponitems + _secondaryweaponmagazine;


_handgunweapon = (handgunWeapon _unit);
_handgunweaponitems = (handgunItems _unit);
_handgunweaponmagazine = (handgunMagazine _unit);

_handgun = [_handgunweapon];
{
_handgun pushBack _x;
}forEach _handgunweaponitems + _handgunweaponmagazine;

_return = [_primary, _secondary, _handgun];


_return;