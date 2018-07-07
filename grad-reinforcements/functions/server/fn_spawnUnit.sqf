params ["_group", "_type", "_position", ["_vehicle", objNull]];

private _isCargo = !(isNull _vehicle);
private _special = "NONE";

if (_isCargo) then {
	_special = "CARGO";
};

private _unit = _group createUnit [_type, _position, [], 0, _special];

_unit moveInCargo _vehicle;

{
	_x addCuratorEditableObjects [[_unit],true];
	nil
} count allCurators;


_unit setSkill ["aimingAccuracy", 0.1];
_unit setSkill ["aimingShake", 0.5]; 
_unit setSkill ["aimingSpeed", 0.75]; 
_unit setSkill ["endurance", 0.8]; 
_unit setSkill ["spotDistance", 1]; 
_unit setSkill ["spotTime", 0.8]; 
_unit setSkill ["courage", 1]; 
_unit setSkill ["reloadSpeed", 1]; 
_unit setSkill ["commanding", 1];
_unit setSkill ["general", 1];

_unit