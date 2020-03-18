/*
	Author: ZKB1325
	FileName: fn_RoadBlock.sqf
	Function: ZKB_fnc_RoadBlock
	Description: Activated through addAction with map objects in the argument field of the addAction. Toggles the objects below the map (roadblock lowerd) and to their original position (roadblock raised)
	
	this addAction [localize "STR_Cop_RaiseLowerRoadblock",ZKB_fnc_RoadBlock,"",1,true,true,"","serverTime >= ((_target getVariable [""lastToggle"",0]) + 10)",7];
*/
private _controller = param [0,objNull,[objNull]];
if (isNull _controller) exitWith {};

_controller setVariable ["lastToggle",serverTime,true];

if ((_controller getVariable ["curRoadBlockObjects",[]]) isEqualTo []) then
	{
	private _objects = [];
	{
	private _object = (_x select 0) createVehicle [0,0,0];
	_object setposATL (_x select 1);
	_object setVectorDirAndUp (_x select 2);
	_objects pushBack _object;
	}forEach (_controller getVariable ["roadBlockArray",[]]);
	_controller setVariable ["curRoadBlockObjects",_objects,true];
	}
	else
	{
	{
	deleteVehicle _x;
	}forEach (_controller getVariable ["curRoadBlockObjects",[]]);
	_controller setVariable ["curRoadBlockObjects",[],true];
	};

["STR_Cop_RoadblockToggled"] call ZKB_fnc_DynamicText;