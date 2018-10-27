/*
	File: fn_CivMarkers.sqf
	Function: ZKB_fnc_CivMarkers
	Author: ZKB1325
	Description: Displays gang member markers in the map
*/
private _markers = [];
private _members = [];

for "_i" from 0 to 1 step 0 do {
    sleep 0.5;
    if (visibleMap) then
    {
        _members = units (group player);
        {
		_marker = createMarkerLocal [format["%1_marker",_x],visiblePosition _x];
		if (_x isEqualTo player) then
			{
			_marker setMarkerColorLocal "ColorRed";
			_marker setMarkerTypeLocal "Select";
			_marker setMarkerTextLocal format["(%1) %2",_x,name _x];
			}
			else
			{
			if !(isPlayer _x) then
				{
				_marker setMarkerColorLocal "ColorCivilian";
				_marker setMarkerTypeLocal "Mil_dot";
				_marker setMarkerTextLocal format [localize "STR_Slave_Marker",[_x getVariable ["money",0]] call ZKB_fnc_FormatNumber];
				}
				else
				{
				_marker setMarkerColorLocal "ColorCivilian";
				_marker setMarkerTypeLocal "Mil_dot";
				_marker setMarkerTextLocal format["(%1) %2",_x,name _x];
				};
			};
		_markers pushBack [_marker,_x];
        }forEach _members;

        while {visibleMap} do
        {
            {
                private _unit = _x select 1;
                if (!isNil "_unit" && !isNull _unit) then {
                      (_x select 0) setMarkerPosLocal (visiblePosition _unit);
                };
            }forEach _markers;
            if (!visibleMap) exitWith {};
            sleep 0.02;
        };

        {deleteMarkerLocal (_x select 0);} forEach _markers;
        _markers = [];
        _members = [];
    };
};
