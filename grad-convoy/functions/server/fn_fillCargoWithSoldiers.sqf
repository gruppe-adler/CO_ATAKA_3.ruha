params ["_vehicle","_isArmy"];

// todo: find right group in afghan police
_squad = (configfile >> "CfgGroups" >> "East" >> "rhs_faction_vdv" >> "rhs_group_rus_vdv_infantry" >> "rhs_group_rus_vdv_infantry_squad");


_soldiers = [[0,0,0], EAST, _squad] call BIS_fnc_spawnGroup;

{_x assignAsCargo _vehicle; _x moveInCargo _vehicle;} forEach units _soldiers;

// delete leftovers
{if !(_x in _vehicle) then { deleteVehicle _x}; } forEach units _soldiers;