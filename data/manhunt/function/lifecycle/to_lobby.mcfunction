# lifecycle/to_lobby — the gathering pen.
#
# Everyone is held inside a small world border, cannot break anything and cannot be
# hurt, so a match can be set up without anyone wandering off, griefing the spawn area
# or dying to a creeper during the countdown. The border opens when PREP starts and the
# runner's head start begins from there.

function manhunt:lifecycle/api/set_phase {phase:"lobby"}

function manhunt:lifecycle/border/save
function manhunt:lifecycle/border/lobby

scoreboard players set #c20 mh.tmp 20
scoreboard players operation #lobby.s mh.tmp = #lobby mh.tmp
scoreboard players operation #lobby.s mh.tmp /= #c20 mh.tmp

# Applied here as well as on the once-a-second tick. Without this the pen is not in
# force until the first modulo tick, so for up to a second everyone can still break
# blocks and take damage.
function manhunt:lifecycle/lobby_apply
function manhunt:hud/bossbar_lobby

title @a times 5 40 10
title @a subtitle [{"translate":"manhunt.lobby.sub","fallback":"Gather up — the border opens shortly","color":"gray"}]
title @a title [{"translate":"manhunt.lobby.title","fallback":"GET READY","color":"yellow","bold":true}]
