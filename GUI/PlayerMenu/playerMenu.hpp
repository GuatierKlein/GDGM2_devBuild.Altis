
class dialogPlayerMenu {
	idd = 11031;
	class controls {
		class btnSave: RscButton
		{
			action = "closedialog 0; [] remoteExec ['GDGM_fnc_save',2]";

			idc = 1600;
			text = "SAVE"; //--- ToDo: Localize;
			x = 0.592797 * safezoneW + safezoneX;
			y = 0.423007 * safezoneH + safezoneY;
			w = 0.113419 * safezoneW;
			h = 0.0439961 * safezoneH;
			tooltip = "Save the game"; //--- ToDo: Localize;
		};
		class btnAttack: RscButton
		{
			action = "";

			idc = 1601;
			text = "EMPTY"; //--- ToDo: Localize;
			x = 0.592797 * safezoneW + safezoneX;
			y = 0.532997 * safezoneH + safezoneY;
			w = 0.113419 * safezoneW;
			h = 0.0439961 * safezoneH;
			tooltip = ""; //--- ToDo: Localize;
		};
		class btnCommander: RscButton
		{
			action = "closedialog 0; [] spawn GDGM_fnc_openSelectCommander";

			idc = 1602;
			text = "CHANGE COMMANDER"; //--- ToDo: Localize;
			x = 0.592797 * safezoneW + safezoneX;
			y = 0.478002 * safezoneH + safezoneY;
			w = 0.113419 * safezoneW;
			h = 0.0439961 * safezoneH;
			tooltip = "Change commander behaviour"; //--- ToDo: Localize;
		};
		class btnCamp: RscButton
		{
			action = "closedialog 0; [player] remoteExec ['GDGM_fnc_playerReinf',2]";

			idc = 1603;
			text = "CALL REINFORCEMENTS"; //--- ToDo: Localize;
			x = 0.469068 * safezoneW + safezoneX;
			y = 0.478002 * safezoneH + safezoneY;
			w = 0.113419 * safezoneW;
			h = 0.0439961 * safezoneH;
			tooltip = "A truck will bring a squad of AIs to fill your group"; //--- ToDo: Localize;
		};
		class btnAmmo: RscButton
		{
			action = "closedialog 0; [] call GDGM_fnc_playerAmmo";

			idc = 1604;
			text = "CALL SUPPLIES"; //--- ToDo: Localize;
			x = 0.469068 * safezoneW + safezoneX;
			y = 0.423007 * safezoneH + safezoneY;
			w = 0.113419 * safezoneW;
			h = 0.0439961 * safezoneH;
			tooltip = "A truck or helicopter will deliver you ammo"; //--- ToDo: Localize;
		};
		class btnCrate: RscButton
		{
			action = "closedialog 0; [player, 'small'] remoteExec ['GDGM_fnc_spawnLogiCrate',2]";

			idc = 1605;
			text = "DROP SUPPLY CRATE"; //--- ToDo: Localize;
			x = 0.469068 * safezoneW + safezoneX;
			y = 0.587992 * safezoneH + safezoneY;
			w = 0.113419 * safezoneW;
			h = 0.0439961 * safezoneH;
			tooltip = "Drop a small supply crate to build (only for engineers)"; //--- ToDo: Localize;
		};
		class RscButton_1606: RscButton
		{
			action = "closedialog 0; [player] spawn GDGM_fnc_openBuildMenu";

			idc = 1606;
			text = "BUILD MENU"; //--- ToDo: Localize;
			x = 0.592797 * safezoneW + safezoneX;
			y = 0.642987 * safezoneH + safezoneY;
			w = 0.113419 * safezoneW;
			h = 0.0439961 * safezoneH;
			tooltip = "Opens build menu (only for engineers)"; //--- ToDo: Localize;
		};
		class RscButton_1607: RscButton
		{
			action = "closedialog 0; [player] spawn GDGM_fnc_openRecruitAI";

			idc = 1607;
			text = "AI GROUP MENU"; //--- ToDo: Localize;
			x = 0.592797 * safezoneW + safezoneX;
			y = 0.587992 * safezoneH + safezoneY;
			w = 0.113419 * safezoneW;
			h = 0.0439961 * safezoneH;
			tooltip = "Opens group management menu"; //--- ToDo: Localize;
		};
		class RscButton_1608: RscButton
		{
			action = "closedialog 0; [] spawn GDGM_fnc_openTPMap";

			idc = 1608;
			text = "TELEPORT TO NODE"; //--- ToDo: Localize;
			x = 0.469068 * safezoneW + safezoneX;
			y = 0.532997 * safezoneH + safezoneY;
			w = 0.113419 * safezoneW;
			h = 0.0439961 * safezoneH;
			tooltip = "Teleport to a friendly node, only available when close to a friendly node or your faction commander."; //--- ToDo: Localize;
		};
		class btnClose: RscButton
		{
			action = "closedialog 0";

