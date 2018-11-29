/*
	Author: ZKB1325
	FileName: fn_InvDropItem.sqf
	Function: ZKB_fnc_InvDropItem
	Description: Runs when a player drops an item from inventory
*/
private ["_itemarr","_itemtodrop","_iteminvamount","_amountdropped"];
_itemarr = (_this select 0);
if (typeName _itemarr isEqualTo typeName "") then
	{
	_itemarr = call compile _itemarr;
	};

_itemtodrop = _itemarr select 0;
_iteminvamount = _itemarr select 1;
_amountdropped = floor (abs (parseNumber (_this select 1)));

if (_amountdropped < 1) exitWith {};
if !((vehicle player) == player) exitWith {["STR_Inv_NotAllowedToDropInVeh"] call ZKB_fnc_DynamicText;};
if (_amountdropped > _iteminvamount) exitWith {["STR_Inv_NotEnoughToDrop", [[_amountdropped] call ZKB_fnc_FormatNumber, [_itemtodrop] call ZKB_fnc_GetItemName]] call ZKB_fnc_DynamicText;};
if !([_itemtodrop] call ZKB_fnc_GetItemCanDrop) exitWith {["STR_Inv_NotAllowedToDrop", [[_itemtodrop] call ZKB_fnc_GetItemName]] call ZKB_fnc_DynamicText;};

closeDialog 0;
[_itemtodrop, _amountdropped] call ZKB_fnc_InvRemoveItem;

_physItem = switch _itemtodrop do
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
	
if(currentWeapon player == "")then{player playmove "AmovPercMstpSnonWnonDnon_AinvPknlMstpSnonWnonDnon"}else{player playmove "AinvPknlMstpSlayWrflDnon"};
private _dropPos = (ASLToATL (player modelToWorldWorld [0,1.25,.2]));
_object = createVehicle [_physItem,_dropPos,[],1,"CAN_COLLIDE"];
_object setVariable ["ItemData", [_itemtodrop, _amountdropped], true];
[_object, [format [localize "STR_Inv_PickUp", [_itemtodrop] call ZKB_fnc_GetItemName, [_amountdropped] call ZKB_fnc_FormatNumber], ZKB_fnc_InvPickUpItem, "", 1, true, true, "", "_var = (_target getVariable ""ItemData""); (!IsNil ""_var"")", 3]] remoteExecCall ["addAction", 0, _object];

["STR_Inv_Dropped", [[_amountdropped] call ZKB_fnc_FormatNumber, [_itemtodrop] call ZKB_fnc_GetItemName]] call ZKB_fnc_DynamicText;
["STR_Admin_PlayerLogsDropItem",name player,[_amountdropped] call ZKB_fnc_FormatNumber,[_itemtodrop] call ZKB_fnc_GetItemName] call ZKB_fnc_AdminAddPlayerLog;