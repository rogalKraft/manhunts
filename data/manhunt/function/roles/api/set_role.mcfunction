# roles/api/set_role — THE ONLY writer of mh.role. Runs as the target player.
#
# Macro. Required key: `role`  (0 none | 1 runner | 2 hunter | 3 spectator)
# Call: execute as <player> run function manhunt:roles/api/set_role {role:1}
#
# Deliberately takes only `role`, not a player name. TECH §12 originally listed
# `player` as a second key; interpolating a player name into a macro is exactly the
# escaping hazard R-29 describes, and `as @s` removes the whole problem. A name with
# an odd character can no longer produce a malformed command.

$scoreboard players set @s mh.role $(role)

function manhunt:roles/apply
