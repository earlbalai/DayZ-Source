private [ "_config", "_type","_position","_dir","_onFire","_object"];

for "_i" from ((count _this) - 1) to 0 step -1 do 
{
	_config = (_this select _i);
	if (isClass(_config)) then {
		_type = getText (_config >> "type");
		_position = [] + getArray (_config >> "position");
		_dir = getNumber (_config >> "direction");
		_onFire = getNumber (_config >> "onFire");
		
		_object = _type createVehicleLocal [_position select 0,_position select 1,-100];
		_object setDir _dir;
		_object setPos [_position select 0,_position select 1,0];
		_object setPosATL _position;
		_object allowDamage false;
		_object setVariable ["", true]; // SV used by player_spawnCheck
		if ((_i % 10) == 0) then { sleep 0.01; };
		//diag_log format["CreateObj: %1 / %2",_type,_position];
		/*
		if (_onFire > 0) then {
			nul=[_object,_onFire,time,false,false] spawn BIS_Effects_Burn;
		};
		*/
	};
};
//diag_log ("FILL: " + str(_this));
