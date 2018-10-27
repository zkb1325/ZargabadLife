/*
	Author: ZKB1325
	FileName: fn_RoadBlock.sqf
	Function: ZKB_fnc_RoadBlock
	Description: Activated through addAction with map objects in the argument field of the addAction. Toggles the objects below the map (roadblock lowerd) and to their original position (roadblock raised)
	
	this addAction [localize "STR_Cop_RaiseLowerRoadblock",ZKB_fnc_RoadBlock,[object],1,true,true,"","",7];
*/
private _actionObject = param [0,objNull,[objNull]];
if (isNull _actionObject) exitWith {};
private _objects = param [3,[],[[]]];

{
if !(isNil {_x getVariable "rbStartPos"}) then
	{
	if (((getPosATL _x) select 2) < -500) then
		{
		_x setPosATL (_x getVariable "rbStartPos");
		}
		else
		{
		_x setPosATL [(getposATL _x) select 0,(getposATL _x) select 1,-1000];
		};
	};
}forEach _objects;

["STR_Cop_RoadblockToggled"] call ZKB_fnc_DynamicText;