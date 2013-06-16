/*
	Anti-Teleport
	Created By Razor
	Refactored By Alby
*/

private["_debug","_curpos","_lastpos","_curheight","_lastheight","_terrainHeight","_curtime","_lasttime","_distance","_difftime","_speed","_topSpeed","_lastVehicle","_safetyVehicle", "_topv","_toph", "_v", "_h"];

diag_log(format["%1: init", __FILE__]);
waitUntil {vehicle player == player};

[] spawn {
	private ["_playerName","_playerUID"];
	_playerName = name player;
	_playerUID = getPlayerUID player;
	while {true} do {
		if (typeName player != "OBJECT") then {
			PVDZ_sec_atp = format["WARNING typename error for player UID#%1", _playerUID];
			publicVariableServer "PVDZ_sec_atp";
			//forceEnd;
			endMission "CONTINUE";
			sleep 10; //Bypass spam
		};
	};
};

_debug = getMarkerpos "respawn_west";
_lastpos = getPosATL (vehicle player);
_lastheight = (ATLtoASL _lastpos) select 2;
_lasttime = time;
_lastVehicle = vehicle player;

// freefall detection:
_v = 0;
_h = 0;
_topv = 0;
_toph = 0;

while {alive player} do
{
	//[-18697.58,379.53012,25815.256]
	/*
	if ([getMarkerPos "respawn_west", [0,0,0]] call BIS_fnc_areEqual || !([getMarkerPos "respawn_west", _debug] call BIS_fnc_areEqual)) then {
		createMarkerLocal ["respawn_west", _debug];
		"respawn_west" setMarkerType "EMPTY";
	};
	*/
	_curpos = getPosATL (vehicle player);
	_curheight = (ATLtoASL _curpos) select 2;
	_curtime = time;
	_distance = _lastpos distance _curpos;
	_difftime = (_curtime - _lasttime) max 0.001;
	_speed = _distance / _difftime;
	_topSpeed = 10;

	if (vehicle player != player) then {
		_topSpeed = (getNumber (configFile >> "CfgVehicles" >> typeOf (vehicle player) >> "maxSpeed")) min 500;
	};

	_terrainHeight = getTerrainHeightASL [_curpos select 0, _curpos select 1];

	/*
	_differenceCheck = false;
	_lastPosVar = player getVariable ["lastPos", []];
	if (count _lastPosVar > 0) then {
		_differenceCheck = (_lastPosVar distance _lastpos) > _topSpeed;
	} else {
		diag_log "LASTPOS RESET";
	};
	*/

	_safetyVehicle = vehicle player;

	if (_lastVehicle == vehicle player) then {
		if ((_speed > _topSpeed) && (alive player) && ((driver (vehicle player) == player) or (isNull (driver (vehicle player)))) && (_debug distance _lastpos > 3000) && !((vehicle player == player) && (_curheight < _lastheight) && ((_curheight - _terrainHeight) > 1))) then {
			(vehicle player) setpos _lastpos;
			PVDZ_sec_atp = format["TELEPORT REVERT for player UID#%1 from %2 to %3, %4 meters, now at %5", getPlayerUID player, dayz_characterID, _lastpos, _curPos, round(_lastpos distance _curpos), getPosATL player];
			publicVariableServer "PVDZ_sec_atp";
		} else {
			_lastpos = _curpos;
			_lastheight = _curheight;
		};

		_lasttime = _curtime;
	};

	if (_safetyVehicle == vehicle player) then {
		_lastVehicle = vehicle player;
	};

	// freefall detection:
	_v = -((velocity player) select 2);
	_h = (getPosATL player) select 2;
	if (_v > 4 AND _h > 3) then {
		_topv = _topv max _v;
		_toph = _toph max _h;
		Dayz_freefall = [ time, _toph, _topv ];
	}
	else {
		_topv = 0;
		_toph = 0;
	};

	sleep 0.25;
};