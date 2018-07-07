/*
 [this] call GRAD_civPartisans_fnc_addLeafletAction;
*/

params ["_vehicle"];

_vehicle addAction ["<t color='#66aa66'>Drop the Leaflets", 
	"[_target] remoteExec ['grad_civPartisans_fnc_leafLets', [0,-2] select isDedicated];",
	"", 1, false, false, "", 
	"_this in _target"
];

// ["fired",[position this,getPos this select 2]] spawn GRAD_civPartisans_fnc_leafLets;