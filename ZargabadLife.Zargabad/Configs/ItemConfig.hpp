/*
class className //className used for shops and factories
	{
	className = "className used for spawning weapons/gear/vehicles";
		Note: class className AND className = ""; should ALWWAYS be the same for virtual items. Gear and Vehicles can be different but not recommended.
	dropClass = ""; //For virtual items only will be the physical object the drops on the ground
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

class ItemBase
	{
	className = "";
	dropClass = "Land_Suitcase_F";
	displayName = "";
	itemType = "";
	Function = "";
	buyPirce = 0;
	sellPirce = 0;
	Weight = 0;
	trunkSpace = 0;
	civLicense = "";
	copLicense = "";
	sharedLicense = "";
	canDrop = true;
	canGive = true;
	isIllegal = false;
	Description = "";
	reqResources[] = {};
	};

class Money: ItemBase
	{
	className = "Money";
	dropClass = "Land_Money_F";
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
class KeyChain: ItemBase
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
class Phone: ItemBase
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
class MedKit: ItemBase
	{
	className = "MedKit";
	dropClass = "Land_PainKillers_F";
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
class RepairKit: ItemBase
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
	reqResources[] = {{"Steel",2},{"Plastic",1}};
	};
class Lighter: ItemBase
	{
	className = "Lighter";
	dropClass = "Land_ButaneTorch_F";
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
	reqResources[] = {{"Plastic",1}};
	};
class LockPick: ItemBase
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
	reqResources[] = {{"Iron",1}};
	};
class RefuelCan: ItemBase
	{
	className = "RefuelCan";
	dropClass = "Land_CanisterFuel_F";
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
	reqResources[] = {{"Plastic",1},{"Oil",1}};
	};
class SiphonFuelKit: ItemBase
	{
	className = "SiphonFuelKit";
	dropClass = "Land_CanisterFuel_F";
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
	reqResources[] = {{"Plastic",1}};
	};
class OilBarrel: ItemBase
	{
	className = "OilBarrel";
	dropClass = "Land_MetalBarrel_F";
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
class WeaponBag: ItemBase
	{
	className = "WeaponBag";
	dropClass = "Land_Sleeping_bag_folded_F";
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
class ItemBag: ItemBase
	{
	className = "ItemBag";
	dropClass = "Land_Sleeping_bag_folded_F";
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
class DefuseKit: ItemBase
	{
	className = "DefuseKit";
	dropClass = "Land_MultiMeter_F";
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
class SpikeStrip: ItemBase
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
class BlueInk: ItemBase
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
class BankInsurance: ItemBase
	{
	className = "BankInsurance";
	dropClass = "Land_File1_F";
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
class FishingPole: ItemBase
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
class Shovel: ItemBase
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
class PickAxe: ItemBase
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
class JackHammer: ItemBase
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
	reqResources[] = {{"Steel",2},{"ElectronicComponents",1}};
	};
class VehicleAmmo: ItemBase
	{
	className = "VehicleAmmo";
	dropClass = "Land_Ammobox_rounds_F";
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
	reqResources[] = {{"Copper",5},{"BlackPowder",8}};
	};
/*
class SpeedUpgrade1: ItemBase
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
	reqResources[] = {{"Steel",1},{"ElectronicComponents",1},{"Plastic",1}};
	};
class SpeedUpgrade2: ItemBase
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
	reqResources[] = {{"Steel",2},{"ElectronicComponents",2},{"Plastic",2}};
	};
class SpeedUpgrade3: ItemBase
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
	reqResources[] = {{"Steel",3},{"ElectronicComponents",3},{"Platinum",1}};
	};
class SpeedUpgrade4: ItemBase
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
	reqResources[] = {{"Steel",4},{"ElectronicComponents",4},{"Platinum",2}};
	};
class SpeedUpgrade5: ItemBase
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
	reqResources[] = {{"Steel",5},{"ElectronicComponents",5},{"Platinum",4}};
	};
*/
class SuicideBomb: ItemBase
	{
	className = "SuicideBomb";
	dropClass = "Explosive";
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
class ActivationBomb: ItemBase
	{
	className = "ActivationBomb";
	dropClass = "Explosive";
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
class TimeBomb: ItemBase
	{
	className = "TimeBomb";
	dropClass = "Explosive";
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
	reqResources[] = {{"ElectronicComponents",8},{"Iron",10},{"BlackPowder",25}};
	};
class SpeedBomb: ItemBase
	{
	className = "SpeedBomb";
	dropClass = "Explosive";
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
	reqResources[] = {{"ElectronicComponents",8},{"Iron",20},{"BlackPowder",25}};
	};
class RemoteBomb: ItemBase
	{
	className = "RemoteBomb";
	dropClass = "Explosive";
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
	reqResources[] = {{"ElectronicComponents",5},{"Iron",20},{"BlackPowder",25}};
	};
class BombRemote: ItemBase
	{
	className = "BombRemote";
	dropClass = "Land_Tablet_02_F";
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
	reqResources[] = {{"ElectronicComponents",1},{"Plastic",1}};
	};
class Goat: ItemBase
	{
	className = "Goat";
	dropClass = "Land_TinContainer_F";
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
class Rabbit: ItemBase
	{
	className = "Rabbit";
	dropClass = "Land_TinContainer_F";
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
class StrangeMeat: ItemBase
	{
	className = "StrangeMeat";
	dropClass = "Land_TinContainer_F";
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
class Donut: ItemBase
	{
	className = "Donut";
	dropClass = "Land_TinContainer_F";
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
class Trout: ItemBase
	{
	className = "Trout";
	dropClass = "Land_TinContainer_F";
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
class Perch: ItemBase
	{
	className = "Perch";
	dropClass = "Land_TinContainer_F";
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
class Walleye: ItemBase
	{
	className = "Walleye";
	dropClass = "Land_TinContainer_F";
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
class Bass: ItemBase
	{
	className = "Bass";
	dropClass = "Land_TinContainer_F";
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
class Bread: ItemBase
	{
	className = "Bread";
	dropClass = "Land_TinContainer_F";
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
class Iron: ItemBase
	{
	className = "Iron";
	dropClass = "Land_Bucket_F";
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
class Copper: ItemBase
	{
	className = "Copper";
	dropClass = "Land_Bucket_F";
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
class Coal: ItemBase
	{
	className = "Coal";
	dropClass = "Land_Bucket_F";
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
class Silicon: ItemBase
	{
	className = "Silicon";
	dropClass = "Land_Bucket_F";
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
class DiamondRock: ItemBase
	{
	className = "DiamondRock";
	dropClass = "Land_Bucket_F";
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
class Platinum: ItemBase
	{
	className = "Platinum";
	dropClass = "Land_Bucket_F";
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
class Silver: ItemBase
	{
	className = "Silver";
	dropClass = "Land_Bucket_F";
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
class Gold: ItemBase
	{
	className = "Gold";
	dropClass = "Land_Bucket_F";
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
class Oil: ItemBase
	{
	className = "Oil";
	dropClass = "Land_MetalBarrel_F";
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
class Sand: ItemBase
	{
	className = "Sand";
	dropClass = "Land_Bucket_F";
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
class Sulfer: ItemBase
	{
	className = "Sulfer";
	dropClass = "Land_Bucket_F";
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
class Steel: ItemBase
	{
	className = "Steel";
	dropClass = "Land_Bucket_F";
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
class BlackPowder: ItemBase
	{
	className = "BlackPowder";
	dropClass = "Land_Bucket_F";
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
class Glass: ItemBase
	{
	className = "Glass";
	dropClass = "Land_Bucket_F";
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
class Plastic: ItemBase
	{
	className = "Plastic";
	dropClass = "Land_Bucket_F";
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
class ElectronicComponents: ItemBase
	{
	className = "ElectronicComponents";
	dropClass = "Land_Bucket_F";
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
	reqResources[] = {{"Silicon",1},{"Copper",1}};
	};
class DiamondRing: ItemBase
	{
	className = "DiamondRing";
	dropClass = "Land_MetalCase_01_small_F";
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
class ExpensiveDiamondRing: ItemBase
	{
	className = "ExpensiveDiamondRing";
	dropClass = "Land_MetalCase_01_small_F";
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
class PlatinumRing: ItemBase
	{
	className = "PlatinumRing";
	dropClass = "Land_MetalCase_01_small_F";
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
class ExpensivePlatinumRing: ItemBase
	{
	className = "ExpensivePlatinumRing";
	dropClass = "Land_MetalCase_01_small_F";
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
class UnProcessedCocaine: ItemBase
	{
	className = "UnProcessedCocaine";
	dropClass = "Land_Bag_EP1";
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
class Cocaine: ItemBase
	{
	className = "Cocaine";
	dropClass = "Land_Bag_EP1";
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
class UnProcessedMarijuana: ItemBase
	{
	className = "UnProcessedMarijuana";
	dropClass = "Land_Bag_EP1";
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
class Marijuana: ItemBase
	{
	className = "Marijuana";
	dropClass = "Land_Bag_EP1";
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
class UnProcessedLSD: ItemBase
	{
	className = "UnProcessedLSD";
	dropClass = "Land_Bag_EP1";
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
class LSD: ItemBase
	{
	className = "LSD";
	dropClass = "Land_Bag_EP1";
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
class UnProcessedHeroin: ItemBase
	{
	className = "UnProcessedHeroin";
	dropClass = "Land_Bag_EP1";
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
class Heroin: ItemBase
	{
	className = "Heroin";
	dropClass = "Land_Bag_EP1";
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
class M2StaticMG: ItemBase
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
	reqResources[] = {{"Steel",5},{"BlackPowder",2}};
	};
};