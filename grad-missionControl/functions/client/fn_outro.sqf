params ["_unit", "_center", "_count", "_chair"];

private _distance = _count/5;

STHud_UIMode = 0;

private _zeusDisplay = (findDisplay 312);

if (!isNull _zeusDisplay) then {
	_zeusDisplay closeDisplay 2;
};

cutText ["Mission abgeschlossen", "BLACK OUT", 5];
[objNull, player] call ace_medical_fnc_treatmentAdvanced_fullHealLocal;
sleep 5;
moveout player;

[_chair, _unit] call acex_sitting_fnc_sit;

playMusic "QGTrack2";
7 fadeMusic 0.5;

[
	_center,
	15,
	_distance,
	45,
	1.2,
	0,
	0.1,
	true
] call GRAD_missionControl_fnc_rotatingCam;