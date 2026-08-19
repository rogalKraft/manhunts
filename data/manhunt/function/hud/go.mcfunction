# hud/go — the head start is over.
#
# The bossbar is hidden here rather than repurposed: during PREP it earns its space by
# being a timer; during the match it was a permanent band carrying nothing that changes.

title @a times 0 20 10
title @a subtitle {"text":""}
title @a title [{"translate":"manhunt.go","fallback":"GO!","color":"red","bold":true}]
playsound minecraft:block.note_block.pling master @a ~ ~ ~ 1 2

function manhunt:hud/bossbar_hide
