/*
	"TKO DieBaustelle" v 1 static mission for Rosche.
*/

private ["_AICount", "_AIMaxReinforcements", "_AItrigger", "_AIwave", "_AIdelay", "_staticguns", "_missionObjs", "_crate0", "_cash0", "_crate_loot_values0", "_crate_weapons0", "_crate_items0", "_difficultyM", "_difficulty", "_PossibleDifficulty", "_msgWIN", "_vehicle", "_pinCode", "_VehicleChance"];

// For logging purposes
_num = DMS_MissionCount;

// Set mission side (only "bandit" is supported for now)
_side = "bandit";

_pos = [13136,7401.68,0]; //insert the centre here

if ([_pos,DMS_StaticMinPlayerDistance] call DMS_fnc_IsPlayerNearby) exitWith {"delay"};

//create possible difficulty add more of one difficulty to weight it towards that
_PossibleDifficulty		= 	[	
                                "easy",
								"moderate",
								"difficult",
								"hardcore"
							];
//choose mission difficulty and set value and is also marker colour
_difficultyM = selectRandom _PossibleDifficulty;

switch (_difficultyM) do
{
	case "easy":
	{
_difficulty = "easy";									//AI difficulty
_AICount = (15 + (round (random 5)));					//AI starting numbers
_AIMaxReinforcements = (4 + (round (random 1)));		//AI reinforcement cap , AI Verstärkungskappe
_AItrigger = (6 + (round (random 2)));					//If AI numbers fall below this number then reinforce if any left from AIMax , Maximaler AI-Wert in Verstärkungswellen
_AIwave = (1 + (round (random 1)));						//Max amount of AI in reinforcement wave
_AIdelay = (1 + (round (random 1)));					//The delay between reinforcements ,Die Verzögerung zwischen Verstärkungen
_VehicleChance = 20;									//10% SpawnPersistentVehicle chance
_crate_weapons0 	= (40 + (round (random 5)));		//Crate 0 weapons number
_crate_items0 		= (40 + (round (random 5)));		//Crate 0 items number
_cash0 = (50000 + round (random (15000)));				//Tabs for crate0
	};
	case "moderate":
	{
_difficulty = "moderate";
_AICount = (20 + (round (random 2)));
_AIMaxReinforcements = (4 + (round (random 1)));		//AI reinforcement cap , AI Verstärkungskappe
_AItrigger = (6 + (round (random 2)));					//If AI numbers fall below this number then reinforce if any left from AIMax , Maximaler AI-Wert in Verstärkungswellen
_AIwave = (1 + (round (random 1)));						//Max amount of AI in reinforcement wave
_AIdelay = (1 + (round (random 1)));					//The delay between reinforcements ,Die Verzögerung zwischen Verstärkungen
_VehicleChance = 50;									//20% SpawnPersistentVehicle chance
_crate_weapons0 	= (50 + (round (random 5)));
_crate_items0 		= (40 + (round (random 5)));
_cash0 = (70000 + round (random (15000)));				//Tabs for crate0
	};
	case "difficult":
	{
_difficulty = "difficult";
_AICount = (22 + (round (random 5)));
_AIMaxReinforcements = (8 + (round (random 1)));		//AI reinforcement cap , AI Verstärkungskappe
_AItrigger = (6 + (round (random 2)));					//If AI numbers fall below this number then reinforce if any left from AIMax , Maximaler AI-Wert in Verstärkungswellen
_AIwave = (1 + (round (random 1)));						//Max amount of AI in reinforcement wave
_AIdelay = (1 + (round (random 1)));					//The delay between reinforcements ,Die Verzögerung zwischen Verstärkungen
_VehicleChance = 90;									//20% SpawnPersistentVehicle chance
_crate_weapons0 	= (60 + (round (random 5)));
_crate_items0 		= (40 + (round (random 5)));
_cash0 = (70000 + round (random (15000)));				//Tabs for crate0
	};
	//case "hardcore":
	default
	{
_difficulty = "hardcore";
_AICount = (25 + (round (random 5)));
_AIMaxReinforcements = (8 + (round (random 1)));		//AI reinforcement cap , AI Verstärkungskappe
_AItrigger = (6 + (round (random 2)));					//If AI numbers fall below this number then reinforce if any left from AIMax , Maximaler AI-Wert in Verstärkungswellen
_AIwave = (1 + (round (random 1)));						//Max amount of AI in reinforcement wave
_AIdelay = (1 + (round (random 1)));					//The delay between reinforcements ,Die Verzögerung zwischen Verstärkungen
_VehicleChance = 70;									//20% SpawnPersistentVehicle chance
_crate_weapons0 	= (60 + (round (random 5)));
_crate_items0 		= (50 + (round (random 5)));
_cash0 = (80000 + round (random (15000)));				//Tabs for crate0
	};
};

