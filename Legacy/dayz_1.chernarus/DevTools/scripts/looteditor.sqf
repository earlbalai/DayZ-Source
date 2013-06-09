/*
        Created exclusively for ArmA2:OA - DayZMod.
        Please request permission to use/alter/distribute from project leader (R4Z0R49) AND the author (facoptere@gmail.com)
*/

/*
Howto use:

1/ for other map than Chernarus, edit the values plr_initpos, plr_initdir, bld_initpos, bld_sparepos  below.
2/ if you to add some building to edit, add them to bld_list array.
3/ Use dev mission files, open monkey monitor menu, select lootpos editor. It"s an one way trip. To quit the editor, disconnect.
4/ Editor start, you will see the first building in front of you. Each lootpos contains a "glass" vehicle part.
5/ use the keys shown on the hint window in the right.
6/ if a lootpos has been modified, a special log line will be printed in arma2oa.RPT clienside log. 
   format:  [<date>] lootpos   <building type>  lootPos[] = {{x,y,z}...};  
7/ Once you edited all buildings, extract lootpos lines and copy/paste them 
   into dayz_code/Configs/CfgLoot/CfgBuildingPos.hpp     
   Don't forget to change maxRoaming (= max number of Zed) and lootChance
   if Zeds are prone to commit suicide while spawing, because the lootpos is high, or in the roofslope, or has to AI path, you will have to set maxRoaming=0
*/
hintkbd = 'DevTools\scripts\looteditor.paa';
plr_initpos = [4148, 10872, 0]; // where the player (editor) should be
plr_initdir = 92; // direction so that he is facing the building
bld_initpos = [4194, 10864,0]; // where the edited building should be
bld_sparepos = [4214, 10875,0]; // another flat horizontal pos, further than building (must not collide)
bld_list = [ "Camp", "CampEast_EP1", "CampEast", "datsun01Wreck", "FarmRoaming", "Fort_Barricade", "Grave", "GraveCross1", "GraveCross2", "GraveCrossHelmet", "HouseRoaming", "LADAWreck", "Land_A_BuildingWIP", "Land_A_Castle_Bergfrit", "Land_A_Castle_Gate", "Land_A_Castle_Stairs_A", "Land_A_Crane_02b", "Land_A_CraneCon", "Land_A_FuelStation_Build", "Land_A_GeneralStore_01", "Land_A_GeneralStore_01a", "Land_A_Hospital", "Land_A_MunicipalOffice", "Land_A_Office01", "Land_A_Office02", "Land_A_Pub_01", "Land_a_stationhouse", "Land_A_statue01", "Land_A_TVTower_Base", "Land_Barn_Metal", "Land_Barn_W_01", "Land_Barn_W_02", "Land_BoatSmall_2b", "Land_Church_01", "Land_Church_02", "Land_Church_02a", "Land_Church_03", "Land_Church_05R", "Land_Farm_Cowshed_a", "Land_Farm_Cowshed_b", "Land_Farm_Cowshed_c", "Land_GuardShed", "Land_Hangar_2", "Land_Hlidac_budka", "Land_HouseB_Tenement", "Land_HouseBlock_A1_1", "Land_HouseBlock_A1_2", "Land_HouseBlock_A1", "Land_HouseBlock_A2_1", "Land_HouseBlock_A2", "Land_HouseBlock_A3", "Land_HouseBlock_B1", "Land_HouseBlock_B2", "Land_HouseBlock_B3", "Land_HouseBlock_B4", "Land_HouseBlock_B5", "Land_HouseBlock_B6", "Land_HouseBlock_C1", "Land_HouseBlock_C2", "Land_HouseBlock_C3", "Land_HouseBlock_C4", "Land_HouseBlock_C5", "Land_HouseV_1I1", "Land_HouseV_1I2", "Land_HouseV_1I3", "Land_HouseV_1I4", "Land_HouseV_1L1", "Land_HouseV_1L2", "Land_HouseV_1T", "Land_HouseV_2I", "Land_HouseV_2L", "Land_HouseV_2T1", "Land_houseV_2T2", "Land_HouseV_3I1", "Land_HouseV_3I2", "Land_HouseV_3I3", "Land_HouseV_3I4", "Land_HouseV2_01A", "Land_HouseV2_01B", "Land_HouseV2_02_Interier", "Land_HouseV2_03", "Land_HouseV2_04_interier", "Land_hut06", "Land_Ind_Expedice_1", "Land_Ind_Garage01", "Land_Ind_Mlyn_03", "Land_Ind_Pec_01", "Land_Ind_Shed_01_end", "Land_Ind_Shed_02_main", "Land_Ind_SiloVelke_01", "Land_Ind_TankBig", "Land_Ind_Vysypka", "Land_Ind_Workshop01_01", "Land_Ind_Workshop01_02", "Land_Ind_Workshop01_04", "Land_Ind_Workshop01_L", "Land_KBud", "Land_komin", "Land_kulna", "Land_Mil_Barracks_i", "Land_Mil_Barracks_L", "Land_Mil_Barracks", "Land_Mil_ControlTower", "Land_Mil_Guardhouse", "Land_Mil_House", "Land_Misc_Cargo1Ao", "Land_Misc_Cargo1Bo", "Land_Misc_Cargo1D", "Land_Misc_deerstand", "Land_Misc_Garb_Heap_EP1", "Land_Misc_GContainer_Big", "Land_Misc_PowerStation", "Land_Misc_Rubble_EP1", "Land_Nav_Boathouse", "Land_Panelak", "Land_Panelak2", "Land_psi_bouda", "Land_Rail_House_01", "Land_rail_station_big", "Land_ruin_01", "Land_sara_domek_zluty", "Land_Shed_Ind02", "Land_Shed_M02", "Land_Shed_W01", "Land_Shed_W02", "Land_Shed_W03", "Land_Shed_W4", "Land_Shed_wooden", "Land_SS_hangar", "Land_stodola_old_open", "Land_stodola_open", "Land_telek1", "Land_tent_east", "Land_Toilet", "Land_Tovarna2", "Land_trafostanica_velka", "Land_wagon_box", "MASH_EP1", "MASH", "Mi8Wreck_DZ", "Misc_TyreHeap", "RU_WarfareBFieldhHospital", "Rubbish5", "SKODAWreck", "UH1Wreck_DZ", "UH60Wreck_DZ", "UralWreck", "USMC_WarfareBFieldhHospital" ];


