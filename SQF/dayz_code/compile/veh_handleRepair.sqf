/*
        Created exclusively for ArmA2:OA - DayZMod.
        Please request permission to use/alter/distribute from project leader (R4Z0R49) AND the author (facoptere@gmail.com)
*/

/***********************************************************
REPAIR A PART OF A UNIT. 
Called by "PVDZ_veh_SF" PV
or by action/repair.sqf

- Function fnc_veh_handleRepair
- [unit, selectionName, damage, broadcast] call fnc_veh_handleRepair;
- return : 0 :)
broadcast: boolean. if true, then the request will be sent to all players if the vehicle is not local.
************************************************************/
private ["_unit","_selection","_dam","_SVname"];

_unit = _this select 0;
_selection = _this select 1;
if (_selection == "?") then { _selection = ""; }; // bad arma triggered event (workaround)
_dam = 1 min (0 max (_this select 2));
_SVname = "hit_" + _selection;

//diag_log(format["%1 this:%2", __FILE__, _this]);

if (local _unit) then {
	_globalDam = damage _unit;
	if (_selection != "") then {
		// only local unit can set the damage of a vehicle part
		_unit setVariable [_SVname, 0, true];
		_unit setHit [_selection, 0];
	//diag_log(format["%1: %2 setHit %3 %4", __FILE__, _unit, _selection, 0]);
		// we change also global damage, according to number of vehicle parts
		_globalDam = 0.01 max (_globalDam - 1.3/(1+(count (_unit call vehicle_getHitpoints))));
	}
	else { // generic part for global damage
		_globalDam = 0.01; // not 0 otherwise all parts will be magically repaired
	};
	_unit setDamage _globalDam;
	//diag_log(format["%1: %2 setDamage %3 %4", __FILE__, _unit, _globalDam]);
	if (!isServer) then {
		PVDZ_veh_Save = [_unit, "repair"];
		publicVariableServer "PVDZ_veh_Save";		
	}
	else {
		[_unit, "repair"] call server_updateObject;
	};
}
else {
	if ( (count _this > 3) AND {(_this select 3)}) then {
		// vehicle is not local to this client, ask the client which vehicle is local to set damage
		_this resize 3; // delete "broadcast" boolean 
		PVDZ_veh_SF = _this;
		publicVariable "PVDZ_veh_SF";
	};
};

0
