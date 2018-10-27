/*
	Author: ZKB1325
	FileName: fn_InitPlayer.sqf
	Function: ZKB_fnc_InitPlayer
	
	Description: Init for joining players. Handles first time joining and stat loading for session
*/

//Disabled by default because CBA Keybinds are used.
(findDisplay 46) displayAddEventHandler ["KeyDown", {_this call ZKB_fnc_KeyDownEH;}]; //still needed for map key and escape key
//(findDisplay 46) displayAddEventHandler ["KeyUp", {_this call ZKB_fnc_KeyUpEH;}];

player addEventHandler ["HandleDamage", {_this call ZKB_fnc_HandleDamageEH;}];
player addEventHandler ["Killed", {_this call ZKB_fnc_KilledEH;}];
player addEventHandler ["Respawn", {_this spawn ZKB_fnc_RespawnEH;}];
player addEventHandler ["GetInMan", {_this spawn ZKB_fnc_GetInEH;}];
player addEventHandler ["InventoryOpened",{_this call ZKB_fnc_InventoryOpenedEH;}];

call ZKB_fnc_ClearGear;
switch (playerSide) do
	{
	case west:
		{
		if !(isNil {missionNamespace getVariable format ["stats_%1_%2",getPlayerUID player,playerSide]}) then
			{
			call ZKB_fnc_LoadPlayer;
			}
			else
			{
			player setUnitLoadout [ZKB_RespawnLoadOut,true];
			};
		};
	
	case civilian:
		{
		if !(isNil {missionNamespace getVariable format ["stats_%1_%2",getPlayerUID player,playerSide]}) then
			{
			call ZKB_fnc_LoadPlayer;
			}
			else
			{
			private _startHeadGear = 
				[
				"CUP_H_TKI_Lungee_Open_01",
				"CUP_H_TKI_Lungee_Open_02",
				"CUP_H_TKI_Lungee_Open_03",
				"CUP_H_TKI_Lungee_Open_04",
				"CUP_H_TKI_Lungee_Open_05",
				"CUP_H_TKI_Lungee_Open_06",
				"CUP_H_TKI_Lungee_01",
				"CUP_H_TKI_Lungee_02",
				"CUP_H_TKI_Lungee_03",
				"CUP_H_TKI_Lungee_04",
				"CUP_H_TKI_Lungee_05",
				"CUP_H_TKI_Lungee_06",
				"CUP_H_TKI_Pakol_1_01",
				"CUP_H_TKI_Pakol_2_04",
				"CUP_H_TKI_Pakol_2_05",
				"CUP_H_TKI_Pakol_2_06"
				];
			private _startUniforms = 
				[
				"CUP_O_TKI_Khet_Jeans_04",
				"CUP_O_TKI_Khet_Jeans_02",
				"CUP_O_TKI_Khet_Jeans_01",
				"CUP_O_TKI_Khet_Jeans_03",
				"CUP_O_TKI_Khet_Partug_04",
				"CUP_O_TKI_Khet_Partug_02",
				"CUP_O_TKI_Khet_Partug_01",
				"CUP_O_TKI_Khet_Partug_07",
				"CUP_O_TKI_Khet_Partug_08",
				"CUP_O_TKI_Khet_Partug_05",
				"CUP_O_TKI_Khet_Partug_06"
				];
				
			player addHeadgear (selectRandom _startHeadGear);
			player forceAddUniform (selectRandom _startUniforms);
			{
			player addWeapon _x;
			}forEach ["ItemMap","ItemWatch","ItemCompass","ItemRadio"];
				
			ZKB_RespawnLoadOut = getUnitLoadout player;
			};
		};
	};
	
if !(isNil {missionNamespace getVariable format ["stats_%1_Shared",getPlayerUID player]}) then
	{
	private _sharedStats = missionNamespace getVariable format ["stats_%1_Shared",getPlayerUID player];
	_slaves = _sharedStats select 0;
	_slaves = _slaves - [objNull];
	if (count _slaves > 0) then
		{
		if (IsCop) then
			{
			{deleteVehicle _x}forEach _slaves;
			}
			else
			{
			player setVariable ["ownedSlave",_slaves];
			_slaves joinSilent (group player);
			(group player) selectLeader player;
			{[_x] spawn ZKB_fnc_SlaveLoop;}forEach _slaves;
			doStop _slaves;
			};
		};
	};

["BlueInk",(["BlueInk"] call ZKB_fnc_GetInvItemAmount)] call ZKB_fnc_InvRemoveItem;
[100000] call ZKB_fnc_SetRating;
player enableStamina false;

if (player getVariable ["InJail",false]) then
	{
	player setVariable ["InJail",false,true];
	[(missionNamespace getVariable ["JailTime",0]),player getVariable ["Bail",0],name player] spawn ZKB_fnc_Jail;
	};

call ZKB_fnc_OpenWelcomeMenu;

reverse ZKB_Rules;
player createDiarySubject ["serverRules",localize "STR_MainMenu_MapTabServerRules"];
{
ZKB_DiaryRules = player createDiaryRecord ["serverRules", _x];
}forEach ZKB_Rules;

if !(player diarySubjectExists "locations") then
	{
	player createDiarySubject ["locations",localize "STR_MainMenu_MapTabMapLocations"];
	};