_init = {
	// 65 lootable buildings
	_bld = bld_list;

	cutText [ format ["    P L E A S E   W A I T ...\nSpawning %1 buildings in limbo", count _bld], "PLAIN DOWN"];
	curhouse = 0;
	myhouses = [];
	{
		_loot=[] + getArray(configFile >> "CfgBuildingLoot" >> _x >> "lootPos");
		//if (count _loot > 0) then {
			_o = _x createVehicleLocal [0,0,100];sleep 0.01;
			_o setVectorDirAndUp [[0,0,1],[0,0,1]];
			myhouses set [count myhouses, _o ];
			_o setVariable [ "loot", _loot ];
		//};
	} forEach _bld;
	diag_log(format["init done %1", count myhouses]);
};

_settle = {
	private ["_o", "_a", "_p", "_orig"];
	_o = myhouses select curhouse;
	_orig = +(bld_initpos);
	_orig set [2, 0.01];
	if (typeOf _o == "Land_A_Castle_Bergfrit") then { 
		_orig set [2, -10];
	};
	if (typeOf _o == "Land_A_Crane_02b") then { 
		_orig set [2, -10.4];
	};
	_o setPos _orig;
//	if (typeOf _o == "Land_HouseB_Tenement") then { _o setPos [4194, 10864, -39.5]; };
//	if (typeOf _o == "Land_A_Hospital") then { _o setPos [4194, 10864, -10.5]; };
	
	_a = [];
	_o setVariable [ "edited", false ];
	{
		_dot = if (count _x > 3) then { (_x select 3) createVehicleLocal [0,0,0] } else { (types select curType) createVehicleLocal [0,0,0] };
		_dot setPos bld_initpos;
		if (count _x > 4) then { _dot setDir ((getDir _o)+(_x select 4)); };
		//diag_log(format["settle %1 %2 %3", getDir _o, _x select 4, getDir _dot]);
		_p = +(_x);
		_p resize 3;
		_dot setPosATL (_o modelToWorld _p);
		_p = getPosATL _dot;
		if (_p select 2 < 0.01) then {
			if (abs((_p select 2) - 0.01) > 0.01) then { _o setVariable [ "edited", true ]; };
			_p set [2, 0.01];
			_dot setPosATL _p;
		};
		_a set [count _a, _dot];
	} forEach (_o getVariable ["loot", []]);
	_o setVariable [ "dots", _a];
	diag_log("settle done");
};

