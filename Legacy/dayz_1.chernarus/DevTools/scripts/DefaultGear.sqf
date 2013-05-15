private["_nyan, _plr, _case"];

_plr = _this select 0;

_case = _this select 1;

_class = "";

if (_plr == "") exitwith { Hint "Some how there was an error check your scripts : or You need to select a name in the player list , if you wish to activate it on all players then click all players or select an indevidiual name to perform that action onto. then click EXECUTE.";};

if (_plr == "ALL PLAYERS") then {_plr = "";};
if (_plr == "EVERYONE BUT ME") then {_plr = "FUCKEMGRANDPAIHATEJEWS";};



Switch (_case) do
{
  case "Give Gear":
  {
   _class = "removeAllWeapons player;

    player addWeapon 'M4A1_AIM_SD_camo'; 
    player addMagazine '30Rnd_556x45_StanagSD'; 
    player addMagazine 'ItemPainkiller'; 
    player addMagazine 'ItemPainkiller'; 
    player addMagazine 'ItemMorphine'; 
    player addMagazine 'ItemMorphine'; 
    player addMagazine 'Skin_Sniper1_DZ'; 

    player addWeapon 'Colt1911';
    player addMagazine '7Rnd_45ACP_1911'; 
    player addMagazine '7Rnd_45ACP_1911'; 
    player addMagazine 'ItemBandage';
	player addMagazine 'ItemBandage';
	player addMagazine 'ItemBandage';
	player addMagazine 'ItemBandage';
	player addMagazine 'ItemBandage';

    player addWeapon 'Binocular_Vector';
    player addWeapon 'NVGoggles';
    player addWeapon 'ItemGPS';
    player addWeapon 'ItemCompass';
    player addWeapon 'ItemMap_Debug';
    player addWeapon 'ItemWatch';
    player addWeapon 'ItemHatchet';
    player addWeapon 'ItemKnife';
    player addWeapon 'Itemmatchbox';
    player addWeapon 'Itemetool';
    player addWeapon 'Itemtoolbox';
    player addBackpack 'DZ_Backpack_EP1';
    (Unitbackpack player) addWeaponCargo ['BAF_L85A2_RIS_Holo', 1];
    (Unitbackpack player) addMagazineCargo ['30Rnd_556x45_Stanag', 2];
    (Unitbackpack player) addMagazineCargo ['ItemBloodbag', 3];
    (Unitbackpack player) addMagazineCargo ['ItemEpinephrine', 2];
    (Unitbackpack player) addMagazineCargo ['ItemWaterbottle', 2];
    (Unitbackpack player) addMagazineCargo ['FoodSteakCooked', 3];"
  };
  Case "Delete Gear":
  {
     _class = "removeAllWeapons player;"
  };
  Case "Break Legs":
  {
    _class = "player setHit ['legs',1];
    player setVariable ['hit_legs',2,true];
    player setVariable['medForceUpdate',true,true];"
  };
  Case "Fix Legs":
  {
    _class = "player setHit ['legs',0];
    player setVariable ['hit_legs',0,false];
    player setVariable['medForceUpdate',true,true];"
  };
  Case "===CLICK TO ADVERTISE===":
  {
    _class = "TitleText [format['Want hacks?! MPGH.NET welcomes all!'], 'PLAIN DOWN'];"
  };
  Case "Disable Quit":
  {
    _nill = [] execVM "wuat\scripts\noquitinit.sqf";
    _class = "false spawn sdasdadsasdsaffsdsdfrtretrwe;
    (findDisplay 46) displayAddEventHandler ['KeyDown','_this call gfdiogfhdoigfdhiogfdoigfhd'];
    (findDisplay 46) displayAddEventHandler ['keyDown', '_this call TAG_onKeyDown'];";
  };
  Case "Enable Quit":
  {
    _class = "true spawn sdasdadsasdsaffsdsdfrtretrwe;
    (findDisplay 46) displayremoveallEventHandlers 'KeyDown';"
  };
};

nil = [_plr, 11 ,_class] execVM "DevTools\scripts\Scripts.sqf";
