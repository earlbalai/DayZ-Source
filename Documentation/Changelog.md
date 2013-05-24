* [NEW] - Combat spawning system to spawn infected around players firing.
* [NEW] - Removed annoying "re-arm" option from actions menu
* [NEW] - Models and textures for mutton.
* [NEW] - Separate meat for goats, same blood regen as mutton.
* [NEW] - Can now combine magazines.
* [NEW] - Added new loot & table for church.
* [NEW] - Added new food and drink items (only found in supermarkets).
* [NEW] - Added model for a dropped map and watch.
* [NEW] - Weapon MakarovSD (Military, Military Special).
* [NEW] - Weapon RPK_74 (Mi8 Helicrash).
* [NEW] - Vehicle Damage in Percent (With a Toolbox).
* [NEW] - 5L Fuel can takes 1 inv slot.
* [NEW] - Bigger Compass (You can see the number of degrees).
* [NEW] - Added auth retry system to make sure clients are auth'ed before they spawn (should stop seagull issue).
* [NEW] - Added force end mission for players joining with wrong version/failed auth. (Will replace timeout later).
* [NEW] - Mi8 Crash site model.
* [NEW] - 2 New background tracks.
* [NEW] - 6 New "Viral" zeds - They are harder to kill, they do more damage, and they have a higher chance of causing an infection... be afraid.
* [NEW] - Added optional watermark for servername (Server admins can choose to enable/disable. (See Mission prerequisites)).
* [NEW] - "Sleep" at tents changed to "Rest". (WIP)
* [NEW] - Remote exec security. Should prevent all major RE exploits
* [NEW] - Clear Ground around crash sites added but disabled by default, server admins can enable. (http://i.imgur.com/uVDfGym.jpg)
* [NEW] - Vehicles and tents now report free gear slots. Example: Old Camping Tent (weapons/others/backpacks). http://ziellos2k.net/images/20130417141327522.png
* [NEW] - Weapons spawns now have a chance to spawn with 0 mags up to a max of 2.
* [NEW] - Melee weapons can now be dropped and picked up using the normal a2 system. (This means you can now store in backpack and tents, without swapping to toolbelt) No need to take itemslots.
* [NEW] - New starting gear added. Guaranteed Start Items: ("ItemBandage","HandRoadFlare") + 1 RandomStartItem: ("ItemBandage","ItemPainkiller").
* [NEW] - Servers date has been locked to give full moon nights.
* [NEW] - Zeds hitting through Walls/Buildings should now be fixed.
* [NEW] - Mainmenu Intro.
* [NEW] - 2 new stash sites. (tools required = Etool or Shovel. Items required = 1 sandbog for small 2 for medium)
					Small = 8 objects slots, no weapons, no bags.
					Medium = 16 Objects 1 weapon , no bags
* [NEW] - Infected survivor camps. (WIP) 3 - Small, 4 - Medium.
* [NEW] - FPS Monitor this will dynamicly change how/total amount of zeds/loot/trash is spawning to keep the players base fps up.
* [NEW] - Crafting is now added.
* [NEW] - Attachment Crafting is the only way to upgrade weapons. (Attachments are found they need other objects to be crafted before being applyed to weapons)
* [NEW] - 2 New Melee weapons.(Bat,Shovel)
* [NEW] - 2 New Bat variations used in crafting. (NailedBat,WiredBat)
* [NEW] - Wild Spawning of zeds has been redone and readded.
* [NEW] - Zed Spawning fully updated to spawn outside the players field of view. (Excludes Infected camps).
* [NEW] - Zeds can now tackle players to the ground when attacked (Zeds stuck player's leg out to trip him/her up).
	
* [FIXED] - Vehicle repair should now always work correctly.
* [FIXED] - Humanity skin change can now change during gameplay in all directions. (No longer have to die/logout to change from hero to normal to bandit and vice versa)
* [FIXED] - StudyBody should now work. (Describing wounds accurately)
* [FIXED] - Crashsite loot should now spawn correctly for all types of Crash model.
* [FIXED] - Hero Skin teleport issue.
* [FIXED] - BAF Bags so they don't set on fire. :-) (no moaning it was a bug)
* [FIXED] - Updated timeout timer from 40 secs to 60 secs, Should allow lower end systems to keep up. (Something went wrong, please disconnect and try again!)
* [FIXED] - Zeds spawning underground.
* [FIXED] - Loot spawning underground.
* [FIXED] - Melee weapons having no ammo on login/skin change. (Open close gear menu will always reset ammo count to 10000)
* [FIXED] - Loot Spawns have now been fully resolved. Buildings are now tagged and will not spawn any new loot for 30 minutes.
* [FIXED] - Loot Cleanup has now been fully resolved. Old loot piles will now be cleaned every 60 minutes and no players within 250 meters(WIP). (Server performance boost)
* [FIXED] - Gear menu exploit to force respawn.
* [FIXED] - Optimized some destruction effects for security and performance.
* [FIXED] - Unconscious damage scale to only happen if hit by zeds. (reduces damage while unconscious)
* [FIXED] - Dayz Date/Time public var will now end mission on failed attempt.
* [FIXED] - Can no longer break legs by anything other than players/zeds/falling/getting out of moving vehicle.
* [FIXED] - Most Dupeing issues should now be resolved.
* [FIXED] - Most wallhack exploits should now be resolved.
		
* [UPDATED] - Reset action alert of zeds, Zeds hearing from actions is now reset back to 1.7.5.1 - (Max sight/hearing from movement forced to 80 meters)
* [UPDATED] - Updated rabbit to drop 2 raw food items. Lowered hp gain to Raw - 200 each / Cooked - 800 each.
* [UPDATED] - Moved anti teleport system to mission. Server admins can choose to enable/disable. (See prerequisites)
* [UPDTAED] - ALL loot table weights have been updated.
* [UPDTAED] - ALL loot table weights have been rebalanced.
* [UPDATED] - Updated Czech, German, Spanish, French and Russian stringtable.
* [UPDATED] - Mac and 1911 Pistol dmg updated.
* [UPDATED] - CrashSite Loot should now represent each type of model more. (("MilitaryWEST","HeliCrashWEST") Two new crash site loot tables)
* [UPDATED] - Zed spawn timer from 2 minutes to 5 minutes. This should allow an area to be cleared of zeds before more spawn.
* [UPDATED] - Re-added the "save" option to tents and vehicles. This is a fail-safe option, not required. (Due to a small amount of servers reporting issues with tents saving. With no info for us to recreate we re-added this option to save tents/vehicles) 
* [UPDATED] - Zed generate system. has now been fully rewrote should stop zeds spawning in view of players then being deleted.
* [UPDATED] - Zeds overall dmg has been updated per hit/per zed (Old Type: Max possible dmg = body 600, Legs 100, Hands 50, Head 1200 New Type: Body 1200, Head 2400)
* [UPDATED] - Bleed from zed attacks will now only happen if the initial dmg is above 0.7 or the zed gives a head shot. (should reduce the amount of bandages needed)
* [UPDATED] - Zeds knocking players unconscious now has a 50/50 chance if dmg multiplier is above > 0.8
* [UPDATED] - When unconscious all dmg is lowed to 50 blood for each hit zeds do no matter the part they hit. (Should allow some survivability)
* [UPDATED] - Zeds sight and sound chance has been re-added so there is a chance they can ignore you.
* [UPDATED] - Sight and sound rebalanced to make them a little more even from movement.
* [UPDATED] - Call extension calls for vehicle dmg.
* [UPDATED] - Zeds will no longer spawn for air vehicles.
* [UPDATED] - Hunters loot table adjusted with more weapons.
* [UPDATED] - SQL files working on Linux.
* [UPDATED] - Add crawl animation damage. Players will now take dmg from crawling zeds.
* [UPDATED] - Updated zed speed to default.
* [UPDATED] - Melee systems updated.
* [UPDATED] - Old Bandit skin for male chars.
* [UPDATED] - Lowered action sound for refuel from 10 meters to 5.
* [UPDATED] - Lowered Direct comms action sound.
* [UPDATED] - Vehicle damage syncs updated to reduce call extension spam.
* [UPDATED] - Lowered Transfusion infection rate.
* [UPDATED] - Quiver acts as a quiver, you now have to take an arrow out of the quiver.
* [UPDATED] - You can now only have 1 useable quiver in your main inventory and unlimited in your backpack.
* [UPDATED] - Melee range has been updated.
* [UPDATED] - HMMWV Stroage has been updated to 10 weapons, 50 slots and 2 backpacks.
* [UPDATED] - AH6 & MH6 Cargo updated. (AH6 3 weapons, 30 slots and 2 backpacks) (MH6J 3 weapons, 20 slots and 3 backpacks)
* [UPDATED] - Fire Places will no longer act as storage systems.
* [UPDATED] - Fireplace can now only be lit once without adding new wood inside the fireplace.
* [UPDATED] - Fireplace can no longer be picked up after lighting.
* [UPDATED] - Vehicles speeds HMMWV, PBX and UAZ - Faster / ATV's - Slower
* [UPDATED] - Tanktraps, sandbags and razor-wires won't spawn in buildings. Tents will always spawn in a safe place.
* [UPDATED] - Up to +/-2000 Humanity gain/loss according to "humanKills" counter from killed character.
* [UPDATED] - Refuel now locks the player in place for the time to fill.
* [UPDATED] - More lootable buildings (Iron barn, car wrecks, several non enterable buildings...)
	
* [REMOVED] - M107 and AS50. (Removed from game)
* [REMOVED] - Removed all military weapons with any attachment from loot tables. (Not removed from game)
