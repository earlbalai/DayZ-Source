//["dayzUpdateVehicle",[_this select 3,"all"]] call callRpcProcedure;
private["_object"];

_cursorTarget = _this select 3;

if (_cursorTarget isKindOf "TentStorage") then {
	dayzUpdateVehicle = [_cursorTarget,"gear"];
};
if (cursorTarget isKindOf "AllVehicles") then {
	dayzUpdateVehicle = [_cursorTarget,"all"];
};

publicVariableServer "dayzUpdateVehicle";
if (isServer) then {
	dayzUpdateVehicle call server_updateObject;
};