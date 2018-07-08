if (!isServer) exitWith {};

[{
	if (fueltank distance uav_pshtela < 300) then {
		private _fuel = fuel uav_pshtela;
		_fuel = _fuel + 0.01;
		uav_pshtela setFuel _fuel;

		private _owner = UAVControl uav_pshtela select 0;

		if (!isNull _owner) then {
			["refueling..."] remoteExec ["hintSilent",  _owner];
		};
	};
}, 0.5, []] call CBA_fnc_addPerFrameHandler;