waitUntil {!isNull player};
waitUntil {  time > 3 };
if (
  !isNull (getAssignedCuratorLogic player) &&
  {isClass (configFile >> "CfgPatches" >> "achilles_modules_f_achilles")}
) then
{
  // Note that the line below has to be uncommented if your mission is a Zeus Game Master mission.
  // TODO check if below is necessary to uncomment
  waitUntil {not isNil "ares_category_list"};

  ["ZEUS HELPERS", "Force Movement",
  {
  	// Get all the passed parameters
  	params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

    if (!(_objectUnderCursor isKindOf "LAND")) exitWith { hint "no land vehicle"; };

    private _waypointPos = waypointPosition [group _objectUnderCursor, (currentWaypoint group _objectUnderCursor)];

    [_objectUnderCursor, _waypointPos] call GRAD_zeusHelpers_fnc_forceMovement;

  }] call Ares_fnc_RegisterCustomModule;

  ["ZEUS HELPERS", "Activate Civilian Modules",
  {
    // Get all the passed parameters
    params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

    civmodule_1 setVariable ["#active",true,true];
    civmodule_2 setVariable ["#active",true,true];

  }] call Ares_fnc_RegisterCustomModule;

  ["ZEUS HELPERS", "Deactivate Civilian Modules",
  {
    // Get all the passed parameters
    params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

    civmodule_1 setVariable ["#active",false,true];
    civmodule_2 setVariable ["#active",false,true];

  }] call Ares_fnc_RegisterCustomModule;

  ["ZEUS HELPERS", "Stuhlkreis bauen",
  {
    // Get all the passed parameters
    params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

    private _dialogResult =
    [
      "Anzahl der Stühle",
      [
        // The last number is optional! If you want the first selection you can remove the number.
        ["Text Control", "", "24"],
        ["Combo Box Control", ["Leer lassen", "Mit Spielern besetzen"], 0],
        ["Combo Box Control", ["Campingstuhl", "Teppich"], 0]
      ]
    ] call Ares_fnc_showChooseDialog;

    // If the dialog was closed.
    if (_dialogResult isEqualTo []) exitWith{};
    // Get the selected data
    _dialogResult params ["_typedText", "_fillWithPlayers", "_type"];
    
    if (_typedText isEqualTo 0) exitWith { systemChat "zero chairs?"; };
    
    private _count = parseNumber _typedText;


    // prepare chairs for all players
    if (_fillWithPlayers isEqualTo 1) then { 
        _count = count (playableUnits + switchableUnits);
    };
    
    // possible chairs
    private _classnames = ["Land_CampingChair_V1_F", "Land_Carpet_EP1"];
    private _chairs = [_classnames select _type, _position, _count] call GRAD_zeusHelpers_fnc_createChairCircle;

    // fill chairs with players
    if (_fillWithPlayers isEqualTo 1) then {
        {
            if (_type isEqualTo 0) then {
                [_position, _count, _chairs select _forEachIndex] remoteExec ["GRAD_missionControl_fnc_outro", _x, true];
            } else {
                _x setPos (getPos (_chairs select _forEachIndex));
          };
        } forEach (switchableUnits + playableUnits);
    };


  }] call Ares_fnc_RegisterCustomModule;


  ["ZEUS HELPERS", "Outro",
  {
    // Get all the passed parameters
    params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

    
    private _count =count (playableUnits + switchableUnits);

    
    // possible chairs
    private _chairs = ["Land_CampingChair_V1_F", _position, _count] call GRAD_zeusHelpers_fnc_createChairCircle;

    // fill chairs with players
    {      
        [_x, _position, _count, _chairs select _forEachIndex] remoteExec ["GRAD_missionControl_fnc_outro", _x, true];
          
    } forEach (switchableUnits + playableUnits);

  }] call Ares_fnc_RegisterCustomModule;

  ["ZEUS HELPERS", "Terminate Ambient Anim",
  {
    // Get all the passed parameters
    params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

    if (!isNull _objectUnderCursor) then {
      [_objectUnderCursor] call GRAD_zeusHelpers_fnc_terminateAmbientAnim;
    };


  }] call Ares_fnc_RegisterCustomModule;

};