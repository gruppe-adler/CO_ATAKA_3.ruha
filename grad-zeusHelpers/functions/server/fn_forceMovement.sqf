params ["_unit", "_targetPos"];

private _unitPosition = position _unit;
private _distance = ceil (_unit distance2D _targetPos);
private _dir = _unit getRelDir _targetPos;

// on foot
if (_unit isKindOf "Man") then {
	_unit disableAI "FSM";
	_unit disableAI "COMBAT";

	_unit addEventHandler ["AnimChanged", 
	{
	_aunit = _this select 0;
	_curanim = _this select 1; 
	    if (_curanim == "AmovPercMrunSnonWnonDf") then {_aunit playmove "AmovPercMevaSnonWnonDf"};
	    if (_curanim == "AmovPercMrunSnonWnonDfl") then {_aunit playmove "AmovPercMevaSnonWnonDfl"};
	    if (_curanim == "AmovPercMrunSnonWnonDfr") then {_aunit playmove "AmovPercMevaSnonWnonDfr"};

	    if (_curanim == "AmovPknlMrunSnonWnonDf") then {_aunit playmove "AmovPknlMevaSnonWnonDf"};
	    if (_curanim == "AmovPknlMrunSnonWnonDfl") then {_aunit playmove "AmovPknlMevaSnonWnonDfl"};
	    if (_curanim == "AmovPknlMrunSnonWnonDfr") then {_aunit playmove "AmovPknlMevaSnonWnonDfr"};

	    if (_curanim == "AmovPpneMrunSnonWnonDf") then {_aunit playmove "AmovPpneMsprSnonWnonDf"};
	}];

	[{
		private _unit = (_this select 0);

		_unit removeAllEventHandlers "AnimChanged";
		_unit enableAI "FSM";
		_unit enableAI "COMBAT";

	}, [_unit], 10] call CBA_fnc_waitAndExecute;
};

// land vehicle
if (_unit isKindOf "LandVehicle") then {

	// plot course
	private _pathNet = [];
	
	// one point for each m
	for "_i" from 1 to _distance do {
		private _point = _unitPosition getPos [_i, _dir];
		_pathNet pushBack _point;
	};

	_unit setDriveOnPath _pathNet;

	{	
		_x params ["_Xpos", "_Ypos"];
		_markerstr = createMarkerLocal [format ["mrk_path_%1_%2", _Xpos, _Ypos],[_Xpos,_Ypos]];
		_markerstr setMarkerShapeLocal "ICON";
		_markerstr setMarkerTypeLocal "mil_dot"; 
	} forEach _pathNet
};