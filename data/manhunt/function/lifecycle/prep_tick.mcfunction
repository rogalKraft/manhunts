# lifecycle/prep_tick — the head start. Runs every tick while phase == prep.
#
# The timer lives in storage, not in a `schedule`. That is what makes a /reload
# mid-PREP a non-event: the countdown resumes from whatever tick it was on, and no
# duplicate loop can exist to run it twice (US-17).

execute store result score #prep mh.tmp run data get storage manhunt:state prep_remaining
scoreboard players remove #prep mh.tmp 1
execute store result storage manhunt:state prep_remaining int 1 run scoreboard players get #prep mh.tmp

# Display work runs once per second, not 20 times. #prep.s is whole seconds remaining.
scoreboard players set #c20 mh.tmp 20
scoreboard players operation #prep.mod mh.tmp = #prep mh.tmp
scoreboard players operation #prep.mod mh.tmp %= #c20 mh.tmp
scoreboard players operation #prep.s mh.tmp = #prep mh.tmp
scoreboard players operation #prep.s mh.tmp /= #c20 mh.tmp

execute if score #prep.mod mh.tmp matches 0 run function manhunt:hud/bossbar_prep
execute if score #prep.mod mh.tmp matches 0 run function manhunt:hud/countdown

execute if score #prep mh.tmp matches ..0 run function manhunt:lifecycle/to_running
