class ZKB_ShoutText
{
idd = 7000;														
name = "ZKB_ShoutText";
movingEnabled = true;
enableSimulation = true;
onLoad = "uiNamespace setVariable ['ZKB_ShoutText', _this select 0]";
onUnload = "uiNamespace setVariable ['ZKB_ShoutText', displayNull]";

class controls
	{
	class ShoutText_BG: IGUIBack
	{
		idc = 7001;

		x = 0.175 * safezoneW + safezoneX;
		y = 0.28 * safezoneH + safezoneY;
		w = 0.6375 * safezoneW;
		h = 0.4 * safezoneH;
	};
	class ShoutText_Frame: ZKB_RscFrame
	{
		idc = 7002;
		
		text = $STR_MainMenu_ShoutTexts;
		x = 0.175 * safezoneW + safezoneX;
		y = 0.28 * safezoneH + safezoneY;
		w = 0.6375 * safezoneW;
		h = 0.4 * safezoneH;
	};
	class ShoutText_Text1: ZKB_RscEdit
	{
		idc = 7010;
		onChar = "[_this, 7010] spawn ZKB_fnc_CheckValidChar;";

		x = 0.2 * safezoneW + safezoneX;
		y = 0.32 * safezoneH + safezoneY;
		w = 0.375 * safezoneW;
		h = 0.04 * safezoneH;
	};
	class ShoutText_ChatOption1: ZKB_RscCombo
	{
		idc = 7020;

		x = 0.6125 * safezoneW + safezoneX;
		y = 0.32 * safezoneH + safezoneY;
		w = 0.17 * safezoneW;
		h = 0.04 * safezoneH;
	};
	class ShoutText_Text2: ZKB_RscEdit
	{
		idc = 7030;
		onChar = "[_this, 7030] spawn ZKB_fnc_CheckValidChar;";

		x = 0.2 * safezoneW + safezoneX;
		y = 0.38 * safezoneH + safezoneY;
		w = 0.375 * safezoneW;
		h = 0.04 * safezoneH;
	};
	class ShoutText_ChatOption2: ZKB_RscCombo
	{
		idc = 7040;

		x = 0.6125 * safezoneW + safezoneX;
		y = 0.38 * safezoneH + safezoneY;
		w = 0.17 * safezoneW;
		h = 0.04 * safezoneH;
	};
	class ShoutText_Text3: ZKB_RscEdit
	{
		idc = 7050;
		onChar = "[_this, 7050] spawn ZKB_fnc_CheckValidChar;";

		x = 0.2 * safezoneW + safezoneX;
		y = 0.44 * safezoneH + safezoneY;
		w = 0.375 * safezoneW;
		h = 0.04 * safezoneH;
	};
	class ShoutText_ChatOption3: ZKB_RscCombo
	{
		idc = 7060;

		x = 0.6125 * safezoneW + safezoneX;
		y = 0.44 * safezoneH + safezoneY;
		w = 0.17 * safezoneW;
		h = 0.04 * safezoneH;
	};
	class ShoutText_Text4: ZKB_RscEdit
	{
		idc = 7070;
		onChar = "[_this, 7070] spawn ZKB_fnc_CheckValidChar;";

		x = 0.2 * safezoneW + safezoneX;
		y = 0.5 * safezoneH + safezoneY;
		w = 0.375 * safezoneW;
		h = 0.04 * safezoneH;
	};
	class ShoutText_ChatOption4: ZKB_RscCombo
	{
		idc = 7080;

		x = 0.6125 * safezoneW + safezoneX;
		y = 0.5 * safezoneH + safezoneY;
		w = 0.17 * safezoneW;
		h = 0.04 * safezoneH;
	};
	class ShoutText_SaveBtn: ZKB_RscButton
	{
		idc = 7090;
		action = "[""Save""] call ZKB_fnc_SayTextMenu";

		text = $STR_MainMenu_Save;
		x = 0.2125 * safezoneW + safezoneX;
		y = 0.58 * safezoneH + safezoneY;
		w = 0.21 * safezoneW;
		h = 0.04 * safezoneH;
	};
	class ShoutText_Close: ZKB_RscButton
	{
		idc = 7095;
		action = "closedialog 0; createDialog ""ZKB_MainMenu"";";

		text = $STR_Common_Back;
		x = 0.55 * safezoneW + safezoneX;
		y = 0.58 * safezoneH + safezoneY;
		w = 0.21 * safezoneW;
		h = 0.04 * safezoneH;
	};
	};
};
