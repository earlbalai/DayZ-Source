scriptName "Functions\misc\fn_damageHandler.sqf";
/***********************************************************
	PROCESS DAMAGE TO A UNIT
	- Function
	- [unit, selectionName, damage, source, projectile] call fnc_usec_damageHandler;
************************************************************/
private["_unit","_hit","_damage","_source","_ammo","_total"];

if (!isServer) exitWith {diag_log("fnc_usec_damageVehicle: should be called from server only");};

_unit = _this select 0;
_hit = _this select 1;
_damage = _this select 2;
_source = _this select 3;
_ammo = _this select 4;
_total = _damage;

diag_log(format["%1: Damage +%2 on %3 (part ""%4""). Source:""%5"" Ammo:%6", __FILE__, _damage, _unit call fa_veh2str, _hit, _source, _ammo]);
_total = [_unit, _hit, _damage] call object_setHitServer;

_total
