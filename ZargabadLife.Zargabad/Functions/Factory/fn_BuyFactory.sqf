/*
	Author: ZKB1325
	File: fn_BuyFactory.sqf
	Function: ZKB_fnc_BuyFactory
	Description: Handles what's needed to buy a factory when player uses the action
*/
_this = _this select 3;
private _facName = _this select 0;
private _faccost = _this select 1;
private _facVar = _this select 2;

if ((["Money"] call ZKB_fnc_GetInvItemAmount) < _faccost) exitWith {["STR_Shop_NotEnoughMoney"] call ZKB_fnc_DynamicText;};

ZKB_OwnedFactories pushBack _facVar;
["Money", _faccost] call ZKB_fnc_InvRemoveItem;
["STR_Fac_BoughtFactory", [_facName]] call ZKB_fnc_DynamicText;
["STR_Admin_PlayerLogsBoughtFactory",name player,_facName] call ZKB_fnc_AdminAddPlayerLog;