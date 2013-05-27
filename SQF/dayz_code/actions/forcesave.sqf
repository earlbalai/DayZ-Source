//["PVDZ_veh_Save",[_this select 3,"all"]] call callRpcProcedure;
private["_object"];

_cursorTarget = _this select 3;

if (_cursorTarget isKindOf "TentStorage") then {
	PVDZ_veh_Save = [_cursorTarget,"gear"];
};
if (cursorTarget isKindOf "AllVehicles") then {
	PVDZ_veh_Save = [_cursorTarget,"all"];
};

publicVariableServer "PVDZ_veh_Save";
if (isServer) then {
	PVDZ_veh_Save call server_updateObject;
};