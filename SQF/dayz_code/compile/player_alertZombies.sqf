
private["_unit","_distance","_doRun","_pos","_listTalk","_target","_targets"];

_unit = 	_this select 0;
_distance = _this select 1;
_doRun = 	_this select 2;
_pos = 		_this select 3;
_listTalk = _pos nearEntities ["zZombie_Base",_distance];

if ("ItemMap_Debug" in items player) then {
	diag_log ("alertzeds Unit: " +str(_unit));
	diag_log ("alertzeds Distance: " +str(_distance/2));
	diag_log ("alertzeds DoRun: " +str(_doRun));
	diag_log ("alertzeds Pos: " +str(_pos));
	diag_log ("alertzeds ListTalk: " +str(_listTalk));
};

//hint str(_listTalk);

{
private["_target","_targets"];

	if (local _x) then
	{
		if (_doRun) then
		{
			_target = _x getVariable ["target",[]];
			if (!(_unit in _target)) then
			{
				_target set [count _target,_unit];
				_x setVariable ["target",_target];
			};
		}
		else
		{
			_x setVariable ["myDest",_pos];
		};
	}
	else
	{
		if (_doRun) then
		{
			_targets = _x getVariable ["targets",[]];
			if (!(_unit in _targets)) then
			{
				_targets set [count _targets,_unit];
				_x setVariable ["targets",_targets,true];
			};
		}
		else
		{
			_x setVariable ["myDest",_pos,true];
		};
	};
} forEach _listTalk;
