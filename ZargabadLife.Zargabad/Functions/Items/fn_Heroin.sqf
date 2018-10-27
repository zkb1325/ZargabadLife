/*

	Author: ZKB1325
	File: fn_Heroin.sqf
	Function: ZKB_fnc_Heroin
	Description: Effect the happens when the player uses Heroin
	
*/
private _item = param [1,""];
[_item, 1] call ZKB_fnc_InvRemoveItem;

if ((player getVariable ["heroinInSystem",0]) > 0) exitWith
	{
	player setVariable ["heroinInSystem",(player getVariable ["heroinInSystem",0])+1];
	["STR_ItemMisc_TakenMoreDrugs"] call ZKB_fnc_DynamicText;
	};
player setVariable ["heroinInSystem",(player getVariable ["heroinInSystem",0])+1];	
private _effectDuration = 180;
private _effectTime = serverTime;

private _filmHndl = ppEffectCreate ["FilmGrain", 2050]; 
_filmHndl ppEffectEnable true; 
_colorHndl = ppEffectCreate ["ColorInversion", 2500];
_colorHndl ppEffectEnable true; 
	
while {(_effectTime + (_effectDuration*(player getVariable ["heroinInSystem",0]))) > serverTime} do  
	{
	if !(alive player) exitWith {};
	
	if ((player getVariable ["heroinInSystem",0]) > 4) then
		{
		_filmHndl ppEffectAdjust [1, 1, 4, 1, 1, 0]; 
		}
		else
		{
		_filmHndl ppEffectAdjust [0.005, 1.25, 2.01, 0.75, 1.0,0];
		}; 
	_filmHndl ppEffectCommit 0;
	_colorHndl ppEffectAdjust [random 1,random 1,random 1];
	_colorHndl ppEffectCommit (5/(player getVariable ["heroinInSystem",1]));
	waitUntil {ppEffectCommitted _colorHndl};
	};
	
player setVariable ["heroinInSystem",0];
["STR_ItemMisc_DrugEffectDiminish"] call ZKB_fnc_DynamicText;

ppEffectDestroy _filmHndl;
ppEffectDestroy _colorHndl;