class ZKB_Bank
{
idd = 13000;														
name = "ZKB_Bank";
movingEnabled = true;
enableSimulation = true;
onLoad = "uiNamespace setVariable ['ZKB_Bank', _this select 0]";
onUnload = "uiNamespace setVariable ['ZKB_Bank', displayNull]";

class controls
	{

	class Bank_BG: IGUIBack
	{
		idc = 13001;
		x = 0.31 * safezoneW + safezoneX;
		y = 0.14 * safezoneH + safezoneY;
		w = 0.37 * safezoneW;
		h = 0.73 * safezoneH;
	};
	class GenericList_Frame: RscFrame
	{
		idc = 13002;
		text = "$STR_Bank_ATMBANK";
		x = 0.31 * safezoneW + safezoneX;
		y = 0.14 * safezoneH + safezoneY;
		w = 0.37 * safezoneW;
		h = 0.73 * safezoneH;
	};
	class Bank_Dep_Trans: RscStructuredText
	{
		idc = 13010;
		text = "$STR_Bank_DepTrans";
		x = 0.325 * safezoneW + safezoneX;
		y = 0.17 * safezoneH + safezoneY;
		w = 0.325 * safezoneW;
		h = 0.04 * safezoneH;
		class Attributes
			{
			align = "center";
			};
	};
	class Bank_SelectPlayer: RscStructuredText
	{
		idc = 13020;
		text = "$STR_Bank_PlayerSelect";
		x = 0.33 * safezoneW + safezoneX;
		y = 0.22 * safezoneH + safezoneY;
		w = 0.15 * safezoneW;
		h = 0.04 * safezoneH;
		size = (0.016 * safezoneW);
		class Attributes
			{
			align = "right";
			};
	};
	class Bank_PlayerList: RscCombo
	{
		idc = 13030;
		x = 0.48 * safezoneW + safezoneX;
		y = 0.22 * safezoneH + safezoneY;
		w = 0.19 * safezoneW;
		h = 0.04 * safezoneH;
	};
	class Bank_Dep_Trans_Amount: RscEdit
	{
		idc = 13040;
		text = "0";
		x = 0.325 * safezoneW + safezoneX;
		y = 0.28 * safezoneH + safezoneY;
		w = 0.325 * safezoneW;
		h = 0.04 * safezoneH;
	};
	class Bank_TaxInfo: RscStructuredText
	{
		idc = 13045;
		text = "";
		x = 0.325 * safezoneW + safezoneX;
		y = 0.32 * safezoneH + safezoneY;
		w = 0.325 * safezoneW;
		h = 0.04 * safezoneH;
	};
	class Bank_Dep_Trans_Btn: RscButton
	{
		idc = 13050;
		text = "$STR_Bank_Submit";
		action = "[ctrlText 13040, lbData [13030,lbCurSel 13030]] call ZKB_fnc_DepositBank;";
		x = 0.39 * safezoneW + safezoneX;
		y = 0.37 * safezoneH + safezoneY;
		w = 0.2 * safezoneW;
		h = 0.04 * safezoneH;
	};
	class Bank_InvMoneyTxt: RscStructuredText
	{
		idc = 13060;
		text = "$STR_Bank_InvMoney";
		x = 0.3275 * safezoneW + safezoneX;
		y = 0.44 * safezoneH + safezoneY;
		w = 0.3125 * safezoneW;
		h = 0.04 * safezoneH;
	};
	class Bank_AccountMoneyTxt: RscStructuredText
	{
		idc = 13070;
		text = "$STR_Bank_BankMoney";
		x = 0.3275 * safezoneW + safezoneX;
		y = 0.49 * safezoneH + safezoneY;
		w = 0.3125 * safezoneW;
		h = 0.04 * safezoneH;
	};
	class Bank_TrenLine: RscText
	{
		idc = 13080;
		x = 0.32 * safezoneW + safezoneX;
		y = 0.54 * safezoneH + safezoneY;
		w = 0.35 * safezoneW;
		h = 0.01 * safezoneH;
		colorBackground[] = {0.5,0.5,0.5,0.75};
	};
	class Bank_WithdrawTxt: RscStructuredText
	{
		idc = 13090;
		text = "$STR_Bank_Withdraw";
		x = 0.325 * safezoneW + safezoneX;
		y = 0.58 * safezoneH + safezoneY;
		w = 0.325 * safezoneW;
		h = 0.04 * safezoneH;
		class Attributes
			{
			align = "center";
			};
	};
	class Bank_WithdrawAmount: RscEdit
	{
		idc = 13100;
		text = "0";
		x = 0.325 * safezoneW + safezoneX;
		y = 0.62 * safezoneH + safezoneY;
		w = 0.325 * safezoneW;
		h = 0.04 * safezoneH;
	};
	class Bank_WithdrawBtn: RscButton
	{
		idc = 13110;
		text = "$STR_Bank_Withdraw";
		action = "[ctrlText 13100] call ZKB_fnc_WithdrawBank";
		x = 0.39 * safezoneW + safezoneX;
		y = 0.73 * safezoneH + safezoneY;
		w = 0.2 * safezoneW;
		h = 0.04 * safezoneH;
	};
	class Bank_Cancel: RscButton
	{
		idc = 13120;
		text = "$STR_Common_Close";
		x = 0.39 * safezoneW + safezoneX;
		y = 0.82 * safezoneH + safezoneY;
		w = 0.2 * safezoneW;
		h = 0.04 * safezoneH;
		action = "closedialog 0";
	};
	};
};
