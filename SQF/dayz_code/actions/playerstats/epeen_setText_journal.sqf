

private ["_ys","_ms","_ds","_b","_2","_6","_7","_8","_9","_10","_str_left_text","_1","_3","_4","_5","_blood_in_pack","_blood_in_inv","_mag_arr","_backpack","_11","_mags_for_weap","_mssv_cnt","_weapon","_config"];

_str_left_text = "
<t size = '1.4' font = 'Zeppelin33' color = '#000000' shadow = 'false' align = 'left'>
My name is %1.  I woke up %2 somewhere in %3; an area of the infected hell hole also known as %4.
<br />
<br />
The date is %5, and %6
<br />
<br />
%7%8%9  %10
<br />
<br />
%11
</t>
";

_1 = name player;

if (player hasWeapon "ItemWatch") then
{
	if (dayz_Survived == Dayz_logonDate) then // only interested if the same - assume server will only run over one day before restart
	{
		switch (true) do
		{
			case (Dayz_logonTime > 20): {_2 = "tonight"};
			case (Dayz_logonTime > 17): {_2 = "this evening"};
			case (Dayz_logonTime > 12): {_2 = "this afternoon"};
			default {_2 = "this morning" };
		};
	} else
	{
		switch (true) do
		{
			case (Dayz_logonTime > 20): {_2 = "last night"};
			case (Dayz_logonTime > 17): {_2 = "yesterday evening"};
			case (Dayz_logonTime > 12): {_2 = "yesterday afternoon"};
			default {_2 = "early yesterday" };
		};
	};
} else
{
	_2 = "a while ago";
};

_3 = Dayz_logonTown;

_4 = worldName;

_ys = str (date select 0);
_ms = "";
_ds = str (date select 2);

switch (true) do
{
	case (date select 1 == 1):{_ms = "Jan"};
	case (date select 1 == 2):{_ms = "Feb"};
	case (date select 1 == 3):{_ms = "Mar"};
	case (date select 1 == 4):{_ms = "Apr"};
	case (date select 1 == 5):{_ms = "May"};
	case (date select 1 == 6):{_ms = "June"};
	case (date select 1 == 7):{_ms = "July"};
	case (date select 1 == 8):{_ms = "Aug"};
	case (date select 1 == 9):{_ms = "Sep"};
	case (date select 1 == 10):{_ms = "Oct"};
	case (date select 1 == 11):{_ms = "Nov"};
	case (date select 1 == 12):{_ms = "Dec"};
};

_5 = _ds + " " + _ms + " " + _ys;

// can't test dayz_Survived at home

switch (true) do
{
	case (dayz_Survived == 0): {_6 = "it's my first day here since waking up on the shore."};
	case (dayz_Survived == 1): {_6 = "I've only been here a day, so still getting used to what's going on."};
	case (dayz_Survived > 1): {_6 = format ["I've been here %1 days and counting.", dayz_Survived]};
	default {};
};

switch (true) do
{
	case (!r_fracture_legs and !r_fracture_arms): {_7 = "At least I haven't got any broken bones, "};
	case (r_fracture_legs and r_fracture_arms): {_7 = "The situation looks dire.  I've got multiple broken bones, "};
	case (r_fracture_legs): {_7 = "Things could be better. My leg is broken, "};
	case (r_fracture_arms): {_7 = "Things aren't so good.  My arm is broken, "};
	default {};
};

switch (true) do
{
	case (r_player_infected):
	{
		if (!r_fracture_legs and !r_fracture_arms) then
		{
			_8 = "although I do feel really sick, ";
		} else
		{
			_8 = "I feel really feverish, ";
		};
	};
	default {_8 = " "};
};

if (r_fracture_legs or r_fracture_arms) then
{
	switch (true) do
	{
		case (r_player_blood < 3000): {_9 = "and I'm fading fast from lack of blood."};
		case (r_player_blood < 6000): {_9 = "and I've lost a lot of blood."};
		case (r_player_blood < 9000): {_9 = "and I've lost some blood."};
		case (r_player_blood < 11000): {_9 = "and I've got some minor wounds."};
		case (r_player_blood == 12000): {_9 = "but somehow I don't appear have lost any blood.  Strange."};
		default {_9 = ""};
	};
}else
{
	switch (true) do
	{
		case (r_player_blood < 3000): {_9 = "but I'm physically pale from loss of blood."};
		case (r_player_blood < 6000): {_9 = "but I've lost a lot of blood."};
		case (r_player_blood < 9000): {_9 = "but I've lost some blood."};
		case (r_player_blood < 11000): {_9 = "but apart from some minor wounds that need tending to, I'm in pretty good shape."};
		case (r_player_blood == 12000):
		{
			if (r_player_infected) then
			{
				_9 = "but quite strangely the sickness hasn't affected my wellbeing.";
			} else
			{
				_9 = "and I'm in full health";
			};
		};
		default {_9 = ""};
	};
};

