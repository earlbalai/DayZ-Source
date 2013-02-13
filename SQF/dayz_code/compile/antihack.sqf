/*
	Anti-Teleport
	Created By Razor
	Refactored By Alby
*/

private["_curpos","_lastpos","_curtime","_lasttime","_distance","_difftime","_speed","_topSpeed"];

waitUntil {vehicle player == player};

_lastpos = getPosATL (vehicle player);
_lasttime = time;

while {alive player} do
{
	_curpos = getPosATL (vehicle player);
	_curtime = time;
	_distance = _lastpos distance _curpos;
	_difftime = (_curtime - _lasttime) max 0.001;
	_speed = _distance / _difftime;
	_topSpeed = 10;
	
	if (vehicle player != player) then {
		_topSpeed = getNumber (configFile >> "CfgVehicles" >> typeOf (vehicle player) >> "maxSpeed");
	};
	
	_debug = getMarkerPos "respawn_west";
	if ((_speed > _topSpeed) && (alive player) && ((driver (vehicle player) == player) or (isNull (driver (vehicle player)))) && (_debug distance _lastpos > 2000)) then {
		(vehicle player) setpos _lastpos;
		atp = [name player, dayz_characterID, _lastpos, _curPos, getPosATL player];
		publicVariableServer "atp";
	} else {
		_lastpos = _curpos; 
	};
	
	_lasttime = _curtime;
	sleep 0.5;
};
