class ZargLife_Client
	{
	tag = "ZKB";
	
	class Activity
		{
		file = "Functions\Activity";
		
		class DeliveryMission {};
		class GatherResources {};
		class PatrolMission {};
		class ProcessResourceAction {};
		class RobBank {};
		class RobBankLoss {};
		class RobStation {};
		
		};	
		
	class Bank
		{
		file = "Functions\Bank";
		
		class BuyWorkPlace {};
		class DepositBank {};
		class OpenBank {};
		class PaycheckLoop {};
		class ReTransferBank {};
		class TransferBank {};
		class WithdrawBank {};
		
		};
	
	class Civ
		{
		file = "Functions\Civ";
		
		class InteractionMenu {};
		class RobPlayer {};
		class RobPlayerDropItems {};
		
		};
		
	class Cop
		{
		file = "Functions\Cop";
		
		class AddWanted {};
		class ArrestPlayer {};
		class BountyCollect {};
		class CheckInventory {};
		class CivInteractionMenu {};
		class CopMarkers {};
		class Disarm {};
		class Disarmed {};
		class FreePlayer {};
		class GiveTicket {};
		class HealPlayer {};
		class IsKnockedOut {};
		class IsRestrained {};
		class IsWanted {};
		class Jail {};
		class JailCam {};
		class KnockedOut {};
		class knockoutAction {};
		class OpenCivCamMenu {};
		class OpenPoliceComputer {};
		class OpenPoliceComputerLite {};
		class OpenWantedMenu {};
		class Pardon {};
		class PardonPlayer {};
		class PayBail {};
		class PayBailCopReward {};
		class PoliceSiren {};
		class RecieveTicket {};
		class Restrain {};
		class RestrainPlayer {};
		class SatCam {};
		class SearchPlayer {};
		class SearchPlayerRemoveItems {};
		class SearchShop {};
		class SetWanted {};
		class ShowWantedList {};
		class TearGasLoop {};
		class TicketCollect {};
		class WatchCiv {};

		};
		
	class EH
		{
		file = "Functions\EH";
		
		class EscMenuInterupt {};
		class GetInEH {};
		class HandleDamageEH {};
		class InventoryOpenedEH {};
		class KeyBindHandsDown {};
		class KeyBindHandsUp {};
		class KeyBindHolsterWeapon {};
		class KeyBindInteractionKey {};
		class KeyBindOpenGangMenu {};
		class KeyBindOpenInfoMenu {};
		class KeyBindOpenInventory {};
		class KeyBindKnockOut {};
		class KeyBindOpenTrunk {};
		class KeyBindPoliceComputer {};
		class KeyBindSirenOnOff {};
		class KeyBindVehicleLock {};
		class KeyDownEH {};
		class KeyUpEH {};
		class KilledEH {};
		class KilledPlayer {};
		class LoadPlayer {};
		class RespawnEH {};
		class SavePlayer {};

		};
		
	class Factory
		{
		file = "Functions\Factory";
		
		class BuyFactory {};
		class CreateFactoryItem {};
		class ExportFactoryItem {};
		class ExportedFactoryItem {};
		class GetFacItemAmount {};
		class HireWorker {};
		class ManufactureItem {};
		class OpenFactoryManufacture {};
		class OpenFactoryStorage {};
		class UpdateFacInvList {};
		class UpdateFacStorage {};
		class UpdateFacStorageCompleted {};
		class UpdateFacStorageList {};
		class UpdateFacStoreSelInfo {};
		class UpdateFacTakeSelInfo {};

		};
		
	class Gang
		{
		file = "Functions\Gang";
		
		class FindGang {};
		class GangAreaControl {};
		class GangCheckName {};
		class GangCreate {};
		class GangCreated {};
		class GetGangMembers {};
		class GetGangName {};
		class GroupGang {};
		class IsGangLeader {};
		class IsGangMember {};
		class JoinGang {};
		class KickFromGang {};
		class LeaveGang {};
		class ManageGang {};
		class OpenGangMenu {};
		class RemoveFromGang {};
		class UpdateGangLock {};

		};
		
	class Gear
		{
		file = "Functions\Gear";
		
		class ClearGear {};
		class GetPlayerGear {};
		class GetWeaponsAndItems {};

		};
		
	class Init
		{
		file = "Functions\Init";
		
		class InitCBAKeyBinds {};
		class InitPlayer {};
		class InitServer {};
		class OpenWelcomeMenu {};

		};
		
	class Items
		{
		file = "Functions\Items";
		
		class ActivationBomb {};
		class BombRemote {};
		class Cocaine {};
		class DefuseKit {};
		class FishingPole {};
		class Food {};
		class Heroin {};
		class ItemBag {};
		class KeyChain {};
		class Lighter {};
		class LockPick {};
		class LSD {};
		class Marijuana {};
		class MedKit {};
		class Mine {};
		class Phone {};
		class PlaceObject {};
		class RefuelCan {};
		class RemoteBomb {};
		class RepKit {};
		class SpeedBomb {};
		class SpeedUpgrade {};
		class SpikeStrip {};
		class SpikeStripEffect {};
		class SuicideBomb {};
		class SyphonFuel {};
		class TakeGoatMeat {};
		class TakeRabbitMeat {};
		class TimeBomb {};
		class VehicleAmmo {};
		class WeaponBag {};

		};
		
	class Inventory
		{
		file = "Functions\Inventory";
		
		class DropItem {};
		class HasRequiredLicenses {};
		class InvCorrectAmountToWeight {};
		class InvGiveItem {};
		class InvPickUpItem {};
		class GetInvItemAmount {};
		class GetInvItemTotalWeight {};
		class GetInvTotalWeight {};
		class GetItemBuyPrice {};
		class GetItemBuyPriceWithTax {};
		class GetItemCanDrop {};
		class GetItemCanGive {};
		class GetItemCondition {};
		class GetItemDesc {};
		class GetItemFunction {};
		class GetItemInfo {};
		class GetItemIsIllegal {};
		class GetItemLicenseBoth {};
		class GetItemLicenseCiv {};
		class GetItemLicenseCop {};
		class GetItemName {};
		class GetItemNeedFactoryItems {};
		class GetItemSellPrice {};
		class GetItemSellPriceWithTax {};
		class GetItemTrunkSpace {};
		class GetItemType {};
		class GetItemWeight {};
		class InvDropItem {};
		class InvAddItem {};
		class InvRemoveItem {};
		class InvSelChange {};
		class OpenInventory {};
		class UseItem {};

		};
		
	class MainMenu
		{
		file = "Functions\MainMenu";
		

		class AddItemInfoFilter {};
		class FillItemInfoList {};
		class FillMenuGenText {};
		class ItemInfoMenu {};
		class ItemInfoMenuSpawnItem {};
		class ItemInfoSelChange {};
		class OpenInfoMenu {};
		class SayTextMenu {};
		class SayRadioText {};
		class SetUpRadioTriggers {};

		};
		
	class Misc
		{
		file = "Functions\Misc";
		
		class AddAction {};
		class AddActions {};
		class AddForce {};
		class AnimSync {};
		class BuyLicense {};
		class BuySlave {};
		class CfgGetDisplayName {};
		class CfgGetPicture {};
		class CheckCharNum {};
		class CheckValidChar {};
		class CivMarkers {};
		class DynamicText {};
		class FormatNumber {};
		class GasStationInit {};
		class GasStationRefuel {};
		class GenerateIDC {};
		class GetConfigByClass {};
		class GetGearType {};
		class GetLicenseDisplayName {};
		class GetPlayerFromID {};
		class HandsUp {};
		class HasLicenses {};
		class HudTags {};
		class InWorkPlaceLoop {};
		class IsSurrending {};
		class RemoveLicense {};
		class RoadBlock {};
		class RoadBlockObjectInit {};
		class SetRating {};
		class SetUpLicenses {};
		class SetUpWorkplaces {};
		class SlaveLoop {};

		};
	
	class Server
		{
		file = "Functions\Server";
		
		class AssassinMission {};
		class AssassinMissionCivLoop {};
		class AssassinMissionCivWin {};
		class AssassinMissionCopWin {};
		class GovernmentConvoy {};
		class GovernmentConvoyCivLoop {};
		class GovernmentConvoyCivWin {};
		class GovernmentConvoyCopWin {};
		class HostageInit {};
		class HostageCivWin {};
		class HostageCopWin {};
		class HostageKilled {};
		class HostageKilledKiller {};
		class KilledGoatEH {};
		class TakeHostageLoop {};

		};
		
	class Shop
		{
		file = "Functions\Shop";
		
		class OpenShop {};
		class ShopBuy {};
		class ShopGetItemStock {};
		class ShopSell {};
		class UpdateShopBuyList {};
		class UpdateShopBuySelInfo {};
		class UpdateShopSellList {};
		class UpdateShopSellSelInfo {};
		class UpdateShopStock {};

		};		
		
	class Vehicle
		{
		file = "Functions\Vehicle";
		
		class AddVehicleActions {};
		class CreateVehicle {};
		class GetTrunkItemAmount {};
		class Impound {};
		class ImpoundMenu {};
		class OpenVehicleTrunk {};
		class PullOut {};
		class SearchVehicle {};
		class setVehicleVarName {};
		class UnflipVeh {};
		class UnImpound {};
		class UpdateVehicleInvList {};
		class UpdateVehicleTrunk {};
		class UpdateVehicleTrunkList {};
		class VehInfo {};
		class ViewTrunk {};

		};
		
	class Voting
		{
		file = "Functions\Voting";
		
		class ChangeTaxes {};
		class ElectionLoop {};
		class IsChief {};
		class IsMayor {};
		class OpenChiefVoteMenu {};
		class OpenLawMenu {};
		class OpenMayorVoteMenu {};
		class OpenTaxMenu {};
		class UpdateLaw {};
		class VoteChief {};
		class VoteMayor {};

		};

	};