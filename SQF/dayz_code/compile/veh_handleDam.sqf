
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
private ["_unit","_selection","_dam","_SVname","_currentDam", "_globalDam"];

_unit = _this select 0;
_selection = _this select 1;
if (_selection == "?") then { _selection = ""; }; // bad arma triggered event (workaround)
_dam = 1 min (0 max (_this select 2));
_SVname = "hit_" + _selection;

diag_log(format["%1 this:%2", __FILE__, _this]);

_currentDam = if (_selection != "") then {_unit getVariable [_SVname, 1]} else {damage _unit};
if (local _unit) then {
	_globalDam = damage _unit;
	if (_selection != "") then {
		// only local unit can set the damage of a vehicle part
		_currentDam = 0.99 min (_currentDam + _dam);
		_unit setVariable [_SVname, _currentDam, true];
		_unit setHit [_selection, _currentDam];
		diag_log(format["%1: %2 setHit %3 %4", __FILE__, _unit, _selection, _currentDam]);
		// we change also global damage, according to damage of this part and number of vehicle parts
		_globalDam = 0.99 min (_globalDam + _dam/2/(1+(count (_unit call vehicle_getHitpoints))));
	}
	else {
		_globalDam = 0.99 min (_globalDam + abs(_dam));
	};
	_unit setDamage _globalDam;
	diag_log(format["%1: %2 setDamage %3 %4", __FILE__, _unit, _globalDam]);
	if (!isServer) then {
		dayzUpdateVehicle = [_unit,"damage"];
		publicVariableServer "dayzUpdateVehicle";		
	}
	else {
		[_unit, "damage"] call server_updateObject;
	};
}
else {
	if ( (count _this > 5) AND {(_this select 5)}) then {
		// vehicle is not local to this client, ask the client which vehicle is local to set damage
		PVDZ_veh_SH = _this;
		publicVariable "PVDZ_veh_SH";
	};
};

_currentDam
