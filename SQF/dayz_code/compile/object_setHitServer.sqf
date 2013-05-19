
private["_unit","_selection","_damage","_strH","_dam","_total"];

if (!isServer) exitWith { diag_log ("object_setHitServer: should be called from server only"); };

_unit =			_this select 0;
_selection =	_this select 1;
_damage =		abs(_this select 2); // damage quantity that will be added to current damage

if (_selection != "") then {
	_strH = "hit_" + (_selection);
	_dam = _unit getVariable [_strH,0];
	_total = (_dam + _damage);
	if (_total > 1) then {
		_total = 1;
	};
	_unit setVariable [_strH,_total,true];

	[_unit,"damage"] call server_updateObject;
// TODO : compute global damage based on damaged parts
} else {
	_damage = 0;
};

_damage
