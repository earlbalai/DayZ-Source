DayZ Community Project
=========================

This is a Community Dayz project.
This code is currently compatible with DayZ 1.7.2.6 and ArmA 2 OA beta patch build 97771.
Now including Rajkosto Hive - Source code can be found here (https://github.com/rajkosto/hive)

This would not be possible without the work of Rocket and Guru Abdul. We also use the fantastic cPBO from Kegetys (www.kegetys.fi) and wget for Windows by the GnuWin32 team (gnuwin32.sourceforge.net).

**NOTE**: No support is implied or offered for pirated copies of ArmA 2.

FIX : 26th OCTOBER 2012

	Affected addons:
		* dayz_code		1.7.2.*
		* dayz_server 	(server admins only)
	
	Developer's Note: 
		* 

	Developer Changelog:
		*

	Community Notes: 
		* 

	Community Changelog:
	Client Side:
		* [NEW]  Tents can no longer be placed on concrete.
		* [FIXED]  Building checks for tent placement (No longer place tents in buildings).
		* [FIXED]  Tents now are one click place.
		* [FIXED]  Fixed function for checking if in buildings.
		* [UPDATED]  Vehicle repair menus now all replaced.
		* [NEW]  Vehicle menus now list all damaged parts no matter if you have the item or not.
		* [NEW]  Vehicle repair menus will now let you know the exact item you need to repair on failed repair attempts.
		* [FIXED]  Vehicle Damage is now fully working.
		* [FIXED]  Vehicle Killed is now in effect fully destroyed vehicles will now set correct in db.
		* [FIXED]  Tents Now add and remove from db.
		* [FIXED]  Food can no longer be consumed if the player does not have in inventory.
		* [FIXED]  water can no longer be consumed if the player does not have in inventory.
		* [UPDATED]  Updated UI control bug.
		* [NEW]  Toolbox is now needed for all repairs.
		* [NEW]  Alt-f4 is now locked and will only open your status menu.
		* [Fixed]  No longer possible to drink/eat/pitch a tent/put on clothes/build sand bags/cat wire/hedgehogs/consume medical supplies/free filled water without consuming the item.
		* [FIXED]  No longer possible to create axes out of thin air if you already have one
		* [FIXED]  Switching skins no longer repairs pain shakes/broken legs/resets/dupes/screws/resets ammo
		* [FIXED]  Duping no longer possible through zombie corpses/etc
		* [FIXED]  It should now be impossible for a new players spawns to spawn unconscious.
		* [FIXED]  You can no longer cook infinite free meat from camp fires
		* [FIXED]  Survivors should no longer pickup a single item at the same time and both receive it.
		* [FIXED]  You can no longer generate multiple tents while packing up a deployed tent.
		* [FIXED]  You can no longer change clothes/eat/drink/etc. while in a vehicle
		* [NEW]  combat 30 sec timer on all combat actions.
		* [UPDATED]  ItemWire reduced from 0.06 to 0.01
		* [UPDATED]  PartEngine updated from 0.01 to 0.06
		* [UPDATED]  Version info is now displayed correct
		* [NEW]  New Combat System If you fire a weapon, then you go into combat.  During combat, "ABORT" is disabled. (Need to look at the effects with high player counts)
		* [NEW]  Combat 30 sec timer on all combat actions.

	Server.pbo:
		* [NEW] HiveEXT.dll now replaced with our new version.
		* [NEW] Official Hive login is now hard coded into the .dll
		* [NEW] New Hive can now set ingame time to custom, local(local server time), static
		* [FIXED]  Object Gear syncs happen based on radius not just on menu.
		* [FIXED]  Vehicle Position is now updated with client position.
		* [FIXED]  Vehicles save fuel properly


Prerequisites
=============

 - Windows (tested with 7, Server 2008)
 - A working ArmA 2 Combined Ops dedicated server (Steam users must merge ArmA2 and ArmA2 OA directories) with recommended beta patch installed (http://www.arma2.com/beta-patch.php)
 - Microsoft Visual C++ 2010 SP1 x86 Redistributable (http://www.microsoft.com/en-us/download/details.aspx?id=8328)
 
Branchs
===========

- **Master** - This is always the most stable branch of code.
- **Dev** - Always the latest dev build.

Other Branch names are induvidual fix's for diffrent issues.

Directories
===========
 - @Dayz - Source Code for Dayz
 - @Hive - Source Code For the HiveEXT
 - HiveEXT.dll - Rajkosto Hive - Source code can be found here (https://github.com/rajkosto/hive)

Installation
============

Upgrading
=========

Vehicles
========

Optional Features
=================

Multiple Instances
==================

Customization
=============

Gotchas / Known Bugs
==========

Common Issues
=============

Support
=======