// Define spawn locations for AI Soldiers. These will be used for the initial spawning of AI as well as reinforcements.
// The center spawn location is added 3 times so at least 3 AI will spawn initially at the center location, and so that future reinforcements are more likely to spawn at the center.
_AISoldierSpawnLocations =
[
	//AI
	[13164.8,7433.1,0],
	[13154.6,7385.52,0],
	[13132.9,7383.16,0],
	[13119.3,7383.33,0],
	[13153,7367.02,0],
	[13203.6,7363.94,0],
	[13217.6,7333.66,0],
	[13189.1,7336.6,0],
	[13102.7,7357.22,0],
	[13075.7,7330.24,0],
	[13105.7,7411.7,0],
	[13067.2,7433.01,0],
	[13038.2,7470.9,0],
	[13042.8,7501.31,0],
	[13100,7480.81,0],
	[13123.2,7471.6,0],
	[13129.9,7491.21,0],
	[13123.1,7451.99,0],
	[13181.2,7500.37,0],
	[13209.8,7480.5,0],
	[13238.4,7428.16,0],
	[13252.3,7509.9,0],
	[13195.3,7383.17,0],
	[13188.4,7417.97,0],
	[13183.3,7458.76,0]
];

_group =
[
	_AISoldierSpawnLocations+[_pos,_pos,_pos],			// Pass the regular spawn locations as well as the center pos 3x
	_AICount,											// Set in difficulty select
	_difficulty,										// Set in difficulty select
	"random",
	_side
] call DMS_fnc_SpawnAIGroup_MultiPos;

//Reduce Static guns if mission is easy
if (_difficultyM isEqualTo "easy") then {
_staticGuns =
[
	[
    //HochHMG
	[13110.2,7436.38,12.127],
	[13116.4,7411.29,15.602],
	[13139.8,7420.06,12.352],
	[13141.8,7419.71,8.450],
	[13146.7,7447.85,7.305],
	[13141.2,7451.13,3.895],
	[13113.8,7405.89,5.865],
	[13147.7,7413.51,4.516],
	//BodenHMG
	[13246.7,7417.28,0],
	[13250.8,7435.96,0],
	[13218.4,7370.19,0],
	[13162.7,7356.86,0],
	[13114.8,7348.43,0],
	[13123,7364.35,0],
	[13091.3,7328.98,0],
	[13077.5,7461.92,0],
	[13016.4,7501.11,0],
	[13022.9,7502.35,0],
	[13117.1,7452.31,0],
	[13136.3,7478.78,0],
	[13207.8,7510.18,0],
	[13248.3,7526.46,0],
	[13213.1,7487.49,0],
	[13225.1,7495.22,0],
	[13193.7,7492.73,0],
	[13162.9,7385.43,0],
	[13114.4,7382.96,0],
	[13161.1,7422.97,0]
	],
	_group,
	"assault",
	_difficulty,
	"bandit",
	"random"
] call DMS_fnc_SpawnAIStaticMG;
										} else
										{
_staticGuns =
[
	[
    //HochHMG
	[13110.2,7436.38,12.127],
	[13116.4,7411.29,15.602],
	[13139.8,7420.06,12.352],
	[13141.8,7419.71,8.450],
	[13146.7,7447.85,7.305],
	[13141.2,7451.13,3.895],
	[13113.8,7405.89,5.865],
	[13147.7,7413.51,4.516],
	//BodenHMG
	[13246.7,7417.28,0],
	[13250.8,7435.96,0],
	[13218.4,7370.19,0],
	[13162.7,7356.86,0],
	[13114.8,7348.43,0],
	[13123,7364.35,0],
	[13091.3,7328.98,0],
	[13077.5,7461.92,0],
	[13016.4,7501.11,0],
	[13022.9,7502.35,0],
	[13117.1,7452.31,0],
	[13136.3,7478.78,0],
	[13207.8,7510.18,0],
	[13248.3,7526.46,0],
	[13213.1,7487.49,0],
	[13225.1,7495.22,0],
	[13193.7,7492.73,0],
	[13162.9,7385.43,0],
	[13114.4,7382.96,0],
	[13161.1,7422.97,0]
	],
	_group,
	"assault",
	_difficulty,
	"bandit",
	"random"
] call DMS_fnc_SpawnAIStaticMG;
										};

