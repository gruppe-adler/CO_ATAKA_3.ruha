/*
	creates Waypoints, deletes Vehicles if they reach last waypoint

	[_group, _waypoints] call GRAD_convoy_fnc_setWaypoints;
*/

params ["_group","_waypoints"];	

{
	_wp = _group addWaypoint [_x, _foreachindex];
	_wp setWaypointCompletionRadius 10;
	_wp setWaypointType "MOVE";
	_wp setWaypointStatements ["true", ""];
	
	// delete all vehicles of group if they reach last wp
	if (_forEachIndex == (count _waypoints - 1)) then {
		_wp setWaypointStatements ["true", "
				{
					if (alive _x) then { 
						deleteVehicle _x;
					};
				} foreach thislist + [vehicle this]
			"];
	};
} forEach _waypoints;