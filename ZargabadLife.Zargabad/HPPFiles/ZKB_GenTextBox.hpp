class ZKB_GenTextBox
{
idd = 1500;														
name = "ZKB_GenTextBox";
movingEnabled = true;
enableSimulation = true;
onLoad = "uiNamespace setVariable ['ZKB_GenTextBox', _this select 0]";
onUnload = "uiNamespace setVariable ['ZKB_GenTextBox', displayNull]";

class controls
	{
	class GenericTextBox_BG: IGUIBack
	{
		idc = 1501;
		x = 0.3 * safezoneW + safezoneX;
		y = 0.12 * safezoneH + safezoneY;
		w = 0.4 * safezoneW;
		h = 0.8 * safezoneH;
	};
	class GenericTextBox_Frame: ZKB_RscFrame
	{
		idc = 1502;
		x = 0.3 * safezoneW + safezoneX;
		y = 0.12 * safezoneH + safezoneY;
		w = 0.4 * safezoneW;
		h = 0.8 * safezoneH;
	};
	class GenericTextBox_Text_CTRLGrp: ZKB_RscControlsGroup
		{
		
		idc = 1503;
		x = 0.325 * safezoneW + safezoneX;
		y = 0.16 * safezoneH + safezoneY;
		w = 0.35 * safezoneW;
		h = 0.64 * safezoneH;
		
		class controls
			{
		
			class GenericTextBox_Text: ZKB_RscStructuredText
				{
				idc = 1510;
				text = "";
				x = 0;
				y = 0;
				w = 0.339 * safezoneW;
				h = 0.64 * safezoneH;
				};	
			};
		};
	class GenericTextBox_Text_Frame: ZKB_RscFrame
		{
		
		idc = 1504;
		x = 0.325 * safezoneW + safezoneX;
		y = 0.16 * safezoneH + safezoneY;
		w = 0.35 * safezoneW;
		h = 0.64 * safezoneH;
		};
	class GenericTextBox_Btn: ZKB_RscButton
	{
		idc = 1520;
		text = "$STR_Common_Close";
		x = 0.4 * safezoneW + safezoneX;
		y = 0.84 * safezoneH + safezoneY;
		w = 0.2 * safezoneW;
		h = 0.04 * safezoneH;
		action = "closedialog 0;";
	};
	};
};
