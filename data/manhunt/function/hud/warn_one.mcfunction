# Runs as, and at, one runner.
#
# `distance=` is measured in the execution dimension, so a hunter in the Nether cannot
# set off a warning for a runner in the Overworld — that would be a lie the runner has
# no way to check.

execute store result score #wq mh.tmp run data get storage manhunt:config runner_warning_distance
scoreboard players set #c4 mh.tmp 4
scoreboard players operation #wq mh.tmp /= #c4 mh.tmp

execute store result storage manhunt:tmp warn.d int 1 run data get storage manhunt:config runner_warning_distance
execute store result storage manhunt:tmp warn.q int 1 run scoreboard players get #wq mh.tmp

function manhunt:hud/warn_eval with storage manhunt:tmp warn
