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
		
	class Admin
		{
		file = "Functions\Admin";
		
		class AdminAddAdminLog {};
		class AdminAddPlayerLog {};
		class AdminCompAddItemInfoFilter {};
		class AdminCompBankReceive {};
		class AdminCompItem {};
		class AdminCompItemReceive {};
		class AdminCompMenu {};
		class AdminCompPlayer {};
		class AdminGodMode {};
		class AdminHealPlayer {};
		class AdminSpectatePlayer {};
		class AdminTPBack {};
		class AdminTPHere {};
		class AdminTPMap {};
		class AdminTPTo {};
		class AdminViewAdminLogs {};
		class AdminViewPlayerInfo {};
		class AdminViewPlayerLogs {};
		class ExecAdminCommand {};
		class OpenAdminMenu {};
		
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
		
	class CFG
		{
		file = "Functions\CFG";
		
		class CfgGetDisplayName {};
		class CfgGetPicture {};
		
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
		
	class DualInv
		{
		file = "Functions\DualInv";
		
		class DualInvAddItem {};
		class DualInvDraggingEvent {};
		class DualInvDropEvent {};
		class DualInvOpen {};
		class DualInvRemoveItem {};
		class DualInvTransfer {};
		class DualInvUpdateBtn {};
		class DualInvUpdateLists {};
		};
		
	class EH
		{
		file = "Functions\EH";
		
		class EscMenuInterupt {};
		class GetInEH {};
		class GetOutEH {};
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
		class KilledEH {};
		class KilledPlayer {};
		class RespawnEH {};

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
		class UpdateFacStorageCompleted {};

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
		class GetGangMemberName {};
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
		class SkipBriefing {preInit = 1; recompile = 0;};

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
		class SiphonFuel {};
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
		class CheckCharNum {};
		class CheckValidChar {};
		class CivMarkers {};
		class CompareDay {};
		class CompareHour {};
		class CompareMinute {};
		class CompareMonth {};
		class CompareYear {};
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
		class SubtractDate {};

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
		class SetShotParents {};
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
	
	class Stats
		{
		file = "Functions\Stats";
		
		class LoadPlayer {};
		class SavePlayer {}
		class ServerDeleteVehicle {};
		class ServerLoadGangs {};
		class ServerLoadImpound {};
		class ServerLoadPlayerStats {};
		class ServerLoadStats {};
		class ServerLoadVehicles {};
		class ServerSavePlayerStats {};
		class ServerSaveStats {};
		class ServerSaveVehicle {};
		class ServerUpdateGangSave {};
		class ServerUpdateImpound {};
		};
		
	class Vehicle
		{
		file = "Functions\Vehicle";
		
		class AddVehicleActions {};
		class CreateVehicle {};
		class GetTrunkItemAmount {};
		class Impound {};
		class ImpoundMenu {};
		class PullOut {};
		class SearchVehicle {};
		class setVehicleVarName {};
		class UnflipVeh {};
		class UnImpound {};
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