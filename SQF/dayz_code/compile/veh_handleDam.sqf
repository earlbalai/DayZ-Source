/*
        Created exclusively for ArmA2:OA - DayZMod.
        Please request permission to use/alter/distribute from project leader (R4Z0R49) AND the author (facoptere@gmail.com)
*/

/***********************************************************
ASSIGN DAMAGE TO A UNIT. 
Called by "HandleDamage" vehicle Event Handler
or by "PVDZ_veh_SH" PV
or by zombie_attack

- Function fnc_veh_handleDam
- [unit, selectionName, damage, source, projectile, broadcast] call fnc_veh_handleDam;
- return : updated damage for that part
broadcast: boolean. if true, then the request will be sent to all players if the vehicle is not local.
************************************************************/
private ["_unit","_selection","_dam","_SVname","_currentDam", "_globalDam", "_delta", "_log"];

_unit = _this select 0;
_selection = _this select 1;
if (_selection == "?") exitWith {0}; // ignore undefined parts
_dam = 1 min (0 max (_this select 2));
_SVname = "hit_" + _selection;


_currentDam = if ((!isNil "_selection") AND {(_selection != "")}) then {_unit getVariable [_SVname, 0]} else {damage _unit};
_globalDam = damage _unit;
_log = format["%1 _this:%2 vehicle:%3#%4 part:""%5"" part_damage:%6 global_damage:%7  ", __FILE__, 
_this, typeOf _unit, _unit getVariable ["ObjectID",""],
_selection, _currentDam, _globalDam];
if (local _unit) then {
	_delta = 0;
	if ((!isNil "_selection") AND {(_selection != "")}) then {
		//// make bicycles a bit stronger
		//if (_unit isKindOf "Bicycle") then { _dam = _dam / 10; };
		// only local unit can set the damage of a vehicle part
		_dam = _currentDam max _dam;
		_delta = _dam - _currentDam; 
		_currentDam = _dam;
		if (_delta > 0) then {
			_unit setVariable [_SVname, _currentDam, true];
			_unit setHit [_selection, _currentDam];
			_log = format["%1. s3tHit[%2,%3]", _log, _selection, _currentDam];
			if (_selection IN ["palivo", "karoserie", "motor", "mala vrtule", "velka vrtule"]) then {
				// we overwirte also global damage logic, according to damage of this part and number of vehicle parts
				_globalDam = _globalDam max (0.80 min (_globalDam + _delta/3));
				_unit setDamage _globalDam;
				_log = format["%1. s3tD4mage %2", _log, _globalDam];
			};
		};
	}
	else {
		_dam = _globalDam max _dam;
		_delta = _dam - _globalDam; 
		if (_delta > 0) then {
			_globalDam = _dam;
			_unit setDamage _globalDam;			
			_log = format["%1. s3tD4mage %2", _log, _globalDam];
		};
	};
	if (_delta > 0) then {
		if (!isServer) then {
			PVDZ_veh_Save = [_unit,"damage"];
			publicVariableServer "PVDZ_veh_Save";		
			_log = _log + ". Requesting serv3r hive write.";
		}
		else {
			[_unit, "damage"] call server_updateObject;
			_log = _log + ". Writing to hive.";
		};
	};
}
else {
	if ( (count _this > 5) AND {(_this select 5)}) then {
		// vehicle is not local to this client, ask the client which vehicle is local to set damage
		_this resize 5; // delete "broadcast" boolean 
		_log = _log + ". Broadcasting to all.";
		PVDZ_veh_SH = _this;
		publicVariable "PVDZ_veh_SH";
	};
};
diag_log _log;
// all "HandleDamage event" functions should return the effective damage that the engine will record for that part
_currentDam