_blood_in_pack = false;
_backpack = unitBackpack player;

if (!isNull _backpack) then
{
	_mag_arr = getMagazineCargo _backpack;
	if ("ItemBloodbag" in (_mag_arr select 0)) then
	{
		_blood_in_pack = true;
	};
};
_blood_in_inv = false;

if ("ItemBloodbag" in (magazines player)) then
{
	_blood_in_inv = true;
};

_10 = "";

if (r_player_blood < 9000 and (_blood_in_inv or _blood_in_pack)) then
{
	if (_blood_in_inv) then
	{
		_10 = "Good thing I've got a blood bag on me.  Now if only there was someone who could hook me up...";
	} else
	{
		_10 = "Good thing I've got a blood bag in my backpack.  Now if only there was someone who could hook me up...";
	};
};
if (r_player_blood < 9000 and ! _blood_in_inv and ! _blood_in_pack) then
{
	_10 = "I really need to get a transfusion from somewhere.  If only I had a blood bag.";
};

_11 = "";

_weapon = currentWeapon player;
_config = configFile >> "CfgWeapons";

// possibly filter out torch and the dayz_throwweapon thingy too.  Need to get feedback..

if (_weapon != "" and _weapon != "Throw" and _weapon != "Put" and _weapon != "Flare") then
{
	switch (true) do
	{
		case (getText (_config >> _weapon >> "melee") == "true"): // used getText as config entry had "" marks around it.
		{
			_11 = format ["Good news is I've got my trusty %1 to defend myself with.", getText (_config >> _weapon >> "displayName")];
		};
        case (_weapon == "ItemFlashlight" or _weapon == "ItemFlashlightRed"):
		{
			if (sunOrMoon == 1) then
			{
				_11 = format ["I've got a %1 but it won't be much use in this daylight.", getText (_config >> _weapon >> "displayName")];
			} else
			{
				_11 = format ["I've got a %1 which is perfect for seeing in this dark.  I guess other survivors can see me flashing it about though.  Not sure if that's a good thing or not given the circumstances.", getText (_config >> _weapon >> "displayName")];
			};
		};
		case (_weapon == "Makarov"):
		{
			_11 = format ["I've got a damn %1 so people better watch out.", getText (_config >> _weapon >> "displayName")];
		};
		default
		{
			_mags_for_weap = getArray (_config >> _weapon >> "magazines");

			_mssv_cnt = false;
			{
				if (_x in _mags_for_weap) then
				{
					_mssv_cnt = true;
				};
			} forEach (magazines player);

			if (_mssv_cnt) then
			{
				if (player ammo _weapon > 0) then
				{
					_11 = format ["Good news is I'm packing a %1 and I've got some ammo for it.", getText (configFile >> "CfgWeapons" >> _weapon >> "displayName")];
				} else
				{
					_11 = format ["Good news is I'm packing a %1 and I've got some ammo for it.  I should probably reload it though seeing as it's empty.", getText (configFile >> "CfgWeapons" >> _weapon >> "displayName")];
				};
			} else
			{
				_11 = format ["Good news is I've found a %1 but I haven't got any ammo for it.", getText (_config >> _weapon >> "displayName")];
			};
		};
	};
} else
{
	_11 = "For some reason I think it's a good idea to wander about without arming myself.  Maybe I should try and find a weapon.";
};

// left page
((uiNamespace getVariable "horde_myDisplay") displayCtrl 1800) ctrlSetStructuredText parseText format [_str_left_text, _1, _2, _3, _4, _5, _6, _7, _8, _9, _10, _11];

// right page - blank until humanity is checked

_b = "<img size = '5' image = '\z\addons\dayz_communityassets\pictures\playerstats\tally\0.paa'/>";

((uiNamespace getVariable "horde_myDisplay") displayCtrl 1801) ctrlSetStructuredText parseText format ["%1", _b];
((uiNamespace getVariable "horde_myDisplay") displayCtrl 1802) ctrlSetStructuredText parseText format ["%1", _b];
((uiNamespace getVariable "horde_myDisplay") displayCtrl 1803) ctrlSetStructuredText parseText format ["%1", _b];
((uiNamespace getVariable "horde_myDisplay") displayCtrl 1804) ctrlSetStructuredText parseText format ["%1", _b];
((uiNamespace getVariable "horde_myDisplay") displayCtrl 1805) ctrlSetStructuredText parseText format ["%1", _b];
((uiNamespace getVariable "horde_myDisplay") displayCtrl 1806) ctrlSetStructuredText parseText format ["%1", _b];
((uiNamespace getVariable "horde_myDisplay") displayCtrl 1807) ctrlSetStructuredText parseText format ["%1", _b];
((uiNamespace getVariable "horde_myDisplay") displayCtrl 1808) ctrlSetStructuredText parseText format ["%1", _b];
((uiNamespace getVariable "horde_myDisplay") displayCtrl 1809) ctrlSetStructuredText parseText format ["%1", _b];

