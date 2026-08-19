# One pulse, to this runner only. SOUND ONLY — no text.
#
# The warning deliberately writes nothing to the actionbar. Two reasons:
#
#   - the runner's actionbar already carries the hunter count, and two writers on the
#     same line simply overwrite each other twice a second;
#   - a sound is ambient. It reaches the player without taking their eyes off the
#     world, which is exactly right for a signal that means "look behind you".
#
# Proximity only: never direction, never a number (FR-8.19), and hunters get no
# indication that it fired (FR-8.20). The pitch rises in the inner band so the two
# bands are distinguishable by ear alone, which is the whole point now that there is
# no text to read.
#
# Sound ids are fixed strings chosen from a config enum, matched with plain
# conditionals rather than interpolated: a macro here would let a bad config value
# produce a malformed command.

execute if data storage manhunt:config {runner_warning_sound:"heartbeat"} if score #warn.band mh.tmp matches 1 run playsound minecraft:entity.warden.heartbeat master @s ~ ~ ~ 1 0.8
execute if data storage manhunt:config {runner_warning_sound:"heartbeat"} if score #warn.band mh.tmp matches 2 run playsound minecraft:entity.warden.heartbeat master @s ~ ~ ~ 1 1.2

execute if data storage manhunt:config {runner_warning_sound:"sculk"} if score #warn.band mh.tmp matches 1 run playsound minecraft:block.sculk_sensor.clicking master @s ~ ~ ~ 1 0.8
execute if data storage manhunt:config {runner_warning_sound:"sculk"} if score #warn.band mh.tmp matches 2 run playsound minecraft:block.sculk_sensor.clicking master @s ~ ~ ~ 1 1.4

execute if data storage manhunt:config {runner_warning_sound:"pling"} if score #warn.band mh.tmp matches 1 run playsound minecraft:block.note_block.pling master @s ~ ~ ~ 1 0.6
execute if data storage manhunt:config {runner_warning_sound:"pling"} if score #warn.band mh.tmp matches 2 run playsound minecraft:block.note_block.pling master @s ~ ~ ~ 1 1.2

execute if data storage manhunt:config {runner_warning_sound:"bell"} run playsound minecraft:block.bell.use master @s ~ ~ ~ 1 1
execute if data storage manhunt:config {runner_warning_sound:"orb"} run playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 1 0.7
execute if data storage manhunt:config {runner_warning_sound:"fuse"} run playsound minecraft:entity.creeper.primed master @s ~ ~ ~ 0.6 1
