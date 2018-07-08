setViewDistance 1500;

cutText ["","BLACK FADED",999];
call compile preprocessfile "node_modules\shk_pos\functions\shk_pos_init.sqf";
["BLU_F", "UsMPT"] call GRAD_Loadout_fnc_FactionSetLoadout;
["OPF_F", "RuFlora"] call GRAD_Loadout_fnc_FactionSetLoadout;

RHSDecalsOff = true;

// disable auto spotting and similar shit
enableSentences false;
enableRadio false;
showChat false;

{
	_x setMarkerAlphaLocal 0;
} forEach [
	"mrk_convoy_1",
	"mrk_convoy_2",
	"mrk_convoy_3",
	"mrk_convoy_4",
	"mrk_convoy_5"
];

waitUntil {!isNull player};
waitUntil {time > 0};
cutText ["", "BLACK IN", 1];
player switchmove "amovpercmstpslowwrfldnon";

private _pos = player getVariable ["GRAD_setup_pos", position player];
private _dir = player getVariable ["GRAD_setup_dir", 0];

player setPos _pos; 
player setDir _dir;

[] spawn GRAD_missionControl_fnc_intro;