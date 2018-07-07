// binding to the player object:
["setTFARFrequencyHandler", "OnRadiosReceived", {

	private _frequencySW = player getVariable ["GRAD_missionControl_frequencySW", "133.7"];
	private _frequencyLR = player getVariable ["GRAD_missionControl_frequencyLR", "33.7"];

	private _swRadio = call TFAR_fnc_activeSwRadio;
	private _lrRadio = call TFAR_fnc_activeLrRadio;

	if (!(_swRadio isEqualTo "")) then {
		[_swRadio, _frequencySW] call TFAR_fnc_setSwFrequency;
	};

	if  (!(count _lrRadio isEqualTo 0)) then {
		[_lrRadio, _frequencyLR] call TFAR_fnc_setLrFrequency;
	};
	
}, player] call TFAR_fnc_addEventHandler;