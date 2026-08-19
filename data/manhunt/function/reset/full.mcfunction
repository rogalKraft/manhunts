# reset/full — back to a fresh install, except for config.

function manhunt:reset/match

execute as @a run function manhunt:roles/api/set_role {role:0}

# NOT `scoreboard players reset @a mh.role`. The line above already sets everyone to 0,
# and `reset` REMOVES the entry — after which no `scores={mh.role=0}` selector matches
# the player at all, until ensure_seen puts a value back on the next cycle. That is what
# made "everyone unassigned to hunter" appear to assign the role to a single player
# after a full reset: the button simply could not see anybody. Same rule as the trigger
# handlers (CLAUDE.md): consume with `set 0`, never `reset`.

# NOTE: there is deliberately no `forceload remove all` here.
#
# The pack forceloads nothing (that is the whole point of reading position off the
# player instead of a marker entity), and `forceload remove all` would strip every
# forceloaded chunk in the dimension — including other packs'. That is exactly the
# defect this project criticised in the 1.21.1 prototype's `kill @e[type=marker]`,
# and it would be worse here because the damage is invisible.
#
# If the pack ever does forceload, it must track its own chunks and remove those
# specifically.

tellraw @a [{"translate":"manhunt.prefix","fallback":"[Manhunt] ","color":"green"},{"translate":"manhunt.msg.reset_full","fallback":"Full reset. Roles cleared.","color":"white"}]