			idc = 1609;
			text = "CLOSE"; //--- ToDo: Localize;
			x = 0.597952 * safezoneW + safezoneX;
			y = 0.895965 * safezoneH + safezoneY;
			w = 0.113419 * safezoneW;
			h = 0.0439961 * safezoneH;
		};
		class txtWestSupplies: RscText
		{
			idc = 1000;
			text = "West:"; //--- ToDo: Localize;
			x = 0.190676 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.0824863 * safezoneW;
			h = 0.0329971 * safezoneH;
			colorText[] = {0,0,0,1};
		};
		class txtEastSupplies: RscText
		{
			idc = 1001;
			text = "East:"; //--- ToDo: Localize;
			x = 0.190676 * safezoneW + safezoneX;
			y = 0.532997 * safezoneH + safezoneY;
			w = 0.0824863 * safezoneW;
			h = 0.0329971 * safezoneH;
			colorText[] = {0,0,0,1};
		};
		class txtIndSupplies: RscText
		{
			idc = 1002;
			text = "Ind:"; //--- ToDo: Localize;
			x = 0.190676 * safezoneW + safezoneX;
			y = 0.565994 * safezoneH + safezoneY;
			w = 0.0824863 * safezoneW;
			h = 0.0329971 * safezoneH;
			colorText[] = {0,0,0,1};
		};
		class ctrlTxtWestSupplies: RscText
		{
			idc = 110311;

			text = "<supplies>"; //--- ToDo: Localize;
			x = 0.273163 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.0824863 * safezoneW;
			h = 0.0329971 * safezoneH;
			colorText[] = {0,0,0,1};
		};
		class ctrlTxtEastSupplies: RscText
		{
			idc = 110312;

			text = "<supplies>"; //--- ToDo: Localize;
			x = 0.273163 * safezoneW + safezoneX;
			y = 0.532997 * safezoneH + safezoneY;
			w = 0.0824863 * safezoneW;
			h = 0.0329971 * safezoneH;
			colorText[] = {0,0,0,1};
		};
		class ctrlTxtIndSupllies: RscText
		{
			idc = 110313;

			text = "<supplies>"; //--- ToDo: Localize;
			x = 0.273163 * safezoneW + safezoneX;
			y = 0.565994 * safezoneH + safezoneY;
			w = 0.0824863 * safezoneW;
			h = 0.0329971 * safezoneH;
			colorText[] = {0,0,0,1};
		};
		class ctrlTxtWestReserves: RscText
		{
			idc = 8053;

			text = "<reserves>"; //--- ToDo: Localize;
			x = 0.319561 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.0824863 * safezoneW;
			h = 0.0329971 * safezoneH;
			colorText[] = {0,0,0,1};
		};
		class ctrlTxtEastReserves: RscText
		{
			idc = 8052;

			text = "<reserves>"; //--- ToDo: Localize;
			x = 0.319561 * safezoneW + safezoneX;
			y = 0.532997 * safezoneH + safezoneY;
			w = 0.0824863 * safezoneW;
			h = 0.0329971 * safezoneH;
			colorText[] = {0,0,0,1};
		};
		class ctrlTxtIndReserves: RscText
		{
			idc = 8051;

			text = "<reserves>"; //--- ToDo: Localize;
			x = 0.319561 * safezoneW + safezoneX;
			y = 0.565994 * safezoneH + safezoneY;
			w = 0.0824863 * safezoneW;
			h = 0.0329971 * safezoneH;
			colorText[] = {0,0,0,1};
		};
		class txtSupplies: RscText
		{
			idc = 1009;
			text = "Supplies"; //--- ToDo: Localize;
			x = 0.273163 * safezoneW + safezoneX;
			y = 0.456004 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.055 * safezoneH;
			colorText[] = {0,0,0,1};
		};
		class txtReserves: RscText
		{
			idc = 1010;
			text = "Reserves"; //--- ToDo: Localize;
			x = 0.324717 * safezoneW + safezoneX;
			y = 0.456004 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.055 * safezoneH;
			colorText[] = {0,0,0,1};
		};
		class txtVehReserves: RscText
		{
			idc = 1011;
			text = "Friendly vehicle reserves: "; //--- ToDo: Localize;
			x = 0.185521 * safezoneW + safezoneX;
			y = 0.60999 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.0440001 * safezoneH;
			colorText[] = {0,0,0,1};
		};
		class txtVehTrucks: RscText
		{
			idc = 1012;
			text = "Trucks:"; //--- ToDo: Localize;
			x = 0.195832 * safezoneW + safezoneX;
			y = 0.642987 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.055 * safezoneH;
			colorText[] = {0,0,0,1};
		};
		class txtAPC: RscText
		{
			idc = 1013;
			text = "APC's:"; //--- ToDo: Localize;
			x = 0.195832 * safezoneW + safezoneX;
			y = 0.675984 * safezoneH + safezoneY;
			w = 0.0360937 * safezoneW;
			h = 0.0440001 * safezoneH;
			colorText[] = {0,0,0,1};
		};
		class txtTanks: RscText
		{
			idc = 1014;
			text = "Tanks: "; //--- ToDo: Localize;
			x = 0.195832 * safezoneW + safezoneX;
			y = 0.697982 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.055 * safezoneH;
			colorText[] = {0,0,0,1};
		};
		class txtTrHeli: RscText
		{
			idc = 1015;
			text = "Transport aircrafts:"; //--- ToDo: Localize;
			x = 0.195832 * safezoneW + safezoneX;
			y = 0.73098 * safezoneH + safezoneY;
			w = 0.0773437 * safezoneW;
			h = 0.0440001 * safezoneH;
			colorText[] = {0,0,0,1};
		};
		class txtArmedHeli: RscText
		{
			idc = "1-1017";

