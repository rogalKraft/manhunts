title @a times 10 60 20
title @a subtitle [{"text":"","color":"gray"}]
title @a title [{"translate":"manhunt.end.hunters.title","fallback":"HUNTERS WIN","color":"red","bold":true}]
tellraw @a [{"translate":"manhunt.prefix","fallback":"[Manhunt] ","color":"green"},{"translate":"manhunt.end.hunters.title","fallback":"HUNTERS WIN","color":"red","bold":true},{"translate":"manhunt.end.hunters.chat","fallback":" — after ","color":"white"},{"score":{"name":"#dur.s","objective":"mh.tmp"},"color":"yellow"},{"text":"s.","color":"white"}]
playsound minecraft:entity.wither.spawn master @a
