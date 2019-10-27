class ZKB_Factory
{
idd = 4000;														
name = "ZKB_Factory";
movingEnabled = true;
enableSimulation = true;
onLoad = "uiNamespace setVariable ['ZKB_Factory', _this select 0]";
onUnload = "uiNamespace setVariable ['ZKB_Factory', displayNull]";

class controls
	{
	class Factory_BG: IGUIBack
	{
		idc = 4001;
		x = 0.3 * safezoneW + safezoneX;
		y = 0.1 * safezoneH + safezoneY;
		w = 0.34 * safezoneW;
		h = 0.8 * safezoneH;
	};
	class FactoryItemListFrame: ZKB_RscFrame
	{
		idc = 4002;
		x = 0.32 * safezoneW + safezoneX;
		y = 0.14 * safezoneH + safezoneY;
		w = 0.3 * safezoneW;
		h = 0.25 * safezoneH;
	};
	class FactoryCurrentProductionFrame: ZKB_RscFrame
	{
		idc = 4003;
		x = 0.32 * safezoneW + safezoneX;
		y = 0.42 * safezoneH + safezoneY;
		w = 0.3 * safezoneW;
		h = 0.12 * safezoneH;
	};	
	class FactoryItemInfoFrame: ZKB_RscFrame
	{
		idc = 4004;
		x = 0.32 * safezoneW + safezoneX;
		y = 0.55 * safezoneH + safezoneY;
		w = 0.3 * safezoneW;
		h = 0.12 * safezoneH;
	};
	class Factory_Frame: ZKB_RscFrame
	{
		idc = 4005;
		x = 0.3 * safezoneW + safezoneX;
		y = 0.1 * safezoneH + safezoneY;
		w = 0.34 * safezoneW;
		h = 0.8 * safezoneH;
	};
	class FactoryItemList: ZKB_RscListBox
	{
		idc = 4010;
		x = 0.32 * safezoneW + safezoneX;
		y = 0.14 * safezoneH + safezoneY;
		w = 0.3 * safezoneW;
		h = 0.25 * safezoneH;
	};
	class FactoryCurrentProduction: ZKB_RscListBox
	{
		idc = 4020;
		text = "Currently In Production";
		x = 0.32 * safezoneW + safezoneX;
		y = 0.42 * safezoneH + safezoneY;
		w = 0.3 * safezoneW;
		h = 0.12 * safezoneH;
	};
	class FactoryItemInfo_CTRLGrp: ZKB_RscControlsGroup
		{
		idc = -1;
		x = 0.32 * safezoneW + safezoneX;
		y = 0.55 * safezoneH + safezoneY;
		w = 0.3 * safezoneW;
		h = 0.12 * safezoneH;
		
		class controls
			{	
			class FactoryItemInfo: ZKB_RscStructuredText
				{
				idc = 4030;
				text = "Factory Info";
				x = 0;
				y = 0;
				w = 0.3 * safezoneW;
				h = 0.12 * safezoneH;
				};	
			};
		};
	class FactoryCreate: ZKB_RscButton
	{
		idc = 4040;
		action = "[lbData [4010, (lbCurSel 4010)]] call ZKB_fnc_CreateFactoryItem";
		text = "$STR_Fac_Create";
		x = 0.32 * safezoneW + safezoneX;
		y = 0.69 * safezoneH + safezoneY;
		w = 0.3 * safezoneW;
		h = 0.04 * safezoneH;
	};
	class FactoryExport: ZKB_RscButton
	{
		idc = 4050;
		action = "[lbData [4010, (lbCurSel 4010)]] call ZKB_fnc_ExportFactoryItem";
		text = "$STR_Fac_Export";
		x = 0.32 * safezoneW + safezoneX;
		y = 0.74 * safezoneH + safezoneY;
		w = 0.3 * safezoneW;
		h = 0.04 * safezoneH;
	};
	class FactoryManufacture: ZKB_RscButton
	{
		idc = 4060;
		action = "[lbData [4010, (lbCurSel 4010)]] call ZKB_fnc_ManufactureItem";
		text = "$STR_Fac_Manufacture";
		x = 0.32 * safezoneW + safezoneX;
		y = 0.79 * safezoneH + safezoneY;
		w = 0.3 * safezoneW;
		h = 0.04 * safezoneH;
	};
	class FactoryClose: ZKB_RscButton
	{
		idc = 4070;
		text = "$STR_Common_Close";
		x = 0.32 * safezoneW + safezoneX;
		y = 0.84 * safezoneH + safezoneY;
		w = 0.3 * safezoneW;
		h = 0.04 * safezoneH;
		action = "closeDialog 0;";
	};
	};
};
