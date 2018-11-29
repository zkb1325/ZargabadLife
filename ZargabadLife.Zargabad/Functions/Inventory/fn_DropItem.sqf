/*
	Author: ZKB1325
	FileName: fn_DropItem.sqf
	Function: ZKB_fnc_DropItem
	Description: Generic drop item function mainly for when players die and drop items or get robbed
*/

private _itemarr = (_this select 0);
if (typeName _itemarr isEqualTo typeName "") then
	{
	_itemarr = call compile _itemarr;
	};

private _itemtodrop = _itemarr select 0;
private _iteminvamount = _itemarr select 1;
private _amountdropped = (_this select 1);

if (_amountdropped < 1) exitWith {};
if !([_itemtodrop] call ZKB_fnc_GetItemCanDrop) exitWith {};
if (_amountdropped > _iteminvamount) then {_amountdropped = _iteminvamount;};

[_itemtodrop, _amountdropped] call ZKB_fnc_InvRemoveItem;

private _physItem = switch _itemtodrop do
	{
	case "Money": {"Land_Money_F"};
	case "MedKit": {"Land_PainKillers_F"};
	case "Lighter": {"Land_ButaneTorch_F"};
	case "RefuelCan": {"Land_CanisterFuel_F"};
	case "SiphonFuelKit": {"Land_CanisterFuel_F"};
	case "Oil";
	case "OilBarrel": {"Land_MetalBarrel_F"};
	case "WeaponBag": {"Land_Sleeping_bag_folded_F"};
	case "ItemBag": {"Land_Sleeping_bag_folded_F"};
	case "DefuseKit": {"Land_MultiMeter_F"};
	case "BankInsurance": {"Land_File1_F"};
	case "VehicleAmmo": {"Land_Ammobox_rounds_F"};
	case "SuicideBomb";
	case "ActivationBomb";
	case "TimeBomb";
	case "SpeedBomb";
	case "RemoteBomb": {"Explosive"};
	case "BombRemote": {"Land_Tablet_02_F"};
	case "Goat";
	case "Rabbit";
	case "StrangeMeat";
	case "Donut";
	case "Trout";
	case "Perch";
	case "Walleye";
	case "Bass";
	case "Bread": {"Land_TinContainer_F"};
	case "Iron";
	case "ElectronicComponents";
	case "Copper";
	case "Steel";
	case "BlackPowder";
	case "Coal";
	case "Silicon";
	case "DiamondRock";
	case "Platinum";
	case "Silver";
	case "Gold";
	case "Glass";
	case "Plastic";
	case "Sulfer";
	case "Sand": {"Land_Bucket_F"};
	case "DiamondRing";
	case "ExpensiveDiamondRing";
	case "PlatinumRing";
	case "ExpensivePlatinumRing": {"Land_MetalCase_01_small_F"};
	case "UnProcessedCocaine";
	case "Cocaine";
	case "UnProcessedMarijuana";
	case "Marijuana";
	case "UnProcessedLSD";
	case "LSD";
	case "UnProcessedHeroin";
	case "Heroin": {"Land_Bag_EP1"};
	default {"Land_Suitcase_F"};
	};

private _dropPos = (ASLToATL (player modelToWorldWorld [0,1.25,.2]));
private _object = createVehicle [_physItem,_dropPos,[],1,"CAN_COLLIDE"];
_object setVariable ["ItemData", [_itemtodrop, _amountdropped], true];
[_object, [format [localize "STR_Inv_PickUp", [_itemtodrop] call ZKB_fnc_GetItemName, [_amountdropped] call ZKB_fnc_FormatNumber], ZKB_fnc_InvPickUpItem, "", 1, true, true, "", "_var = (_target getVariable ""ItemData""); (!IsNil ""_var"")", 3]] remoteExecCall ["addAction", 0, _object];