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
private ["_unit","_selection","_dam","_SVname","_currentDam", "_globalDam", "_delta"];

_unit = _this select 0;
_selection = _this select 1;
if (_selection == "?") exitWith {0}; // ignore undefined parts
_dam = 0.99 min (0 max (_this select 2));
_SVname = "hit_" + _selection;


_currentDam = if ((!isNil "_selection") AND {(_selection != "")}) then {_unit getVariable [_SVname, 0]} else {damage _unit};
//diag_log(format["%1 this:%2 veh:%4#%5 currentDam:%3", __FILE__, _this, _currentDam, typeOf _unit, _unit getVariable ["ObjectID",""]]);
if (local _unit) then {
	_globalDam = damage _unit;
	if ((!isNil "_selection") AND {(_selection != "")}) then {
		//// make bicycles a bit stronger
		//if (_unit isKindOf "Bicycle") then { _dam = _dam / 10; };
		// only local unit can set the damage of a vehicle part
		_dam = _currentDam max _dam;
		_delta = _dam - _currentDam; 
		_currentDam = _dam;
		_unit setVariable [_SVname, _currentDam, true];
		_unit setHit [_selection, _currentDam];
	//diag_log(format["%1: %2 setHit %3 %4", __FILE__, _unit, _selection, _currentDam]);
		if (_selection IN ["palivo", "karoserie", "motor"]) then {
			// we overwirte also global damage logic, according to damage of this part and number of vehicle parts
			_globalDam = _globalDam max (0.80 min (_globalDam + _delta/3));
		};
	}
	else {
		_globalDam = _dam;
	};
	_unit setDamage _globalDam;
	//diag_log(format["%1: %2 setDamage %3 %4", __FILE__, _unit, _globalDam]);
	if (!isServer) then {
		PVDZ_veh_Save = [_unit,"damage"];
		publicVariableServer "PVDZ_veh_Save";		
	}
	else {
		[_unit, "damage"] call server_updateObject;
	};
}
else {
	if ( (count _this > 5) AND {(_this select 5)}) then {
		// vehicle is not local to this client, ask the client which vehicle is local to set damage
		_this resize 5; // delete "broadcast" boolean 
		PVDZ_veh_SH = _this;
		publicVariable "PVDZ_veh_SH";
	};
};

// all "HandleDamage event" functions should return the effective damage that the engine will record for that part
_currentDam
