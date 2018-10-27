/*
	File: fn_GasStationRefuel.sqf
	Function: ZKB_fnc_GasStationRefuel
	Author: ZKB1325
	Description: Init for gas station refuel action
	
	0: Object
	Vehicle to refuel
	
	3: Number
	Cost to refuel per .1 fuel/10 liters
*/

private _vehicle = param [0,objNull,[objNull]];
private _fuelCost = param [3,0,[0]];

if (isNull _vehicle) exitWith {};
if (isEngineOn _vehicle) exitWith {["STR_Vehicle_RefuelEngineOn"] call ZKB_fnc_DynamicText;};

while {fuel _vehicle < .99} do
	{
	["STR_Vehicle_Refueling",[([typeOf _vehicle] call ZKB_fnc_GetItemName),[_fuelCost] call ZKB_fnc_FormatNumber]] call ZKB_fnc_DynamicText;
	
	if (isEngineOn _vehicle) exitWith{[localize "STR_Vehicle_RefuelEngineOn"] call ZKB_fnc_DynamicText;};
	if ((["Money"] call ZKB_fnc_GetInvItemAmount) < _fuelCost) exitWith {["STR_Shop_NotEnoughMoney"] call ZKB_fnc_DynamicText;};
	if ((count (nearestObjects [_vehicle,["Land_A_FuelStation_Feed","Land_Ind_FuelStation_Feed_EP1","Land_FuelStation_Feed_PMC"],10]) < 1) or ((vehicle player) isEqualTo player) or !(driver (vehicle player) isEqualTo player)) exitWith {};
	["Money", _fuelCost] call ZKB_fnc_InvRemoveItem;
	sleep 2;
	_vehicle setFuel ((fuel _vehicle) + .1);
	[OilShop,0,1,false] call ZKB_fnc_UpdateShopStock;
	};

["STR_Vehicle_RefuelComplete"] call ZKB_fnc_DynamicText;