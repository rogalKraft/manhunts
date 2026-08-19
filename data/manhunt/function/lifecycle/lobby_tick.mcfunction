# lifecycle/lobby_tick — runs every tick while phase == lobby.

execute store result score #lobby mh.tmp run data get storage manhunt:state lobby_remaining
scoreboard players remove #lobby mh.tmp 1
execute store result storage manhunt:state lobby_remaining int 1 run scoreboard players get #lobby mh.tmp

scoreboard players set #c20 mh.tmp 20
scoreboard players operation #lobby.mod mh.tmp = #lobby mh.tmp
scoreboard players operation #lobby.mod mh.tmp %= #c20 mh.tmp
scoreboard players operation #lobby.s mh.tmp = #lobby mh.tmp
scoreboard players operation #lobby.s mh.tmp /= #c20 mh.tmp

# Once a second: refresh the pen. Re-applying rather than applying once means a player
# who joins, respawns or is changed by another pack mid-lobby is covered too.
execute if score #lobby.mod mh.tmp matches 0 run function manhunt:lifecycle/lobby_apply
execute if score #lobby.mod mh.tmp matches 0 run function manhunt:hud/bossbar_lobby

execute if score #lobby mh.tmp matches ..0 run function manhunt:lifecycle/to_prep