private _resourceLocationString = "Only some will move the map when clicked... I don't know why. But at least it still marks the location.<br/>";
_resourceLocationString = _resourceLocationString + format ["<marker name='%1'>%2</marker><br/>","CoalMine",localize "STR_Markers_CoalMine"];
_resourceLocationString = _resourceLocationString + format ["<marker name='%1'>%2</marker><br/>","CopperMine",localize "STR_Markers_CopperMine"];
_resourceLocationString = _resourceLocationString + format ["<marker name='%1'>%2</marker><br/>","DiamondRockMine",localize "STR_Markers_DiamondRockMine"];
_resourceLocationString = _resourceLocationString + format ["<marker name='%1'>%2</marker><br/>","GoldMine",localize "STR_Markers_GoldMine"];
_resourceLocationString = _resourceLocationString + format ["<marker name='%1'>%2</marker><br/>","IronMine",localize "STR_Markers_IronMine"];
_resourceLocationString = _resourceLocationString + format ["<marker name='%1'>%2</marker><br/>","OilMine",localize "STR_Markers_OilMine"];
_resourceLocationString = _resourceLocationString + format ["<marker name='%1'>%2</marker><br/>","OilMine2",localize "STR_Markers_OilMine"];
_resourceLocationString = _resourceLocationString + format ["<marker name='%1'>%2</marker><br/>","PlatinumMine",localize "STR_Markers_PlatinumMine"];
_resourceLocationString = _resourceLocationString + format ["<marker name='%1'>%2</marker><br/>","SandMine",localize "STR_Markers_SandMine"];
_resourceLocationString = _resourceLocationString + format ["<marker name='%1'>%2</marker><br/>","SiliconMine",localize "STR_Markers_SiliconMine"];
_resourceLocationString = _resourceLocationString + format ["<marker name='%1'>%2</marker><br/>","SilverMine",localize "STR_Markers_SilverMine"];
_resourceLocationString = _resourceLocationString + format ["<marker name='%1'>%2</marker><br/>","SulferMine",localize "STR_Markers_SulferMine"];
_resourceLocationString = _resourceLocationString + "<br/>";
_resourceLocationString = _resourceLocationString + format ["<marker name='%1'>%2</marker><br/>","FishingAreaBass",localize "STR_Markers_BassArea"];
_resourceLocationString = _resourceLocationString + format ["<marker name='%1'>%2</marker><br/>","FishingAreaPerch",localize "STR_Markers_PerchArea"];
_resourceLocationString = _resourceLocationString + format ["<marker name='%1'>%2</marker><br/>","FishingAreaTrout",localize "STR_Markers_TroutArea"];
_resourceLocationString = _resourceLocationString + format ["<marker name='%1'>%2</marker><br/>","FishingAreaWalleye",localize "STR_Markers_WalleyeArea"];
_resourceLocationString = _resourceLocationString + "<br/>";
_resourceLocationString = _resourceLocationString + format ["<marker name='%1'>%2</marker><br/>","HuntingGroundpMarker",localize "STR_Markers_HuntingGrounds"];
player createDiaryRecord ["locations", [localize "STR_MainMenu_MapTabResources",_resourceLocationString]];


player createDiarySubject ["info",localize "STR_MainMenu_MapTabCreditsInfo"];
player createDiaryRecord ["info", [localize "STR_MainMenu_MapTabCredits","
<t align='center'>Welcome to Zargabad Life by ZKB1325</t><br/>
<br/>
This life mod is intended to be a recreation of Arma 2 OA Zargabad Life.<br/>
<br/>
Original credit to EddieV223, Pogoman, Issetea, and Fewo.<br/>
<br/>
Thanks to the CUP team for porting Arma 2 OA assets to Arma 3 as this mission uses and requires: Cup_Terrains-Maps, Cup_Terrains-Core, Cup_Vehicles, Cup_Units, Cup_weapons, and CBA_A3<br/>
"]];

player createDiaryRecord ["info", [localize "STR_MainMenu_MapTabControls","
All keybinds can be changed if you go to Configure >> Controls >> Configure Addons >> and select Zargabad Life from the drop down.<br/><br/>
- Press TAB to Enable/Disable your keys by default, this can be changed in controls. If they are disabled none of the keybinds below will work and normal Arma actions will happen.<br/>
- Press 1 to open the info menu.<br/>
- Press 2 to open the inventory menu.<br/>
- Press 3 to put your hand up.<br/>
- Press 4 to put your hands down.<br/>
- Press 5 as a civ to open the gang menu.<br/>
- Press E to interact with objects such as shops, getting in/out of vehicle, and other players.<br/>
- Press T while in the driver seat of a vehicle that you have keys to, to open the trunk.<br/>
- Press Shift + H to holster your weapon.<br/>
- Press Shift + F when looking at another player and you are armed to knock them out.<br/>
- Press Tilda ~ as a cop to open the cop menu. Being in a vehicle and on foot open different menus.<br/>
- Press F as a cop in the driver seat of a vehicle to toggle the siren on and off.<br/>
- You can press 2 then click the menu button or press 0-0-Enter to get to the menu where you can change settings and see other helpful information.<br/>
- You can open the gear of a vehicle if you have keys to the vehicle or the vehicle is unlocked.<br/>
"]];











