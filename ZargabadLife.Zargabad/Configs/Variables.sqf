#include "..\ConfigMacros.hpp"
/*
	Author: ZKB1325
	FileName: Variables.sqf
	Function: Not a function
*/
//Text to display in the intro menu. Does NOT have to be an array of strings can be an array with single string
ZKB_IntroMessage =
[
"<t align='center'>Welcome to Zargabad Life by ZKB1325<br/><br/>",
"This life mod is intended to be a recreation of Arma 2 OA Zargabad Life.<br/>Original credit to EddieV223, Pogoman, Issetea, and Fewo.<br/>Thanks to the CUP team for porting Arma 2 OA assets to Arma 3 as this mission uses and requires: Cup_Terrains-Maps, Cup_Terrains-Core, Cup_Vehicles, Cup_Units, Cup_weapons, and CBA_A3</t><br/><br/>",
"<t color='#FF0000' align='center'>This version of the Life Framework is intended for Zargabad Life, A more generic version will be released in the future.</t><br/><br/>",
"<br/>",
//"Website: <a underline='true' href='https://www.arkleus.net/'>www.arkleus.net</a><br/>",
//"Discord: <a underline='true' href='http://discord.me/igfgaming'>http://discord.me/igfgaming</a><br/>",
//"Teamspeak: <t color='#D09B43'>play.igfgaming.net</t><br/>",
"<br/>",
"<t size='1.5' color='#ff9400'>You can find the controls and full rules in the map tabs along with jail times and ticket amounts.</t><br/>",
"<br/>",
"Default Controls:<br/>",
"<t underline='true'>All keybinds can be changed if you go to Configure >> Controls >> Configure Addons >> and select Zargabad Life from the drop down.</t><br/>",
"- Press F1 to open this menu.<br/>",
"- Press F2 to lower sound volume by 10%.<br/>",
"- Press F3 to raise sound volume by 10%.<br/>",
"- Press TAB to Enable/Disable your keys by default, this can be changed in controls. If they are disabled none of the keybinds below will work and normal Arma actions will happen.<br/>",
"- Press 1 to open the info menu.<br/>",
"- Press 2 to open the inventory menu.<br/>",
"- Press 3 to put your hand up.<br/>",
"- Press 4 to put your hands down.<br/>",
"- Press 5 as a civ to open the gang menu.<br/>",
"- Press E to interact with objects such as shops, getting in/out of vehicle, and other players.<br/>",
"- Press T while in the driver seat of a vehicle that you have keys to, to open the trunk.<br/>",
"- Press Shift + H to holster your weapon.<br/>",
"- Press Shift + F when looking at another player and you are armed to knock them out.<br/>",
"- Press Tilda ~ as a cop to open the cop menu. Being in a vehicle and on foot open different menus.<br/>",
"- Press F as a cop in the driver seat of a vehicle to toggle the siren on and off.<br/>",
"- You can press 2 then click the menu button or press 0-0-Enter to get to the menu where you can change settings and see other helpful information.<br/>",
"- You can open the gear of a vehicle if you have keys to the vehicle or the vehicle is unlocked.<br/>",
"<br/><br/>",
"Rules:<br/>",
"The rules can be found in the map tab ""Server Rules"", There is no excuse to not read them.<br/>",
"If you want to do something but not sure if it's against the rules then either don't do it or ask an Admin.<br/>",
"<br/><br/>",
"While this mission is meant to be a recreation of Zargabad Life from Arma 2 some things are a little different for reasons ranging from doable to practical.<br/>For example:<br/>",
"- Speed upgrades are in the mission but not usable because CUP vehicles behave oddly.<br/>",
"- Robbing the bank now puts Blue Ink in your inventory instead of automatically wanting you to make things a little more fair with cops having to manually search you.<br/>",
"- The Item Info menu displays a lot more info that could be useful to the player.<br/>",
"- Some weapons were added such as a M9 with a shield and the Saiga 12K with beanbag rounds to make things more interesting.<br/>",
"- Uniforms, Vests, and helmets were never a thing in Arma 2 OA but they are in Arma 3 so there is clothing and other gear to buy.<br/>",
"- When voting for someone you can hover over a name to see how many votes they have, this gives you a better idea on how popular you are.<br/>",
"- If you happen to be the Mayor or the Police Chief and get disconnected you maintain the role upon reconnecting unless someone else gets voted in. But being mayor or police chief and switching to Cop or Civ will remove you from being that role.<br/>",
"- Impounding vehicle in Arma 2 OA Zargabad Life would teleport the vehicle to a location on the map, It no longer does that and instead deletes the vehicle from the map to be retrieved from the impound lot.<br/>",
"- No unImpounding vehicles you bought as cop when you're a civ and no unImpounding vehicle that you do NOT own.<br/>",
"- While civ cam is still in and still OP so is sat cam with a change on how you move the camera to give you more control.<br/>",
"- Disarming a civilian will not only strip them down to their uniform it will also add up the cost of all the illegal gear items they have to add to their bounty. If their uniform happens to be illegal they will lose that as well.<br/>",
"- It's easier to handle Tasks in Arma 3 so Patrol missions and Delivery missions use tasks to mark their locations.<br/>",
"- It was annoying when the bank got robbed and you lost more than what was robbed so now you can't lose more than what was stolen.<br/>",
"- The VIP/Assassination mission is now a mission like the government convoy as it will spawn after a set amount of time instead of being spawned when a player takes the mission.<br/>",
"- Taking a hostage is a little different because you need to go to an NPC thats in the hostage area and select ""Take Hostage"" at which point the hostage will be handcuffed on the spot and the civ has to defend them from the cops releasing them.<br/>",
"- There is no animation menu because it caused more problems then good such as glitching through walls<br/>",
"<br/><br/>"
];

