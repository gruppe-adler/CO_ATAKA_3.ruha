params ["_vehicleArray", ["_waypointMarker",[]],"_dir","_side"];

// _vehicleArray is [_classname, _init, _inventory]
private _waypoints = [];

if (count _waypointMarker isEqualTo 0) exitWith {
	diag_log format ["no waypoints found"];
};

private _startPos = getMarkerPos (_waypointMarker select 0);

{
	_waypoints append [getMarkerPos _x];
} forEach _waypointMarker;

private _distanceBetweenVehicles = 50;
private _distanceFromFirst = 0;
private _group = createGroup _side;

private _vehicleFlagDefinitions = [
	["rhs_tigr_m_vdv",[-1.1,1.2,1.2],[0,-0.2,1]],
	["rhs_tigr_m_3camo_vdv",[-1.1,1.2,1.2],[0,-0.2,1]],
	["rhsgref_cdf_b_reg_uaz_dshkm", [0.8,-1.15,1.3], [0,0,0]],
	["rhsgref_nat_uaz_dshkm", [0.8,-1.15,1.3], [0,0,0]],
	["rhs_gaz66_repair_vdv",[1.1,-1.9,2.2], [0,0,0]],
	["rhs_gaz66_r142_vv",[1.1,-2.1,2.9], [0,0,0]],
	["rhs_bmp1_msv", [0,-2.5,0.6], [0,0,0]],
	["rhs_btr70_msv",[0,-2.7,0.6], [0,0,0]],
	["rhs_brm1k_msv", [0,-2.5,0.6], [0,0,0]],
	["rhsgref_BRDM2_HQ_msv", [0.8,-1.15,1.3], [0,0,0]],
	["rhs_uaz_vv",[0,-1.7,0.6], [0,0,0]],
	["rhs_btr80a_vv",[0,-3.2,0.6], [0,0,0]],
	["RHS_Ural_Zu23_VV_01",[0,-3,1], [0,0,0]],
	["RHS_Ural_Open_VV_01",[0,-3,1], [0,0,0]],
	["rhsgref_cdf_b_ural_fuel",[0,-3,0.6], [0,0,0]]
];

{

	
	_classname = _vehicleArray select _foreachindex select 0;
	_init = _vehicleArray select _foreachindex select 1;
	_inventory = _vehicleArray select _foreachindex select 2;

	diag_log format ["vehicle classname is %1, %2, %3", _classname, _init, _inventory];

	_distanceFromFirst = _distanceFromFirst + _distanceBetweenVehicles;
	private _calculatedPos = [_startPos, _distanceFromFirst, _dir] call BIS_fnc_relPos;


	private _vehicle = createVehicle [_classname, _calculatedPos, [], 0, "NONE"];
	_vehicle setDir (_dir-180);

	// make consistent group for whole convoy
	createVehicleCrew _vehicle;
	{ [_x] joinSilent _group; } forEach (crew _vehicle);

	// add everything to zeus
	{
		{_x addCuratorEditableObjects [[_x],true]} forEach crew _vehicle;
		_x addCuratorEditableObjects [[_vehicle],true];
		nil
	} count allCurators;

	// fill vehicle with reasonable stuff
	[_vehicle] call _inventory;
	sleep 0.1;

	// adjust vehicle (remove lamp covers and stuff)
	if (count _init > 0) then {
		[_vehicle, nil, _init] call BIS_fnc_initVehicle;
	};

	_vehicle setVehicleLock "UNLOCKED";
	// _vehicle forceFollowRoad true;
	_vehicle setConvoySeparation 20;
	

	// if (_foreachindex isEqualTo 0) then {
	_vehicle limitSpeed 20;
	//};
	
	 driver _vehicle disableAI "autocombat";

	private _flag = "rhs_Flag_chdkz" createVehicle [0,0,0];
	_flag setFlagTexture "pic\flag_sov_co.jpg";
	
	{
	  if ((typeOf _vehicle) isEqualTo (_x select 0)) exitWith {
	  			
	  			_flag attachto [_vehicle,_x select 1];
	  			_vehicle setVariable ["GRAD_vehicleFlag", _flag];
	  			_vehicle addEventHandler ["killed", "
	  				deleteVehicle ((_this select 0) getVariable ['GRAD_vehicleFlag', objNull]);
	  			"];
	  		};
	} forEach _vehicleFlagDefinitions;

	

} forEach _vehicleArray;

// set convoy behaviour
{	
	_x setSpeedMode "LIMITED";
	_x setCombatMode "SAFE";
} forEach units _group;

_group setFormation "STAG COLUMN";

[_group, _waypoints] call GRAD_convoy_fnc_setWaypoints;