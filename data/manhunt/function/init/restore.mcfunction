# init/restore — rebuild what does not survive a reload or restart.
#
# Match state itself lives in storage and needs no restoring — that is the whole
# reason there are no `schedule` loops in this pack (TECH.md §2). What DOES need
# rebuilding is everything held outside storage:
#
#   - the bossbar (removed when the pack unloads)
#   - trigger arming (a player must hold an armed trigger to use any menu)
#
# Filled in as those subsystems are built. Deliberately left as a named seam rather
# than folded into init/load, so there is one obvious place for "restore after reload"
# and it cannot drift into meaning "reset".

# Arm every online player's triggers. A player left holding a disarmed trigger sees
# a menu button that does nothing — no error, no log (R-28, TECH.md §9.1).
scoreboard players enable @a mh.menu
scoreboard players enable @a mh.pick
