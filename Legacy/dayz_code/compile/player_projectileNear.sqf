private["_unit","_ammo","_audible","_distance","_listTalk","_weapon","_projectile","_vUp","_endPos","_dir","_height","_bolt","_hitArray","_hitObject","_hitSelection","_config","_hitMemoryPt","_variation","_val","_doLoop","_countr","_nearplayer","_playerName","_playerPos","_listNear"];
_unit = 		_this select 0;
_weapon = 		_this select 1;
_ammo = 		_this select 4;
_projectile = 	_this select 6;

_projectile = nearestObject [_unit, _ammo];
_endPos = getPosATL _projectile;
_dir = 0;

_doWait = true;
while {_doWait} do {
	_vel = (velocity _projectile) distance [0,0,0];
	if (!(alive _projectile)) then {_doWait = false};	
	if (_vel < 0.1) then {_doWait = false};
	_endPos = getPosATL _projectile;
	sleep 0.01;
};

//_distance = parseNumber format["%1",(getArray (configFile >> "CfgAmmo" >> _ammo >> "soundHit") select 3)];

//_combattimer = time + 30;
//if ((_endPos distance player) <= 50) then {
//	player setVariable["incombat", _combattimer, true];
//};

_listNear = (_endPos) nearEntities [["CAManBase","AllVehicles"],50];
{
	_nearVehicle = _x;
	_isInCombat = _nearVehicle getVariable["startcombattimer",0];

	if ((alive _nearVehicle) and (isPlayer _nearVehicle) and _isInCombat == 0) then {
		_nearVehicle setVariable["startcombattimer", 1, true];
		diag_log("Now in Combat (Player): " + name _nearVehicle);
	};
	if (_nearVehicle isKindOf "AllVehicles") then {
		{
			_isInCombat = _x getVariable["startcombattimer",0];
			if (isPlayer _x and _isInCombat == 0) then {
				_x setVariable["startcombattimer", 1, true];
				diag_log("Now in Combat (Crew): " + name _x);
			};
		} forEach (crew _nearVehicle);
	};
} forEach _listNear;