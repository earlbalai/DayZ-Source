private["_holder","_type","_classname","_name"];
_holder = _this select 0;
_type = _this select 1;
_classname = _this select 2;

_name = getText (configFile >> _type >> _classname >> "displayName");

actionMonitor = {
	private["_holder","_type","_classname","_name","_action","_run","_nearPlayers","_actionPlayers","_newActionPlayers"];
	_holder = _this select 0;
	_type = _this select 1;
	_classname = _this select 2;
	_name = _this select 3;

	_run = true;
	_nearPlayers = [];
	_actionPlayers = [];

	diag_log format["actionMonitor: starting..."];
	while { _run } do {
		_tmr = diag_tickTime;
		if (alive _holder) then {
			_nearPlayers = getPosATL _holder nearEntities ["CAManBase", 1];

			if ((count _nearPlayers > 0)) then {
				// Create action for all players nearby
				{
					private["_playerAction"];
					_playerAction = _x addAction [format[(localize "STR_DAYZ_CODE_1"),_name], "\z\addons\dayz_code\actions\object_pickup.sqf",[_type,_classname,_holder], 20, true, true];
					_actionPlayers set [count _actionPlayers, [_x, _playerAction]];
					_x reveal _holder;
					diag_log format["actionMonitor: added action to %1", _x];
				} forEach _nearPlayers;
			} else {
				// Remove action for all players in _actionPlayers because there's no one nearby anyway
				{
					private["_player","_playerAction"];
					_player = _x select 0;
					_playerAction = _x select 1;
					_player removeAction _playerAction;
					diag_log format["actionMonitor: removed action for %1 (reason: no players near)", _player];
				} forEach _actionPlayers;
				_actionPlayers = [];
			};

			// Remove action for players that went out of range
			_newActionPlayers = [];
			{
				private["_player","_playerAction"];
				_player = _x select 0;
				_playerAction = _x select 1;

				if (_player distance _holder > 1) then {
					_player removeAction _playerAction;
					diag_log format["actionMonitor: removed action for %1 (reason: player went out of range)", _player];
				} else {
					_newActionPlayers set [count _newActionPlayers, [_player, _playerAction]];
				};
			} forEach _actionPlayers;
			_actionPlayers = _newActionPlayers;
		} else {
			// Remove action for all players in _actionPlayers because _holder is dead (i.e. picked up or removed)
			{
				private["_player","_playerAction"];
				_player = _x select 0;
				_playerAction = _x select 1;
				_player removeAction _playerAction;
				diag_log format["actionMonitor: removed action for %1 (reason: WeaponHolder is dead)", _player];
			} forEach _actionPlayers;
			diag_log "actionMonitor: Arrow was picked up or removed, exiting";
			_run = false;
		};
		diag_log format["actionMonitor: iteration took %1ms to complete", round ((time - _tmr) * 1000)]
		sleep 2;
	};

	diag_log "actionMonitor: stopped...";
};

if (_classname == "WoodenArrow") then {
	[_holder,_type,_classname,_name] spawn actionMonitor;
} else {
	null = _holder addAction [format[(localize "STR_DAYZ_CODE_1"),_name], "\z\addons\dayz_code\actions\object_pickup.sqf",[_type,_classname,_holder], 20, true, true];
	player reveal _holder;
};
