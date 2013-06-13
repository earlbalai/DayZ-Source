private ["_unit","_blood","_lowBlood","_injured","_inPain","_lastused","_text","_animState","_started","_finished","_timer","_i","_isMedic","_isClose"];
// bleed.sqf
_unit = (_this select 3) select 0;
_blood = _unit getVariable ["USEC_BloodQty", 0];
_lowBlood = _unit getVariable ["USEC_lowBlood", false];
_injured = _unit getVariable ["USEC_injured", false];
_inPain = _unit getVariable ["USEC_inPain", false];
_lastused = _unit getVariable ["LastTransfusion", time];

//if (_lastused - time < 600) exitwith {cutText [format[(localize "str_actions_medical_18"),_text] , "PLAIN DOWN"]};

call fnc_usec_medic_removeActions;
r_action = false;

if (vehicle player == player) then {
	//not in a vehicle
	player playActionNow "Medic";
};

r_interrupt = false;
_animState = animationState player;
r_doLoop = true;
_started = false;
_finished = false;
_timer = diag_tickTime;
_i = 0;

while {r_doLoop and (_i < 12)} do {
	_animState = animationState player;
	_isMedic = ["medic",_animState] call fnc_inString;

	if (_isMedic and !_started) then {
		diag_log format ["TRANSFUSION: starting blood transfusion (%1 > %2)", name player, name _unit];
		player removeMagazine "ItemBloodbag";
		cutText ["Transfusion in progress, remain still...", "PLAIN DOWN"];
		[player,_unit,"loc",rTITLETEXT,"Transfusion in progress, remain still...","PLAIN DOWN"] call RE;
		_started = true;
	};

	if (_started) then {
		if ((diag_tickTime - _timer) >= 1) then {
			_timer = diag_tickTime;
			PVDZ_hlt_Transfuse = [_unit,player,1000];
			publicVariable "PVDZ_hlt_Transfuse";
			[player,25] call player_humanityChange;
			_i = _i + 1;
		};

		if (!_isMedic) then {
			player playActionNow "Medic";
		};
	};

	_blood = _unit getVariable ["USEC_BloodQty", 0];

	if ((_blood >= r_player_bloodTotal) or (_i == 12)) then {
		diag_log format ["TRANSFUSION: completed blood transfusion successfully (_i = %1)", _i];
		cutText ["Transfusion successful.", "PLAIN DOWN"];
		[player,_unit,"loc",rTITLETEXT,"Transfusion successful.","PLAIN DOWN"] call RE;
		r_doLoop = false;
	};

	_isClose = ((player distance _unit) < ((sizeOf typeOf _unit) / 2));

	if (r_interrupt or !_isClose) then {
		diag_log format ["TRANSFUSION: transfusion was interrupted (r_interrupt: %1 | distance: %2 (%3) | _i = %4)", r_interrupt, player distance _unit, _isClose, _i];
		cutText ["The transfusion was interrupted! The blood bag has been lost.", "PLAIN DOWN"];
		[player,_unit,"loc",rTITLETEXT,"The transfusion was interrupted! The blood bag has been lost.","PLAIN DOWN"] call RE;
		r_doLoop = false;
	};

	sleep 0.1;
};

r_doLoop = false;

if (r_interrupt) then {
	r_interrupt = false;
	player switchMove "";
	player playActionNow "stop";
};
