# Pen countdown. Once a second, not every tick: a bossbar name is resolved when it is
# set, so it has to be re-sent to change.
bossbar set manhunt:main color blue
bossbar set manhunt:main name [{"translate":"manhunt.lobby.bar","fallback":"Border opens in ","color":"gray"},{"score":{"name":"#lobby.s","objective":"mh.tmp"},"color":"aqua","bold":true},{"text":"s","color":"gray"}]
execute store result score #lobby.max mh.tmp run data get storage manhunt:config lobby_seconds
execute store result bossbar manhunt:main max run scoreboard players get #lobby.max mh.tmp
execute store result bossbar manhunt:main value run scoreboard players get #lobby.s mh.tmp
bossbar set manhunt:main players @a[scores={mh.role=1..3}]
bossbar set manhunt:main visible true