// Define the classnames and locations where the crates can spawn (at least 2, since we're spawning 2 crates)
_crateClasses_and_Positions =
[
	//Loot
	//[[17648.3,34220.8,0],"I_CargoNet_01_ammo_F"],
	//[[17594.7,34218.3,0],"I_CargoNet_01_ammo_F"],
	//[[17671,34197,0],"I_CargoNet_01_ammo_F"],
	[[13165.5,7383.16,0],"I_CargoNet_01_ammo_F"],
	[[13112.7,7370.35,0],"I_CargoNet_01_ammo_F"],
	[[13084.5,7457.31,0],"I_CargoNet_01_ammo_F"]
];

{
	deleteVehicle (nearestObject _x);		// Make sure to remove any previous crates.
} forEach _crateClasses_and_Positions;

// Shuffle the list
_crateClasses_and_Positions = _crateClasses_and_Positions call ExileClient_util_array_shuffle;


// Create Crates
_crate0 = [_crateClasses_and_Positions select 0 select 1, _crateClasses_and_Positions select 0 select 0] call DMS_fnc_SpawnCrate;

// Don't think an armed AI vehicle fit the idea behind the mission. You're welcome to uncomment this if you want.
_veh =
[
	[
		[_pos,100,random 360] call DMS_fnc_SelectOffsetPos,
		_pos
	],
	_group,
	"assault",
	_difficulty,
	_side
] call DMS_fnc_SpawnAIVehicle;

// Enable smoke on the crates due to size of area
{
	_x setVariable ["DMS_AllowSmoke", true];
} forEach [_crate0];

// Define mission-spawned AI Units
_missionAIUnits =
[
	_group 		// We only spawned the single group for this mission
];

// Define the group reinforcements
_groupReinforcementsInfo =
[
	[
		_group,			// pass the group
		[
			[
				0,		// Let's limit number of units instead...
				0
			],
			[
				_AIMaxReinforcements,	// Maximum units that can be given as reinforcements (defined in difficulty selection).
				0
			]
		],
		[
			_AIdelay,		// The delay between reinforcements. >> you can change this in difficulty settings
			diag_tickTime
		],
		_AISoldierSpawnLocations,
		"random",
		_difficulty,
		_side,
		"reinforce",
		[
			_AItrigger,		// Set in difficulty select - Reinforcements will only trigger if there's fewer than X members left
			_AIwave			// X reinforcement units per wave. >> you can change this in mission difficulty section
		]
	]
];

