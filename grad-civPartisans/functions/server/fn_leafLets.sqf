/*
	Author: Karel Moricky

	Description:
	Initialize interactive leaflet.

	Parameter(s):
		0: STRING - mode; use "init" for scripted initialization, other modes are used when leaflets are fired as a weapon.
		1: ARRAY - params in one of the following formats
			0: OBJECT - leaflet
			1: STRINg - texture
			2: STRING - localized text, shown when previewing the leaflet in full screen

			or

			0: OBJECT - leaflet
			1: STRING - class from CfgLeaflets

	Examples:
		["init",[myLeaflet,"#(argb,8,8,3)color(1,1,0,1)","Yellow pages"]] call bis_fnc_initLeaflet;

		["init",[myLeaflet,"Custom_02"]] call bis_fnc_initLeaflet;

		["fired",[myLeaflet,"Custom_02"]] call bis_fnc_initLeaflet;


		["fired",[position this,getPos this select 2]] spawn GRAD_civPartisans_fnc_leafLets;
		
	Returns:
	NOTHING
*/

private _leafletClass = "West";

params ["_object"];

private _position = position _object;

_position set [2, _height];

_time = time + 0.1;
waituntil {time > _time};

//--- Leaflets that turn into pickable objects
_leaflets = objnull;
_leafletsParams = "Leaflets" call bis_fnc_getCloudletParams;
if (count _leafletsParams > 0) then {

	//--- Assign script
	private _leafletScript = gettext (configfile >> "CfgLeaflets" >> ("script" + _leafletClass));
	if (_leafletScript == "") exitwith {["Script not defined for leaflet %1",_leafletClass] call bis_fnc_error;};
	(_leafletsParams select 0) set [17,_leafletScript];

	//--- Use custom model
	private _cfg = [["CfgLeaflets",_leafletClass],configfile >> "CfgLeaflets" >> "Default"] call bis_fnc_loadClass;
	if (istext (_cfg >> "model")) then {(_leafletsParams select 0 select 0) set [0,gettext (_cfg >> "model")];};

	//--- Create particle source
	_leaflets = "#particlesource" createVehicleLocal _position;
	_leaflets setParticleParams (_leafletsParams select 0);
	_leaflets setParticleRandom (_leafletsParams select 1);
	_leaflets setDropInterval (_leafletsParams select 2);
	_leaflets attachto [_position,[0,0,0],"leaflet_spawn"];
};

_time = time + 1;
waituntil {time > _time};
deletevehicle _leaflets;