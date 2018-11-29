/*
class className //className used for shops and factories
	{
	className = "className used for spawning weapons/gear/vehicles";
		Note: class className AND className = ""; should ALWWAYS be the same for virtual items. Gear and Vehicles can be different but not recommended.
	Condition = ""; //Condition that must return true in order to buy the item. Leave "" or don't define to always return true. This is checked every time someone tries to buy the item.
	displayName = "item name";
	picture = ""; //File path to an image.paa for virtual items only
	itemType = "item type for tax"; //"Item", "Vehicle", "Magazine", "Weapon" or "" for not affected by tax
	Function = "function for usable item" //"" for not usable
	buyPrice = buy price, Set to -1 to add up the buy price of all the required materials to make in a factory. Be careful of loops for example. Item1 requires Item2 and Item3 to make but Item3 requires Item1
	sellPrice = sell price -1 for half of buy price
	Weight = item weight for inventory and trunkSpace
	turnkSpace = how much trunk space for vehicles
	civLicense = "needed license as civ"
	copLicense = "needed license as cop"
	sharedLicense = "needed license for any side"
	canDrop = true/false if item can be dropped
	canGive = true/false if item can be given
	isIllegal = true/false if the item is illegal
	Description = "Item description can be localized string";
	reqResources[] = {array of required resources to make in factory {"item1",amount},{"item2",amount}}
	};
	
_className = "CUP_NVG_PVS7"; 
_configs = "getText (_x >> 'className') isEqualTo _className" configClasses (missionConfigFile >> "Item_Config"); 
configName (_configs select 0);
*/
class Item_Config
{
#include "ItemConfig_Weapons.hpp"
#include "ItemConfig_Magazines.hpp"
#include "ItemConfig_Attachments.hpp"
#include "ItemConfig_Uniforms.hpp"
#include "ItemConfig_Gear.hpp"
#include "ItemConfig_Vehicles.hpp"


class Money
	{
	className = "Money";
	displayName = "Money";
	itemType = "";
	Function = "";
	buyPirce = 1;
	sellPirce = 1;
	Weight = 0;
	trunkSpace = 0;
	civLicense = "";
	copLicense = "";
	sharedLicense = "";
	canDrop = true;
	canGive = true;
	isIllegal = false;
	Description = "STR_ItemDesc_Money";
	reqResources[] = {};
	};
class KeyChain
	{
	className = "KeyChain";
	displayName = "Key Chain";
	itemType = "";
	Function = "ZKB_fnc_KeyChain";
	buyPirce = 0;
	sellPirce = 0;
	Weight = 0;
	trunkSpace = 0;
	civLicense = "";
	copLicense = "";
	sharedLicense = "";
	canDrop = false;
	canGive = false;
	isIllegal = false;
	Description = "STR_ItemDesc_KeyChain";
	reqResources[] = {};
	};
class Phone
	{
	className = "Phone";
	displayName = "Phone";
	itemType = "Item";
	Function = "ZKB_fnc_Phone";
	buyPirce = 100;
	sellPirce = -1;
	Weight = 1;
	trunkSpace = 0;
	civLicense = "";
	copLicense = "";
	sharedLicense = "";
	canDrop = true;
	canGive = true;
	isIllegal = false;
	Description = "STR_ItemDesc_Phone";
	reqResources[] = {{"Plastic",1},{"ElectronicComponents",1}};
	};
class MedKit
	{
	className = "MedKit";
	displayName = "MedKit";
	itemType = "Item";
	Function = "ZKB_fnc_MedKit";
	buyPirce = 2500;
	sellPirce = -1;
	Weight = 2;
	trunkSpace = 0;
	civLicense = "";
	copLicense = "";
	sharedLicense = "";
	canDrop = true;
	canGive = true;
	isIllegal = false;
	Description = "STR_ItemDesc_MedKit";
	reqResources[] = {{"Plastic",1},{"Coal",1}};
	};
class RepairKit
	{
	className = "RepairKit";
	displayName = "RepairKit";
	itemType = "Item";
	Function = "ZKB_fnc_RepKit";
	buyPirce = 5000;
	sellPirce = -1;
	Weight = 4;
	trunkSpace = 0;
	civLicense = "";
	copLicense = "";
	sharedLicense = "";
	canDrop = true;
	canGive = true;
	isIllegal = false;
	Description = "STR_ItemDesc_RepKit";
	reqResources[] = {{"Steel",3},{"Plastic",2}};
	};
class Lighter
	{
	className = "Lighter";
	displayName = "Lighter";
	itemType = "Item";
	Function = "ZKB_fnc_Lighter";
	buyPirce = 1250;
	sellPirce = -1;
	Weight = 1;
	trunkSpace = 0;
	civLicense = "";
	copLicense = "";
	sharedLicense = "";
	canDrop = true;
	canGive = true;
	isIllegal = true;
	Description = "STR_ItemDesc_Lighter";
	reqResources[] = {{"Plastic",1},{"Oil",1}};
	};
class LockPick
	{
	className = "LockPick";
	displayName = "LockPick";
	itemType = "Item";
	Function = "ZKB_fnc_LockPick";
	buyPirce = 1500;
	sellPirce = -1;
	Weight = 1;
	trunkSpace = 0;
	civLicense = "";
	copLicense = "";
	sharedLicense = "";
	canDrop = true;
	canGive = true;
	isIllegal = true;
	Description = "STR_ItemDesc_LockPick";
	reqResources[] = {{"Steel",1}};
	};
class RefuelCan
	{
	className = "RefuelCan";
	displayName = "Refuel Can";
	itemType = "Item";
	Function = "ZKB_fnc_RefuelCan";
	buyPirce = 1000;
	sellPirce = -1;
	Weight = 2;
	trunkSpace = 0;
	civLicense = "";
	copLicense = "";
	sharedLicense = "";
	canDrop = true;
	canGive = true;
	isIllegal = false;
	Description = "STR_ItemDesc_RefuelCan";
	reqResources[] = {{"Plastic",1},{"Oil",2}};
	};
class SiphonFuelKit
	{
	className = "SiphonFuelKit";
	displayName = "Siphon Fuel-Kit";
	itemType = "Item";
	Function = "ZKB_fnc_SiphonFuel";
	buyPirce = 1000;
	sellPirce = -1;
	Weight = 1;
	trunkSpace = 0;
	civLicense = "";
	copLicense = "";
	sharedLicense = "";
	canDrop = true;
	canGive = true;
	isIllegal = false;
	Description = "STR_ItemDesc_SiphonFuelKit";
	reqResources[] = {{"Plastic",2}};
	};
class OilBarrel
	{
	className = "OilBarrel";
	displayName = "Oil Barrel";
	itemType = "Item";
	Function = "ZKB_fnc_RefuelCan";
	buyPirce = 40000;
	sellPirce = -1;
	Weight = 12;
	trunkSpace = 0;
	civLicense = "";
	copLicense = "";
	sharedLicense = "";
	canDrop = true;
	canGive = true;
	isIllegal = false;
	Description = "STR_ItemDesc_OilBarrel";
	reqResources[] = {{"Oil",4}};
	};
class WeaponBag
	{
	className = "WeaponBag";
	displayName = "Weapon Bag";
	itemType = "Item";
	Function = "ZKB_fnc_WeaponBag";
	buyPirce = 1000;
	sellPirce = -1;
	Weight = 0.5;
	trunkSpace = 0;
	civLicense = "";
	copLicense = "";
	sharedLicense = "";
	canDrop = true;
	canGive = true;
	isIllegal = true;
	Description = "STR_ItemDesc_WeaponBag";
	reqResources[] = {};
	};
class ItemBag
	{
	className = "ItemBag";
	displayName = "Item Bag";
	itemType = "Item";
	Function = "ZKB_fnc_ItemBag";
	buyPirce = 1000;
	sellPirce = -1;
	Weight = 0.5;
	trunkSpace = 0;
	civLicense = "";
	copLicense = "";
	sharedLicense = "";
	canDrop = true;
	canGive = true;
	isIllegal = true;
	Description = "STR_ItemDesc_ItemBag";
	reqResources[] = {};
	};
class DefuseKit
	{
	className = "DefuseKit";
	displayName = "Defuse Kit";
	itemType = "Item";
	Function = "ZKB_fnc_DefuseKit";
	buyPirce = 4000;
	sellPirce = -1;
	Weight = 1;
	trunkSpace = 0;
	civLicense = "";
	copLicense = "";
	sharedLicense = "";
	canDrop = true;
	canGive = true;
	isIllegal = true;
	Description = "STR_ItemDesc_DefuseKit";
	reqResources[] = {};
	};
class SpikeStrip
	{
	className = "SpikeStrip";
	displayName = "Spike Strip";
	itemType = "Item";
	Function = "ZKB_fnc_SpikeStrip";
	buyPirce = 2800;
	sellPirce = -1;
	Weight = 15;
	trunkSpace = 0;
	civLicense = "";
	copLicense = "";
	sharedLicense = "";
	canDrop = true;
	canGive = true;
	isIllegal = true;
	Description = "STR_ItemDesc_SpikeStrip";
	reqResources[] = {};
	};
class BlueInk
	{
	className = "BlueInk";
	displayName = "Blue Ink";
	itemType = "";
	Function = "";
	buyPirce = 1;
	sellPirce = 1;
	Weight = 0;
	trunkSpace = 0;
	civLicense = "";
	copLicense = "";
	sharedLicense = "";
	canDrop = false;
	canGive = false;
	isIllegal = true;
	Description = "STR_ItemDesc_BlueInk";
	reqResources[] = {};
	};
class BankInsurance
	{
	className = "BankInsurance";
	displayName = "Bank Insurance";
	itemType = "";
	Function = "";
	buyPirce = 2000;
	sellPirce = 0;
	Weight = 0;
	trunkSpace = 0;
	civLicense = "";
	copLicense = "";
	sharedLicense = "";
	canDrop = true;
	canGive = true;
	isIllegal = false;
	Description = "STR_ItemDesc_BankInsurance";
	reqResources[] = {};
	};
class FishingPole
	{
	className = "FishingPole";
	displayName = "FishingPole";
	itemType = "Item";
	Function = "ZKB_fnc_FishingPole";
	buyPirce = 4000;
	sellPirce = -1;
	Weight = 5;
	trunkSpace = 0;
	civLicense = "";
	copLicense = "";
	sharedLicense = "";
	canDrop = true;
	canGive = true;
	isIllegal = false;
	Description = "STR_ItemDesc_FishingPole";
	reqResources[] = {{"Plastic",1}};
	};
class Shovel
	{
	className = "Shovel";
	displayName = "Shovel";
	itemType = "Item";
	Function = "ZKB_fnc_Mine";
	buyPirce = 1000;
	sellPirce = -1;
	Weight = 5;
	trunkSpace = 0;
	civLicense = "";
	copLicense = "";
	sharedLicense = "";
	canDrop = true;
	canGive = true;
	isIllegal = false;
	Description = "STR_ItemDesc_Shovel";
	reqResources[] = {{"Iron",1}};
	};
class PickAxe
	{
	className = "PickAxe";
	displayName = "PickAxe";
	itemType = "Item";
	Function = "ZKB_fnc_Mine";
	buyPirce = 5000;
	sellPirce = -1;
	Weight = 5;
	trunkSpace = 0;
	civLicense = "";
	copLicense = "";
	sharedLicense = "";
	canDrop = true;
	canGive = true;
	isIllegal = false;
	Description = "STR_ItemDesc_PickAxe";
	reqResources[] = {{"Iron",2}};
	};
class JackHammer
	{
	className = "JackHammer";
	displayName = "JackHammer";
	itemType = "Item";
	Function = "ZKB_fnc_Mine";
	buyPirce = 40000;
	sellPirce = -1;
	Weight = 5;
	trunkSpace = 0;
	civLicense = "";
	copLicense = "";
	sharedLicense = "";
	canDrop = true;
	canGive = true;
	isIllegal = false;
	Description = "STR_ItemDesc_JackHammer";
	reqResources[] = {{"Steel",2},{"Plastic",1},{"ElectronicComponents",1}};
	};
class VehicleAmmo
	{
	className = "VehicleAmmo";
	displayName = "Vehicle Ammo";
	itemType = "Item";
	Function = "ZKB_fnc_VehicleAmmo";
	buyPirce = 10000;
	sellPirce = -1;
	Weight = 10;
	trunkSpace = 0;
	civLicense = "Terror_Training";
	copLicense = "Civ_Shop_License";
	sharedLicense = "";
	canDrop = true;
	canGive = true;
	isIllegal = true;
	Description = "STR_ItemDesc_VehicleAmmo";
	reqResources[] = {{"Copper",5},{"BlackPowder",10}};
	};
/*
class SpeedUpgrade1
	{
	className = "SpeedUpgrade1";
	displayName = "Speed Upgrade 1";
	itemType = "Item";
	Function = "ZKB_fnc_SpeedUpgrade";
	buyPirce = 15000;
	sellPirce = -1;
	Weight = 10;
	trunkSpace = 0;
	civLicense = "Engineer_License";
	copLicense = "";
	sharedLicense = "";
	canDrop = true;
	canGive = true;
	isIllegal = true;
	Description = "STR_ItemDesc_SpeedUpgrade";
	reqResources[] = {{"Steel",1},{"ElectronicComponents",1},{"Plastic",1},{"Oil",5}};
	};
class SpeedUpgrade2
	{
	className = "SpeedUpgrade2";
	displayName = "Speed Upgrade 2";
	itemType = "Item";
	Function = "ZKB_fnc_SpeedUpgrade";
	buyPirce = 35000;
	sellPirce = -1;
	Weight = 10;
	trunkSpace = 0;
	civLicense = "Engineer_License";
	copLicense = "";
	sharedLicense = "";
	canDrop = true;
	canGive = true;
	isIllegal = true;
	Description = "STR_ItemDesc_SpeedUpgrade";
	reqResources[] = {{"Steel",2},{"ElectronicComponents",2},{"Plastic",2},{"Oil",5}};
	};
class SpeedUpgrade3
	{
	className = "SpeedUpgrade3";
	displayName = "Speed Upgrade 3";
	itemType = "Item";
	Function = "ZKB_fnc_SpeedUpgrade";
	buyPirce = 55000;
	sellPirce = -1;
	Weight = 10;
	trunkSpace = 0;
	civLicense = "Engineer_License";
	copLicense = "Patrol_Officer_Training";
	sharedLicense = "";
	canDrop = true;
	canGive = true;
	isIllegal = true;
	Description = "STR_ItemDesc_SpeedUpgrade";
	reqResources[] = {{"Steel",3},{"ElectronicComponents",3},{"Platinum",1},{"Oil",5}};
	};
class SpeedUpgrade4
	{
	className = "SpeedUpgrade4";
	displayName = "Speed Upgrade 4";
	itemType = "Item";
	Function = "ZKB_fnc_SpeedUpgrade";
	buyPirce = 75000;
	sellPirce = -1;
	Weight = 10;
	trunkSpace = 0;
	civLicense = "Engineer_License";
	copLicense = "Armed_Response_Officer_Training";
	sharedLicense = "";
	canDrop = true;
	canGive = true;
	isIllegal = true;
	Description = "STR_ItemDesc_SpeedUpgrade";
	reqResources[] = {{"Steel",4},{"ElectronicComponents",4},{"Platinum",2},{"Oil",5}};
	};
class SpeedUpgrade5
	{
	className = "SpeedUpgrade5";
	displayName = "Speed Upgrade 5";
	itemType = "Item";
	Function = "ZKB_fnc_SpeedUpgrade";
	buyPirce = 100000;
	sellPirce = -1;
	Weight = 10;
	trunkSpace = 0;
	civLicense = "Engineer_License";
	copLicense = "Armed_Response_Officer_Training";
	sharedLicense = "";
	canDrop = true;
	canGive = true;
	isIllegal = true;
	Description = "STR_ItemDesc_SpeedUpgrade";
	reqResources[] = {{"Steel",5},{"ElectronicComponents",5},{"Platinum",4},{"Oil",5}};
	};
*/
class SuicideBomb
	{
	className = "SuicideBomb";
	displayName = "Suicide Bomb";
	itemType = "Item";
	Function = "ZKB_fnc_SuicideBomb";
	buyPirce = 325000;
	sellPirce = -1;
	Weight = 15;
	trunkSpace = 0;
	civLicense = "Terror_Training";
	copLicense = "Civ_Shop_License";
	sharedLicense = "";
	canDrop = true;
	canGive = true;
	isIllegal = true;
	Description = "STR_ItemDesc_SuicideBomb";
	reqResources[] = {{"ElectronicComponents",2},{"Iron",15},{"BlackPowder",20}};
	};
class ActivationBomb
	{
	className = "ActivationBomb";
	displayName = "Activation Bomb";
	itemType = "Item";
	Function = "ZKB_fnc_ActivationBomb";
	buyPirce = 260000;
	sellPirce = -1;
	Weight = 15;
	trunkSpace = 0;
	civLicense = "Terror_Training";
	copLicense = "Civ_Shop_License";
	sharedLicense = "";
	canDrop = true;
	canGive = true;
	isIllegal = true;
	Description = "STR_ItemDesc_ActivationBomb";
	reqResources[] = {{"ElectronicComponents",5},{"Iron",20},{"BlackPowder",25}};
	};
class TimeBomb
	{
	className = "TimeBomb";
	displayName = "Time Bomb";
	itemType = "Item";
	Function = "ZKB_fnc_TimeBomb";
	buyPirce = 275000;
	sellPirce = -1;
	Weight = 15;
	trunkSpace = 0;
	civLicense = "Terror_Training";
	copLicense = "Civ_Shop_License";
	sharedLicense = "";
	canDrop = true;
	canGive = true;
	isIllegal = true;
	Description = "STR_ItemDesc_TimeBomb";
	reqResources[] = {{"ElectronicComponents",10},{"Iron",10},{"Plastic",5},{"BlackPowder",25}};
	};
class SpeedBomb
	{
	className = "SpeedBomb";
	displayName = "Speed Bomb";
	itemType = "Item";
	Function = "ZKB_fnc_SpeedBomb";
	buyPirce = 250000;
	sellPirce = -1;
	Weight = 15;
	trunkSpace = 0;
	civLicense = "Terror_Training";
	copLicense = "Civ_Shop_License";
	sharedLicense = "";
	canDrop = true;
	canGive = true;
	isIllegal = true;
	Description = "STR_ItemDesc_SpeedBomb";
	reqResources[] = {{"ElectronicComponents",10},{"Iron",20},{"BlackPowder",25}};
	};
class RemoteBomb
	{
	className = "RemoteBomb";
	displayName = "Remote Bomb";
	itemType = "Item";
	Function = "ZKB_fnc_RemoteBomb";
	buyPirce = 275000;
	sellPirce = -1;
	Weight = 15;
	trunkSpace = 0;
	civLicense = "Terror_Training";
	copLicense = "Civ_Shop_License";
	sharedLicense = "";
	canDrop = true;
	canGive = true;
	isIllegal = true;
	Description = "STR_ItemDesc_RemoteBomb";
	reqResources[] = {{"ElectronicComponents",5},{"Iron",20},{"Copper",10},{"BlackPowder",25}};
	};
class BombRemote
	{
	className = "BombRemote";
	displayName = "Bomb Remote";
	itemType = "Item";
	Function = "ZKB_fnc_BombRemote";
	buyPirce = 15000;
	sellPirce = -1;
	Weight = 5;
	trunkSpace = 0;
	civLicense = "Terror_Training";
	copLicense = "Civ_Shop_License";
	sharedLicense = "";
	canDrop = true;
	canGive = true;
	isIllegal = true;
	Description = "STR_ItemDesc_BombRemote";
	reqResources[] = {{"ElectronicComponents",2},{"Plastic",2}};
	};
class Goat
	{
	className = "Goat";
	displayName = "Goat Meat";
	itemType = "Item";
	Function = "ZKB_fnc_Food";
	buyPirce = 3000;
	sellPirce = -1;
	Weight = 5;
	trunkSpace = 0;
	civLicense = "";
	copLicense = "";
	sharedLicense = "";
	canDrop = true;
	canGive = true;
	isIllegal = false;
	Description = "STR_ItemDesc_Goat";
	reqResources[] = {};
	};
class Rabbit
	{
	className = "Rabbit";
	displayName = "Rabbit Meat";
	itemType = "Item";
	Function = "ZKB_fnc_Food";
	buyPirce = 1200;
	sellPirce = -1;
	Weight = 2;
	trunkSpace = 0;
	civLicense = "";
	copLicense = "";
	sharedLicense = "";
	canDrop = true;
	canGive = true;
	isIllegal = false;
	Description = "STR_ItemDesc_Rabbit";
	reqResources[] = {};
	};
class StrangeMeat
	{
	className = "StrangeMeat";
	displayName = "Strange Meat";
	itemType = "Item";
	Function = "ZKB_fnc_Food";
	buyPirce = 2000;
	sellPirce = -1;
	Weight = 3;
	trunkSpace = 0;
	civLicense = "";
	copLicense = "";
	sharedLicense = "";
	canDrop = true;
	canGive = true;
	isIllegal = false;
	Description = "STR_ItemDesc_StrangeMeat";
	reqResources[] = {};
	};
class Donut
	{
	className = "Donut";
	displayName = "Donut";
	itemType = "Item";
	Function = "ZKB_fnc_Food";
	buyPirce = 200;
	sellPirce = -1;
	Weight = 3;
	trunkSpace = 0;
	civLicense = "";
	copLicense = "";
	sharedLicense = "";
	canDrop = false;
	canGive = true;
	isIllegal = false;
	Description = "STR_ItemDesc_Donut";
	reqResources[] = {};
	};
class Trout
	{
	className = "Trout";
	displayName = "Trout";
	itemType = "Item";
	Function = "ZKB_fnc_Food";
	buyPirce = 600;
	sellPirce = -1;
	Weight = 2;
	trunkSpace = 0;
	civLicense = "";
	copLicense = "";
	sharedLicense = "";
	canDrop = true;
	canGive = true;
	isIllegal = false;
	Description = "STR_ItemDesc_Fish";
	reqResources[] = {};
	};
class Perch
	{
	className = "Perch";
	displayName = "Perch";
	itemType = "Item";
	Function = "ZKB_fnc_Food";
	buyPirce = 1000;
	sellPirce = -1;
	Weight = 2;
	trunkSpace = 0;
	civLicense = "";
	copLicense = "";
	sharedLicense = "";
	canDrop = true;
	canGive = true;
	isIllegal = false;
	Description = "STR_ItemDesc_Fish";
	reqResources[] = {};
	};
class Walleye
	{
	className = "Walleye";
	displayName = "Walleye";
	itemType = "Item";
	Function = "ZKB_fnc_Food";
	buyPirce = 750;
	sellPirce = -1;
	Weight = 2;
	trunkSpace = 0;
	civLicense = "";
	copLicense = "";
	sharedLicense = "";
	canDrop = true;
	canGive = true;
	isIllegal = false;
	Description = "STR_ItemDesc_Fish";
	reqResources[] = {};
	};
class Bass
	{
	className = "Bass";
	displayName = "Bass";
	itemType = "Item";
	Function = "ZKB_fnc_Food";
	buyPirce = 2500;
	sellPirce = -1;
	Weight = 5;
	trunkSpace = 0;
	civLicense = "";
	copLicense = "";
	sharedLicense = "";
	canDrop = true;
	canGive = true;
	isIllegal = false;
	Description = "STR_ItemDesc_Fish";
	reqResources[] = {};
	};
class Bread
	{
	className = "Bread";
	displayName = "Bread";
	itemType = "Item";
	Function = "ZKB_fnc_Food";
	buyPirce = 150;
	sellPirce = -1;
	Weight = 1;
	trunkSpace = 0;
	civLicense = "";
	copLicense = "";
	sharedLicense = "";
	canDrop = true;
	canGive = true;
	isIllegal = false;
	Description = "STR_ItemDesc_Bread";
	reqResources[] = {};
	};
class Iron
	{
	className = "Iron";
	displayName = "Iron";
	itemType = "Item";
	Function = "";
	buyPirce = 2000;
	sellPirce = -1;
	Weight = 2;
	trunkSpace = 0;
	civLicense = "";
	copLicense = "";
	sharedLicense = "";
	canDrop = true;
	canGive = true;
	isIllegal = false;
	Description = "STR_ItemDesc_Iron";
	reqResources[] = {};
	};
class Copper
	{
	className = "Copper";
	displayName = "Copper";
	itemType = "Item";
	Function = "";
	buyPirce = 600;
	sellPirce = -1;
	Weight = 1;
	trunkSpace = 0;
	civLicense = "";
	copLicense = "";
	sharedLicense = "";
	canDrop = true;
	canGive = true;
	isIllegal = false;
	Description = "STR_ItemDesc_Copper";
	reqResources[] = {};
	};
class Coal
	{
	className = "Coal";
	displayName = "Coal";
	itemType = "Item";
	Function = "";
	buyPirce = 200;
	sellPirce = -1;
	Weight = 0.25;
	trunkSpace = 0;
	civLicense = "";
	copLicense = "";
	sharedLicense = "";
	canDrop = true;
	canGive = true;
	isIllegal = false;
	Description = "STR_ItemDesc_Coal";
	reqResources[] = {};
	};
class Silicon
	{
	className = "Silicon";
	displayName = "Silicon";
	itemType = "Item";
	Function = "";
	buyPirce = 500;
	sellPirce = -1;
	Weight = 1.5;
	trunkSpace = 0;
	civLicense = "";
	copLicense = "";
	sharedLicense = "";
	canDrop = true;
	canGive = true;
	isIllegal = false;
	Description = "STR_ItemDesc_Silicon";
	reqResources[] = {};
	};
class DiamondRock
	{
	className = "DiamondRock";
	displayName = "Diamond Rock";
	itemType = "Item";
	Function = "";
	buyPirce = 4500;
	sellPirce = -1;
	Weight = 3;
	trunkSpace = 0;
	civLicense = "";
	copLicense = "";
	sharedLicense = "";
	canDrop = true;
	canGive = true;
	isIllegal = false;
	Description = "STR_ItemDesc_DamondRock";
	reqResources[] = {};
	};
class Platinum
	{
	className = "Platinum";
	displayName = "Platinum";
	itemType = "Item";
	Function = "";
	buyPirce = 4750;
	sellPirce = -1;
	Weight = 4;
	trunkSpace = 0;
	civLicense = "";
	copLicense = "";
	sharedLicense = "";
	canDrop = true;
	canGive = true;
	isIllegal = false;
	Description = "STR_ItemDesc_Platinum";
	reqResources[] = {};
	};
class Silver
	{
	className = "Silver";
	displayName = "Silver";
	itemType = "Item";
	Function = "";
	buyPirce = 2250;
	sellPirce = -1;
	Weight = 2;
	trunkSpace = 0;
	civLicense = "";
	copLicense = "";
	sharedLicense = "";
	canDrop = true;
	canGive = true;
	isIllegal = false;
	Description = "STR_ItemDesc_Silver";
	reqResources[] = {};
	};
class Gold
	{
	className = "Gold";
	displayName = "Gold";
	itemType = "Item";
	Function = "";
	buyPirce = 3000;
	sellPirce = -1;
	Weight = 4;
	trunkSpace = 0;
	civLicense = "";
	copLicense = "";
	sharedLicense = "";
	canDrop = true;
	canGive = true;
	isIllegal = false;
	Description = "STR_ItemDesc_Gold";
	reqResources[] = {};
	};
class Oil
	{
	className = "Oil";
	displayName = "Oil";
	itemType = "Item";
	Function = "";
	buyPirce = 900;
	sellPirce = -1;
	Weight = 3;
	trunkSpace = 0;
	civLicense = "";
	copLicense = "";
	sharedLicense = "";
	canDrop = true;
	canGive = true;
	isIllegal = false;
	Description = "STR_ItemDesc_Oil";
	reqResources[] = {};
	};
class Sand
	{
	className = "Sand";
	displayName = "Sand";
	itemType = "Item";
	Function = "";
	buyPirce = 150;
	sellPirce = -1;
	Weight = 0.25;
	trunkSpace = 0;
	civLicense = "";
	copLicense = "";
	sharedLicense = "";
	canDrop = true;
	canGive = true;
	isIllegal = false;
	Description = "STR_ItemDesc_Sand";
	reqResources[] = {};
	};
class Sulfer
	{
	className = "Sulfer";
	displayName = "Sulfer";
	itemType = "Item";
	Function = "";
	buyPirce = 150;
	sellPirce = -1;
	Weight = .25;
	trunkSpace = 0;
	civLicense = "";
	copLicense = "";
	sharedLicense = "";
	canDrop = true;
	canGive = true;
	isIllegal = false;
	Description = "STR_ItemDesc_Sulfer";
	reqResources[] = {};
	};
class Steel
	{
	className = "Steel";
	displayName = "Steel";
	itemType = "Item";
	Function = "";
	buyPirce = -1;
	sellPirce = -1;
	Weight = 3;
	trunkSpace = 0;
	civLicense = "";
	copLicense = "";
	sharedLicense = "";
	canDrop = true;
	canGive = true;
	isIllegal = false;
	Description = "STR_ItemDesc_Steel";
	reqResources[] = {{"Iron",2}};
	};
class BlackPowder
	{
	className = "BlackPowder";
	displayName = "Black Powder";
	itemType = "Item";
	Function = "";
	buyPirce = -1;
	sellPirce = -1;
	Weight = 1;
	trunkSpace = 0;
	civLicense = "";
	copLicense = "";
	sharedLicense = "";
	canDrop = true;
	canGive = true;
	isIllegal = false;
	Description = "STR_ItemDesc_BlackPowder";
	reqResources[] = {{"Coal",1},{"Sulfer",1}};
	};
class Glass
	{
	className = "Glass";
	displayName = "Glass";
	itemType = "Item";
	Function = "";
	buyPirce = -1;
	sellPirce = -1;
	Weight = 1.5;
	trunkSpace = 0;
	civLicense = "";
	copLicense = "";
	sharedLicense = "";
	canDrop = true;
	canGive = true;
	isIllegal = false;
	Description = "STR_ItemDesc_Glass";
	reqResources[] = {{"Sand",1},{"Silicon",1}};
	};
class Plastic
	{
	className = "Plastic";
	displayName = "Plastic";
	itemType = "Item";
	Function = "";
	buyPirce = -1;
	sellPirce = -1;
	Weight = 1.5;
	trunkSpace = 0;
	civLicense = "";
	copLicense = "";
	sharedLicense = "";
	canDrop = true;
	canGive = true;
	isIllegal = false;
	Description = "STR_ItemDesc_Plastic";
	reqResources[] = {{"Oil",1},{"Coal",1}};
	};
class ElectronicComponents
	{
	className = "ElectronicComponents";
	displayName = "Electronic Components";
	itemType = "Item";
	Function = "";
	buyPirce = -1;
	sellPirce = -1;
	Weight = 2;
	trunkSpace = 0;
	civLicense = "";
	copLicense = "";
	sharedLicense = "";
	canDrop = true;
	canGive = true;
	isIllegal = false;
	Description = "STR_ItemDesc_ElectronicComponents";
	reqResources[] = {{"Silicon",1},{"Copper",1},{"Plastic",1}};
	};
class DiamondRing
	{
	className = "DiamondRing";
	displayName = "Diamond Ring";
	itemType = "Item";
	Function = "";
	buyPirce = 65000;
	sellPirce = -1;
	Weight = 0.5;
	trunkSpace = 0;
	civLicense = "";
	copLicense = "";
	sharedLicense = "";
	canDrop = true;
	canGive = true;
	isIllegal = false;
	Description = "STR_ItemDesc_DiamondRing";
	reqResources[] = {{"DiamondRock",10},{"Silver",1}};
	};
class ExpensiveDiamondRing
	{
	className = "ExpensiveDiamondRing";
	displayName = "Expensive Diamond Ring";
	itemType = "Item";
	Function = "";
	buyPirce = 120000;
	sellPirce = -1;
	Weight = 0.5;
	trunkSpace = 0;
	civLicense = "";
	copLicense = "";
	sharedLicense = "";
	canDrop = true;
	canGive = true;
	isIllegal = false;
	Description = "STR_ItemDesc_ExpensiveDiamondRing";
	reqResources[] = {{"DiamondRock",15},{"Gold",2}};
	};
class PlatinumRing
	{
	className = "PlatinumRing";
	displayName = "Platinum Ring";
	itemType = "Item";
	Function = "";
	buyPirce = 100000;
	sellPirce = -1;
	Weight = 0.5;
	trunkSpace = 0;
	civLicense = "";
	copLicense = "";
	sharedLicense = "";
	canDrop = true;
	canGive = true;
	isIllegal = false;
	Description = "STR_ItemDesc_PlatinumRing";
	reqResources[] = {{"DiamondRock",10},{"Platinum",5}};
	};
class ExpensivePlatinumRing
	{
	className = "ExpensivePlatinumRing";
	displayName = "Expensive Platinum Ring";
	itemType = "Item";
	Function = "";
	buyPirce = 175000;
	sellPirce = -1;
	Weight = 0.5;
	trunkSpace = 0;
	civLicense = "";
	copLicense = "";
	sharedLicense = "";
	canDrop = true;
	canGive = true;
	isIllegal = false;
	Description = "STR_ItemDesc_ExpensivePlatinumRing";
	reqResources[] = {{"DiamondRock",15},{"Platinum",10}};
	};
class UnProcessedCocaine
	{
	className = "UnProcessedCocaine";
	displayName = "UnProcessed Cocaine";
	itemType = "";
	Function = "";
	buyPirce = 2750;
	sellPirce = 2750;
	Weight = 2;
	trunkSpace = 0;
	civLicense = "";
	copLicense = "";
	sharedLicense = "";
	canDrop = true;
	canGive = true;
	isIllegal = true;
	Description = "STR_ItemDesc_UnProcessedCocaine";
	reqResources[] = {};
	};
class Cocaine
	{
	className = "Cocaine";
	displayName = "Cocaine";
	itemType = "";
	Function = "ZKB_fnc_Cocaine";
	buyPirce = 11000;
	sellPirce = 11000;
	Weight = 1.5;
	trunkSpace = 0;
	civLicense = "";
	copLicense = "";
	sharedLicense = "";
	canDrop = true;
	canGive = true;
	isIllegal = true;
	Description = "STR_ItemDesc_Cocaine";
	reqResources[] = {{"UnProcessedCocaine",4}};
	};
class UnProcessedMarijuana
	{
	className = "UnProcessedMarijuana";
	displayName = "UnProcessed Marijuana";
	itemType = "";
	Function = "";
	buyPirce = 1600;
	sellPirce = 1600;
	Weight = 1.5;
	trunkSpace = 0;
	civLicense = "";
	copLicense = "";
	sharedLicense = "";
	canDrop = true;
	canGive = true;
	isIllegal = true;
	Description = "STR_ItemDesc_UnProcessedMarijuana";
	reqResources[] = {};
	};
class Marijuana
	{
	className = "Marijuana";
	displayName = "Marijuana";
	itemType = "";
	Function = "ZKB_fnc_Marijuana";
	buyPirce = 8000;
	sellPirce = 8000;
	Weight = 1;
	trunkSpace = 0;
	civLicense = "";
	copLicense = "";
	sharedLicense = "";
	canDrop = true;
	canGive = true;
	isIllegal = true;
	Description = "STR_ItemDesc_Marijuana";
	reqResources[] = {{"UnProcessedMarijuana",5}};
	};
class UnProcessedLSD
	{
	className = "UnProcessedLSD";
	displayName = "UnProcessed LSD";
	itemType = "";
	Function = "";
	buyPirce = 4000;
	sellPirce = 4000;
	Weight = 2;
	trunkSpace = 0;
	civLicense = "";
	copLicense = "";
	sharedLicense = "";
	canDrop = true;
	canGive = true;
	isIllegal = true;
	Description = "STR_ItemDesc_UnProcessedLSD";
	reqResources[] = {};
	};
class LSD
	{
	className = "LSD";
	displayName = "LSD";
	itemType = "";
	Function = "ZKB_fnc_LSD";
	buyPirce = 12000;
	sellPirce = 12000;
	Weight = 1.5;
	trunkSpace = 0;
	civLicense = "";
	copLicense = "";
	sharedLicense = "";
	canDrop = true;
	canGive = true;
	isIllegal = true;
	Description = "STR_ItemDesc_LSD";
	reqResources[] = {{"UnProcessedLSD",3}};
	};
class UnProcessedHeroin
	{
	className = "UnProcessedHeroin";
	displayName = "UnProcessed Heroin";
	itemType = "";
	Function = "";
	buyPirce = 4500;
	sellPirce = 4500;
	Weight = 2.5;
	trunkSpace = 0;
	civLicense = "";
	copLicense = "";
	sharedLicense = "";
	canDrop = true;
	canGive = true;
	isIllegal = true;
	Description = "STR_ItemDesc_UnProcessedHeroin";
	reqResources[] = {};
	};
class Heroin
	{
	className = "Heroin";
	displayName = "Heroin";
	itemType = "";
	Function = "ZKB_fnc_Heroin";
	buyPirce = 13500;
	sellPirce = 13500;
	Weight = 2;
	trunkSpace = 0;
	civLicense = "";
	copLicense = "";
	sharedLicense = "";
	canDrop = true;
	canGive = true;
	isIllegal = true;
	Description = "STR_ItemDesc_Heroin";
	reqResources[] = {{"UnProcessedHeroin",3}};
	};
class M2StaticMG
	{
	className = "M2StaticMG";
	displayName = "M2 Static MG";
	itemType = "Item";
	Function = "ZKB_fnc_PlaceObject";
	buyPirce = 105000;
	sellPirce = -1;
	Weight = 25;
	trunkSpace = 0;
	civLicense = "Terror_Training";
	copLicense = "SOBR_Training";
	sharedLicense = "";
	canDrop = true;
	canGive = true;
	isIllegal = true;
	Description = "STR_ItemDesc_M2StaticMg";
	reqResources[] = {{"Steel",5},{"Iron",2},{"BlackPowder",2}};
	};
};