_dismantle = {
	_rndxyz = {
		[round((_this select 0)*100)/100,round((_this select 1)*100)/100,round((_this select 2)*100)/100];
	};
	private ["_o", "_a", "_onlyloot"];
	_o = myhouses select curhouse;
	_a = [];
	_b = [];
	{
		_pos = _o worldToModel (getPosATL _x);
		if (_pos distance [0,0,0] < (sizeOf(typeOf(_o)))) then {
			_pos = _pos call _rndxyz;
			if ((typeOf _x) IN ["Sign_sphere25cm_EP1","WeaponHolder_PartGlass"] ) then {
				_b set [count _b, +(_pos)];
			};
			_pos set [ count _pos, typeOf _x ];
			//diag_log(format["dismantle %1 %2", getDir _x, getDir _o]);
			_pos set [ count _pos, (round((getDir _x)-(getDir _o)+720)%360)];
			_a set [count _a, _pos];
		}
		else { diag_log(format["Err:%1 %2/%3", _x, _pos distance [0,0,0],(sizeOf(typeOf(_o)))]);};
		deleteVehicle _x;
	} forEach (_o getVariable ["dots", []]);
	if (_o getVariable ["edited", false]) then {
		_tmp = toArray str _b;
		{
			if (_x == 91) then { _tmp set [_forEachIndex, 123 ]; }
			else { if (_x == 93) then { _tmp set [_forEachIndex, 125 ]; }; };
		} forEach _tmp;
		_b = toString _tmp;
		diag_log(format["%1 lootpos       %2   lootPos[] = %3;  " , date, typeOf _o, _b]);
		diag_log(format["%1 antiwallhack  [""%2"", [], %3]  " , date, typeOf _o, _a]);
		_o setVariable [ "loot", _a ];
		cutText [ format ["%1 saved in arma2oa.RPT log !", typeOf _o], "PLAIN DOWN"];
	};
	_o setPosATL [0,0,0];
	diag_log("dismantle done");
};

