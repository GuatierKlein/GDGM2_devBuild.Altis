
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


/* #Merebo
$[
	1.063,
	["dsqds",[[0,0,1,1],0.025,0.04,"GUI_GRID"],0,0,0],
	[1200,"frame",[1,"Images\PlayerMenu.paa",["0.164899 * safezoneW + safezoneX","-0.0169541 * safezoneH + safezoneY","0.634113 * safezoneW","1.03391 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1600,"btnSave",[1,"SAVE",["0.592797 * safezoneW + safezoneX","0.423007 * safezoneH + safezoneY","0.113419 * safezoneW","0.0439961 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"Save the game","-1"],["action = |closedialog 0; [] remoteExec [^GDGM_fnc_save^,2]|;"]],
	[1601,"btnAttack",[1,"ATTACK MENU",["0.592797 * safezoneW + safezoneX","0.532997 * safezoneH + safezoneY","0.113419 * safezoneW","0.0439961 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"Order an attack ","-1"],["action = |closedialog 0; [] spawn GDGM_fnc_openSelectAttack|;"]],
	[1602,"btnCommander",[1,"CHANGE COMMANDER",["0.592797 * safezoneW + safezoneX","0.478002 * safezoneH + safezoneY","0.113419 * safezoneW","0.0439961 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"Change commander behaviour","-1"],["action = |closedialog 0; [] spawn GDGM_fnc_openSelectCommander|;"]],
	[1603,"btnCamp",[1,"CALL REINFORCEMENTS",["0.469068 * safezoneW + safezoneX","0.478002 * safezoneH + safezoneY","0.113419 * safezoneW","0.0439961 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"A truck will bring a squad of AIs to fill your group","-1"],["action = |closedialog 0; [player] remoteExec [^GDGM_fnc_playerReinf^,2]|;"]],
	[1604,"btnAmmo",[1,"CALL SUPPLIES",["0.469068 * safezoneW + safezoneX","0.423007 * safezoneH + safezoneY","0.113419 * safezoneW","0.0439961 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"A truck or helicopter will deliver you ammo","-1"],["action = |closedialog 0; [position player, side player, player] remoteExec [^GDGM_fnc_ammoOnPos^,2]|;"]],
	[1605,"btnCrate",[1,"DROP SUPPLY CRATE",["0.469068 * safezoneW + safezoneX","0.587992 * safezoneH + safezoneY","0.113419 * safezoneW","0.0439961 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"Drop a small supply crate to build (only for engineers)","-1"],["action = |closedialog 0; [player, ^small^] remoteExec [^GDGM_fnc_spawnLogiCrate^,2]|;"]],
	[1606,"RscButton_1606",[1,"BUILD MENU",["0.592797 * safezoneW + safezoneX","0.642987 * safezoneH + safezoneY","0.113419 * safezoneW","0.0439961 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"Opens build menu (only for engineers)","-1"],["action = |closedialog 0; [player] spawn GDGM_fnc_openBuildMenu|;"]],
	[1607,"RscButton_1607",[1,"AI GROUP MENU",["0.592797 * safezoneW + safezoneX","0.587992 * safezoneH + safezoneY","0.113419 * safezoneW","0.0439961 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"Opens group management menu","-1"],["action = |closedialog 0; [player] spawn GDGM_fnc_openRecruitAI|;"]],
	[1608,"RscButton_1608",[1,"TELEPORT TO NODE",["0.469068 * safezoneW + safezoneX","0.532997 * safezoneH + safezoneY","0.113419 * safezoneW","0.0439961 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"Teleport to a friendly node, only available when close to a friendly node or your faction commander.","-1"],["action = |closedialog 0; [] spawn GDGM_fnc_openTPMap|;"]],
	[1609,"btnClose",[1,"CLOSE",["0.597952 * safezoneW + safezoneX","0.895965 * safezoneH + safezoneY","0.113419 * safezoneW","0.0439961 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],["action = |closedialog 0|;"]],
	[1000,"txtWestSupplies",[1,"West:",["0.190676 * safezoneW + safezoneX","0.5 * safezoneH + safezoneY","0.0824863 * safezoneW","0.0329971 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1001,"txtEastSupplies",[1,"East:",["0.190676 * safezoneW + safezoneX","0.532997 * safezoneH + safezoneY","0.0824863 * safezoneW","0.0329971 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1002,"txtIndSupplies",[1,"Ind:",["0.190676 * safezoneW + safezoneX","0.565994 * safezoneH + safezoneY","0.0824863 * safezoneW","0.0329971 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1003,"ctrlTxtWestSupplies",[1,"<supplies>",["0.273163 * safezoneW + safezoneX","0.5 * safezoneH + safezoneY","0.0824863 * safezoneW","0.0329971 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],["idc = 110311;"]],
	[1004,"ctrlTxtEastSupplies",[1,"<supplies>",["0.273163 * safezoneW + safezoneX","0.532997 * safezoneH + safezoneY","0.0824863 * safezoneW","0.0329971 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],["idc = 110312;"]],
	[1005,"ctrlTxtIndSupllies",[1,"<supplies>",["0.273163 * safezoneW + safezoneX","0.565994 * safezoneH + safezoneY","0.0824863 * safezoneW","0.0329971 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],["idc = 110313;"]],
	[1006,"ctrlTxtWestReserves",[1,"<reserves>",["0.319561 * safezoneW + safezoneX","0.5 * safezoneH + safezoneY","0.0824863 * safezoneW","0.0329971 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],["idc = 8053;"]],
	[1007,"ctrlTxtEastReserves",[1,"<reserves>",["0.319561 * safezoneW + safezoneX","0.532997 * safezoneH + safezoneY","0.0824863 * safezoneW","0.0329971 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],["idc = 8052;"]],
	[1008,"ctrlTxtIndReserves",[1,"<reserves>",["0.319561 * safezoneW + safezoneX","0.565994 * safezoneH + safezoneY","0.0824863 * safezoneW","0.0329971 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],["idc = 8051;"]],
	[1009,"txtSupplies",[1,"Supplies",["0.273163 * safezoneW + safezoneX","0.456004 * safezoneH + safezoneY","0.04125 * safezoneW","0.055 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1010,"txtReserves",[1,"Reserves",["0.324717 * safezoneW + safezoneX","0.456004 * safezoneH + safezoneY","0.04125 * safezoneW","0.055 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1011,"txtVehReserves",[1,"Friendly vehicle reserves: ",["0.185521 * safezoneW + safezoneX","0.60999 * safezoneH + safezoneY","0.0979687 * safezoneW","0.0440001 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1012,"txtVehTrucks",[1,"Trucks:",["0.195832 * safezoneW + safezoneX","0.642987 * safezoneH + safezoneY","0.04125 * safezoneW","0.055 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1013,"txtAPC",[1,"APC's:",["0.195832 * safezoneW + safezoneX","0.675984 * safezoneH + safezoneY","0.0360937 * safezoneW","0.0440001 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1014,"txtTanks",[1,"Tanks: ",["0.195832 * safezoneW + safezoneX","0.697982 * safezoneH + safezoneY","0.04125 * safezoneW","0.055 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1015,"txtTrHeli",[1,"Transport aircrafts:",["0.195832 * safezoneW + safezoneX","0.73098 * safezoneH + safezoneY","0.0773437 * safezoneW","0.0440001 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1016,"txtArmedHeli",[1,"Combat aircrafts:",["0.195832 * safezoneW + safezoneX","0.752978 * safezoneH + safezoneY","0.0721875 * safezoneW","0.055 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],["idc = |1-1017|;"]],
	[1017,"ctrlTruckReserves",[1,"<reserves>",["0.288629 * safezoneW + safezoneX","0.653986 * safezoneH + safezoneY","0.0824863 * safezoneW","0.0329971 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],["idc = 29051;"]],
	[1018,"ctrlAPCReserves",[1,"<reserves>",["0.288629 * safezoneW + safezoneX","0.686983 * safezoneH + safezoneY","0.0773437 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],["idc = 29052;"]],
	[1019,"ctrlTankReserves",[1,"<reserves>",["0.288629 * safezoneW + safezoneX","0.708981 * safezoneH + safezoneY","0.0824863 * safezoneW","0.0329971 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],["idc = 29053;"]],
	[1020,"ctrlTrHeliReserves",[1,"<reserves>",["0.288629 * safezoneW + safezoneX","0.741979 * safezoneH + safezoneY","0.0825 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],["idc = 29054;"]],
	[1021,"ctrlCombatHeliReserves",[1,"<reserves>",["0.288629 * safezoneW + safezoneX","0.763977 * safezoneH + safezoneY","0.0824863 * safezoneW","0.0329971 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],["idc = 29055;"]]
]
*/









