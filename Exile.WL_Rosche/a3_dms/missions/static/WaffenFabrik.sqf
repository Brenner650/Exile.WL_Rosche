/*
	"TKO WaffenFabrik" v 1 static mission for Australia.
*/

private ["_AICount", "_AIMaxReinforcements", "_AItrigger", "_AIwave", "_AIdelay", "_staticguns", "_missionObjs", "_crate0", "_cash0", "_crate_loot_values0", "_crate_weapons0", "_crate_items0", "_difficultyM", "_difficulty", "_PossibleDifficulty", "_msgWIN", "_vehicle", "_pinCode", "_VehicleChance"];

// For logging purposes
_num = DMS_MissionCount;

// Set mission side (only "bandit" is supported for now)
_side = "bandit";

_pos = [6172.88,9881.58,0]; //insert the centre here

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
_AIMaxReinforcements = (1 + (round (random 1)));		//AI reinforcement cap , AI Verstärkungskappe
_AItrigger = (6 + (round (random 2)));					//If AI numbers fall below this number then reinforce if any left from AIMax , Maximaler AI-Wert in Verstärkungswellen
_AIwave = (1 + (round (random 1)));						//Max amount of AI in reinforcement wave
_AIdelay = (1 + (round (random 1)));					//The delay between reinforcements ,Die Verzögerung zwischen Verstärkungen
_VehicleChance = 10;									//10% SpawnPersistentVehicle chance
_crate_weapons0 	= (40 + (round (random 5)));		//Crate 0 weapons number
_crate_items0 		= (30 + (round (random 5)));		//Crate 0 items number
_cash0 = (30000 + round (random (1500)));				//Tabs for crate0
	};
	case "moderate":
	{
_difficulty = "moderate";
_AICount = (20 + (round (random 2)));
_AIMaxReinforcements = (1 + (round (random 1)));		//AI reinforcement cap , AI Verstärkungskappe
_AItrigger = (6 + (round (random 2)));					//If AI numbers fall below this number then reinforce if any left from AIMax , Maximaler AI-Wert in Verstärkungswellen
_AIwave = (1 + (round (random 1)));						//Max amount of AI in reinforcement wave
_AIdelay = (1 + (round (random 1)));					//The delay between reinforcements ,Die Verzögerung zwischen Verstärkungen
_VehicleChance = 10;									//20% SpawnPersistentVehicle chance
_crate_weapons0 	= (50 + (round (random 5)));
_crate_items0 		= (30 + (round (random 5)));
_cash0 = (40000 + round (random (1500)));				//Tabs for crate0
	};
	case "difficult":
	{
_difficulty = "difficult";
_AICount = (22 + (round (random 5)));
_AIMaxReinforcements = (1 + (round (random 1)));		//AI reinforcement cap , AI Verstärkungskappe
_AItrigger = (6 + (round (random 2)));					//If AI numbers fall below this number then reinforce if any left from AIMax , Maximaler AI-Wert in Verstärkungswellen
_AIwave = (1 + (round (random 1)));						//Max amount of AI in reinforcement wave
_AIdelay = (1 + (round (random 1)));					//The delay between reinforcements ,Die Verzögerung zwischen Verstärkungen
_VehicleChance = 10;									//20% SpawnPersistentVehicle chance
_crate_weapons0 	= (60 + (round (random 5)));
_crate_items0 		= (40 + (round (random 5)));
_cash0 = (50000 + round (random (1500)));				//Tabs for crate0
	};
	//case "hardcore":
	default
	{
_difficulty = "hardcore";
_AICount = (25 + (round (random 5)));
_AIMaxReinforcements = (1 + (round (random 1)));		//AI reinforcement cap , AI Verstärkungskappe
_AItrigger = (6 + (round (random 2)));					//If AI numbers fall below this number then reinforce if any left from AIMax , Maximaler AI-Wert in Verstärkungswellen
_AIwave = (1 + (round (random 1)));						//Max amount of AI in reinforcement wave
_AIdelay = (1 + (round (random 1)));					//The delay between reinforcements ,Die Verzögerung zwischen Verstärkungen
_VehicleChance = 20;									//20% SpawnPersistentVehicle chance
_crate_weapons0 	= (60 + (round (random 5)));
_crate_items0 		= (50 + (round (random 5)));
_cash0 = (70000 + round (random (1500)));				//Tabs for crate0
	};
};

