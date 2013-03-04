
private["_agent","_target","_targets","_range","_manDis","_remote","_local","_objects","_dis","_cantSee","_man"];

_agent = _this;
_target = objNull;
_local = [];
_remote = [];
_targets = [];
_range = 120;
_manDis = 0;

_local =	_agent getVariable ["target",[]];
//diag_log ("Local is: " + str(_local));
_remote =	_agent getVariable ["targets",[]];
//diag_log ("Remote is: " + str(_remote));

if (count _remote == 0) then
{
	_targets = _local;
	//diag_log ("Targets is: " + str(_targets));
}
else
{
	_targets = _local + _remote;
	//diag_log ("Local + Remote targets is: " + str(_targets));
};

if (isNil "_targets") exitWith {};
//Search for objects
if (count _targets == 0) then
{
	_objects = nearestObjects [_agent,["ThrownObjects","GrenadeHandTimedWest","SmokeShell"],50];
	{
		if (!(_x in _targets)) then
		{
			_targets set [count _targets,_x];
		};
	} forEach _objects;
};

//Find best target
if (count _targets > 0) then
{
	_man = _targets select 0;
	_manDis = _man distance _agent;
	{
		private["_dis","_cantSee"];
		_dis =  _x distance _agent;
		_cantSee = [_x,_agent] call dayz_losCheck;

		if ((_x isKindOf "SmokeShell") and (!_cantSee)) exitWith
		{
			_man = _x;
			_manDis = _dis;
		};

		if (_dis < _manDis) then
		{
			if (isPlayer _x) then
			{
				_man = _x;
				_manDis = _dis;
			} else {
				if (!isPlayer _man) then
				{
					_man = _x;
					_manDis = _dis;
				};
			};
		};	
	} forEach _targets;
	_target = _man;
};

//Check if too far
if (_manDis > _range) then
{
	_targets = _targets - [_target];
	_target = objNull;
};

_target
