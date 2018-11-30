#define F(NAME,TARGET) class NAME { \
    allowedTargets = TARGET; \
};

#define ALL 0
#define CLIENT 1
#define SERVER 2

class CfgRemoteExec
	{        
		class Functions
			{
			mode = 2;
			jip = 0;
			
			//Server Only
			F(ZKB_fnc_ServerSaveStats,SERVER)
			F(ZKB_fnc_ServerSavePlayerStats,SERVER)
			F(ZKB_fnc_ServerSaveVehicle,SERVER)
			F(ZKB_fnc_ServerUpdateImpound,SERVER)
			F(ZKB_fnc_ServerUpdateGangSave,SERVER)
			F(ZKB_fnc_ServerLoadPlayerStats,SERVER)
			F(ZKB_fnc_ServerDeleteVehicle,SERVER)
			F(ZKB_fnc_SetShotParents,SERVER)
			F(ZKB_fnc_InvAddItem,SERVER)
			F(ZKB_fnc_SpikeStripEffect,SERVER)
			F(ZKB_fnc_TakeHostageLoop,SERVER)
			
			//Client Only
			F(ZKB_fnc_AddAction,CLIENT)
			F(ZKB_fnc_RobBankLoss,CLIENT)
			F(ZKB_fnc_AdminCompItemReceive,CLIENT)
			F(ZKB_fnc_AdminCompBankReceive,CLIENT)
			F(ZKB_fnc_TransferBank,CLIENT)
			F(ZKB_fnc_ReTransferBank,CLIENT)
			F(ZKB_fnc_RobPlayerDropItems,CLIENT)
			F(ZKB_fnc_BountyCollect,CLIENT)
			F(ZKB_fnc_PayBailCopReward,CLIENT)
			F(ZKB_fnc_Jail,CLIENT)
			F(ZKB_fnc_Disarmed,CLIENT)
			F(ZKB_fnc_SearchPlayerRemoveItems,CLIENT)
			F(ZKB_fnc_RecieveTicket,CLIENT)
			F(ZKB_fnc_TicketCollect,CLIENT)
			F(ZKB_fnc_KnockedOut,CLIENT)
			F(ZKB_fnc_Restrain,CLIENT)
			F(ZKB_fnc_KilledPlayer,CLIENT)
			F(ZKB_fnc_AssassinMissionCopWin,CLIENT)
			F(ZKB_fnc_AssassinMissionCivWin,CLIENT)
			F(ZKB_fnc_AssassinMissionCivLoop,CLIENT)
			F(ZKB_fnc_GovernmentConvoyCivLoop,CLIENT)
			F(ZKB_fnc_GovernmentConvoyCopWin,CLIENT)
			F(ZKB_fnc_HostageKilledKiller,CLIENT)
			
			//ALL
			F(BIS_fnc_error,ALL)
			F(bis_fnc_settasklocal,ALL)
			F(BIS_fnc_effectKilledAirDestruction,ALL)
			F(BIS_fnc_effectKilledSecondaries,ALL)
			F(BIS_fnc_objectVar,ALL)
			F(ZKB_fnc_DynamicText,ALL)
			F(ZKB_fnc_AddForce,ALL)
			F(ZKB_fnc_AnimSync,ALL)
			F(ZKB_fnc_PoliceSiren,ALL)
			F(ZKB_fnc_SayRadioText,ALL)
			F(ZKB_fnc_AddVehicleActions,ALL)
			F(ZKB_fnc_setVehicleVarName,ALL)

			};        

		
		class Commands
			{
			mode = 1;
			jip = 0;
			
			//Client
			F(addAction,CLIENT)
			F(cutText,CLIENT)
			F(hint,CLIENT)
			
			//ALL
			F(lock,ALL)
			F(selectLeader,ALL)
			F(setUserActionText,ALL)
			};
	};