// Define spawn locations for AI Soldiers. These will be used for the initial spawning of AI as well as reinforcements.
// The center spawn location is added 3 times so at least 3 AI will spawn initially at the center location, and so that future reinforcements are more likely to spawn at the center.
_AISoldierSpawnLocations =
[
	//AI
	[6159.39,9976.24,0],
	[6223.12,9995.13,0],
	[6223.6,9945.18,0],
	[6175.22,9942.21,0],
	[6161.36,9968.07,0],
	[6145.46,9968.25,0],
	[6129.1,9967.77,0],
	[6113.34,9971.95,0],
	[6120.75,9992.1,0],
	[6120.46,10006.3,0],
	[6135.41,9990.42,0],
	[6113.39,9945.35,0],
	[6115.28,9922.61,0],
	[6128.55,9917.77,0],
	[6150.55,9921.34,0],
	[6163.9,9932.69,0],
	[6099.36,9911.44,0],
	[6095.83,9871.16,0],
	[6096.16,9893.37,0],
	[6148.82,9871.44,0],
	[6143.9,9911,0],
	[6193.18,10000.9,0],
	[6169.32,10007.9,0],
	[6139.71,9952.69,0],
	[6129.12,9952.41,0]
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
	[6173.48,9994.72,7.225],
	[6173.56,9988.26,7.225],
	[6179.18,9986.3,3.73],
	[6141.35,9900.51,13.919],
	[6141.77,9896.08,13.681],
	[6142.25,9888.87,7.290],
	[6143.23,9854.12,6.831],
	[6115.91,9877.72,1.003],
	[6115.72,9900.65,1.003],
	[6126.3,9974.33,0.277],
	[6240.87,9933.82,17.806],
	[6238.55,9943.21,17.979],
	[6093.29,9852.66,17.803],
	[6085.09,9857.74,17.905],
	[6163.28,9909.19,3.127],
	[6167.6,9911.43,3.127],
	[6159.56,9916.09,3.127],
	//BodenHMG
	[6178,9960.29,0],
	[6194.5,9987.02,0],
	[6117.79,9995.95,0],
	[6117.66,9987.48,0],
	[6156.46,9995.72,0],
	[6152.06,9966.58,0],
	[6121.1,9953.75,0],
	[6111.48,9934.44,0],
	[6141.02,9872.97,0],
	[6241.48,9983.9,0],
	[6213.69,9942.52,0]
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
	[6173.48,9994.72,7.225],
	[6173.56,9988.26,7.225],
	[6179.18,9986.3,3.73],
	[6141.35,9900.51,13.919],
	[6141.77,9896.08,13.681],
	[6142.25,9888.87,7.290],
	[6143.23,9854.12,6.831],
	[6115.91,9877.72,1.003],
	[6115.72,9900.65,1.003],
	[6126.3,9974.33,0.277],
	[6240.87,9933.82,17.806],
	[6238.55,9943.21,17.979],
	[6093.29,9852.66,17.803],
	[6085.09,9857.74,17.905],
	[6163.28,9909.19,3.127],
	[6167.6,9911.43,3.127],
	[6159.56,9916.09,3.127],
	//BodenHMG
	[6178,9960.29,0],
	[6194.5,9987.02,0],
	[6117.79,9995.95,0],
	[6117.66,9987.48,0],
	[6156.46,9995.72,0],
	[6152.06,9966.58,0],
	[6121.1,9953.75,0],
	[6111.48,9934.44,0],
	[6141.02,9872.97,0],
	[6241.48,9983.9,0],
	[6213.69,9942.52,0]
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
	[[6155.14,9977.52,0],"I_CargoNet_01_ammo_F"],
	[[6236.05,9951.97,0],"I_CargoNet_01_ammo_F"],
	[[6181.39,9953.56,0],"I_CargoNet_01_ammo_F"],
	[[6140.26,9906.62,0],"I_CargoNet_01_ammo_F"],
	[[6107.99,9894.14,0],"I_CargoNet_01_ammo_F"]
];

{
	deleteVehicle (nearestObject _x);		// Make sure to remove any previous crates.
} forEach _crateClasses_and_Positions;

// Shuffle the list
_crateClasses_and_Positions = _crateClasses_and_Positions call ExileClient_util_array_shuffle;


// Create Crates
_crate0 = [_crateClasses_and_Positions select 0 select 1, _crateClasses_and_Positions select 0 select 0] call DMS_fnc_SpawnCrate;

// Don't think an armed AI vehicle fit the idea behind the mission. You're welcome to uncomment this if you want.
//_veh =
//[
//	[
//		[_pos,100,random 360] call DMS_fnc_SelectOffsetPos,
//		_pos
//	],
//	_group,
//	"assault",
//	_difficulty,
//	_side
//] call DMS_fnc_SpawnAIVehicle;

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

// is %chance greater than random number O_APC_Tracked_02_cannon_F   O_T_APC_Wheeled_02_rcws_ghex_F  B_APC_Tracked_01_rcws_F   gorgon I_APC_Wheeled_03_cannon_F ["O_T_APC_Tracked_02_cannon_ghex_F",[23130.7,19778.7,0],
if (_VehicleChance >= (random 100)) then {
											_pinCode = (1000 +(round (random 8999)));
											_vehicle = ["B_CTRG_Heli_Transport_01_sand_F",[6172.88,9881.58,0],_pinCode] call DMS_fnc_SpawnPersistentVehicle;
											_msgWIN = ['#0080ff',format ["Ihr habt die WaffenFabrik gesichert, code ist %1...",_pinCode]];
											} else
											{
											_vehicle = ["B_CTRG_Heli_Transport_01_sand_F",[6172.88,9881.58,0]] call DMS_fnc_SpawnNonPersistentVehicle;
											_msgWIN = ['#0080ff',"Ihr habt die WaffenFabrik gesichert"];
											};

// Define mission-spawned objects and loot values with vehicle
_missionObjs =
[
	_staticGuns,			// static gun(s). Note, we don't add the base itself because it already spawns on server start.
	[_vehicle],				// vehicle prize
	[[_crate0,_crate_loot_values0]]
];	
											
// Define Mission Start message
_msgStart = ['#FFFF00',format["In der WaffenFabrik werden Panzer von %1 Söldner verladen",_difficultyM]];

// Define Mission Win message defined in vehicle choice

// Define Mission Lose message
_msgLOSE = ['#FF0000',"Truppen haben den Panzer gesichert."];

// Define mission name (for map marker and logging)
_missionName = "WaffenFabrik";

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