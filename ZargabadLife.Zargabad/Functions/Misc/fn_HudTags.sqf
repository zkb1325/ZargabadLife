#include "..\..\ConfigMacros.hpp"
/*
	File: fn_HudTags.sqf
	Function: ZKB_fnc_HudTags
	Author: ZKB1325
	Description: hud tags such as Enter (E), ATM (E), shopName (E), player (name player), Search (E)
*/

disableserialization;
("ZKB_HudTags_Layer" call BIS_fnc_rscLayer) cutRsc ["HudTags", "PLAIN", 1, false];
private _display = (uiNamespace getVariable "HudTags");
private _tagCtrl = _display displayCtrl 30001;
private _interactionCtrl = _display displayCtrl 30002;
private _interactionKeyText = "";

while {true} do
	{
	_tagCtrl ctrlSetText "";
	_interactionCtrl ctrlSetText "";
	_interactionKeyText = (((["Zargabad Life","Interaction_Key"] call CBA_fnc_getKeybind) select 5) call CBA_fnc_localizeKey);
	
	waitUntil {!([player] call ZKB_fnc_IsRestrained) and !([player] call ZKB_fnc_IsSurrending) and (missionNamespace getVariable ["keysEnabled",true])};
	
	if ((vehicle player == player) and ((locked cursorObject) == 0) and (!isNil {cursorObject getVariable "plate"}) and (player distance cursorObject < 5)) then
		{
		_interactionCtrl ctrlSetStructuredText parseText format [localize "STR_Hud_Enter",_interactionKeyText];
		_interactionCtrl ctrlSetTextColor [0,1,0,1];
		};
		
	if (((str cursorObject)in SETTING(getArray,"ZKB_ATMArray")) and (player distance cursorObject < 8)) then
		{
		_interactionCtrl ctrlSetStructuredText parseText format [localize "STR_Hud_ATM",_interactionKeyText];
		_interactionCtrl ctrlSetTextColor [0,1,0,1];
		};
		
	if ((count (cursorObject getVariable ["ShopData",[]]) > 0) and (player distance cursorObject < 5)) then
		{
		if ((str cursorObject) in SETTING(getArray,"ZKB_GangAreas")) exitWith {};
		if (cursorObject in [CocaineShop,MarijuanaShop,LSDShop,HeroinShop] and IsCop)then
			{
			_interactionCtrl ctrlSetStructuredText parseText format [localize "STR_Hud_Search",_interactionKeyText];
			_interactionCtrl ctrlSetTextColor [0,0,1,1];
			}
			else
			{
			_interactionCtrl ctrlSetStructuredText parseText format [localize "STR_Hud_Shop",(if (isLocalized ((cursorObject getVariable "ShopData") select 1)) then {localize ((cursorObject getVariable "ShopData") select 1)}else{((cursorObject getVariable "ShopData") select 1)}),_interactionKeyText];
			_interactionCtrl ctrlSetTextColor [1,1,1,1];
			};
		};
		
	if ((isPlayer cursorObject) and (alive cursorObject) and (player distance cursorObject < 3)) then
		{
		_tagCtrl ctrlSetStructuredText parseText (name cursorObject);
		if (side cursorObject isEqualTo west) then
			{
			_tagCtrl ctrlSetTextColor [0,0,1,1];
			
			if (IsCiv) then
				{
				_interactionCtrl ctrlSetStructuredText parseText format [localize "STR_Hud_Interact",_interactionKeyText];
				_interactionCtrl ctrlSetTextColor [1,0,0,1];
				};
			}
			else
			{
			if (IsCop) then
				{
				_interactionCtrl ctrlSetStructuredText parseText format [localize "STR_Hud_Search",_interactionKeyText];
				_interactionCtrl ctrlSetTextColor [0,0,1,1];
				};
				
			if (IsCiv) then
				{
				_interactionCtrl ctrlSetStructuredText parseText format [localize "STR_Hud_Interact",_interactionKeyText];
				_interactionCtrl ctrlSetTextColor [1,0,0,1];
				};
				
			if ([cursorObject] call ZKB_fnc_IsWanted) then
				{
				_tagCtrl ctrlSetTextColor [1,0,0,1];
				}
				else
				{
				_tagCtrl ctrlSetTextColor [1,1,0,1];
				};
			};
		};

	sleep 0.1;

	};
