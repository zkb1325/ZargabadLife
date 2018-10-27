/*
	File: fn_GetPlayerGear.sqf
	Function: ZKB_fnc_GetPlayerGear
	Author: ZKB1325
	Description: Gets a players gear depending on parameters and returns array of strings.
	
	0: Object
		unit to get the gear of
	1: Array
		Array of numbers for given types of gear to return. Default: 0
		Example: [2,3,4] will return items in uniform, vest, and backpack.
		0 All
		1 Uniform,Vest,Backpack,Primary,Secondary,Handgun along with attachments + Map,compass, ect
		2 Items in uniform
		3 Items in vest
		4 Items in backpack
*/

private ["_unit","_type","_gear","_uniform","_vest","_backpack","_goggles","_headgear","_currentgear"];
_unit = param [0,player];
_type = param [1,[0],[[]]];

_gear = [];

{
switch (_x) do
{
	case 0:
		{
		_uniform = uniform _unit;
		if !(_uniform == "") then
			{
			_gear pushBack _uniform;
			};
		_vest = vest _unit;
		if !(_vest == "") then
			{
			_gear pushBack _vest;
			};
		_backpack = backpack _unit;
		if !(_backpack == "") then
			{
			_gear pushBack _backpack;
			};
		_goggles = goggles _unit;
		if !(_goggles == "") then
			{
			_gear pushBack _goggles;
			};
		
		_headgear = headgear _unit;
		if !(_headgear == "") then
			{
			_gear pushBack _headgear;
			};
		{
		_gear pushBack _x;
		}forEach (assignedItems _unit);
		{
		_gear pushBack _x;
		}forEach (uniformItems _unit);
		{
		_gear pushBack _x;
		}forEach (vestItems _unit);
		{
		_gear pushBack _x;
		}forEach (backpackItems _unit);
		_currentgear = ([_unit] call ZKB_fnc_GetWeaponsAndItems);
		{
			{
			if !(_x == "") then
				{
				_gear pushBack _x;	
				};
			}forEach _x;
		}forEach _currentgear;
		};
	case 1:
		{
		_uniform = uniform _unit;
		if !(_uniform == "") then
			{
			_gear pushBack _uniform;
			};
		_vest = vest _unit;
		if !(_vest == "") then
			{
			_gear pushBack _vest;
			};
		_backpack = backpack _unit;
		if !(_backpack == "") then
			{
			_gear pushBack _backpack;
			};
		_goggles = goggles _unit;
		if !(_goggles == "") then
			{
			_gear pushBack _goggles;
			};
		
		_headgear = headgear _unit;
		if !(_headgear == "") then
			{
			_gear pushBack _headgear;
			};
		{
		_gear pushBack _x;
		}forEach (assignedItems _unit);
		_currentgear = ([_unit] call ZKB_fnc_GetWeaponsAndItems);
		{
			{
			if !(_x == "") then
				{
				_gear pushBack _x;	
				};
			}forEach _x;
		}forEach _currentgear;
		};
	case 2:
		{
		{
		_gear pushBack _x;
		}forEach (uniformItems _unit);
		};
	case 3:
		{
		{
		_gear pushBack _x;
		}forEach (vestItems _unit);
		};
	case 4:
		{
		{
		_gear pushBack _x;
		}forEach (backpackItems _unit);
		};
		
	default {_gear = [];};
};
}forEach _type;

_gear;




