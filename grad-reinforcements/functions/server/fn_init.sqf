private _m2a2 = [
	"RHS_M2A2_BUSKI_WD",
	["Olive",1],
	["IFF_Panels_Hide",1,"Select_TOW",0,"Select_Stinger",1]
];

private _hmmwv = [
	"rhsusf_m998_w_s_2dr_fulltop",
	["Olive",1],
	["hide_middleTop",0,"hide_CIP",1,"hide_BFT",1,"hide_Antenna",1,"hide_A2_Parts",1,"Hide_A2Bumper",1]
];

private _m1a1 = [
	"rhsusf_m1a1fep_wd",
	["OD",1], 
	["DUKE_Hide",1,"IFF_Panels_Hide",1,"Miles_Hide",0,"showCamonetTurret",0,"showCamonetHull",0]
];

private _ikarus = [
	"RDS_Ikarus_Civ_01",
	"",
	[]
];

private _gaz24 = [
	"RDS_Gaz24_Civ_03",
	"",
	[]
];


private _AT_team = [
	"rhsusf_usmc_marpat_wd_teamleader",
	"rhsusf_usmc_marpat_wd_rifleman_m4",
	"rhsusf_usmc_marpat_wd_rifleman_m4",
	"rhsusf_usmc_marpat_wd_javelin"
];

private _MG_team = [
	"rhsusf_usmc_marpat_wd_teamleader",
	"rhsusf_usmc_marpat_wd_machinegunner",
	"rhsusf_usmc_marpat_wd_machinegunner_ass",
	"rhsusf_usmc_marpat_wd_rifleman_m4"
];

private _civilianMob = [
	"rhsusf_usmc_recon_marpat_wd_teamleader_lite",
	"rhsusf_usmc_recon_marpat_wd_teamleader_lite",
	"rhsusf_usmc_recon_marpat_wd_teamleader_lite",
	"rhsusf_usmc_recon_marpat_wd_teamleader_lite",
	"rhsusf_usmc_recon_marpat_wd_teamleader_lite",
	"rhsusf_usmc_recon_marpat_wd_teamleader_lite",
	"rhsusf_usmc_recon_marpat_wd_teamleader_lite",
	"rhsusf_usmc_recon_marpat_wd_teamleader_lite"
];

private _civilianMob2 = [
	"rhsusf_usmc_recon_marpat_wd_teamleader_lite",
	"rhsusf_usmc_recon_marpat_wd_teamleader_lite",
	"rhsusf_usmc_recon_marpat_wd_teamleader_lite",
	"rhsusf_usmc_recon_marpat_wd_teamleader_lite"
];

private _reinforcements = [
	[_m2a2, getPos reinf_1, getDir reinf_1, _AT_team, false],
	[_m2a2, getPos reinf_2, getDir reinf_2, _MG_team, false],
	[_hmmwv, getPos reinf_3, getDir reinf_3, _AT_team, false],
	[_hmmwv, getPos reinf_4, getDir reinf_4, _MG_team, false],
	[_m1a1, getPos reinf_5, getDir reinf_5, [], false],
	[_m1a1, getPos reinf_6, getDir reinf_6, [], false],
	[_m1a1, getPos reinf_7, getDir reinf_7, [], false]
];


{
  	_x params ["_vehicle", "_position", "_dir", "_cargo", "_isPartisan"];
  	_vehicle params ["_type", "_initSkin", "_initExtras"];

  	private _spawnedVehicle = [_type, _position, _dir, _initSkin, _initExtras, _cargo] call GRAD_reinforcements_fnc_spawnVehicle;

  	private _cargoGroup = createGroup west;
  	
  	{
  		private _cargoUnit = [_cargoGroup, _x, [0,0,0], _spawnedVehicle] call GRAD_reinforcements_fnc_spawnUnit;

  		if (_isPartisan) then {
  			[_cargoUnit, true] call GRAD_civPartisans_fnc_equip;
  		};
  	} forEach _cargo;

	{
		_x addCuratorEditableObjects [[_spawnedVehicle],true];
		nil
	} count allCurators;

	sleep 3;

} forEach _reinforcements;