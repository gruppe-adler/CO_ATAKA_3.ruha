params ["_truck"];

_truck setVariable ["GRAD_isBombTruck",true,true];
	
_truck addEventHandler ["Explosion",{
	_veh = _this select 0;
	_dmg = _this select 1;

	diag_log format ["%1 vehicle bomb EH triggered",_veh];

	// if (!alive _veh) exitWith { _veh removeAllEventHandlers "Explosion"; };
	// if !("DemoCharge_Remote_Mag" in (getMagazineCargo _veh)) exitWith {};

	// if (_dmg > 0.3 || damage _veh > 0.3) then {

		_veh removeAllEventHandlers "Explosion"; 
		diag_log format ["%1 vehicle bomb activated",_veh];
		[_veh] spawn {
			params ["_veh"];
			_bomb = "Bo_GBU12_LGB_MI10" createVehicle (position _veh);
			_bomb setVelocity [0,0,-100];
			sleep 0.2;

			_bomb = "Cluster_120mm_AMOS" createVehicle (position _veh);
			_bomb setVelocity [0,0,-100];

			sleep 0.1;

			_bomb = "Sh_120mm_AMOS" createVehicle (position _veh);
			_bomb setVelocity [0,0,-100];
			sleep 0.1;

			_bomb = "SatchelCharge_Remote_Ammo" createVehicle (position _veh);
			_bomb setDamage 1;
			sleep 0.1;
			_bomb = "SatchelCharge_Remote_Ammo" createVehicle [position _veh select 0, position _veh select 1, 2];
			_bomb setDamage 1;
			sleep 0.1;

			_smoke = "BigDestructionSmoke";
			_emitterSmoke = "#particlesource" createVehicle (position _veh);
            _emitterSmoke setParticleClass _smoke;
   	 };
	// };
}];