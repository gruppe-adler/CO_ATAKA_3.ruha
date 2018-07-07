params ["_markers"];

/*
rhs_btr80a_vv
RHS_Ural_Zu23_VV_01
*/
_vehicleArray = [

	[
		"rhs_uaz_vv",
		["light_hide", 1],
		{
			_veh = _this select 0;
			_veh call GRAD_convoy_fnc_clearInventory;
		}
	],
	[
		"RHS_Ural_Open_VV_01",
		["light_hide", 1],
		{
			_veh = _this select 0;
			_veh call GRAD_convoy_fnc_clearInventory;
			[_veh,true] call GRAD_convoy_fnc_fillCargoWithSoldiers;
		}
	],
	[
		"RHS_Ural_Open_VV_01",
		["light_hide", 1],
		{
			_veh = _this select 0;
			_veh call GRAD_convoy_fnc_clearInventory;
			[_veh,true] call GRAD_convoy_fnc_fillCargoWithSoldiers;
		}
	],
	[
		"RHS_Ural_Open_VV_01",
		["light_hide", 1],
		{
			_veh = _this select 0;
			_veh call GRAD_convoy_fnc_clearInventory;
			[_veh,true] call GRAD_convoy_fnc_fillCargoWithSoldiers;
		}
	],
	[
		"RHS_Ural_Zu23_VV_01",
		["light_hide", 1],
		{
			_veh = _this select 0;
			_veh call GRAD_convoy_fnc_clearInventory;
			
		}
	],
	[
		"RHS_Ural_Open_VV_01",
		["light_hide", 1],
		{
			_veh = _this select 0;
			_veh call GRAD_convoy_fnc_clearInventory;
			[_veh,true] call GRAD_convoy_fnc_fillCargoWithSoldiers;
		}
	],
	[
		"RHS_Ural_Open_VV_01",
		["light_hide", 1],
		{
			_veh = _this select 0;
			_veh call GRAD_convoy_fnc_clearInventory;
			[_veh,true] call GRAD_convoy_fnc_fillCargoWithSoldiers;
		}
	],
	[
		"RHS_Ural_Fuel_VMF_01",
		["light_hide", 1],
		{
			_veh = _this select 0;
			_veh call GRAD_convoy_fnc_clearInventory;	
		}
	],
	[
		"RHS_Ural_Fuel_VMF_01",
		["light_hide", 1],
		{
			_veh = _this select 0;
			_veh call GRAD_convoy_fnc_clearInventory;	
		}
	],
	[
		"rhs_btr80a_vv",
		["light_hide", 1],
		{
			_veh = _this select 0;
			_veh call GRAD_convoy_fnc_clearInventory;
		}
	]
];

/*

convoy:
UAZ/Car, M113, Ural Explosives, Ural Explosives, Ural Fuel, Ural Infantry, M1113?

params ["_vehicleArray","_pos","_dir","_side", ["_waypointMarker",[]]];
*/

[[selectRandom _vehicleArray], _markers, 17, east] call GRAD_convoy_fnc_spawnVehicles;