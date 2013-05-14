/*
	Created by Alby exclusively for DayZMod.
	Please request permission to use/alter from Alby.
*/

private["_config","_input","_output","_required","_hasInput"];
disableSerialization;
_config =	configFile >> "CfgWeapons" >> _this;

_input = 	getArray (_config >> "ItemActions" >> "Craft" >> "input");
_output = 	getArray (_config >> "ItemActions" >> "Craft" >> "output");
_required = getArray (_config >> "ItemActions" >> "Craft" >> "required");

_hasInput = true;

{
	private ["_avail"];
	_selection = _x select 1;
	_item = _x select 0;
	_amount = _x select 2;
	
	switch (_selection) do {
		case "CfgWeapons":
		{ 
			_avail = {_x == _item} count weapons player;
		};
		case "CfgMagazines":
		{
			_avail = {_x == _item} count magazines player;
		};
	};
	
	if (_avail < _amount) exitWith {
		_hasInput = false;
		_itemName = getText(configFile >> _selection >> _item >> "displayName");
		cutText[format[(localize "str_crafting_failed"),(_amount - _avail),_itemName], "PLAIN DOWN"];
	};
}forEach (_input + _required);

if (_hasInput) then {
	player playActionNow "PutDown";
	{
		_item = _x select 0;
		_amount = _x select 2;
		for "_i" from 0 to _amount do {
			_selection = _x select 1;
			switch (_selection) do {
				case "CfgWeapons":
				{
					player removeWeapon _item;
				};
				case "CfgMagazines":
				{
					player removeMagazines _item;
				};
			};
			sleep 0.1;
		};
	}forEach _input;
	
	_freeSlots = [player] call BIS_fnc_invSlotsEmpty;
diag_log (str(_freeSlots));	
	_availabeSpace = true;
	{
	/*
		_classname = _x select 0;
		_type = _x select 1;
		_amount = _x select 2;
		
		_config = (configFile >> _type >> _classname);
		_isOk = [player,_config] call BIS_fnc_invAdd;
		waitUntil {_isOk};
		if (!_isOk) exitwith {
			_availabeSpace = false;
			cutText[(localize "str_crafting_space"), "PLAIN DOWN"];
		};
	*/	
	
		_item = _x select 0;
		_amount = _x select 2;
		_slotType = [_item] call BIS_fnc_invSlotType;
		_count = 0;
		{
			if (_x > 0) exitWith {};
			_count = _count + 1;
		} forEach _slotType;
		for "_i" from 0 to _amount do {	
			for "_j" from 1 to (count _slotType) do {
				if ((_slotType select _j) > 0) then {		
					_freeSlots set[_j, ((_freeSlots select _j) - (_slotType select _j))];
					if (_freeSlots select _j < 0) exitWith {
						_availabeSpace = false;
						cutText[(localize "str_crafting_space"), "PLAIN DOWN"];
					};
				};
			};
		};	
	}forEach _output;
	sleep 1;
	
	if (_availabeSpace) then {
		{
			_item = _x select 0;
			_selection = _x select 1;
			_amount = _x select 2;
			for "_i" from 0 to _amount do {
				switch (_selection) do {
					case "CfgWeapons":
					{
						player addWeapon _item;
					};
					case "CfgMagazines":
					{
						player addMagazine _item;
					};
				};
				_itemName = getText(configFile >> _selection >> _item >> "displayName");
				cutText[format[(localize "str_crafting_success"),_amount,_itemName], "PLAIN DOWN"];
				sleep 2;
			};
		}forEach _output;
	};
};