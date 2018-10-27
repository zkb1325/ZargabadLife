/*
	Author: ZKB1325
	FileName: fn_OpenFactoryManufacture.sqf
	Function: ZKB_fnc_OpenFactoryManufacture
	Description: Handles filling the dialog for the factory storage
*/
private ["_facarray","_facitems","_workers","_manitime","_display","_facitemlist","_index"];
disableserialization;
createDialog "ZKB_Factory";
ZKB_OpenFactory = _this select 0;

_facarray = ZKB_OpenFactory getVariable "FactoryInfo";
_facitems = _facarray select 5;
_workers = missionNameSpace getVariable [(_facarray select 6)+"Workers", 0];

_display = uiNameSpace getVariable "ZKB_Factory";

private _frame = _display displayCtrl 4005;
_frame ctrlSetText (_facarray select 1);

_facitemlist = _display displayCtrl 4010;
_facproduction = _display displayCtrl 4020;

{
if (_workers <= 0) then
	{
	_manitime = localize "STR_Fac_NoWorkers";	
	}
	else
	{
	_manitime = round(((([_x] call ZKB_fnc_GetItemBuyPrice)*.02)/_workers)/1.5) max 5;	
	};
_index = _facitemlist lbAdd (([_x] call ZKB_fnc_GetItemName) + " - " + (if (_workers <= 0) then {_manitime}else{([_manitime, "MM:SS"] call BIS_Fnc_secondsToString)}));	
_facitemlist lbSetData [_index, _x];
}forEach _facitems;


[] spawn
	{
	private ["_facarray","_manuqueue","_display","_facitemlist","_facproduction","_selecteditem","_curramount","_pending"];
	
	disableserialization;
	
	_facarray = ZKB_OpenFactory getVariable "FactoryInfo";
	
	_display = uiNameSpace getVariable "ZKB_Factory";
	_facitemlist = _display displayCtrl 4010;
	_facproduction = _display displayCtrl 4020;
	private _facItemInfo = _display displayCtrl 4030;
	private _iteminfotext = "";
	private _neededFacItems = [];
	
	while {!isNull _display} do
		{
		lbClear _facproduction;
		_selecteditem = _facitemlist lbData (lbCurSel _facitemlist);
		_manuqueue = missionNameSpace getVariable [(_facarray select 6)+"Queue",[]];
		private _facstoragecompleted = missionNameSpace getVariable [(_facarray select 6)+"StorageCompleted",[]];
		
		if !(_selecteditem isEqualTo "") then
			{
			_curramount = 0;
			{
			if (_selecteditem isEqualTo (_x select 0)) exitWith 
				{
				_curramount = (_x select 1);
				};
			}forEach _facstoragecompleted;
			
			_facproduction lbAdd format [localize "STR_Fac_Available", ([_selecteditem] call ZKB_fnc_GetItemName), ([_curramount] call ZKB_fnc_FormatNumber)];
		
			_pending = 0;
			{
			if (_selecteditem isEqualTo (_x select 0)) then 
				{
				_pending = _pending + 1;
				};
			}forEach _manuqueue;
			
			_facproduction lbAdd format [localize "STR_Fac_Pending", ([_selecteditem] call ZKB_fnc_GetItemName), ([_pending] call ZKB_fnc_FormatNumber)];
			
			_iteminfotext = "";
			_iteminfotext = _iteminfotext + (localize "STR_MainMenu_NeededFactoryItems" + "<br/>");
			_neededFacItems = [_selecteditem] call ZKB_fnc_GetItemNeedFactoryItems;
			if (_neededFacItems isEqualTo []) then
				{
				_iteminfotext = _iteminfotext + (localize "STR_Common_None");
				}
				else
				{
				private _facstorage = missionNameSpace getVariable [(_facarray select 6)+"Storage", []];
				{
				_reqitem = (_x select 0);
				_reqitemamount = (_x select 1);
				_amountInStorage = 0;
				{
				if ((_x select 0) isEqualTo _reqitem) then
					{
					_amountInStorage = (_x select 1);
					};
				}forEach _facstorage;
				_iteminfotext = _iteminfotext + format ["%1: (%2) - %3<br/>",[_reqitem] call ZKB_fnc_GetItemName,[_reqitemamount] call ZKB_fnc_FormatNumber,format [localize "STR_Fac_AvailableStorage",[_amountInStorage] call ZKB_fnc_FormatNumber]];	
				}forEach _neededFacItems;
				};
			_facItemInfo ctrlSetStructuredText parseText _iteminfotext;

			_facItemInfo ctrlSetPosition [(ctrlPosition _facItemInfo) select 0, (ctrlPosition _facItemInfo) select 1, (ctrlPosition _facItemInfo) select 2, ctrlTextHeight _facItemInfo];
			_facItemInfo ctrlCommit 0;
			};
		
		_facproduction lbAdd format [localize "STR_Fac_TotalPending", ([count _manuqueue] call ZKB_fnc_FormatNumber)];
		
		if (count _manuqueue > 0) then
			{
			_facproduction lbAdd format [localize "STR_Fac_InProduction", ([((_manuqueue select 0) select 0)] call ZKB_fnc_GetItemName)];
			_manutimereamianing = ZKB_OpenFactory getVariable ["TimeRemaining", 0];	
			_facproduction lbAdd format [localize "STR_Fac_ETA", ([round _manutimereamianing,"MM:SS"] call BIS_fnc_secondsToString)];
			}
			else
			{
			_facproduction lbAdd format [localize "STR_Fac_InProduction", localize "STR_Common_Nothing"];
			_facproduction lbAdd format [localize "STR_Fac_ETA", "00:00"];
			};
			
		
		sleep .1;
		};
	};