//Modifed by Thomas [T.K.O] 
///////////////////////////////////////////////////////////////////////////////
// Static Objects
///////////////////////////////////////////////////////////////////////////////


/**
 * Created with Exile Mod 3DEN Plugin
 * www.exilemod.com  31089.324  5368.399
 */

if (!hasInterface || isServer) exitWith {};



// 37 NPCs
private _npcs = [
["Exile_Trader_WasteDump", ["HubStandingUC_move1"], "Exile_Trader_WasteDump", "WhiteHead_09", [[],[],[],["U_I_G_Story_Protagonist_F",[]],["V_Rangemaster_belt",[]],[],"H_MilCap_gry","G_Tactical_Clear",[],["","","","","",""]], [13890.9, 13903.9, 28.21], [-0.197811, -0.98024, 0], [0, 0, 1]],
["Exile_Trader_AircraftCustoms", [], "Exile_Trader_AircraftCustoms", "GreekHead_A3_07", [[],[],[],["Exile_Uniform_ExileCustoms",[]],["V_RebreatherB",[]],[],"H_PilotHelmetFighter_B","",[],["","","","","",""]], [13812.7, 13845.1, 32.3334], [-0.931729, 0.363153, 0], [0, 0, 1]],
["Exile_Trader_SpecialOperations", [], "Exile_Trader_SpecialOperations", "WhiteHead_18", [["arifle_MX_Black_F","","","",[],[],""],[],[],["U_B_CTRG_1",[]],["V_PlateCarrierGL_blk",[]],["B_Parachute",[]],"H_HelmetB_light_black","G_Balaclava_lowprofile",[],["","","","","","NVGoggles_OPFOR"]], [13852.8, 13804.4, 31.3946], [0.440911, -0.897551, 0], [0, 0, 1]],
["Exile_Trader_Aircraft", [], "Exile_Trader_Aircraft", "WhiteHead_01", [[],[],[],["U_I_pilotCoveralls",[]],[],[],"H_PilotHelmetHeli_O","",[],["","","","","",""]], [13820.4, 13869.5, 32.6345], [-0.710529, -0.703668, 0], [0, 0, 1]],
["Exile_Trader_Office", [], "Exile_Trader_Office", "WhiteHead_15", [[],[],[],["U_I_G_resistanceLeader_F",[]],["V_Rangemaster_belt",[]],[],"H_Hat_brown","",[],["","","","","",""]], [13828.6, 13823.1, 28.4173], [-0.516255, 0.856435, 0], [0, 0, 1]],
["Exile_Trader_Vehicle", ["HubStandingUC_move2"], "Exile_Trader_Vehicle", "WhiteHead_21", [[],[],[],["Exile_Uniform_ExileCustoms",[]],[],[],"H_RacingHelmet_4_F","",[],["","","","","",""]], [13823.1, 13820.5, 30.9992], [0.999208, -0.0397829, 0], [0, 0, 1]],
["Exile_Trader_VehicleCustoms", ["HubStandingUC_move1"], "Exile_Trader_VehicleCustoms", "WhiteHead_18", [[],[],[],["Exile_Uniform_ExileCustoms",[]],[],[],"","G_Tactical_Clear",[],["","","","","",""]], [13825.3, 13829.3, 30.9425], [-0.00122174, -0.999999, 0], [0, 0, 1]],
["Exile_Trader_Hardware", [], "Exile_Trader_Hardware", "Barklem", [[],[],[],["U_C_WorkerCoveralls",[]],["V_BandollierB_rgr",[]],["B_UAV_01_backpack_F",[]],"H_Booniehat_khk_hs","G_Tactical_Clear",[],["","","","","",""]], [13900.5, 13849.5, 28.5814], [-0.942157, 0.335171, 0], [0, 0, 1]],
["Exile_Trader_Food", [], "Exile_Trader_Food", "AfricanHead_02", [[],[],[],["U_C_Poloshirt_blue",[]],[],[],"H_Cap_tan","G_Combat",[],["","","","","",""]], [13903, 13855.8, 28.5628], [-0.565514, -0.824739, 0], [0, 0, 1]],
["Exile_Trader_Equipment", [], "Exile_Trader_Equipment", "AfricanHead_02", [["arifle_MX_GL_Black_F","","","",[],[],""],[],[],["U_BG_Guerrilla_6_1",[]],["V_I_G_resistanceLeader_F",[]],[],"H_Watchcap_khk","",[],["","","","","",""]], [13897, 13840.6, 28.5768], [-0.729376, 0.684113, 0], [0, 0, 1]],
["Exile_Trader_Armory", [], "Exile_Trader_Armory", "WhiteHead_13", [["srifle_DMR_06_olive_F","","","",[],[],""],[],[],["U_Rangemaster",[]],["V_Rangemaster_belt",[]],[],"H_Cap_headphones","G_Shades_Black",[],["","","","","",""]], [13899.5, 13846.7, 28.5814], [-0.724424, -0.689355, 0], [0, 0, 1]],
["Exile_Trader_RussianRoulette", ["HubStandingUC_move2"], "Exile_Trader_RussianRoulette", "WhiteHead_18", [[],[],["hgun_Pistol_Signal_F","","","",[],[],""],["U_Marshal",[]],["V_Rangemaster_belt",[]],[],"H_Cap_marshal","G_Sport_Blackyellow",[],["","","","","",""]], [13832.4, 13873.5, 27.6128], [0.559873, 0.828579, 0], [0, 0, 1]],
["Exile_Trader_AircraftCustoms", ["HubStandingUC_move1"], "Exile_Trader_AircraftCustoms", "WhiteHead_10", [[],[],[],["Exile_Uniform_ExileCustoms",[]],["V_RebreatherB",[]],[],"H_PilotHelmetFighter_B","G_Tactical_Black",[],["","","","","",""]], [961.555, 4559.61, 15.1314], [0.67595, -0.736947, 0], [0, 0, 1]],
["Exile_Trader_Aircraft", ["HubStandingUC_move1"], "Exile_Trader_Aircraft", "WhiteHead_13", [[],[],[],["U_I_pilotCoveralls",[]],[],[],"H_PilotHelmetHeli_O","G_Tactical_Clear",[],["","","","","",""]], [958.841, 4550.87, 15.1314], [-0.132066, -0.991241, 0], [0, 0, 1]],
["Exile_Trader_Armory", [], "Exile_Trader_Armory", "GreekHead_A3_09", [["srifle_DMR_06_olive_F","","","",[],[],""],[],[],["U_Rangemaster",[]],["V_Rangemaster_belt",[]],[],"H_Cap_headphones","G_Shades_Black",[],["","","","","",""]], [970.75, 4568.5, 15.1314], [0.652749, -0.757575, 0], [0, 0, 1]],
["Exile_Trader_Equipment", [], "Exile_Trader_Equipment", "AfricanHead_03", [["arifle_MX_GL_Black_F","","","",[],[],""],[],[],["U_BG_Guerrilla_6_1",[]],["V_I_G_resistanceLeader_F",[]],[],"H_Watchcap_khk","G_Tactical_Clear",[],["","","","","",""]], [975.984, 4572.97, 15.1314], [0.652268, -0.757989, 0], [0, 0, 1]],
["Exile_Trader_Food", ["HubStandingUC_move1"], "Exile_Trader_Food", "AfricanHead_02", [[],[],[],["U_C_Poloshirt_blue",[]],[],[],"H_Cap_tan","",[],["","","","","",""]], [1006.97, 4571.08, 15.1314], [-0.7076, -0.706613, 0], [0, 0, 1]],
["Exile_Trader_Hardware", ["HubStandingUC_move2"], "Exile_Trader_Hardware", "WhiteHead_15", [[],[],[],["U_C_WorkerCoveralls",[]],["V_BandollierB_rgr",[]],["B_UAV_01_backpack_F",[]],"H_Booniehat_khk_hs","G_Tactical_Clear",[],["","","","","",""]], [997.168, 4579.06, 15.1314], [-0.750146, -0.661273, 0], [0, 0, 1]],
["Exile_Trader_Office", ["HubStandingUC_move2"], "Exile_Trader_Office", "WhiteHead_04", [[],[],[],["U_I_G_resistanceLeader_F",[]],["V_Rangemaster_belt",[]],[],"H_Hat_brown","G_Combat",[],["","","","","",""]], [1010.81, 4528.24, 15.1314], [-0.758942, 0.651158, 0], [0, 0, 1]],
["Exile_Trader_SpecialOperations", [], "Exile_Trader_SpecialOperations", "AfricanHead_02", [["arifle_MX_Black_F","","","",[],[],""],[],[],["U_B_CTRG_1",[]],["V_PlateCarrierGL_blk",[]],["B_Parachute",[]],"H_HelmetB_light_black","G_Balaclava_lowprofile",[],["","","","","","NVGoggles_OPFOR"]], [990.111, 4577.02, 15.1314], [0.72899, -0.684525, 0], [0, 0, 1]],
["Exile_Trader_VehicleCustoms", ["AmovPercMstpSnonWnonDnon_exercisekneeBendA"], "Exile_Trader_VehicleCustoms", "AfricanHead_01", [[],[],[],["Exile_Uniform_ExileCustoms",[]],[],[],"","G_Tactical_Clear",[],["","","","","",""]], [1019.31, 4545.46, 15.1314], [-0.667976, 0.744183, 0], [0, 0, 1]],
["Exile_Trader_Vehicle", ["HubStandingUC_move2"], "Exile_Trader_Vehicle", "WhiteHead_07", [[],[],[],["Exile_Uniform_ExileCustoms",[]],[],[],"H_RacingHelmet_4_F","",[],["","","","","",""]], [990.938, 4517.15, 15.1314], [-0.995539, 0.0943514, 0], [0, 0, 1]],
["Exile_Trader_WasteDump", ["AmovPercMstpSnonWnonDnon_exercisePushup"], "Exile_Trader_WasteDump", "WhiteHead_01", [[],[],[],["U_I_G_Story_Protagonist_F",[]],["V_Rangemaster_belt",[]],[],"H_MilCap_gry","G_Tactical_Clear",[],["","","","","",""]], [1014.23, 4562.94, 15.1314], [-0.750146, -0.661273, 0], [0, 0, 1]],
["Exile_Trader_RussianRoulette", ["HubStandingUC_move2"], "Exile_Trader_RussianRoulette", "WhiteHead_08", [[],[],["hgun_Pistol_Signal_F","","","",[],[],""],["U_Marshal",[]],["V_Rangemaster_belt",[]],[],"H_Cap_marshal","G_Sport_Blackyellow",[],["","","","","",""]], [996.733, 4567.4, 15.1314], [0.872769, -0.488134, 0], [0, 0, 1]],
["Exile_Trader_WasteDump", ["HubStandingUC_move1"], "Exile_Trader_WasteDump", "AfricanHead_02", [[],[],[],["U_I_G_Story_Protagonist_F",[]],["V_Rangemaster_belt",[]],[],"H_MilCap_gry","G_Combat",[],["","","","","",""]], [12874.8, 4418.96, 37.3314], [-0.191169, 0.981557, 0], [0, 0, 1]],
["Exile_Trader_AircraftCustoms", ["HubStandingUC_move2"], "Exile_Trader_AircraftCustoms", "WhiteHead_16", [[],[],[],["Exile_Uniform_ExileCustoms",[]],["V_RebreatherB",[]],[],"H_PilotHelmetFighter_B","G_Combat",[],["","","","","",""]], [12924.7, 4503.15, 42.3454], [0.999803, 0.0198257, 0], [0, 0, 1]],
["Exile_Trader_SpecialOperations", [], "Exile_Trader_SpecialOperations", "WhiteHead_03", [["arifle_MX_Black_F","","","",[],[],""],[],[],["U_B_CTRG_1",[]],["V_PlateCarrierGL_blk",[]],["B_Parachute",[]],"H_HelmetB_light_black","G_Balaclava_lowprofile",[],["","","","","","NVGoggles_OPFOR"]], [12872.1, 4525.42, 41.448], [-0.750014, 0.661422, 0], [0, 0, 1]],
["Exile_Trader_Aircraft", ["HubStandingUC_move1"], "Exile_Trader_Aircraft", "Barklem", [[],[],[],["U_I_pilotCoveralls",[]],[],[],"H_PilotHelmetHeli_O","G_Combat",[],["","","","","",""]], [12926.9, 4477.64, 42.0991], [0.388288, 0.921538, 0], [0, 0, 1]],
["Exile_Trader_Office", ["Acts_passenger_flatground_leanright"], "Exile_Trader_Office", "AfricanHead_01", [[],[],[],["U_I_G_resistanceLeader_F",[]],["V_Rangemaster_belt",[]],[],"H_Hat_brown","",[],["","","","","",""]], [12904.7, 4517.9, 38.6323], [-0.694542, -0.719452, 0], [0, 0, 1]],
["Exile_Trader_Vehicle", ["Acts_passenger_flatground_leanright"], "Exile_Trader_Vehicle", "GreekHead_A3_06", [[],[],[],["Exile_Uniform_ExileCustoms",[]],[],[],"H_RacingHelmet_4_F","G_Combat",[],["","","","","",""]], [12907.2, 4522.84, 41.1571], [-0.938794, -0.344479, 0], [0, 0, 1]],
["Exile_Trader_VehicleCustoms", [], "Exile_Trader_VehicleCustoms", "Sturrock", [[],[],[],["Exile_Uniform_ExileCustoms",[]],[],[],"","G_Tactical_Clear",[],["","","","","",""]], [12907.2, 4511.41, 41.1571], [-0.380423, 0.924812, 0], [0, 0, 1]],
["Exile_Trader_Hardware", ["Acts_passenger_flatground_leanright"], "Exile_Trader_Hardware", "Sturrock", [[],[],[],["U_C_WorkerCoveralls",[]],["V_BandollierB_rgr",[]],["B_UAV_01_backpack_F",[]],"H_Booniehat_khk_hs","G_Aviator",[],["","","","","",""]], [12845.2, 4465.52, 37.9048], [0.998766, 0.049669, 0], [0, 0, 1]],
["Exile_Trader_Food", [], "Exile_Trader_Food", "WhiteHead_21", [[],[],[],["U_C_Poloshirt_blue",[]],[],[],"H_Cap_tan","G_Tactical_Clear",[],["","","","","",""]], [12845.3, 4458.75, 37.8093], [0.208055, 0.978117, 0], [0, 0, 1]],
["Exile_Trader_Equipment", [], "Exile_Trader_Equipment", "WhiteHead_01", [["arifle_MX_GL_Black_F","","","",[],[],""],[],[],["U_BG_Guerrilla_6_1",[]],["V_I_G_resistanceLeader_F",[]],[],"H_Watchcap_khk","",[],["","","","","",""]], [12844.8, 4474.68, 38.0405], [0.935219, -0.354069, 0], [0, 0, 1]],
["Exile_Trader_Armory", [], "Exile_Trader_Armory", "WhiteHead_21", [["srifle_DMR_06_olive_F","","","",[],[],""],[],[],["U_Rangemaster",[]],["V_Rangemaster_belt",[]],[],"H_Cap_headphones","G_Shades_Black",[],["","","","","",""]], [12845.7, 4468.86, 37.976], [0.406599, 0.913607, 0], [0, 0, 1]],
["Exile_Trader_RussianRoulette", ["HubStandingUC_move2"], "Exile_Trader_RussianRoulette", "WhiteHead_21", [[],[],["hgun_Pistol_Signal_F","","","",[],[],""],["U_Marshal",[]],["V_Rangemaster_belt",[]],[],"H_Cap_marshal","G_Sport_Blackyellow",[],["","","","","",""]], [12917.3, 4469.39, 37.6614], [-0.201369, -0.979515, 0], [0, 0, 1]],
["Exile_Trader_WasteDump", ["HubStandingUC_move2"], "Exile_Trader_WasteDump", "WhiteHead_05", [[],[],[],["U_I_G_Story_Protagonist_F",[]],["V_Rangemaster_belt",[]],[],"H_MilCap_gry","G_Tactical_Clear",[],["","","","","",""]], [2112.03, 13029.4, 9.26088], [-0.0444041, -0.999014, 0], [0, 0, 1]],
["Exile_Trader_Boat", ["Acts_passenger_flatground_leanright"], "Exile_Trader_Boat", "AfricanHead_03", [[],[],[],["U_OrestesBody",[]],[],[],"H_Cap_surfer","G_Combat",[],["","","","","",""]], [1213.52, 5680.87, 5.70407], [-0.301571, 0.953444, 0], [0, 0, 1]]
];

