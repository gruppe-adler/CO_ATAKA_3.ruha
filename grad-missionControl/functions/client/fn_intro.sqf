
STHud_UIMode = 0;

/*
startFog=0.041335065;
startFogDecay=0.1;
startFogBase=30.393677;
*/

// camera stuff is async
[] spawn {
	
	_filmgrain = ppEffectCreate ["FilmGrain",2000];  
	_filmgrain ppEffectEnable true;  
	_filmgrain ppEffectAdjust [0.3,0.3,0.12,0.12,0.12,true];  
	_filmgrain ppEffectCommit 0;

	private _startPosition = getPos camera_start;
	private _endPosition = getPos camera_end;
	
	_startPosition set [2, 1];
	_endPosition set [2, 1];
	_camTarget = _endPosition;

	_camera = "camera" camCreate _startPosition;
	_camera camSetTarget _camTarget;
	_camera cameraEffect ["internal","back"];
	_camera camSetFov 0.3;
	_camera camCommit 0;

	_camera camSetPos _camTarget;
	_camera camSetFov 0.15;
	_camera camCommit 45;

	sleep 42; // still moving forward while turning on player
	_camera camSetTarget player;
	_camera camCommit 3;
	sleep 3;
	_camera camSetPos [getPos player select 0, getPos player select 1, 1.7];
	_camera camCommit 9;
	sleep 8;
	cutText ["", "BLACK OUT", 1];
	sleep 1;
	_filmgrain ppEffectEnable false;   
	ppEffectDestroy _filmgrain; 
	_camera cameraEffect ["terminate","back"];
	camDestroy _camera;
	sleep 1;
	cutText ["", "BLACK IN", 1];
	STHud_UIMode = 1;
};
cutText ["","BLACK FADED",999];
sleep 3;
cutText ["", "BLACK IN", 10];


playMusic "LeadTrack02_F_Tank";

sleep 14;

_introPic = findDisplay 46 ctrlCreate ["RscPicture", -1];
_introPic ctrlSetPosition [
	(safeZoneX + safeZoneW)/2 - safeZoneW/4,  
 	(safezoneY + safeZoneH)/2 - safeZoneH/4,  
 	safeZoneW/4,  
 	safezoneH/4
];
_introPic ctrlsetText "pic\intro_1.paa";
_introPic ctrlCommit 0;

playSound (selectRandom ["GRAD_heartbeat_slow_1","GRAD_heartbeat_slow_2"]);
sleep 2;

_introPic ctrlsetText "pic\intro_2.paa";
_introPic ctrlCommit 0;
playSound (selectRandom ["GRAD_heartbeat_slow_1","GRAD_heartbeat_slow_2"]);
sleep 2;

_introPic ctrlsetText "pic\intro_3.paa";
_introPic ctrlCommit 0;
playSound (selectRandom ["GRAD_heartbeat_slow_1","GRAD_heartbeat_slow_2"]);
sleep 2;

_introPic ctrlsetText "pic\intro_4.paa";
_introPic ctrlCommit 0;
playSound (selectRandom ["GRAD_heartbeat_slow_1","GRAD_heartbeat_slow_2"]);
sleep 2;

_introPic ctrlsetText "pic\intro_5.paa";
_introPic ctrlCommit 0;
playSound (selectRandom ["GRAD_heartbeat_slow_1","GRAD_heartbeat_slow_2"]);
sleep 3;

_introPic ctrlsetText "pic\intro_6.paa";
_introPic ctrlCommit 0;
playSound (selectRandom ["GRAD_heartbeat_slow_1","GRAD_heartbeat_slow_2"]);
sleep 5;
_introPic ctrlSetFade 1;
_introPic ctrlCommit 3;
/*
[  
 [  
  ["C O   A T A K A","<t align = 'center' shadow = '0' size = '3.5' color='#ff8f1167' font='EtelkaNarrowMediumPro'>%1</t>"],
  ["<br/>","<t color='#00000000' align = 'center' shadow = '0' size = '1.5' font='EtelkaNarrowMediumPro'>%1</t>"],
  ["<br/>by nomisum for Gruppe Adler","<t align = 'center' shadow = '0' color='#66000000' font='EtelkaNarrowMediumPro' size = '.5'>%1</t>"]
 ]
] spawn grad_missionControl_fnc_typeText;
*/


sleep 11;


[ "Nachts", format ["26.07.1987"]] spawn BIS_fnc_infoText;

sleep 10;

INTRO_DONE = true;
publicVariable "INTRO_DONE";

7 fadeMusic 0.25;

[player, "amovpercmstpslowwrfldnon"] remoteExec ["switchMove", 0, true];