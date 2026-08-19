# roles/grace_tick — handle players who have left mid-match. Once per second.
#
# A data pack cannot select an offline player at all: every selector matches only
# players who are present, and there is no disconnect event to hook. So this does not
# try to identify WHO left — it compares how many of each side are online against how
# many are still alive, and acts on the difference.
#
# That is also why the win conditions count `#runners.alive` rather than testing a
# selector: without the counter, the only runner closing their game would instantly
# hand the match to the hunters, which is the single most annoying way to lose a
# match on a real server.
#
# While anyone is missing, the match continues untouched for disconnect_grace_seconds.
# Only when that runs out is the absent player treated as eliminated.

scoreboard players set #r.on mh.tmp 0
scoreboard players set #h.on mh.tmp 0
execute as @a[scores={mh.role=1}] run scoreboard players add #r.on mh.tmp 1
execute as @a[scores={mh.role=2}] run scoreboard players add #h.on mh.tmp 1

scoreboard players set #missing mh.tmp 0
execute if score #r.on mh.tmp < #runners.alive mh.tmp run scoreboard players set #missing mh.tmp 1
execute if score #h.on mh.tmp < #hunters.alive mh.tmp run scoreboard players set #missing mh.tmp 1

# Everyone back: cancel a running countdown, and say so — a hunter who reconnected
# should not have to wonder whether they were dropped from the match.
execute if score #missing mh.tmp matches 0 if score #grace mh.tmp matches 0.. run function manhunt:roles/grace_cancel

execute if score #missing mh.tmp matches 1 if score #grace mh.tmp matches ..-1 run function manhunt:roles/grace_start
execute if score #missing mh.tmp matches 1 if score #grace mh.tmp matches 1.. run scoreboard players remove #grace mh.tmp 1
execute if score #missing mh.tmp matches 1 if score #grace mh.tmp matches 0 run function manhunt:roles/grace_expire