//Jail times and tickets for the map tabs. Will get added under rules and in its own tab. ["Title","text"]
private _jailTimes =
[
"Jail Times and Tickets",
"The player is not automatically pardoned after paying a ticket so in some cases the player should be pardoned after paying a ticket. For example if they are caught with $30,000 or less of illegal items/gear and pay the ticket.<br/>
<br/>
- Speeding: $2,000 Ticket or 2 minutes if ticket can't be paid<br/>
- Operating vehicle without proper license: $2,000 Ticket and vehicle impounded or 2 minutes if ticket can't be paid and vehicle impounded<br/>
- Reckless Driver (offRoading in town, wrong lane): $5,000 ticket or 4 minutes if ticket can't be paid<br/>
- Evasion (Not pulling over within 1 minute): 3 minutes<br/>
- Murder and any other life taking crime: 5 minutes per<br/>
- Hostage Taking: 10 minutes<br/>
- Robbing the bank: Ticket amount stole and 15 minutes or 25 minutes if ticket can't be paid<br/>
- Other robberies (gas station, player): 2 minutes per<br/>
- Escaping Jail: 20 minutes<br/>
- Illegal Item/Gear: Ticket the value if less then $30,000 else 6 minutes<br/>
- Drug Dealing: Ticket value sold and 5 minutes or 10 minutes if ticket can't be paid<br/>
- Being a slaver: 3 minutes per<br/>
- Theft of Government Funds: Ticket amount stole and 7 minutes or 12 minutes if ticket can't be paid<br/>
- Attempted GTA: 1 minute per<br/>
- GTA: 2 minutes per<br/>
"
];


