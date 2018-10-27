/*
	Author: ZKB1325
	FileName: fn_OpenBank.sqf
	Function: ZKB_fnc_OpenBank
	Description: Opens Bank/ATM screen
	
	this addAction[localize "STR_Bank_Bank",ZKB_fnc_OpenBank,"",0,false,false,"",'true',8];
*/
if ((["BlueInk"] call ZKB_fnc_GetInvItemAmount) > 0) exitWith
	{
	["STR_Bank_BankRobbedNoATM"] call ZKB_fnc_DynamicText;
	};
	
disableSerialization;
createDialog "ZKB_Bank";
private _display = uiNamespace getVariable "ZKB_Bank";
private _playerListCtrl = _display displayCtrl 13030;
private _taxInfoCtrl = _display displayCtrl 13045;
private _invMoneyCtrl = _display displayCtrl 13060;
private _bankMoneyCtrl = _display displayCtrl 13070;

{
_index = _playerListCtrl lbAdd (name _x);
_playerListCtrl lbSetData [_index, getPlayerUID _x];
}forEach playableUnits;
lbSort _playerListCtrl;

for "_i" from 0 to ((lbSize _playerListCtrl) - 1) do
	{
	if (getPlayerUID player isEqualTo (_playerListCtrl lbData _i)) exitWith {_playerListCtrl lbSetCurSel _i;};
	};

while {!isNull _display} do
	{
	_bankMoneyCtrl ctrlSetStructuredText parseText format [localize "STR_Bank_BankMoney",[ZKB_BankAccount] call ZKB_fnc_FormatNumber];
	_invMoneyCtrl ctrlSetStructuredText parseText format [localize "STR_Bank_InvMoney",[["Money"] call ZKB_fnc_GetInvItemAmount] call ZKB_fnc_FormatNumber];
	
	if !((_playerListCtrl lbData (lbCurSel _playerListCtrl) isEqualTo getPlayerUID player)) then
		{
		_taxInfoCtrl ctrlSetStructuredText parseText format [localize "STR_Bank_TransferTaxInfo",(ZKB_TaxArray select 4),"%",[((floor (abs (parseNumber (ctrlText (_display displayCtrl 13040)))) * ((ZKB_TaxArray select 4)/100)))] call ZKB_fnc_FormatNumber];
		}
		else
		{
		_taxInfoCtrl ctrlSetText "";
		};
	};