{
    private _logic = "Logic" createVehicleLocal [0, 0, 0];
    private _trader = (_x select 0) createVehicleLocal [0, 0, 0];
    private _animations = _x select 1;
    
    _logic setPosWorld (_x select 5);
    _logic setVectorDirAndUp [_x select 6, _x select 7];
    
    _trader setVariable ["BIS_enableRandomization", false];
    _trader setVariable ["BIS_fnc_animalBehaviour_disable", true];
    _trader setVariable ["ExileAnimations", _animations];
    _trader setVariable ["ExileTraderType", _x select 2];
    _trader disableAI "ANIM";
    _trader disableAI "MOVE";
    _trader disableAI "FSM";
    _trader disableAI "AUTOTARGET";
    _trader disableAI "TARGET";
    _trader disableAI "CHECKVISIBLE";
    _trader allowDamage false;
    _trader setFace (_x select 3);
    _trader setUnitLoadOut (_x select 4);
    _trader setPosWorld (_x select 5);
    _trader setVectorDirAndUp [_x select 6, _x select 7];
    _trader reveal _logic;
    _trader attachTo [_logic, [0, 0, 0]];
    _trader switchMove (_animations select 0);
    _trader addEventHandler ["AnimDone", {_this call ExileClient_object_trader_event_onAnimationDone}];
}
forEach _npcs;


