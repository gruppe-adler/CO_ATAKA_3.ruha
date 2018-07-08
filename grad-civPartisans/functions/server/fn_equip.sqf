/* 

hint str (civmodule_1 getVariable ["#active",false]);
 civmodule_1 setVariable ["#active",false];

 [this, true] call GRAD_civPartisans_fnc_equip;

*/

params ["_unit", ["_armed", false]];

if (!isServer) exitWith {};

private _uniform = selectRandom [
	"rds_uniform_Worker1",
	"rds_uniform_Worker2",
	"rds_uniform_Worker3",
	"rds_uniform_Worker4",
	"rds_uniform_Woodlander1",
	"rds_uniform_Woodlander2",
	"rds_uniform_Woodlander3",
	"rds_uniform_Woodlander4",
	"rds_uniform_Villager1",
	"rds_uniform_Villager2",
	"rds_uniform_Villager3",
	"rds_uniform_Villager4",
	"rds_uniform_Profiteer1",
	"rds_uniform_Profiteer2",
	"rds_uniform_Profiteer3",
	"rds_uniform_Profiteer4",
	"rds_uniform_citizen1",
	"rds_uniform_citizen2",
	"rds_uniform_citizen3",
	"rds_uniform_citizen4",
	"rds_uniform_Rocker1",
	"rds_uniform_Rocker2",
	"rds_uniform_Rocker3",
	"rds_uniform_Rocker4"
];

private _headgear = selectRandom [
	"rds_Villager_cap1",
	"rds_Villager_cap2",
	"rds_Villager_cap3",
	"rds_Villager_cap4"
];

if (_armed) then {
	_unit setUnitLoadout [
		["rhs_weap_akms","rhs_acc_dtkakm","","",["rhs_30Rnd_762x39mm",30],[],""],[],[],
		[_uniform,[["ACE_fieldDressing",1],["ACE_packingBandage",1],["ACE_morphine",1],["ACE_tourniquet",1],["rhs_30Rnd_762x39mm",1,30]]],["V_TacVest_blk",[["rhs_30Rnd_762x39mm",3,30],["rhs_mag_f1",1,1]]],[],
		_headgear,"G_Bandanna_oli",[],["ItemMap","","ItemRadio","ItemCompass","ItemWatch",""]
	];

	if (random 2 > 0.7) then {
		_unit addWeapon "rhs_weap_M136";
		_unit addMagazines ["rhs_m136_mag", 1];
	};
} else {
	_unit setUnitLoadout [[],[],[],[_uniform,[]],[],[],_headgear,"",[],["","","","","",""]];
};