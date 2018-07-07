player addEventHandler ["HandleRating", {0}];

[] call GRAD_missionControl_fnc_setMyFrequency;

["InitializePlayer", [player, true]] call BIS_fnc_dynamicGroups;

[] call GRAD_permaChoice_fnc_addZeusModules;
[] call GRAD_zeusHelpers_fnc_addModules;


/*
15:06:22 Error in expression <_fnc_addModules;

private _pos = player getVariable ["GRAD_setup_pos", position >
15:06:22   Error position: <getVariable ["GRAD_setup_pos", position >
15:06:22   Error 3 elements provided, 2 expected
15:06:22 File mpmissions\__CUR_MP.ruha\initPlayerLocal.sqf, line 8
*/