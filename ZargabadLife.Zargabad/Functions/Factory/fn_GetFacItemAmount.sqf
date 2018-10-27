/*
	Author: ZKB1325
	FileName: fn_GetFacItemAmount.sqf
	Function: ZKB_fnc_GetFacItemAmount
	Description: Returns the total amount of a given item in the given factory
*/
private ["_factoryitem","_return","_factorystoragevar","_factorystorageitems"];
_factoryitem = param [0,"",[""]];
_return = 0;

_factorystoragevar = ZKB_OpenFactory getVariable "FactoryInfo";
_factorystorageitems = missionNameSpace getVariable [(_factorystoragevar select 6)+"Storage", []];

{
if ((_x select 0) == _factoryitem) exitWith
	{
	_return = (_x select 1);
	};
}forEach _factorystorageitems;

_return;