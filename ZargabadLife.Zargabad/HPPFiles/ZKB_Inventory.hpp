class ZKB_Inventory
{
idd = 2000;														
name = "ZKB_Inventory";
movingEnabled = true;
enableSimulation = true;
onLoad = "uiNamespace setVariable ['ZKB_Inventory', _this select 0]";
onUnload = "uiNamespace setVariable ['ZKB_Inventory', displayNull]";

class controls
	{
	class INV_BG: IGUIBack
	{
		idc = 2001;
		x = 0.14 * safezoneW + safezoneX;
		y = 0.1 * safezoneH + safezoneY;
		w = 0.71 * safezoneW;
		h = 0.75 * safezoneH;
	};
	class INV_Frame: RscFrame
	{
		idc = 2002;
		text = "$STR_Inv_Inventory";
		x = 0.14 * safezoneW + safezoneX;
		y = 0.1 * safezoneH + safezoneY;
		w = 0.71 * safezoneW;
		h = 0.75 * safezoneH;
	};
	class INV_Header: RscStructuredText
	{
		idc = 2003;
		text = "$STR_Inv_Inventory";
		size = (0.025 * safezoneW);
		x = 0.23 * safezoneW + safezoneX;
		y = 0.14 * safezoneH + safezoneY;
		w = 0.55 * safezoneW;
		h = 0.04 * safezoneH;
		class Attributes
		{
		align = "center";
		};
	};
	class Use_Btn: RscButton
	{
		idc = 2010;
		text = "$STR_Inv_Use";
		x = 0.15 * safezoneW + safezoneX;
		y = 0.2 * safezoneH + safezoneY;
		w = 0.2 * safezoneW;
		h = 0.04 * safezoneH;
		action = "[(lbData [2070, (lbCurSel 2070)]), ctrlText 2050] call ZKB_fnc_UseItem;";
	};
	class Close_Btn: RscButton
	{
		idc = 2020;
		text = "$STR_Common_Close";
		x = 0.15 * safezoneW + safezoneX;
		y = 0.26 * safezoneH + safezoneY;
		w = 0.2 * safezoneW;
		h = 0.04 * safezoneH;
		action = "closedialog 0;";
	};
	class Drop_Btn: RscButton
	{
		idc = 2030;
		text = "$STR_Inv_Drop";
		x = 0.15 * safezoneW + safezoneX;
		y = 0.32 * safezoneH + safezoneY;
		w = 0.2 * safezoneW;
		h = 0.04 * safezoneH;
		action = "[(lbData [2070, (lbCurSel 2070)]), ctrlText 2050] call ZKB_fnc_InvDropItem;";
	};
	class Give_Btn: RscButton
	{
		idc = 2040;
		text = "$STR_Inv_Give";
		x = 0.15 * safezoneW + safezoneX;
		y = 0.38 * safezoneH + safezoneY;
		w = 0.2 * safezoneW;
		h = 0.04 * safezoneH;
		action = "[(lbData [2070, (lbCurSel 2070)]), ctrlText 2050, (lbData [2060, (lbCurSel 2060)])] call ZKB_fnc_InvGiveItem;";
	};
	class MainMenu_Btn: RscButton
	{
		idc = 2045;
		text = "$STR_MainMenu_MainMenu";
		x = 0.15 * safezoneW + safezoneX;
		y = 0.62 * safezoneH + safezoneY;
		w = 0.2 * safezoneW;
		h = 0.04 * safezoneH;
		action = "closeDialog 0; createDialog ""ZKB_MainMenu"";";
	};
	class Amount: RscEdit
	{
		idc = 2050;
		text = "1";
		onChar = "_this spawn ZKB_fnc_CheckCharNum;";
		x = 0.15 * safezoneW + safezoneX;
		y = 0.44 * safezoneH + safezoneY;
		w = 0.2 * safezoneW;
		h = 0.04 * safezoneH;
	};
	class PlayerList: RscCombo
	{
		idc = 2060;
		x = 0.15 * safezoneW + safezoneX;
		y = 0.50 * safezoneH + safezoneY;
		w = 0.2 * safezoneW;
		h = 0.04 * safezoneH;
	};
	class INV_ItemList: RscListBox
	{
		idc = 2070;
		onLBSelChanged = "[((_this select 0) lbData (_this select 1))] call ZKB_fnc_InvSelChange";
		x = 0.64 * safezoneW + safezoneX;
		y = 0.2 * safezoneH + safezoneY;
		w = 0.2 * safezoneW;
		h = 0.46 * safezoneH;
	};
	class ItemDesc: RscStructuredText
	{
		idc = 2080;
		x = 0.36 * safezoneW + safezoneX;
		y = 0.2 * safezoneH + safezoneY;
		w = 0.25 * safezoneW;
		h = 0.46 * safezoneH;
	};
	class ItemDesc_Frame: RscFrame
	{
		idc = 2081;
		x = 0.36 * safezoneW + safezoneX;
		y = 0.2 * safezoneH + safezoneY;
		w = 0.25 * safezoneW;
		h = 0.46 * safezoneH;
	};
	};
};
