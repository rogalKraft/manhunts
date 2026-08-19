# hud/proximity_warn — D-14. The runner learns that a hunter is near, never where.
#
# This is the one counterweight to live tracking. Hunters always know where the runner
# is; without this the runner knows nothing and evasion is a coin flip rather than a
# skill. Direction is deliberately withheld — giving it would hand the runner most of
# a counter-tracker and invert the asymmetry the mode is built on (FR-8.19).

execute unless data storage manhunt:config {runner_warning:true} run return 0

execute as @a[scores={mh.role=1}] at @s run function manhunt:hud/warn_one
