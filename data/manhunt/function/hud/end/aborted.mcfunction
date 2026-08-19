# No winner. Deliberately not phrased as anyone "winning" (FR-6.11).
title @a times 10 50 20
title @a subtitle [{"translate":"manhunt.end.aborted.sub","fallback":"No winner","color":"gray"}]
title @a title [{"translate":"manhunt.end.aborted.title","fallback":"MATCH ABORTED","color":"yellow","bold":true}]
tellraw @a [{"translate":"manhunt.prefix","fallback":"[Manhunt] ","color":"green"},{"translate":"manhunt.end.aborted.chat","fallback":"Match aborted after ","color":"yellow"},{"score":{"name":"#dur.s","objective":"mh.tmp"},"color":"yellow"},{"text":"s.","color":"white"}]
playsound minecraft:block.note_block.bass master @a