// setup crates with items from choices
_crate_loot_values0 =
[
	_crate_weapons0,		// Set in difficulty select - Weapons
	_crate_items0			// Set in difficulty select - Items
];

// add cash to crates
_crate0 setVariable ["ExileMoney", _cash0,true];

// is %chance greater than random number O_APC_Tracked_02_cannon_F   O_T_APC_Wheeled_02_rcws_ghex_F  B_APC_Tracked_01_rcws_F   gorgon I_APC_Wheeled_03_cannon_F
if (_VehicleChance >= (random 100)) then {
											_pinCode = (1000 +(round (random 8999)));
											_vehicle = ["B_CTRG_Heli_Transport_01_sand_F",[13136,7401.68,0],_pinCode] call DMS_fnc_SpawnPersistentVehicle;
											_msgWIN = ['#0080ff',format ["Ihr habt die DieBaustelle gesichert,code ist %1...",_pinCode]];
											} else
											{
											_vehicle = ["B_CTRG_Heli_Transport_01_sand_F",[13136,7401.68,0]] call DMS_fnc_SpawnNonPersistentVehicle;
											_msgWIN = ['#0080ff',"Ihr habt die DieBaustelle gesichert"];
											};

// Define mission-spawned objects and loot values with vehicle
_missionObjs =
[
	_staticGuns,			// static gun(s). Note, we don't add the base itself because it already spawns on server start.
	[_vehicle],				// vehicle prize
	[[_crate0,_crate_loot_values0]]
];	
											
// Define Mission Start message
_msgStart = ['#FFFF00',format["In DieBaustelle werden Schwere Waffen von %1 Soldaten verladen",_difficultyM]];

// Define Mission Win message defined in vehicle choice

// Define Mission Lose message
_msgLOSE = ['#FF0000',"Guerilla haben den Stuff gesichert."];

// Define mission name (for map marker and logging)
_missionName = "DieBaustelle";

// Create Markers
_markers =
[
	_pos,
	_missionName,
	_difficultyM
] call DMS_fnc_CreateMarker;

_circle = _markers select 1;
_circle setMarkerDir 0;
_circle setMarkerSize [400,400];

_time = diag_tickTime;

// Parse and add mission info to missions monitor
_added =
[
	_pos,
	[
		[
			"kill",
			_group
		],
		[
			"playerNear",
			[_pos,100]
		]
	],
	_groupReinforcementsInfo,
	[
		_time,
		DMS_StaticMissionTimeOut call DMS_fnc_SelectRandomVal
	],
	_missionAIUnits,
	_missionObjs,
	[_missionName,_msgWIN,_msgLOSE],
	_markers,
	_side,
	_difficultyM,
	[[],[]]
] call DMS_fnc_AddMissionToMonitor_Static;

// Check to see if it was added correctly, otherwise delete the stuff
if !(_added) exitWith
{
	diag_log format ["DMS ERROR :: Attempt to set up mission %1 with invalid parameters for DMS_fnc_AddMissionToMonitor_Static! Deleting mission objects and resetting DMS_MissionCount.",_missionName];

	_cleanup = [];
	{
		_cleanup pushBack _x;
	} forEach _missionAIUnits;

	_cleanup pushBack ((_missionObjs select 0)+(_missionObjs select 1));
	
	{
		_cleanup pushBack (_x select 0);
	} foreach (_missionObjs select 2);

	_cleanup call DMS_fnc_CleanUp;

	// Delete the markers directly
	{deleteMarker _x;} forEach _markers;

	// Reset the mission count
	DMS_MissionCount = DMS_MissionCount - 1;
};

// Notify players
[_missionName,_msgStart] call DMS_fnc_BroadcastMissionStatus;

if (DMS_DEBUG) then
{
	(format ["MISSION: (%1) :: Mission #%2 started at %3 with %4 AI units and %5 difficulty at time %6",_missionName,_num,_pos,_AICount,_difficulty,_time]) call DMS_fnc_DebugLog;
};
