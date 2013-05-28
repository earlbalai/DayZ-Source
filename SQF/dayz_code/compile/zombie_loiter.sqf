private["_unit","_aimingPos","_pos", "_deg", "_trip"];
_unit = _this select 0;
_aimingPos = _this select 1; // Zed will wander towards player's position... 

_deg = [_unit,  _aimingPos] call BIS_fnc_relativeDirTo;
if (_deg > 180) then { _deg = _deg - 360; }; // _deg in [-180, +180]
_deg = _deg * ((random(2) - 1) / 10 + 1); // let's randomize the direction. +/- 10% (if player is behind Zed's back, Zed direction will be less precise)
_deg + 10 * (random(2) - 1) + ; // let's randomize the direction more again. +/- 20 degrees
_trip = [_unit, _aimingPos] call BIS_fnc_distance2D;
_trip = _trip * ((random(2) - 1) / 5 + 1); // let's randomize the distance. +/- 20%

_pos = _unit modelToWorld [ sin(_deg) * _trip, cos(_deg) * _trip, 0];

if(isNull group _unit) then {
	_unit moveTo _pos;
} else {
	_unit domove _pos;		
};

_unit forceSpeed 2;
_unit setVariable ["myDest",_pos];