//Array of rules in format [["Rules category","all the rules for this category in a single string"],...]
ZKB_Rules =
[
[
"General Rules",
"Taking advantage of any bugs or glitches will result in a kick or ban.<br/>
<br/>
No trolling or being a nuisance to other players such as knocking a player out over and over, standing in front of another players vehicle to block them, or Running in front of other player driving so they run you over.<br/>
<br/>
Don't confuse Laws and Rules. Laws that are broken are punishable by jail time while Rules are punishable by an Admin's decision.<br/>
<br/>
Laws could conflict with rules and should be brought to an Admin's attention. For example: ""All weapons are illegal, Anyone seen with a weapon should be shot."".<br/>
<br/>
Civs are not allowed to enter UN Base.<br/>
<br/>
Peacekeepers are not allowed to enter Terror Hideout.<br/>
<br/>
You are not allowed to rob or kill Civs in the white civ spawn area marker UNLESS you initiate the robbery outside the area and they run in.<br/>"
],
[
"New Life Rule",
"You are NOT allowed to return to the scene of your death 5 minutes after you respawn.<br/>
<br/>
As a Civ you will only become unWanted if killed by a Peacekeeper or arrested.<br/>
<br/>
Peacekeepers are allowed to arrest you as you run out of Civ spawn ""White Area Marker"" but must wait until you are out of the Civ spawn ""White Area Marker"" before they can attempt to apprehend you.<br/>"
],
[
"DeathMatching Rules",
"Killing other players both Civ and Peacekeepers for no reason is considered Random Death Match (RDM).<br/>
<br/>
No RMDing, If you kill another player you better have a good reason for it.<br/>
<br/>
You are allowed to run over other players but you better have a good reason for it or it will be RDM.<br/>
<br/>
When robbing a player make sure you give clear warning for them to stop and time to obey your command before killing them. Don't just say ""You running down the road stop"" and then kill them 2 seconds later.<br/>
<br/>
When you can kill another player as a Civ:<br/>
- The player you are killing is in an enemy gang and visibly armed and you are in a gang.<br/>
- The player you are killing is in a Gang Area and you are in a gang.<br/>
- The player you are killing has killed or robbed one of your fellow gang members.<br/>
- The player you are killing is not listening to your demands such as stop running so you can rob them (Give them time to stop).<br/>
- The player you are killing is in a helicopter and not obeying your commands to leave the area or to land.<br/>
- The player you are killing is trying to rob you or shooting at you.<br/>
- The player you are killing is a Peacekeeper and actively pursuing you.<br/>
- The player you are killing is a Peacekeeper and they are trying to search you while you have illegal items on you.<br/>
<br/>
When you can kill another player as a Peacekeeper:<br/>
- The player you are killing is Wanted for a murder or any other crime involving killing someone.<br/>
- The player you are killing is Wanted and has a visible weapon in hand.<br/>
- The player you are killing is in a helicopter and not obeying your commands to leave the area or to land.<br/>
- The player you are killing has an illegal weapon (automatic weapons, explosives/Launchers, UN weapon).<br/>
- The player you are killing is in a vehicle that has a mounted weapon.<br/>
- The player you are killing is visibly armed in or immediately around the bank.<br/>
- The player you are killing has a weapon in hand at a gas station.<br/>
- The player you are killing is trying to rob you.<br/>
- The player you are killing is actively shooting at another player. Make sure they are shooting at a player and not hunting or testing out a weapon.<br/>"
],
[
"Civ Rules",
"You are not allowed to return to the scene of your death for 5 minutes after you respawn.<br/>"
],
[
"UN Peacekeeper Rules",
"Peacekeepers are NOT allowed to be corrupt, this includes giving or selling UN equipment/gear to Civs or the mayor.<br/>
<br/>
You are not allowed to return to the scene of your death or the last crime you were involved in for 5 minutes after you respawn.<br/>
<br/>
Peacekeepers must follow the orders given by the UN Commander.<br/>
<br/>
The UN Commander has the power to fire any officer that fails to follow their orders.<br/>
<br/>
If a Peacekeeper that was fired fails to leave or go Civ, or if the UN Commanders orders seem unreasonable then an Admin should be contacted.<br/>
<br/>
Peacekeepers are NOT allowed to use civilian weapons and gear. Peacekeepers are only allowed to use the equipment that is available to them at UN Base. However Peacekeepers are allowed to use civilian vehicles.<br/>
<br/>
Peacekeepers are ONLY allowed to random search a Civ if the Civ is seen in or leaving a gang area, terror area or the Civ was stopped at a roadblock/checkpoint. Civs can also be random searched if they are seen in or leaving a drug field or drug dealer.<br/>
<br/>
Peacekeepers are allowed to ""Camp"" all areas on the map whether it's to catch someone or to deter illegal activity.<br/>
<br/>
Peacekeepers are allowed to ""Camp"" Civ spawn and arrest wanted civilians as they run out, But remember that inside Civ spawn ""White Area Marker"" is safe from crime and being arrested so Peacekeepers need to wait for the Civ to run out.<br/>"
],
_jailTimes,
[
"Mayor and Law Rules",
"The mayor can commit crimes including breaking their own laws but is not immune and faces the same punishment as any other Civ.<br/>
<br/>
Laws could conflict with rules and should be brought to an Admin's attention. For example: ""All weapons are illegal, Anyone seen with a weapon should be shot."".<br/>
<br/>
The mayor can only make drugs legal to buy, posses, and consume.<br/>
<br/>
Illegal workers/slaves can NEVER be made legal.<br/>
"
],
[
"Gang Rules",
"By default gangs are at war.<br/>
<br/>
You are allowed to kill any enemy gang members on sight ONLY if they are visibly armed.<br/>
<br/>
As long as you are in a gang you are allowed to kill any one you see in a Gang Area whether you own the Gang Area or not.<br/>"
],
[
"Terrorism Rules",
"Terrorism is not an excuse to kill every player in sight.<br/>
<br/>
Terrorism is a coordinated bombing or an attack on a specific target or location.<br/>"
]
];

