/*
	Author: ZKB1325
	File: fn_PoliceSiren.sqf
	Function: ZKB_fnc_PoliceSiren
	Description: Handles toggling police sirens when ever a cops turns them on or off. Functions gets remote executed to all clients and each individual client handles the sirens locally.
	Majority of the code was referenced from an old zargabad life mission
	
	0: Bool
		True/False to toggle the siren for set vehicle
	1: Object
		The vehicle to play the lights and sirens off of
*/
private ["_activate","_veh","_shortDur","_longDur"];
_activate = param [0,false,[false]];
_veh = param [1,ObjNull,[ObjNull]];

if (isNull _veh) exitWith {};

if (_activate) then
	{
	_veh setVariable ["SirenOn",true,true];
	//Handle Sirens	
	[_veh] spawn 
		{
		params ["_veh"];
		_shortDur     = 0.9; //default 0.72
		_longDur      = 4.75;
		_sleeptime = 0;
		while {alive _veh} do	
			{
			if !(_veh getVariable ["SirenOn",false]) exitWith {};
			if (player distance _veh < 500) then
				{
				if (speed _veh > 5) then
					{
					if (speed _veh > 40) then
						{

						_veh say3D ["Siren_Long",1000];
						//sleep _longDur;
						_sleeptime = time + _longDur;
						} 
						else 
						{
						_veh say3D ["Siren_Short",800];
						//sleep _shortDur;
						_sleeptime = time + _shortDur;
						};
					WaitUntil {(time >= _sleeptime) or !(_veh getVariable ["SirenOn",false])};
					};
			
				};
			if !(_veh getVariable ["SirenOn",false]) exitWith {};
			};
		};

	//Handle lights
	[_veh] spawn
		{
		params ["_veh"];
		
		_sleeptime = 0;
		
		_lightb = "#lightpoint" createVehicleLocal (getpos _veh);
		_lightb setLightBrightness 0;
		_lightb setLightColor [0, 0, 1];
		_lightb setLightAmbient [0, 0, 0.5];
		_lightb setLightDayLight true;

		_lightr = "#lightpoint" createVehicleLocal (getpos _veh);
		_lightr setLightBrightness 0;
		_lightr setLightColor [1, 0, 0];
		_lightr setLightAmbient [0.5, 0, 0];
		_lightr setLightDayLight true;
		
		_lightb lightAttachObject [_veh, [0,0,0]];
		_lightr lightAttachObject [_veh, [0,0,0]];
		
		while {alive _veh} do	
			{
			if !(_veh getVariable ["SirenOn",false]) exitWith {};
			if (sunOrMoon < 1) then
				{
				_lightb setLightBrightness 1; //night
				}
				else
				{
				_lightb setLightBrightness 6; //day	
				};
			_lightr setLightBrightness 0;

			_sleeptime = time + 1;
			WaitUntil {(time >= _sleeptime) or !(_veh getVariable ["SirenOn",false])};
			
			if (sunOrMoon < 1) then
				{
				_lightr setLightBrightness 1; //night
				}
				else
				{
				_lightr setLightBrightness 6; //day	
				};
			_lightb setLightBrightness 0;
			
			_sleeptime = time + 1;
			WaitUntil {(time >= _sleeptime) or !(_veh getVariable ["SirenOn",false])};
			
			if !(_veh getVariable ["SirenOn",false]) exitWith {};
			};
			deleteVehicle _lightb;
			deleteVehicle _lightr;
		};
	}
	else
	{
	_veh setVariable ["SirenOn",false,true];	
	};

