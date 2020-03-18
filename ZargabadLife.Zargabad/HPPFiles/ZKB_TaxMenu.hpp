class ZKB_TaxMenu
{
idd = 23000;														
name = "ZKB_TaxMenu";
movingEnabled = true;
enableSimulation = true;
onLoad = "uiNamespace setVariable ['ZKB_TaxMenu', _this select 0]";
onUnload = "uiNamespace setVariable ['ZKB_TaxMenu', displayNull]";

class controls
	{

	class TaxMenu_BG: IGUIBack
	{
		idc = 23001;
		x = 0.34 * safezoneW + safezoneX;
		y = 0.08 * safezoneH + safezoneY;
		w = 0.28 * safezoneW;
		h = 0.7 * safezoneH;
	};
	class TaxMenu_Fame: ZKB_RscFrame
	{
		idc = 23002;
		text = "$STR_Tax_TaxMenu";
		x = 0.34 * safezoneW + safezoneX;
		y = 0.08 * safezoneH + safezoneY;
		w = 0.28 * safezoneW;
		h = 0.7 * safezoneH;
	};
	class TaxMenu_ItemTaxTxt: ZKB_RscStructuredText
	{
		idc = 23010;
		text = "$STR_Tax_ItemTax";
		x = 0.35 * safezoneW + safezoneX;
		y = 0.12 * safezoneH + safezoneY;
		w = 0.26 * safezoneW;
		h = 0.04 * safezoneH;
	};
	class TaxMenu_ItemTaxSlider: ZKB_RscSlider
	{
		idc = 23020;
		x = 0.35 * safezoneW + safezoneX;
		y = 0.17 * safezoneH + safezoneY;
		w = 0.26 * safezoneW;
		h = 0.04 * safezoneH;
	};
	class TaxMenu_VehicleTaxTxt: ZKB_RscStructuredText
	{
		idc = 23030;

		text = "$STR_Tax_VehicleTax";
		x = 0.35 * safezoneW + safezoneX;
		y = 0.23 * safezoneH + safezoneY;
		w = 0.26 * safezoneW;
		h = 0.04 * safezoneH;
	};
	class TaxMenu_VehicleTaxSlider: ZKB_RscSlider
	{
		idc = 23040;
		x = 0.35 * safezoneW + safezoneX;
		y = 0.28 * safezoneH + safezoneY;
		w = 0.26 * safezoneW;
		h = 0.04 * safezoneH;
	};
	class TaxMenu_MagazineTaxTxt: ZKB_RscStructuredText
	{
		idc = 23050;
		text = "$STR_Tax_MagazineTax";
		x = 0.35 * safezoneW + safezoneX;
		y = 0.34 * safezoneH + safezoneY;
		w = 0.26 * safezoneW;
		h = 0.04 * safezoneH;
	};
	class TaxMenu_MagazineTaxSlider: ZKB_RscSlider
	{
		idc = 23060;
		x = 0.35 * safezoneW + safezoneX;
		y = 0.39 * safezoneH + safezoneY;
		w = 0.26 * safezoneW;
		h = 0.04 * safezoneH;
	};
	class TaxMenu_WeaponTaxTxt: ZKB_RscStructuredText
	{
		idc = 23070;
		text = "$STR_Tax_WeaponTax";
		x = 0.35 * safezoneW + safezoneX;
		y = 0.45 * safezoneH + safezoneY;
		w = 0.26 * safezoneW;
		h = 0.04 * safezoneH;
	};
	class TaxMenu_WeaponTaxSlider: ZKB_RscSlider
	{
		idc = 23080;
		x = 0.35 * safezoneW + safezoneX;
		y = 0.5 * safezoneH + safezoneY;
		w = 0.26 * safezoneW;
		h = 0.04 * safezoneH;
	};
	class TaxMenu_BankTransferTax: ZKB_RscStructuredText
	{
		idc = 23090;
		text = "$STR_Tax_TransferTax";
		x = 0.35 * safezoneW + safezoneX;
		y = 0.56 * safezoneH + safezoneY;
		w = 0.25 * safezoneW;
		h = 0.04 * safezoneH;
	};
	class TaxMenu_BankTransferSlider: ZKB_RscSlider
	{
		idc = 23100;
		x = 0.35 * safezoneW + safezoneX;
		y = 0.61 * safezoneH + safezoneY;
		w = 0.25 * safezoneW;
		h = 0.04 * safezoneH;
	};
	class TaxMenu_ChangeTaxesBtn: ZKB_RscButton
	{
		idc = 23110;
		text = "$STR_Tax_ChangeTaxes";
		x = 0.38 * safezoneW + safezoneX;
		y = 0.67 * safezoneH + safezoneY;
		w = 0.2 * safezoneW;
		h = 0.04 * safezoneH;
		action = "[sliderPosition 23020, sliderPosition 23040,sliderPosition 23060,sliderPosition 23080,sliderPosition 23100] call ZKB_fnc_ChangeTaxes;";
	};
	class TaxMenu_Cancel: ZKB_RscButton
	{
		idc = 23120;
		text = "$STR_Common_Close";
		x = 0.38 * safezoneW + safezoneX;
		y = 0.72 * safezoneH + safezoneY;
		w = 0.2 * safezoneW;
		h = 0.04 * safezoneH;
		action = "closedialog 0;";
	};
	};
};