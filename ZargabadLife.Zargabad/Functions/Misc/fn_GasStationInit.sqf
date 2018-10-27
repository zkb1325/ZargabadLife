/*
	File: fn_GasStationInit.sqf
	Function: ZKB_fnc_GasStationInit
	Author: ZKB1325
	Description: Init for gas station refuel action
*/

while {true} do
	{
	waitUntil {(count (nearestObjects [(vehicle player),["Land_A_FuelStation_Feed","Land_Ind_FuelStation_Feed_EP1","Land_FuelStation_Feed_PMC"],10]) > 0) and !((vehicle player) isEqualTo player) and (driver (vehicle player) isEqualTo player)};
	private _vehicle = (vehicle player);
	
	private _itemStockArray = ["OilBarrel", OilShop] call ZKB_fnc_ShopGetItemStock;
	private _itemStock = _itemStockArray select 0;
	private _itemMaxStock = _itemStockArray select 1;
	private _cost =  (["OilBarrel"] call ZKB_fnc_GetItemSellPrice) max 1;
	private _costTax =  (["OilBarrel"] call ZKB_fnc_GetItemSellPriceWithTax) max 1;
	private _demand = _costtax*0.5*(_itemstock-(_itemmaxstock*0.5))/(0.5*_itemmaxstock);
	private _fuelCost = round((((_cost*(_costtax/_cost)) - _demand)/2)/15);
	
	ZKB_RefuelAction = _vehicle addAction [format [localize "STR_Vehicle_RefuelAction",[_fuelCost] call ZKB_fnc_FormatNumber],ZKB_fnc_GasStationRefuel,_fuelCost];
	
	waitUntil {(count (nearestObjects [_vehicle,["Land_A_FuelStation_Feed","Land_Ind_FuelStation_Feed_EP1","Land_FuelStation_Feed_PMC"],10]) < 1) or ((vehicle player) isEqualTo player) or !(driver (vehicle player) isEqualTo player)};

	_vehicle removeAction ZKB_RefuelAction;
	};