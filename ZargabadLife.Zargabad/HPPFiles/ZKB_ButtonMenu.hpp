class ZKB_ButtonMenu
{
idd = 15000;														
name = "ZKB_ButtonMenu";
movingEnabled = true;
enableSimulation = true;
onLoad = "uiNamespace setVariable ['ZKB_ButtonMenu', _this select 0]";
onUnload = "uiNamespace setVariable ['ZKB_ButtonMenu', displayNull]";

class controls
	{

	class ButtonMenu_BG: IGUIBack
	{
		idc = 15001;
		x = 0.3875 * safezoneW + safezoneX;
		y = 0.16 * safezoneH + safezoneY;
		w = 0.225 * safezoneW;
		h = 0.6 * safezoneH;
	};
	class ButtonMenu_Btn1: ZKB_RscButton
	{
		idc = 15010;
		text = "Button 1"; //--- ToDo: Localize;
		x = 0.4125 * safezoneW + safezoneX;
		y = 0.2 * safezoneH + safezoneY;
		w = 0.175 * safezoneW;
		h = 0.04 * safezoneH;
		action = "closedialog 0";
	};
	class ButtonMenu_Btn2: ZKB_RscButton
	{
		idc = 15020;
		text = "Button 2"; //--- ToDo: Localize;
		x = 0.4125 * safezoneW + safezoneX;
		y = 0.26 * safezoneH + safezoneY;
		w = 0.175 * safezoneW;
		h = 0.04 * safezoneH;
		action = "closedialog 0";
	};
	class ButtonMenu_Btn3: ZKB_RscButton
	{
		idc = 15030;
		text = "Button 3"; //--- ToDo: Localize;
		x = 0.4125 * safezoneW + safezoneX;
		y = 0.32 * safezoneH + safezoneY;
		w = 0.175 * safezoneW;
		h = 0.04 * safezoneH;
		action = "closedialog 0";
	};
	class ButtonMenu_Btn4: ZKB_RscButton
	{
		idc = 15040;
		text = "Button 4"; //--- ToDo: Localize;
		x = 0.4125 * safezoneW + safezoneX;
		y = 0.38 * safezoneH + safezoneY;
		w = 0.175 * safezoneW;
		h = 0.04 * safezoneH;
		action = "closedialog 0";
	};
	class ButtonMenu_Btn5: ZKB_RscButton
	{
		idc = 15050;
		text = "Button 5"; //--- ToDo: Localize;
		x = 0.4125 * safezoneW + safezoneX;
		y = 0.44 * safezoneH + safezoneY;
		w = 0.175 * safezoneW;
		h = 0.04 * safezoneH;
		action = "closedialog 0";
	};
	class ButtonMenu_Btn6: ZKB_RscButton
	{
		idc = 15060;
		text = "Button 6"; //--- ToDo: Localize;
		x = 0.4125 * safezoneW + safezoneX;
		y = 0.5 * safezoneH + safezoneY;
		w = 0.175 * safezoneW;
		h = 0.04 * safezoneH;
		action = "closedialog 0";
	};
	class ButtonMenu_Btn7: ZKB_RscButton
	{
		idc = 15070;
		text = "Button 7"; //--- ToDo: Localize;
		x = 0.4125 * safezoneW + safezoneX;
		y = 0.56 * safezoneH + safezoneY;
		w = 0.175 * safezoneW;
		h = 0.04 * safezoneH;
		action = "closedialog 0";
	};
	class ButtonMenu_Btn8: ZKB_RscButton
	{
		idc = 15080;
		text = "Button 8"; //--- ToDo: Localize;
		x = 0.4125 * safezoneW + safezoneX;
		y = 0.62 * safezoneH + safezoneY;
		w = 0.175 * safezoneW;
		h = 0.04 * safezoneH;
		action = "closedialog 0";
	};
	class ButtonMenu_Cancel: ZKB_RscButton
	{
		idc = 15090;
		text = "Cancel"; //--- ToDo: Localize;
		x = 0.4125 * safezoneW + safezoneX;
		y = 0.7 * safezoneH + safezoneY;
		w = 0.175 * safezoneW;
		h = 0.04 * safezoneH;
		action = "closedialog 0";
	};
	};
};
