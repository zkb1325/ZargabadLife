class ZKB_MainCam
{
idd = 25000;														
name = "ZKB_MainCam";
movingEnabled = true;
enableSimulation = true;
onLoad = "uiNamespace setVariable ['ZKB_MainCam', _this select 0]";
onUnload = "uiNamespace setVariable ['ZKB_MainCam', displayNull]";

class controls
	{

	class MainCameraDialog_BG_Left: IGUIBack
	{
		idc = -1;
		x = 0 * safezoneW + safezoneX;
		y = 0 * safezoneH + safezoneY;
		w = 0.3 * safezoneW;
		h = 1 * safezoneH;
		colorBackground[] = {0,0,0,1};
	};
	class MainCameraDialog_BG_Right: IGUIBack
	{
		idc = -1;
		x = 0.70375 * safezoneW + safezoneX;
		y = 0 * safezoneH + safezoneY;
		w = 0.3 * safezoneW;
		h = 1 * safezoneH;
		colorBackground[] = {0,0,0,1};
	};
	class MainCameraDialog_BG_Top: IGUIBack
	{
		idc = -1;
		x = 0.3 * safezoneW + safezoneX;
		y = 0 * safezoneH + safezoneY;
		w = 0.4125 * safezoneW;
		h = 0.24 * safezoneH;
		colorBackground[] = {0,0,0,1};
	};
	class MainCameraDialog_BG_Bottom: IGUIBack
	{
		idc = -1;
		x = 0.3 * safezoneW + safezoneX;
		y = 0.76 * safezoneH + safezoneY;
		w = 0.4125 * safezoneW;
		h = 0.24 * safezoneH;
		colorBackground[] = {0,0,0,1};
	};
	
	class MainCameraDialog_HLine_1: IGUIBack
	{
		idc = -1;
		x = 0.3 * safezoneW + safezoneX;
		y = 0.28 * safezoneH + safezoneY;
		w = 0.4125 * safezoneW;
		h = 0.001 * safezoneH;
		colorBackground[] = {0,0,0,.25};
	};
	class MainCameraDialog_HLine_2: MainCameraDialog_HLine_1 {y = 0.32 * safezoneH + safezoneY;};
	class MainCameraDialog_HLine_3: MainCameraDialog_HLine_1 {y = 0.36 * safezoneH + safezoneY;};
	class MainCameraDialog_HLine_4: MainCameraDialog_HLine_1 {y = 0.4 * safezoneH + safezoneY;};
	class MainCameraDialog_HLine_5: MainCameraDialog_HLine_1 {y = 0.44 * safezoneH + safezoneY;};
	class MainCameraDialog_HLine_6: MainCameraDialog_HLine_1 {y = 0.48 * safezoneH + safezoneY;};
	class MainCameraDialog_HLine_7: MainCameraDialog_HLine_1 {y = 0.52 * safezoneH + safezoneY;};
	class MainCameraDialog_HLine_8: MainCameraDialog_HLine_1 {y = 0.56 * safezoneH + safezoneY;};
	class MainCameraDialog_HLine_9: MainCameraDialog_HLine_1 {y = 0.6 * safezoneH + safezoneY;};
	class MainCameraDialog_HLine_10: MainCameraDialog_HLine_1 {y = 0.64 * safezoneH + safezoneY;};
	class MainCameraDialog_HLine_11: MainCameraDialog_HLine_1 {y = 0.68 * safezoneH + safezoneY;};
	class MainCameraDialog_HLine_12: MainCameraDialog_HLine_1 {y = 0.72 * safezoneH + safezoneY;};
	
	class MainCameraDialog_VLine_1: IGUIBack
	{
		idc = -1;
		x = 0.325 * safezoneW + safezoneX;
		y = 0.24 * safezoneH + safezoneY;
		w = 0.001 * safezoneW;
		h = 0.52 * safezoneH;
		colorBackground[] = {0,0,0,.25};
	};
	class MainCameraDialog_VLine_2: MainCameraDialog_VLine_1 {x = 0.365 * safezoneW + safezoneX;};
	class MainCameraDialog_VLine_3: MainCameraDialog_VLine_1 {x = 0.405 * safezoneW + safezoneX;};
	class MainCameraDialog_VLine_4: MainCameraDialog_VLine_1 {x = 0.445 * safezoneW + safezoneX;};
	class MainCameraDialog_VLine_5: MainCameraDialog_VLine_1 {x = 0.485 * safezoneW + safezoneX;};
	class MainCameraDialog_VLine_6: MainCameraDialog_VLine_1 {x = 0.525 * safezoneW + safezoneX;};
	class MainCameraDialog_VLine_7: MainCameraDialog_VLine_1 {x = 0.565 * safezoneW + safezoneX;};
	class MainCameraDialog_VLine_8: MainCameraDialog_VLine_1 {x = 0.605 * safezoneW + safezoneX;};
	class MainCameraDialog_VLine_9: MainCameraDialog_VLine_1 {x = 0.645 * safezoneW + safezoneX;};
	class MainCameraDialog_VLine_10: MainCameraDialog_VLine_1 {x = 0.685 * safezoneW + safezoneX;};
	class MainCameraDialog_VLine_11: MainCameraDialog_VLine_1 {x = 0.725 * safezoneW + safezoneX;};
	class MainCameraDialog_VLine_12: MainCameraDialog_VLine_1 {x = 0.765 * safezoneW + safezoneX;};
	class MainCameraDialog_VLine_13: MainCameraDialog_VLine_1 {x = 0.805 * safezoneW + safezoneX;};
	class MainCameraDialog_VLine_14: MainCameraDialog_VLine_1 {x = 0.845 * safezoneW + safezoneX;};
	class MainCameraDialog_VLine_15: MainCameraDialog_VLine_1 {x = 0.885 * safezoneW + safezoneX;};
	
	
	class MainCameraDialog_CamZoomSlider: RscVSlider
	{
		idc = 25020;
		x = 0.725 * safezoneW + safezoneX;
		y = 0.24 * safezoneH + safezoneY;
		w = 0.0375 * safezoneW;
		h = 0.52 * safezoneH;
	};
	class MainCameraDialog_CamUpDownSlider: RscVSlider
	{
		idc = 25030;
		x = 0.225 * safezoneW + safezoneX;
		y = 0.24 * safezoneH + safezoneY;
		w = 0.04 * safezoneW;
		h = 0.52 * safezoneH;
	};
	class MainCameraDialog_UpDownText: RscStructuredText
	{
		idc = 25040;
		text = "$STR_Cop_SatCamMoveUpDown";
		x = 0.15 * safezoneW + safezoneX;
		y = 0.44 * safezoneH + safezoneY;
		w = 0.0625 * safezoneW;
		h = 0.12 * safezoneH;
		class Attributes
			{
			align = "center";
			};
	};
	class MainCameraDialog_CamLeftRightSlider: RscSlider
	{
		idc = 25050;
		x = 0.3 * safezoneW + safezoneX;
		y = 0.16 * safezoneH + safezoneY;
		w = 0.4 * safezoneW;
		h = 0.04 * safezoneH;
	};
	class MainCameraDialog_LeftRightText: RscStructuredText
	{
		idc = 25060;
		text = "$STR_Cop_SatCamMoveLeftRight";
		x = 0.3125 * safezoneW + safezoneX;
		y = 0.1 * safezoneH + safezoneY;
		w = 0.375 * safezoneW;
		h = 0.04 * safezoneH;
		class Attributes
			{
			align = "center";
			};
	};
	class MainCameraDialog_NVGOnBtn: RscButton
	{
		idc = 25070;
		text = "$STR_Cop_CameraNvgOn";
		x = 0.3 * safezoneW + safezoneX;
		y = 0.78 * safezoneH + safezoneY;
		w = 0.075 * safezoneW;
		h = 0.04 * safezoneH;
		colorBackground[] = {0.5,0.5,0.5,.5};
		action = "camUseNVG true;";
	};
	class MainCameraDialog_NVGOffBtn: RscButton
	{
		idc = 25080;
		text = "$STR_Cop_CameraNvgOff";
		x = 0.4 * safezoneW + safezoneX;
		y = 0.78 * safezoneH + safezoneY;
		w = 0.075 * safezoneW;
		h = 0.04 * safezoneH;
		colorBackground[] = {0.5,0.5,0.5,.5};
		action = "camUseNVG false;";
	};
	class MainCameraDialog_Info: RscStructuredText
	{
		idc = 25090;
		text = "";
		x = 0.3 * safezoneW + safezoneX;
		y = 0.83 * safezoneH + safezoneY;
		w = 0.4 * safezoneW;
		h = 0.04 * safezoneH;
		class Attributes
			{
			align = "center";
			};
	};
	class MainCameraDialog_Close: RscButton
	{
		idc = 25100;
		text = "$STR_Common_Close";
		x = 0.5875 * safezoneW + safezoneX;
		y = 0.78 * safezoneH + safezoneY;
		w = 0.1125 * safezoneW;
		h = 0.04 * safezoneH;
		colorBackground[] = {0.5,0.5,0.5,.5};
		action = "closeDialog 0";
	};
	};
};
