
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
private ["_unit","_selection","_dam","_SVname","_currentDam", "_globalDam", "_delta", "_log", "_ret", "_isbicycle"];

_unit = _this select 0;
_selection = _this select 1;
_dam = 1 min (0 max (_this select 2));

// we assume that hitpoint names are all legit damageable part names (which is quite wrong)
_hitpointnames = [];
{
	_hitpointnames set [count _hitpointnames, getText (configFile >> "CfgVehicles" >> (typeOf _unit) >> "HitPoints" >> _x >> "name")];
} forEach (_unit call vehicle_getHitpoints);

if ((isNil "_selection") OR {(!(_selection IN _hitpointnames))}) exitWith {_this select 2};

_SVname = "hit_" + _selection;
_currentDam = _unit getVariable [_SVname, 0];
_log = format["%1 _this:%2 vehicle:%3#%4 part:""%5"" current_part_damage:%6", __FILE__,
_this, typeOf _unit, _unit getVariable ["ObjectID",""],
_selection, _currentDam ];
_ret = _currentDam;
_isbicycle = _unit isKindOf "Bicycle";

if (local _unit) then {
	_dam = _currentDam max _dam;
	_delta = _dam - _currentDam;
	if (_delta > 0) then {
		_ret = if (_isbicycle) then {_dam - _delta*9/10} else {_dam};
		_unit setVariable [_SVname, _ret, true];
		_unit setHit [_selection, _ret];
		_log = format["%1. setH!t[%2,%3]%4", _log, _selection, _ret, if (_isbicycle) then {" bike special"} else {""}];
		if (!isServer) then {
			PVDZ_veh_Save = [_unit,"damage"];
			publicVariableServer "PVDZ_veh_Save";
			_log = _log + ". Requesting server hive write";
		}
		else {
			[_unit, "damage"] call server_updateObject;
			_log = _log + ". Writing to hive";
		};
	};
}
else {
	if ( (count _this > 5) AND {(_this select 5)}) then {
		// vehicle is not local to this client, ask the client which vehicle is local to set damage
		_this resize 5; // delete "broadcast" boolean
		_log = _log + ". Broadcasting to all";
		PVDZ_veh_SH = _this;
		publicVariable "PVDZ_veh_SH";
	};
};
diag_log format ["%1. Returned damage:%2", _log, _ret];
// all "HandleDamage event" functions should return the effective damage that the engine will record for that part
_ret
