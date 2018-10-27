/*
	Author: ZKB1325
	File: fn_Food.sqf
	Function: ZKB_fnc_Food
	Description: Runs when ever a player eats also runs when player joins the server to start hunger loop
*/
private ["_action","_item","_amount"];
_action = _this select 0;

if (_action == "Use") exitWith
	{
	_item = _this select 1;
	_invamount = _this select 2;
	_amount = _this select 3;
	
	[_item, _amount] call ZKB_fnc_InvRemoveItem;
	
	switch _item do
		{
		case "Goat": {ZKB_Hunger = ZKB_Hunger - (20*_amount);};	
		case "Rabbit": {ZKB_Hunger = ZKB_Hunger - (12*_amount);};	
		case "StrangeMeat": {ZKB_Hunger = ZKB_Hunger - (16*_amount);};	
		case "Donut": {ZKB_Hunger = ZKB_Hunger - (10*_amount);};	
		case "Trout": {ZKB_Hunger = ZKB_Hunger - (5*_amount);};	
		case "Perch": {ZKB_Hunger = ZKB_Hunger - (10*_amount);};	
		case "Walleye": {ZKB_Hunger = ZKB_Hunger - (7*_amount);};	
		case "Bass": {ZKB_Hunger = ZKB_Hunger - (25*_amount);};	
		case "Bread": {ZKB_Hunger = ZKB_Hunger - (5*_amount);};	
		};
		
	if (ZKB_Hunger < 0) then
		{
		ZKB_Hunger = 0;	
		};
	["STR_ItemMisc_JustAte", [[_item] call ZKB_fnc_GetItemName, ZKB_Hunger]] call ZKB_fnc_DynamicText;
	};

if (_action == "HungerLoop") exitWith
	{
	while {true} do
		{
		sleep 35;
		ZKB_Hunger = ZKB_Hunger + 1;
		
		if (ZKB_Hunger >= 95) then
			{
			["STR_ItemMisc_Starving"] call ZKB_fnc_DynamicText;	
			player groupchat localize "STR_ItemMisc_Starving";
			};
			
		if (ZKB_Hunger >= 100) then
			{
			player setDamage 1;
			};
		};
	};