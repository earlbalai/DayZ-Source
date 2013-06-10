private ["_config","_type","_position","_object"];

for "_i" from ((count _this) - 1) to 0 step -1 do 
{
	_config = (_this select _i);
	if (isClass(_config)) then {
		_type = getText (_config >> "ctype");
		_position = getArray (_config >> "position");
		_object = nearestObject [_position,_type];
		deleteVehicle _object;
		if ((_i % 10) == 0) then { sleep 0.01; };		
	};
};
//diag_log ("CLEAR: " + str(_this));