			text = "Combat aircrafts:"; //--- ToDo: Localize;
			x = 0.195832 * safezoneW + safezoneX;
			y = 0.752978 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.055 * safezoneH;
			colorText[] = {0,0,0,1};
		};
		class ctrlTruckReserves: RscText
		{
			idc = 29051;

			text = "<reserves>"; //--- ToDo: Localize;
			x = 0.288629 * safezoneW + safezoneX;
			y = 0.653986 * safezoneH + safezoneY;
			w = 0.0824863 * safezoneW;
			h = 0.0329971 * safezoneH;
			colorText[] = {0,0,0,1};
		};
		class ctrlAPCReserves: RscText
		{
			idc = 29052;

			text = "<reserves>"; //--- ToDo: Localize;
			x = 0.288629 * safezoneW + safezoneX;
			y = 0.686983 * safezoneH + safezoneY;
			w = 0.0773437 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {0,0,0,1};
		};
		class ctrlTankReserves: RscText
		{
			idc = 29053;

			text = "<reserves>"; //--- ToDo: Localize;
			x = 0.288629 * safezoneW + safezoneX;
			y = 0.708981 * safezoneH + safezoneY;
			w = 0.0824863 * safezoneW;
			h = 0.0329971 * safezoneH;
			colorText[] = {0,0,0,1};
		};
		class ctrlTrHeliReserves: RscText
		{
			idc = 29054;

			text = "<reserves>"; //--- ToDo: Localize;
			x = 0.288629 * safezoneW + safezoneX;
			y = 0.741979 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {0,0,0,1};
		};
		class ctrlCombatHeliReserves: RscText
		{
			idc = 29055;

			text = "<reserves>"; //--- ToDo: Localize;
			x = 0.288629 * safezoneW + safezoneX;
			y = 0.763977 * safezoneH + safezoneY;
			w = 0.0824863 * safezoneW;
			h = 0.0329971 * safezoneH;
			colorText[] = {0,0,0,1};
		};
		class btnGhost: RscButton
		{
			idc = 01091;
			text = "Activate ghost mode"; //--- ToDo: Localize;
			x = 0.0153125 * safezoneW + safezoneX;
			y = 0.94 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.044 * safezoneH;
			tooltip = "!!! When activated, ghost mode prevents you from triggering any spawn trigger, useful for pilots !!!"; //--- ToDo: Localize;

			action = "closedialog 0; [] spawn GDGM_fnc_toggleGhostMode";
		};
		class btnGarbage: RscButton
		{
			action = "closedialog 0; [] remoteExec ['GDGM_fnc_nodeGarbageCollector',2]";
			idc = -1;

			text = "COLLECT GARBAGE"; //--- ToDo: Localize;
			x = 0.592812 * safezoneW + safezoneX;
			y = 0.698 * safezoneH + safezoneY;
			w = 0.113419 * safezoneW;
			h = 0.043996 * safezoneH;
			tooltip = "Despawn all unecessary positions"; //--- ToDo: Localize;
		};
		class btnRemoveAO: RscButton
		{
			idc = 04011;
			action = "closedialog 0; [] remoteExec ['GDGM_fnc_removeAO',2]; hint 'AO removed'";

			text = "Remove AO"; //--- ToDo: Localize;
			x = 0.0153125 * safezoneW + safezoneX;
			y = 0.885 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.044 * safezoneH;
			tooltip = "Removes the AO area"; //--- ToDo: Localize;
		};
		class btnSetAO: RscButton
		{
			idc = 04012;
			action = "closedialog 0; [] spawn GDGM_fnc_openSetAo";

			text = "Set AO"; //--- ToDo: Localize;
			x = 0.0153125 * safezoneW + safezoneX;
			y = 0.83 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.044 * safezoneH;
			tooltip = "Allows tou to set a square area where node can spawn. Nodes outside this area won't spawn."; //--- ToDo: Localize;
		};
	};
	class ControlsBackground
	{
		class frame: RscPicture
		{
			idc = -1;
			text = "Images\PlayerMenu.paa";
			x = 0.164899 * safezoneW + safezoneX;
			y = -0.0169541 * safezoneH + safezoneY;
			w = 0.634113 * safezoneW;
			h = 1.03391 * safezoneH;
		};
	};
};