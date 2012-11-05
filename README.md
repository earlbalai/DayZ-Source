DayZ Community Project
=========================

This is a Community Dayz project.

This would not be possible without the work of Rocket and Guru Abdul. We also use the fantastic cPBO from Kegetys (www.kegetys.fi) and wget for Windows by the GnuWin32 team (gnuwin32.sourceforge.net).

**NOTE**: No support is implied or offered for pirated copies of ArmA 2.

FIX : 31st OCTOBER 2012

	Affected addons:
		* dayz_code		1.7.4

	Community Notes: 
		* Current Changelog not final Changelog

	Community Change log:
		Client:
			* [NEW]     class Mi17_Civilian Now Unbanned.
			* [NEW]     S1203_ambulance_EP1 Now Unbanned.
			* [NEW]     UH60_wreck_EP1 Now Unbanned.
			* [NEW]     An2_1_TK_CIV_EP1 Now Unbanned.
			* [NEW]     An2_2_TK_CIV_EP1 Now Unbanned.
			* [NEW]     An2_TK_EP1 Now Unbanned.
			* [NEW]     UH60M_MEV_EP1 Now Unbanned.
			* [NEW]     MV22 Now Unbanned.
			* [NEW]     MH6J_EP1 Now Unbanned.
			* [NEW]     BAF_Offroad_D Now Unbanned.
			* [NEW]     Fully Removed Save button from action menu.
			* [NEW]     New combat mode icon (G17) thanks Alexander.
			* [NEW]     Dogs are now added and can be controlled.

			* [UPDATED] Combat Logging "Fired Near" checks are now limited to 15 metre radius.
			* [UPDATED] Corrected legs and hands fractures they must be set with actual value.

			* [REMOVED] Damaged logging to .rpt.

			* [Fixed]   Adding checks for female skin humanity/login.
			* [Fixed]   Adding female skin to variables.
			* [Fixed]   Fixed Parachute so jumping out of choppers won?t kill you.
			* [Fixed]   Event Handle for wrecked choppers.
			* [Fixed]   Event Handle for Vehicles.
			* [Fixed]   Remove objects from DB by objectID and objectUID only. (Should fix Deployable problems)
			* [Fixed]   Debug menu options to no longer show.
			* [Fixed]   Locked Singleplayer Menu

		Upstream hive (public hive):
			Adjusted the respawn rates of vehicles. Previously all vehicles had pretty long respawn time making them a bit too rare.
			Still requires a server restart for vehicles to show up in-game.
			* [UPDATED] Destroyed low-end (boats, bicycles) vehicles now respawn after 3h.
			* [UPDATED] Destroyed medium-end (normal cars, motorcycle, quads) vehicles respawn after 12h.
			* [UPDATED] Destroyed high-end ( aircraft, all-terrain) vehicles respawn after 24h.
			Note: Respawn rates are our recommended rule set, they may differ on some private hive servers.

		Dogs:

			Dogs can be found around the world roaming.
			Dogs must be tamed using a peace of raw food.
			Tamed dogs can be controlled (This is still limited for now).
			Once tamed dogs will automatically follow unless told to do something else.
			Dogs Need Food (rawsteak) new icon will apear.
			Dogs Need Water (WaterBottle) new icon will apear.
			
			If your dog dies you can gut it.

		Basic Controls:

			Sit - Tells your dog to sit.
			Lie - Tells your dog to lie down.
			Stay - Tells your dog to stay in its current location. Dogs will get bored if left.
			Track - Tells your dog to find the closest animal within 900m.
			Call - Calls your dog back. (Cancels all current commands).
			
		Dog Problems:

			Sometimes get stuck going up/down steep slopes; very slow movement at best.
			Sometimes "loses" player and dosent follow again till player approches dog; sometimes a "Call Dog" fixes the issue.
			Sometimes repeating sit/lay down animations when in waiting mode beside player; often occurs with the Fin model. Always occurs with more than one dog.		

Dogs will be limited a great deal to start with as we need to see how they react in-game with you and the world.

		

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


