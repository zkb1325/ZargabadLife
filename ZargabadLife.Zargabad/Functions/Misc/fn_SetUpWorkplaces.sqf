#include "..\..\ConfigMacros.hpp"
/*
	Author: ZKB1325
	File: fn_SetUpWorkplaces.sqf
	Function: ZKB_fnc_SetUpWorkplaces
	Description: Goes through the array of workplace markers and set them up
*/

{
private _workPlaceStr = (_x select 0);
if !(IsCop) then
	{
	private _workplaceTrigger = createTrigger ["EmptyDetector", getMarkerPos _workPlaceStr, false];
	_workplaceTrigger setTriggerArea [((markerSize _workPlaceStr) select 0),((markerSize _workPlaceStr) select 1),markerDir _workPlaceStr,(markerType _workPlaceStr) isEqualTo "RECTANGLE"];
	_workplaceTrigger setTriggerActivation ["CIV", "PRESENT", true];
	_workplaceTrigger setTriggerStatements ["((vehicle player) in thisList) and (isNull objectParent player)", "[thisTrigger] spawn ZKB_fnc_InWorkPlaceLoop;", ""];
	};

private _marker = createMarkerLocal [format ["%1_Text",_workPlaceStr], getMarkerPos _workPlaceStr];
_marker setMarkerShapeLocal "ICON";
_marker setMarkerColorLocal "ColorYellow";
_marker setMarkerTypeLocal "mil_join";
_marker setMarkerTextLocal format [localize "STR_Markers_WorkPlace",_forEachIndex+1];
}forEach SETTING(getArray,"ZKB_WorkPlaces");