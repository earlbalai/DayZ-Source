// bleed.sqf
_unit = (_this select 3) select 0;
_isDead = _unit getVariable["USEC_isDead",false];
call fnc_usec_medic_removeActions;
player removeMagazine "ItemEpinephrine";

player playActionNow "Medic";

sleep 3;

if (!_isDead) then {
	_unit setVariable ["NORRN_unconscious", false, true];
	_unit setVariable ["USEC_isCardiac",false,true];
	sleep 5;
	//["PVDZ_hlt_Epi",[_unit,player,"ItemEpinephrine"]] call broadcastRpcCallAll;
	PVDZ_hlt_Epi = [_unit,player,"ItemEpinephrine"];
	publicVariable "PVDZ_hlt_Epi";
};

r_action = false;