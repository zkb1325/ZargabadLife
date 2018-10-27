/*
	Author: ZKB1325
	FileName: fn_InitCBAKeyBinds.sqf
	Function: ZKB_fnc_InitCBAKeyBinds
	
	Description: Init to set up CBA key binds
	https://community.bistudio.com/wiki/DIK_KeyCodes
*/

["Zargabad Life","OpenWelcomeMenu_Key", localize "STR_CBA_OpenWelcomeMenu", ZKB_fnc_OpenWelcomeMenu, "", [0x3B,[false,false,false]]] call CBA_fnc_addKeybind;
["Zargabad Life","VolumeDown_Key", localize "STR_CBA_VolumeDown", {0 fadeSound ((soundVolume - .1) max 0); titleText [format [localize "STR_CBA_VolumeAt",((soundVolume/1)*100),"%"],"PLAIN DOWN"];}, "", [0x3C,[false,false,false]]] call CBA_fnc_addKeybind;
["Zargabad Life","VolumeUp_Key", localize "STR_CBA_VolumeUp", {0 fadeSound ((soundVolume + .1) min 1); titleText [format [localize "STR_CBA_VolumeAt",((soundVolume/1)*100),"%"],"PLAIN DOWN"];}, "", [0x3D,[false,false,false]]] call CBA_fnc_addKeybind;

["Zargabad Life","EnableKeys_Key", localize "STR_CBA_EnableKeys", "", {if (missionNamespace getVariable ["keysEnabled",true]) then
			{
			missionNamespace setVariable ["keysEnabled",false];
			titleText [format [localize "STR_Common_KeysEnabled",localize "STR_Common_No"],"PLAIN DOWN"];
			}
			else
			{
			missionNamespace setVariable ["keysEnabled",true];
			titleText [format [localize "STR_Common_KeysEnabled",localize "STR_Common_Yes"],"PLAIN DOWN"];
			};}, [0x0F,[false,false,false]]] call CBA_fnc_addKeybind;
			
["Zargabad Life","OpenInfoMenu_Key", localize "STR_CBA_OpenInfoMenu", ZKB_fnc_KeyBindOpenInfoMenu, "", [0x02,[false,false,false]]] call CBA_fnc_addKeybind;
["Zargabad Life","OpenInventory_Key", localize "STR_CBA_OpenInventory", ZKB_fnc_KeyBindOpenInventory, "", [0x03,[false,false,false]]] call CBA_fnc_addKeybind;
["Zargabad Life","HandsUp_Key", localize "STR_CBA_HandsUp", ZKB_fnc_KeyBindHandsUp, "", [0x04,[false,false,false]]] call CBA_fnc_addKeybind;
["Zargabad Life","HandsDown_Key", localize "STR_CBA_HandsDown", ZKB_fnc_KeyBindHandsDown, "", [0x05,[false,false,false]]] call CBA_fnc_addKeybind;
["Zargabad Life","OpenGangMenu_Key", localize "STR_CBA_OpenGangMenu", ZKB_fnc_KeyBindOpenGangMenu, "", [0x06,[false,false,false]]] call CBA_fnc_addKeybind;
["Zargabad Life","Interaction_Key", localize "STR_CBA_Interaction", ZKB_fnc_KeyBindInteractionKey, "", [0x12,[false,false,false]]] call CBA_fnc_addKeybind;
["Zargabad Life","OpenTrunk_Key", localize "STR_CBA_OpenTrunk", ZKB_fnc_KeyBindOpenTrunk, "", [0x14,[false,false,false]]] call CBA_fnc_addKeybind;
["Zargabad Life","KnockOut_Key", localize "STR_CBA_KnockOut", ZKB_fnc_KeyBindKnockOut, "", [0x21,[true,false,false]]] call CBA_fnc_addKeybind;
["Zargabad Life","SirenToggle_Key", localize "STR_CBA_ToggleSiren", ZKB_fnc_KeyBindSirenOnOff, "", [0x21,[false,false,false]]] call CBA_fnc_addKeybind;
["Zargabad Life","HolsterWeapon_Key", localize "STR_CBA_HolsterWeapon", ZKB_fnc_KeyBindHolsterWeapon, "", [0x23,[true,false,false]]] call CBA_fnc_addKeybind;
["Zargabad Life","VehicleLock_Key", localize "STR_CBA_VehicleLock", ZKB_fnc_KeyBindVehicleLock, "", [0x26,[false,false,false]]] call CBA_fnc_addKeybind;
["Zargabad Life","PoliceComputer_Key", localize "STR_CBA_PoliceComputer", ZKB_fnc_KeyBindPoliceComputer, "", [0x29,[false,false,false]]] call CBA_fnc_addKeybind;

//Use Item Keybinds
{
["Zargabad Life",format["Use_%1_Key",_x], [format [localize "STR_CBA_UseBindName",[_x] call ZKB_fnc_GetItemName], format [localize "STR_CBA_BindToolTip",[_x] call ZKB_fnc_GetItemName,[_x] call ZKB_fnc_GetItemDesc]], "", compile format ["[[""%1"",[""%1""] call ZKB_fnc_GetInvItemAmount],1] call ZKB_fnc_UseItem; (missionNamespace getVariable [""keysEnabled"",true]);",_x]] call CBA_fnc_addKeybind;
}forEach [
"KeyChain",
"Phone",
"MedKit",
"RepairKit",
"Lighter",
"LockPick",
"RefuelCan",
"SyphonFuelKit",
"OilBarrel",
"WeaponBag",
"ItemBag",
"DefuseKit",
"SpikeStrip",
"FishingPole",
"Shovel",
"PickAxe",
"JackHammer",
"VehicleAmmo",
"SuicideBomb",
"BombRemote",
"Goat",
"Rabbit",
"StrangeMeat",
"Donut",
"Trout",
"Perch",
"Walleye",
"Bass",
"Bread",
"Cocaine",
"Marijuana",
"LSD",
"Heroin",
"M2StaticMG"
];