_myfunc = {
private ["_h","_o","_p", "_search", "_ret"];
_search = {
	private ["_o"];
	_o = cursorTarget;
	if ((!isNull _o) AND {((typeOf _o) IN types)}) exitWith {_o};
	_o = (nearestObjects [getPosATL player, types, 6]);
	if (count _o == 0) exitWith {objNull};
	_o = _o select 0;
	if (isNull _o) exitWith {_o};
	_p = [player,_o] call BIS_fnc_relativeDirTo;
	if (_p >180) then { _p = _p -360;};
	if ((player distance _o < 40) AND {(abs(_p) <40)}) exitWith{_o};
	objNull
};
_delete = {
	private ["_l"];
	_l = (myhouses select curhouse) getVariable ["dots", []];
	_l = _l - [_this];
	(myhouses select curhouse) setVariable ["dots", _l];
};
_insert = {
	private ["_l"];
	_l = (myhouses select curhouse) getVariable ["dots", []];
	_l set [count _l, _o ];
	(myhouses select curhouse) setVariable ["dots", _l];
};
_ret = false;
_h = "LOOT EDITOR<br/><t size='0.2' color='#00000001'>.<br/></t><t align='left' font='LucidaConsoleB' size='0.7'>";
if (isNil "myhouses") exitWith {_ret};
_o = (myhouses select curhouse);
if (!isNull _o) then {
	_h = format["%1<t color='#6080FF'>Building </t>%2<br/><t color='#6080FF'>NbLoots </t>%3<br/>",
		_h,
		typeOf _o, 
		count (_o getVariable ["dots",[]])
		//,round((getDir player)-(getDir _o)+720)%360
	];
};
// _o = cursorTarget;
// if (_o != objNull) then {
// 	_h = format["%1<br/>Pointing:%2",	_h, typeOf _o];
// };
_o = call _search;
switch (_this select 1) do {
	case 73: { // up
		if (isNull _o) exitWith {_ret};
		_p = getPosASL _o;
		_p set [ 2, (_p select 2 )+mystep];
		_o setPosASL _p;
		_o setVelocity [0,0,0];
		(myhouses select curhouse) setVariable [ "edited", true ];
//		_h = format["%1<br/>%2<br/>%3",_h, "UP",_o];
		_ret = true;
	};
	case 81: { // down
		if (isNull _o) exitWith {_ret};
		_p = getPosATL _o;
		_p set [ 2, (_p select 2 )-mystep];
		_o setPosATL _p;
		_o setVelocity [0,0,0];
		(myhouses select curhouse) setVariable [ "edited", true ];
//		_h = format["%1<br/>%2<br/>%3",_h, "DOWN",_o];
		_ret = true;
	};
	case 72: { // forward
		if (isNull _o) exitWith {_ret};
		_p = player worldToModel (getPosATL _o);
		_p set [ 1, (_p select 1)+mystep];
		_o setDir (15*round((getDir player)/15));
		_o setPosATL (player modelToWorld _p);
		_o setVelocity [0,0,0];
		(myhouses select curhouse) setVariable [ "edited", true ];
//		_h = format["%1<br/>%2",_h, "FW"];
		_ret = true;
	};
	case 80: { // backwars
		if (isNull _o) exitWith {_ret};
		_p = player worldToModel (getPosATL _o);
		_p set [ 1, (_p select 1)-mystep];
		_o setDir (15*round((getDir player)/15));
		_o setPosATL (player modelToWorld _p);
		_o setVelocity [0,0,0];
		(myhouses select curhouse) setVariable [ "edited", true ];
//		_h = format["%1<br/>%2",_h, "BW"];
		_ret = true;
	};
	case 75: { // left (according to player)
		if (isNull _o) exitWith {_ret};
		_p = player worldToModel (getPosATL _o);
		_p set [ 0, (_p select 0)-mystep];
		_o setDir (15*round((getDir player)/15));
		_o setPosATL (player modelToWorld _p);
		_o setVelocity [0,0,0];
		(myhouses select curhouse) setVariable [ "edited", true ];
//		_h = format["%1<br/>%2",_h, "LEFT"];
		_ret = true;
	};
	case 77: { // right (according to player)
		if (isNull _o) exitWith {_ret};
		_p = player worldToModel (getPosATL _o);
		_p set [ 0, (_p select 0)+mystep];
		_o setDir (15*round((getDir player)/15));
		_o setPosATL (player modelToWorld _p);
		_o setVelocity [0,0,0];
		(myhouses select curhouse) setVariable [ "edited", true ];
//		_h = format["%1<br/>%2",_h, "RIGHT"];
		_ret = true;
	};
	case 211: { // delete
		if (isNull _o) exitWith {_ret};
		_o call _delete; // delete from objects list
		deleteVehicle _o;
		(myhouses select curhouse) setVariable [ "edited", true ];
//		_h = format["%1<br/>%2",_h, "delete"];
		_ret = true;
	};
	case 210: { // new
		_o = (types select curType) createVehicleLocal [0,0,0];
		_o setDir (getDir player);
		_o setPos (player modelToWorld [0, 1, 0]);
		_o call _insert; // insert to objects list
		(myhouses select curhouse) setVariable [ "edited", true ];
//		_h = format["%1<br/>%2 %3",_h, "new", _o];
		_ret = true;
	};
	case 201: { // save/next
		if (curhouse+1 < count myhouses) then {
			call dismantle;
			curhouse = curhouse +1;
			call settle;
//			_h = format["%1<br/>%2 %3",_h, "NEXT", curhouse];
			curType = 0;
			_ret = true;
		}
		else { diag_log(format["cur:%1 tot:%2", curhouse, count myhouses]);};
	};
	case 209: { // save/prev
		if (curhouse > 0) then {
			call dismantle;
			curhouse = curhouse -1;
			call settle;
//			_h = format["%1<br/>%2 %3",_h, "PREV", curhouse];
			curType = 0;
			_ret = true;
		}; 
	};
	case 55: { // next model
		curType = if (curType+1 >= count types) then {0} else {curType+1};
//		_h = format["%1<br/>%2 %3",_h, "Type", types select curType];
		_ret = true;
	};
	case 181: { // prev model
		curType = if (curType == 0) then {(count types)-1} else {curType-1};
//		_h = format["%1<br/>%2 %3",_h, "Type", types select curType];
		_ret = true;
	};
	case 30; case 31; case 32; case 17; case 1 : { _ret = false; };
};
_h = format["%1<t size='0.4' color='#00000001'>.<br/></t><t color='#6080FF'>Next item to add</t><br/>%2<br/><img  size='9' image='%3'/><br/><t size='0.4' color='#00000001'>.<br/></t><t color='#00000001'>___</t><t color='#FFFF00'>Insert </t>Add an item<br/><t color='#00000001'>___</t><t color='#FFFF00'>Delete </t>Delete an item<br/><t color='#FF00FF'>  Page Up </t>Next building<br/><t color='#FF00FF'>Page Down </t>Previous building<br/><t color='#FF0000'> /  </t>Previous item type<br/><t color='#FF0000'>  * </t>Next item type<br/>", _h,types select curType, hintkbd];

if ((!isNull _o) AND {(typeOf _o != "")}) then {
	_h = format["%1<br/><t color='#6080FF'>Editing item</t><br/>%2<br/><t size='0.4' color='#00000001'>.<br/></t><t color='#00FF00'>  9 </t>Up<br/><t color='#00FFFF'> 8  </t>Forth<br/><t color='#00FFFF'>4 6 </t>Left Right<br/><t color='#00FFFF'> 2  </t>Back<br/><t color='#00FF00'>  3 </t>Down", _h, typeOf _o];//",	_h, typeOf _o];
};
_h = _h+"</t>";

hintSilent parseText _h;

"dynamicBlur" ppEffectEnable false;
"colorCorrections" ppEffectEnable false;
"filmGrain" ppEffectEnable false; 
"radialBlur" ppEffectEnable false;
"wetDistortion" ppEffectEnable false;
"chromAberration" ppEffectEnable false;

_ret
};

//diag_log(format["1 %1", curhouse]);


if (isNil "myhouses") then {
	building_spawnZombies = {0};
	fnc_usec_damageHandler = {0};
	player_zombieAttack = {};
	settle = _settle;
	dismantle = _dismantle;
	myfunc = _myfunc;
	terminate dayz_HintMontior;

	mystep=0.01;
	curType = 0;
	types = ["WeaponHolder_PartGlass","Fort_RazorWire","Land_CncBlock_D","Sign_sphere25cm_EP1","Hedgehog"];

	player setDir plr_initdir;
	player setPosATL plr_initpos;

	call _init; // create myhouses array
	[0,201] call myfunc; // select first building
	[] spawn { while {true} do { [0,0] call myfunc; sleep 0.5; }; };
	myhdl = (findDisplay 46) displayAddEventHandler ["KeyDown", "_this call myfunc"];
};
