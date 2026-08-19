# Shrink the border to the pen, centred on the first runner so the pen forms where the
# players actually are rather than at world origin.
#
# Border damage is switched off for the duration: a player who happens to be outside
# the pen when it appears would otherwise be ground down by it, and they have no way to
# know why. With damage off the border only limits how far out they can walk.

execute as @a[scores={mh.role=1},limit=1] at @s store result storage manhunt:tmp bargs.x int 1 run data get entity @s Pos[0]
execute as @a[scores={mh.role=1},limit=1] at @s store result storage manhunt:tmp bargs.z int 1 run data get entity @s Pos[2]
execute store result storage manhunt:tmp bargs.size int 1 run data get storage manhunt:config lobby_border_size

worldborder damage amount 0

# The red screen-edge warning fires within `warning distance` blocks of the border,
# and vanilla defaults that to 5. In a 20-block pen that is almost the whole pen, so
# everyone gathered correctly inside still gets an alarm vignette for the entire
# countdown. Suppressed here and restored with the border.
#
# There is no query form for this setting — `worldborder warning distance` without a
# value is not a command — so the restore uses the vanilla default of 5, the same
# assumption the border centre makes.
worldborder warning distance 0
worldborder warning time 0
function manhunt:lifecycle/border/apply_lobby with storage manhunt:tmp bargs
