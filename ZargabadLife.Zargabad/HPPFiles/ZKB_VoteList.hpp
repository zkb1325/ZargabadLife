class ZKB_VoteList
{
idd = 21000;														
name = "ZKB_VoteList";
movingEnabled = true;
enableSimulation = true;
onLoad = "uiNamespace setVariable ['ZKB_VoteList', _this select 0]";
onUnload = "uiNamespace setVariable ['ZKB_VoteList', displayNull]";

class controls
	{

	class VoteList_BG: IGUIBack
	{
		idc = 21001;
		x = 0.3875 * safezoneW + safezoneX;
		y = 0.18 * safezoneH + safezoneY;
		w = 0.225 * safezoneW;
		h = 0.6 * safezoneH;
	};
	class VoteList_Frame: RscFrame
	{
		idc = 21002;
		x = 0.3875 * safezoneW + safezoneX;
		y = 0.18 * safezoneH + safezoneY;
		w = 0.225 * safezoneW;
		h = 0.6 * safezoneH;
	};
	class VoteList_PlayerList: RscListBox
	{
		idc = 21010;
		x = 0.4125 * safezoneW + safezoneX;
		y = 0.22 * safezoneH + safezoneY;
		w = 0.175 * safezoneW;
		h = 0.38 * safezoneH;
	};
	class VoteList_VoteBtn: RscButton
	{
		idc = 21020;
		text = "$STR_Voting_Vote";
		x = 0.425 * safezoneW + safezoneX;
		y = 0.62 * safezoneH + safezoneY;
		w = 0.15 * safezoneW;
		h = 0.04 * safezoneH;
	};
	class VoteList_CancelBtn: RscButton
	{
		idc = 21030;
		text = "$STR_Common_Close";
		x = 0.425 * safezoneW + safezoneX;
		y = 0.7 * safezoneH + safezoneY;
		w = 0.15 * safezoneW;
		h = 0.04 * safezoneH;
		action = "closedialog 0;";
	};

	};
};

