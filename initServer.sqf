{ 
	_x setSkill ["aimingAccuracy", 0.1];
	_x setSkill ["aimingShake", 0.5]; 
	_x setSkill ["aimingSpeed", 0.75]; 
	_x setSkill ["endurance", 0.8]; 
	_x setSkill ["spotDistance", 1]; 
	_x setSkill ["spotTime", 0.8]; 
	_x setSkill ["courage", 1]; 
	_x setSkill ["reloadSpeed", 1]; 
	_x setSkill ["commanding", 1];
	_x setSkill ["general", 1];

} forEach allUnits;

["Initialize", [true]] call BIS_fnc_dynamicGroups;

[] call GRAD_missionControl_fnc_alignUnitsInLine;