/*
	Author: ZKB1325
	FileName: fn_SubtractDate.sqf
	Function: ZKB_fnc_SubtractDate
*/
private _targetDate = param [0,[],[]];
private _startDate = param [1,[],[]];

//Figure out the days
private _targetDateDays = if ((_targetDate select 1) in [1,2]) then
	{
	floor (365*(_targetDate select 0) + (_targetDate select 0)/4 - (_targetDate select 0)/100 + (_targetDate select 0)/400 + (_targetDate select 2) + (153*((_targetDate select 1) + ([12,13] select ((_targetDate select 0)-1)))+8)/5)
	}
	else
	{
	floor (365*(_targetDate select 0) + (_targetDate select 0)/4 - (_targetDate select 0)/100 + (_targetDate select 0)/400 + (_targetDate select 2) + (153*(_targetDate select 1)+8)/5)
	};
	
private _startDateDays = if ((_startDate select 1) in [1,2]) then
	{
	floor (365*(_startDate select 0) + (_startDate select 0)/4 - (_startDate select 0)/100 + (_startDate select 0)/400 + (_startDate select 2) + (153*((_startDate select 1) + ([12,13] select ((_startDate select 0)-1)))+8)/5)
	}
	else
	{
	floor (365*(_startDate select 0) + (_startDate select 0)/4 - (_startDate select 0)/100 + (_startDate select 0)/400 + (_startDate select 2) + (153*(_startDate select 1)+8)/5)
	};
	
private _daysDifferent = _targetDateDays - _startDateDays;

//Figure out hours and minutes
private _targetDateHour = _targetDate select 3;
private _startDateHour = _startDate select 3;

private _targetDateMinute = _targetDate select 4;
private _startDateMinute = _startDate select 4;

private _minutesLeft = _targetDateMinute - _startDateMinute;

if (_minutesLeft < 0) then
	{
	_targetDateHour = _targetDateHour - 1;
	_minutesLeft = _minutesLeft + 60;
	};

private _hoursLeft = _targetDateHour - _startDateHour;
if (_hoursLeft < 0) then
	{
	_hoursLeft = _hoursLeft + 24;
	_daysDifferent = _daysDifferent - 1;
	};

//Breakdown the days into years, months, days
//Turn days into years
private _years = 0;
private _startYear = (_startDate select 0);
while {(((_startYear call BIS_fnc_isLeapYear) and (_daysDifferent > 366)) or (!(_startYear call BIS_fnc_isLeapYear) and (_daysDifferent > 365)))} do
	{
	_years = _years + 1;
	if (_startYear call BIS_fnc_isLeapYear) then {_daysDifferent = _daysDifferent - 366;}else{_daysDifferent = _daysDifferent - 365;};
	_startYear = _startYear + 1;
	};
	
//Turn days into months
private _months = 0;
private _startMonth = (_startDate select 1);
private _startMonthYear = (_startDate select 0);
while {_daysDifferent > [_startMonthYear,_startMonth] call BIS_fnc_monthDays} do
	{
	_months = _months + 1;
	_startMonth = _startMonth + 1;
	if (_startMonth > 12) then {_startMonth = 1; _startMonthYear = _startMonthYear + 1};
	_daysDifferent = _daysDifferent - ([_startMonthYear,_startMonth] call BIS_fnc_monthDays);
	};
	
//Put it into date array and return
[_years,_months,_daysDifferent,_hoursLeft,_minutesLeft]
	
	
	
	
	
	
	