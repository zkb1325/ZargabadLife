#include "..\..\ConfigMacros.hpp"
/*
	Author: ZKB1325
	FileName: fn_ChangeTaxes.sqf
	Function: ZKB_fnc_ChangeTaxes
	Description: updates the taxes
	[Item Tax, Vehicle Tax, Magazine Tax, Weapon Tax, Bank Transfer Tax]
*/
private _itemTax = round param [0,5,[5]];
private _vehicleTax = round param [1,5,[5]];
private _magazineTax = round param [2,5,[5]];
private _weaponTax = round param [3,5,[5]];
private _transferTax = round param [4,5,[5]];
private _forced = param [5,false,[false]];
closeDialog 0;
if (!(call ZKB_fnc_IsMayor) and !_forced) exitWith {};

ZKB_TaxArray = [_itemTax,_vehicleTax,_magazineTax,_weaponTax,_transferTax];
publicVariable "ZKB_TaxArray";

localize "STR_Tax_TaxesChanged" remoteExecCall ["hint",0,false];
["STR_Admin_AdminLogsChangedTaxes",name player,ZKB_TaxArray] call ZKB_fnc_AdminAddAdminLog;
if (SETTING(getNumber,"ZKB_StatSaveEnabled") isEqualTo 1) then
	{
	["taxes",ZKB_TaxArray] remoteExecCall ["ZKB_fnc_ServerSaveStats",2,false];
	};
