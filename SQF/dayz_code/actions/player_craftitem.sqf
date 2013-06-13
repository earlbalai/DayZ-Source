/*
	Created by Alby exclusively for DayZMod.
	Please request permission to use/alter from Alby.
*/

private["_config","_input","_output","_required","_failChance","_hasInput","_availabeSpace"];
disableSerialization;
_config = configFile >> "CfgWeapons" >> _this;

_input = getArray (_config >> "ItemActions" >> "Craft" >> "input");
_output = getArray (_config >> "ItemActions" >> "Craft" >> "output");
_required = getArray (_config >> "ItemActions" >> "Craft" >> "required");
_failChance = getNumber (_config >> "ItemActions" >> "Craft" >> "failChance");

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
		cutText[format[(localize "str_crafting_missing"),(_amount - _avail),_itemName], "PLAIN DOWN"];
	};
}forEach (_input + _required);

if (_hasInput) then {
	_freeSlots = [player] call BIS_fnc_invSlotsEmpty;
	{
		_item = _x select 0;
		_amount = _x select 2;
		_slotType = [_item] call BIS_fnc_invSlotType;
		for "_i" from 1 to _amount do {
			for "_j" from 1 to (count _slotType) do {
				if ((_slotType select _j) > 0) then {
					_freeSlots set[_j, ((_freeSlots select _j) + (_slotType select _j))];
				};
			};
		};
	}forEach _input;

	_availabeSpace = true;
	{

		_item = _x select 0;
		_amount = _x select 2;
		_slotType = [_item] call BIS_fnc_invSlotType;
		for "_i" from 1 to _amount do {
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
		player playActionNow "PutDown";
		{
			_item = _x select 0;
			_amount = _x select 2;
			for "_i" from 1 to _amount do {
				_selection = _x select 1;
				switch (_selection) do {
					case "CfgWeapons":
					{
						player removeWeapon _item;
					};
					case "CfgMagazines":
					{
						player removeMagazine _item;
					};
				};
				sleep 0.1;
			};
		}forEach _input;

			{
				_item = _x select 0;
				_selection = _x select 1;
				_amount = _x select 2;
				_itemName = getText(configFile >> _selection >> _item >> "displayName");
				for "_i" from 1 to _amount do {
					if (random 1 > _failChance) then {
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
						cutText[format[(localize "str_crafting_success"),_itemName], "PLAIN DOWN"];
						sleep 2;
					} else {
						cutText[format[(localize "str_crafting_failed"),_itemName], "PLAIN DOWN"];
						sleep 2;
					};
				};

			}forEach _output;
	};
};