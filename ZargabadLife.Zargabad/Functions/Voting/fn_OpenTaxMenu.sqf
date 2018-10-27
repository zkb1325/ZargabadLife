/*
	Author: ZKB1325
	FileName: fn_OpenTaxMenu.sqf
	Function: ZKB_fnc_OpenTaxMenu
	Description: Opens the mayors tax menu
	[Item Tax, Vehicle Tax, Magazine Tax, Weapon Tax, Bank Transfer Tax]
	
	this addAction [localize "STR_Tax_TaxMenu",ZKB_fnc_OpenTaxMenu,"",0,true,true,"","call ZKB_fnc_IsMayor",8];
*/
disableSerialization;
createDialog "ZKB_TaxMenu";
private _display = uiNamespace getVariable "ZKB_TaxMenu";
private _itemTaxTextCtrl = _display displayCtrl 23010;
private _itemTaxSliderCtrl = _display displayCtrl 23020;
private _vehicleTaxTextCtrl = _display displayCtrl 23030;
private _vehicleTaxSliderCtrl = _display displayCtrl 23040;
private _magazineTaxTextCtrl = _display displayCtrl 23050;
private _magazineTaxSliderCtrl = _display displayCtrl 23060;
private _weaponTaxTextCtrl = _display displayCtrl 23070;
private _weaponTaxSliderCtrl = _display displayCtrl 23080;
private _transferTaxTextCtrl = _display displayCtrl 23090;
private _transferTaxSliderCtrl = _display displayCtrl 23100;

_itemTaxTextCtrl ctrlSetStructuredText parseText format [localize "STR_Tax_ItemTax",ZKB_TaxArray select 0,"%"];
_vehicleTaxTextCtrl ctrlSetStructuredText parseText format [localize "STR_Tax_VehicleTax",ZKB_TaxArray select 1,"%"];
_magazineTaxTextCtrl ctrlSetStructuredText parseText format [localize "STR_Tax_MagazineTax",ZKB_TaxArray select 2,"%"];
_weaponTaxTextCtrl ctrlSetStructuredText parseText format [localize "STR_Tax_WeaponTax",ZKB_TaxArray select 3,"%"];
_transferTaxTextCtrl ctrlSetStructuredText parseText format [localize "STR_Tax_TransferTax",ZKB_TaxArray select 4,"%"];

_itemTaxSliderCtrl sliderSetSpeed [1, 5];
_itemTaxSliderCtrl sliderSetRange [0, 30];
_itemTaxSliderCtrl sliderSetPosition (ZKB_TaxArray select 0);

_vehicleTaxSliderCtrl sliderSetSpeed [1, 5];
_vehicleTaxSliderCtrl sliderSetRange [0, 30];
_vehicleTaxSliderCtrl sliderSetPosition (ZKB_TaxArray select 1);

_magazineTaxSliderCtrl sliderSetSpeed [1, 5];
_magazineTaxSliderCtrl sliderSetRange [0, 30];
_magazineTaxSliderCtrl sliderSetPosition (ZKB_TaxArray select 2);

_weaponTaxSliderCtrl sliderSetSpeed [1, 5];
_weaponTaxSliderCtrl sliderSetRange [0, 30];
_weaponTaxSliderCtrl sliderSetPosition (ZKB_TaxArray select 3);

_transferTaxSliderCtrl sliderSetSpeed [1, 5];
_transferTaxSliderCtrl sliderSetRange [0, 30];
_transferTaxSliderCtrl sliderSetPosition (ZKB_TaxArray select 4);

while {!isNull _display} do
	{
	_itemTaxTextCtrl ctrlSetStructuredText parseText format [localize "STR_Tax_ItemTax",round (sliderPosition _itemTaxSliderCtrl),"%"];
	_vehicleTaxTextCtrl ctrlSetStructuredText parseText format [localize "STR_Tax_VehicleTax",round (sliderPosition _vehicleTaxSliderCtrl),"%"];
	_magazineTaxTextCtrl ctrlSetStructuredText parseText format [localize "STR_Tax_MagazineTax",round (sliderPosition _magazineTaxSliderCtrl),"%"];
	_weaponTaxTextCtrl ctrlSetStructuredText parseText format [localize "STR_Tax_WeaponTax",round (sliderPosition _weaponTaxSliderCtrl),"%"];
	_transferTaxTextCtrl ctrlSetStructuredText parseText format [localize "STR_Tax_TransferTax",round (sliderPosition _transferTaxSliderCtrl),"%"];
	sleep .1;
	};