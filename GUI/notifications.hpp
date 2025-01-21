class CfgNotifications
{
	class GDGM_townCaptured
	{
		title = "Town captured";				// Title displayed as text on black background. Filled by arguments.
		iconPicture = "\A3\ui_f\data\map\mapcontrol\taskIcon_ca.paa";		// Small icon displayed in left part. Colored by "color", filled by arguments.
		iconText = "";			// Short text displayed over the icon. Colored by "color", filled by arguments.
		description = "%1 (%2) was captured by %3";		// Brief description displayed as structured text. Colored by "color", filled by arguments.
		duration = 5;			// How many seconds will the notification be displayed
		priority = 0;			// Priority; higher number = more important; tasks in queue are selected by priority
	};
	class GDGM_resupplied
	{
		title = "Resupplied";				// Title displayed as text on black background. Filled by arguments.
		iconPicture = "\A3\ui_f\data\map\mapcontrol\taskIcon_ca.paa";		// Small icon displayed in left part. Colored by "color", filled by arguments.
		iconText = "";			// Short text displayed over the icon. Colored by "color", filled by arguments.
		description = "Supplies and new reserves have arrived!";		// Brief description displayed as structured text. Colored by "color", filled by arguments.
		duration = 5;			// How many seconds will the notification be displayed
		priority = 0;			// Priority; higher number = more important; tasks in queue are selected by priority
	};
	class GDGM_vehSpawned
	{
		title = "Vehicle spawned";				// Title displayed as text on black background. Filled by arguments.
		iconPicture = "\A3\ui_f\data\map\mapcontrol\taskIcon_ca.paa";		// Small icon displayed in left part. Colored by "color", filled by arguments.
		iconText = "";			// Short text displayed over the icon. Colored by "color", filled by arguments.
		description = "Your new %1 is ready!";		// Brief description displayed as structured text. Colored by "color", filled by arguments.
		duration = 5;			// How many seconds will the notification be displayed
		priority = 0;			// Priority; higher number = more important; tasks in queue are selected by priority
	};
	class GDGM_vehGarage
	{
		title = "Vehicle put to garage";				// Title displayed as text on black background. Filled by arguments.
		iconPicture = "\A3\ui_f\data\map\mapcontrol\taskIcon_ca.paa";		// Small icon displayed in left part. Colored by "color", filled by arguments.
		iconText = "";			// Short text displayed over the icon. Colored by "color", filled by arguments.
		description = "%1 was put back in the reserve";		// Brief description displayed as structured text. Colored by "color", filled by arguments.
		duration = 5;			// How many seconds will the notification be displayed
		priority = 0;			// Priority; higher number = more important; tasks in queue are selected by priority
	};
	class GDGM_vehCaptured
	{
		title = "Vehicle captured";				// Title displayed as text on black background. Filled by arguments.
		iconPicture = "\A3\ui_f\data\map\mapcontrol\taskIcon_ca.paa";		// Small icon displayed in left part. Colored by "color", filled by arguments.
		iconText = "";			// Short text displayed over the icon. Colored by "color", filled by arguments.
		description = "%1 was captured";		// Brief description displayed as structured text. Colored by "color", filled by arguments.
		duration = 5;			// How many seconds will the notification be displayed
		priority = 0;			// Priority; higher number = more important; tasks in queue are selected by priority
	};
	class GDGM_airThreat
	{
		title = "Air threat";				// Title displayed as text on black background. Filled by arguments.
		iconPicture = "\A3\ui_f\data\map\mapcontrol\taskIcon_ca.paa";		// Small icon displayed in left part. Colored by "color", filled by arguments.
		iconText = "";			// Short text displayed over the icon. Colored by "color", filled by arguments.
		description = "%1 air threat increased!";		// Brief description displayed as structured text. Colored by "color", filled by arguments.
		duration = 5;			// How many seconds will the notification be displayed
		priority = 0;			// Priority; higher number = more important; tasks in queue are selected by priority
	};
	class GDGM_attackSpawned
	{
		title = "Attack spawned";				// Title displayed as text on black background. Filled by arguments.
		iconPicture = "\A3\ui_f\data\map\mapcontrol\taskIcon_ca.paa";		// Small icon displayed in left part. Colored by "color", filled by arguments.
		iconText = "";			// Short text displayed over the icon. Colored by "color", filled by arguments.
		description = "The attack of %1 on %2 has spawned";		// Brief description displayed as structured text. Colored by "color", filled by arguments.
		duration = 5;			// How many seconds will the notification be displayed
		priority = 0;			// Priority; higher number = more important; tasks in queue are selected by priority
	};
	class GDGM_reconParty_go
	{
		title = "Recon mission";				// Title displayed as text on black background. Filled by arguments.
		iconPicture = "\A3\ui_f\data\map\mapcontrol\taskIcon_ca.paa";		// Small icon displayed in left part. Colored by "color", filled by arguments.
		iconText = "";			// Short text displayed over the icon. Colored by "color", filled by arguments.
		description = "Recon mission started";		// Brief description displayed as structured text. Colored by "color", filled by arguments.
		duration = 5;			// How many seconds will the notification be displayed
		priority = 0;			// Priority; higher number = more important; tasks in queue are selected by priority
	};
	class GDGM_reconParty_success
	{
		title = "Recon mission";				// Title displayed as text on black background. Filled by arguments.
		iconPicture = "\A3\ui_f\data\map\mapcontrol\taskIcon_ca.paa";		// Small icon displayed in left part. Colored by "color", filled by arguments.
		iconText = "";			// Short text displayed over the icon. Colored by "color", filled by arguments.
		description = "Recon mission came back and is a success";		// Brief description displayed as structured text. Colored by "color", filled by arguments.
		duration = 5;			// How many seconds will the notification be displayed
		priority = 0;			// Priority; higher number = more important; tasks in queue are selected by priority
	};
	class GDGM_reconParty_failure
	{
		title = "Recon mission";				// Title displayed as text on black background. Filled by arguments.
		iconPicture = "\A3\ui_f\data\map\mapcontrol\taskIcon_ca.paa";		// Small icon displayed in left part. Colored by "color", filled by arguments.
		iconText = "";			// Short text displayed over the icon. Colored by "color", filled by arguments.
		description = "Recon party did not come back";		// Brief description displayed as structured text. Colored by "color", filled by arguments.
		duration = 5;			// How many seconds will the notification be displayed
		priority = 0;			// Priority; higher number = more important; tasks in queue are selected by priority
	};
	class GDGM_offensive
	{
		title = "Offensive";				// Title displayed as text on black background. Filled by arguments.
		iconPicture = "\A3\ui_f\data\map\mapcontrol\taskIcon_ca.paa";		// Small icon displayed in left part. Colored by "color", filled by arguments.
		iconText = "";			// Short text displayed over the icon. Colored by "color", filled by arguments.
		description = "%1 launched an offensive!";		// Brief description displayed as structured text. Colored by "color", filled by arguments.
		duration = 5;			// How many seconds will the notification be displayed
		priority = 0;			// Priority; higher number = more important; tasks in queue are selected by priority
	};
};