//True/False if the dynamic text along the left side of the screen should appear along with group chat messages or if just the group chat messages. The player can change this in settings
ZKB_EnableDynamicText = true;

ZKB_TerrainGridSelection = (uiNamespace getVariable ["ZKB_TerrainGridSelection",1]);
//Array of available Terrain Grids
//https://community.bistudio.com/wiki/setTerrainGrid
ZKB_TerrainGridArray = [50,25,12.5,6.25];
setTerrainGrid(ZKB_TerrainGridArray select ZKB_TerrainGridSelection);
setViewDistance (uiNamespace getVariable ["ZKB_ViewDistance",1600]);

if (side player == WEST) then
	{
	IsCop = true;
	IsCiv = false;
	}
	else
	{
	IsCop = false;
	IsCiv = true;	
	};
		
ZKB_PerformingAction = false;
SirenLock = false;
ZKB_RespawnLoadOut = getUnitLoadout (missionConfigFile >> "ZKB_Settings" >> "ZKB_CopLoadout");

ZKB_BankAccount = SETTING(getNumber,"ZKB_StartingBankAccount");
player setVariable ["BankAccount",ZKB_BankAccount,true];
player setVariable ["ZKB_Inventory",SETTING(getArray,"ZKB_StartingInventory"),true]; //Starting inventory for first time players.
player setVariable ["ZKB_MaxINVWeight",SETTING(getNumber,"ZKB_MaxINVWeight"),true];

ZKB_CopsKilled = [0,0];
player setVariable ["CopKills",ZKB_CopsKilled,true];
ZKB_CivsKilled = [0,0];
player setVariable ["CivKills",ZKB_CivsKilled,true];
ZKB_Suicides = 0; //Serving jail time or being killed by another player will reset this to 0. Yes punish the player if they kill them self but don't punish them if they get killed by another player/RDMed
player setVariable ["Suicides",ZKB_Suicides,true];
ZKB_Deaths = 0;
player setVariable ["Deaths",ZKB_Deaths,true];

ZKB_Hunger = 5;
player setVariable ["Hunger",ZKB_Hunger,true];

ZKB_ShovelDur = 20;
ZKB_PickaxeDur = 50;
ZKB_JackhammerDur = 100;

ZKB_TimeInWorkPlace = 0;
ZKB_DemeritPoints = 10; //Not used but just in case

if (iscop) then 
	{
	if (call ZKB_fnc_IsMayor) then
		{
		missionNamespace setVariable ["currentMayor","",true];
		ZKB_TaxArray = [5,5,5,5,5];
		publicVariable "ZKB_TaxArray";
		if (SETTING(getNumber,"ZKB_StatSaveEnabled") isEqualTo 1) then
			{
			["mayor",""] remoteExecCall ["ZKB_fnc_ServerSaveStats",2,false];
			["taxes",ZKB_TaxArray] remoteExecCall ["ZKB_fnc_ServerSaveStats",2,false];
			};
		};
		
	ZKB_RadioTextMsg_1 = "Put your fucking hands up!";				
	ZKB_RadioTextMsg_2 = "Pull over and stay in your vehicle!";
	ZKB_RadioTextMsg_3 = "Drop your weapon and put your hands on your head!";
	ZKB_RadioTextMsg_4 = "Your free to go, have a nice day";
	}
	else 
	{	
	if (call ZKB_fnc_IsChief) then 
		{
		missionNamespace setVariable ["currentChief","",true];
		if (SETTING(getNumber,"ZKB_StatSaveEnabled") isEqualTo 1) then
			{
			["chief",""] remoteExecCall ["ZKB_fnc_ServerSaveStats",2,false];
			};
		};
				
	ZKB_RadioTextMsg_1 = "Put your fucking hands up now!";
	ZKB_RadioTextMsg_2 = "Step away from the vehicle!";		
	ZKB_RadioTextMsg_3 = "Do it now or your dead!";						
	ZKB_RadioTextMsg_4 = "Dont shoot i give up!";
	};
			
ZKB_RadioTextBroadcast_1 = "direct";												
ZKB_RadioTextBroadcast_2 = "direct";											
ZKB_RadioTextBroadcast_3 = "direct";				
ZKB_RadioTextBroadcast_4 = "direct";

player createDiarySubject ["jailtimes",_jailTimes select 0];
player createDiaryRecord ["jailtimes", _jailTimes];
