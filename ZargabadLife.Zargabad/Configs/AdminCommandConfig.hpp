/*
class PlayerUID {adminLevel = 0;}; //adminLevel for playerUID
*/

class Admins
{
class 76561198034910314 {adminLevel = 5;}; //ZKB1325
class 76561198011217903 {adminLevel = 4;}; //Woods
class 76561198145974876 {adminLevel = 4;}; //Gamerz
class 76561198042283286 {adminLevel = 4;}; //Walrus
class 76561198059428945 {adminLevel = 4;}; //Joe
};

/*

class AdminAbility
	{
	displayName = "Name in list"; //Name in the list
	description = ""; //Description that is displayed as a tooltip
	reqAdminLevel = 5; //required admin level to see in list. Acts as minimum level so level 4 can see if required level is 2. All players are at least 0
	function = ""; //Function to run when option is selected. function is called. Passes selected player object (_this select 0) List control (_this select 1) and command index from the list menu (_this select 2).
	menuIDC[] = {}; //IDC's of menu. This is important so it can hide and show the correct menu's. -1, 50001, and 50002 are reserved.
	condition = ""; //Additional condition on top of needing reqAdminLevel
	};

*/


class AdminCommands
{
class Nothing
	{
	displayName = "$STR_Admin_Nothing";
	description = "$STR_Admin_NothingDesc";
	reqAdminLevel = 0;
	function = "";
	menuIDC[] = {};
	condition = "";
	};
	
class GodMode
	{
	displayName = "$STR_Admin_GodMode";
	description = "$STR_Admin_GodModeDesc";
	reqAdminLevel = 5;
	function = "ZKB_fnc_AdminGodMode";
	menuIDC[] = {};
	condition = "";
	};
	
class HealPlayer
	{
	displayName = "$STR_Admin_HealPlayer";
	description = "$STR_Admin_HealPlayerDesc";
	reqAdminLevel = 1;
	function = "ZKB_fnc_AdminHealPlayer";
	menuIDC[] = {};
	condition = "";
	};
	
class Teleport
	{
	displayName = "$STR_Admin_Teleport";
	description = "$STR_Admin_TeleportDesc";
	reqAdminLevel = 2;
	function = "";
	menuIDC[] = {50010,50011,50012,50013,50014,50015,50016};
	condition = "";
	};	
	
class Comp
	{
	displayName = "$STR_Admin_Comp";
	description = "$STR_Admin_CompDesc";
	reqAdminLevel = 2;
	function = "ZKB_fnc_AdminCompMenu";
	menuIDC[] = {50020,50021,50022,50023,50024,50025,50026,50027,50028,50029,50030,50031,50032,50033,50034,50035,50036,50037,50038};
	condition = "";
	};
	
class Spectate
	{
	displayName = "$STR_Admin_Spectate";
	description = "$STR_Admin_SpectateDesc";
	reqAdminLevel = 2;
	function = "ZKB_fnc_AdminSpectatePlayer";
	menuIDC[] = {};
	condition = "";
	};
	
class AdminLogs
	{
	displayName = "$STR_Admin_AdminLogs";
	description = "$STR_Admin_AdminLogsDesc";
	reqAdminLevel = 2;
	function = "ZKB_fnc_AdminViewAdminLogs";
	menuIDC[] = {50040,50041,50042,50043};
	condition = "";
	};	
	
class PlayerLogs
	{
	displayName = "$STR_Admin_PlayerLogs";
	description = "$STR_Admin_PlayerLogsDesc";
	reqAdminLevel = 1;
	function = "ZKB_fnc_AdminViewPlayerLogs";
	menuIDC[] = {50050,50051,50052,50053};
	condition = "";
	};
	
class PlayerInfo
	{
	displayName = "$STR_Admin_PlayerInfo";
	description = "$STR_Admin_PlayerInfoDesc";
	reqAdminLevel = 1;
	function = "ZKB_fnc_AdminViewPlayerInfo";
	menuIDC[] = {50060,50061,50062,50063,50064,50065,50066,50067};
	condition = "";
	};
};