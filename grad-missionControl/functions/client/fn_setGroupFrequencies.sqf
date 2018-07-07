// obj , number

params ["_unit", "_callsign", ["_frequency", ["133.7", "33.7"]]];

if (!isServer) exitWith {};

_frequency params ["_swFrequency", "_lrFrequency"];

{
	_x setVariable ["GRAD_missionControl_frequencySW", _swFrequency, true];
	_x setVariable ["GRAD_missionControl_frequencyLR", _lrFrequency, true];

} forEach units group _unit;

private _data = [nil, _callsign, false];
["RegisterGroup", [group _unit, _unit, _data]] call BIS_fnc_dynamicGroups;