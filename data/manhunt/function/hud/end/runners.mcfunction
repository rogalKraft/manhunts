# Every visible string is a translate key with an explicit fallback: with the companion
# lang pack absent the English text is shown, with it present the player's own language
# is. The prototype used translate with NO fallback, which made its resource pack
# mandatory — without it the mode displayed raw keys.
title @a times 10 60 20
title @a subtitle [{"translate":"manhunt.end.runners.sub","fallback":"The Ender Dragon is dead","color":"gray"}]
title @a title [{"translate":"manhunt.end.runners.title","fallback":"RUNNERS WIN","color":"green","bold":true}]
tellraw @a [{"translate":"manhunt.prefix","fallback":"[Manhunt] ","color":"green"},{"translate":"manhunt.end.runners.title","fallback":"RUNNERS WIN","color":"green","bold":true},{"translate":"manhunt.end.runners.chat","fallback":" — the dragon is dead after ","color":"white"},{"score":{"name":"#dur.s","objective":"mh.tmp"},"color":"yellow"},{"text":"s.","color":"white"}]
playsound minecraft:ui.toast.challenge_complete master @a
