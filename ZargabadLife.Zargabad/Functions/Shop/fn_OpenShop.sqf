/*
	File: fn_OpenShop.sqf
	Function: ZKB_fnc_OpenShop
	Author: ZKB1325
	Description: Runs when ever a player presses E on a valid shop
*/
private ["_shopData","_display","_buyframe","_sellframe","_buylist","_selllist","_buyamount","_sellamount","_buybtn","_sellbtn"];
ZKB_shopobject = param [0, objNull, [objNull]];

if (isNull ZKB_shopobject) exitWith {hint "Shop Error";};

_shopData = ZKB_shopobject getVariable "ShopData";

if !(call compile (_shopData select 7)) exitWith {["STR_Shop_NotAllowed"] call ZKB_fnc_DynamicText;};

disableserialization;
createDialog "ZKB_ListMenu";

_display = uiNameSpace getVariable "ZKB_ListMenu";

_buyframe = _display displayCtrl 5002;
_sellframe = _display displayCtrl 5004;

_buylist = _display displayCtrl 5010;
_selllist = _display displayCtrl 5020;

_buyamount = _display displayCtrl 5030;
_sellamount = _display displayCtrl 5040;

_buybtn = _display displayCtrl 5050;
_sellbtn = _display displayCtrl 5060;

//_buyinfotxt = _display displayCtrl 5090;
//_sellinfotxt = _display displayCtrl 5095;


_buyframe CtrlSetText ((if (isLocalized (_shopData select 1)) then {localize (_shopData select 1)}else{(_shopData select 1)}) + " " + (localize "STR_Shop_Buy"));
_sellframe CtrlSetText ((if (isLocalized (_shopData select 1)) then {localize (_shopData select 1)}else{(_shopData select 1)}) + " " + (localize "STR_Shop_Sell"));

_buybtn ctrlSetText format [localize "STR_Shop_BuyBtnGear", 0];
_sellbtn ctrlSetText format [localize "STR_Shop_SellBtnGear", 0];

_buybtn buttonSetAction "[(lbData [5010,(lbCurSel 5010)]), (CtrlText 5030), (lbValue [5010,(lbCurSel 5010)])] call ZKB_fnc_ShopBuy";
_sellbtn buttonSetAction "[(lbData [5020,(lbCurSel 5020)]), (CtrlText 5040)] call ZKB_fnc_ShopSell";

_buylist ctrlSetEventHandler ["LBSelChanged", "[((_this select 0) lbData (_this select 1)), (CtrlText 5030)] call ZKB_fnc_UpdateShopBuySelInfo;"];
_selllist ctrlSetEventHandler ["LBSelChanged", "[((_this select 0) lbData (_this select 1)), (CtrlText 5040)] call ZKB_fnc_UpdateShopSellSelInfo;"];

call ZKB_fnc_UpdateShopBuyList;
call ZKB_fnc_UpdateShopSellList;

_buyamounttext = CtrlText _buyamount;
_sellamounttext = CtrlText _sellamount;
	
while {ctrlVisible 5010} do
	{
	
	if !(_buyamounttext == (CtrlText _buyamount)) then {_buyamounttext = CtrlText _buyamount; [(_buylist lbData (lbCurSel _buylist)), (CtrlText _buyamount)] call ZKB_fnc_UpdateShopBuySelInfo;};
	if !(_sellamounttext == (CtrlText _sellamount)) then {_sellamounttext = CtrlText _sellamount; [(_selllist lbData (lbCurSel _selllist)), (CtrlText _sellamount)] call ZKB_fnc_UpdateShopSellSelInfo;};
	sleep .1;
	};