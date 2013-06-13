private["_vehicle","_canSize","_configVeh","_capacity","_nameType","_curFuel","_newFuel","_dis","_sfx","_fueling"];

a_player_jerryfilling = true;
_vehicle = cursorTarget;
_array = _this select 3;
_cantype = _array select 0;
_canSize = getNumber(configFile >> "cfgMagazines" >> _cantype >> "fuelQuantity");
_emptycan = getText(configFile >> "cfgMagazines" >> _cantype >> "emptycan");
_configVeh = configFile >> "cfgVehicles" >> TypeOf(_vehicle);
_capacity = getNumber(_configVeh >> "fuelCapacity");
_nameType = getText(_configVeh >> "displayName");
_curFuel = ((fuel _vehicle) * _capacity);
_newFuel = (_curFuel + _canSize);
_fueling = player getVariable "fueling";

player removeAction s_player_fillfuel + _capacity;

if (fuel _vehicle == 1) exitwith {};

if (isnil "_fueling") then {

	[player] allowGetIn false;

	player setVariable ["fueling", 1];
	if (_newFuel > _capacity) then {_newFuel = _capacity};
	_newFuel = (_newFuel / _capacity);

	player removeMagazine _cantype;
	player addMagazine _emptycan;

	player playActionNow "Medic";

	_dis=5;
	_sfx = "refuel";
	[player,_sfx,0,false,_dis] call dayz_zombieSpeak;
	[player,_dis,true,(getPosATL player)] spawn player_alertZombies;

	r_doLoop = true;
	_started = false;
	_finished = false;
	while {r_doLoop} do {
		_animState = animationState player;
		_isRefuel = ["medic",_animState] call fnc_inString;
		if (_isRefuel) then {
			_started = true;
		};
		if (_started and !_isRefuel) then {
			r_doLoop = false;
			_finished = true;
		};
		sleep 0.1;
	};
	r_doLoop = false;


	if (_finished) then {
		PVDZ_veh_SetFuel = [_vehicle,_newFuel];
		PVDZ_veh_SetFuel spawn local_setFuel;
		publicVariable "PVDZ_veh_SetFuel";

		cutText [format[localize "str_player_05",_nameType,_canSize], "PLAIN DOWN"];
		sleep 1;

		call fnc_usec_medic_removeActions;
		r_action = false;
		[player] allowGetIn true;
		player setVariable ["fueling", nil];
	};
	[player] allowGetIn true;
} else {
	cutText ["Already refueling!","PLAIN DOWN"];
};
a_player_jerryfilling = false;