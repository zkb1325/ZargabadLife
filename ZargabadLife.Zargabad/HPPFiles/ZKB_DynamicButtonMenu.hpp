class ZKB_DynamicButtonMenu
{
idd = 15500;														
name = "ZKB_DynamicButtonMenu";
movingEnabled = false;
enableSimulation = true;
onLoad = "uiNamespace setVariable ['ZKB_DynamicButtonMenu', _this select 0]";
onUnload = "uiNamespace setVariable ['ZKB_DynamicButtonMenu', displayNull]";

class controls
	{

	class DynamicButtonMenu_BG: IGUIBack
		{
		idc = 15501;
		x = 0.3875 * safezoneW + safezoneX;
		y = 0.16 * safezoneH + safezoneY;
		w = 0.225 * safezoneW;
		h = 0.68 * safezoneH;
		};
		
	class DynamicButtonMenu_Frame: RscFrame
		{
		idc = 15502;
		text = "";
		x = 0.3875 * safezoneW + safezoneX;
		y = 0.16 * safezoneH + safezoneY;
		w = 0.225 * safezoneW;
		h = 0.68 * safezoneH;
		};
		
	class DynamicButtonMenu_BtnGroup: RscControlsGroup
		{
		
		idc = 15505;
		x = 0.3875 * safezoneW + safezoneX;
		y = 0.17 * safezoneH + safezoneY;
		w = 0.225 * safezoneW;
		h = 0.67 * safezoneH;
		
		class controls
			{
			class DynamicButtonMenu_Btn1: RscButton
				{
				idc = 15510;
				text = "Button 1"; //--- ToDo: Localize;
				action = "closedialog 0";
				x = (0.4125 * safezoneW + safezoneX) - (0.3875 * safezoneW + safezoneX);
				y = (0.2 * safezoneH + safezoneY) - (0.17 * safezoneH + safezoneY);
				w = 0.175 * safezoneW;
				h = 0.04 * safezoneH;
				};
			};
		};
	};
};
