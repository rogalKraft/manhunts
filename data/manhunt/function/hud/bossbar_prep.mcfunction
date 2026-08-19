# Head-start bar. Called once per second from lifecycle/prep_tick, not every tick.
bossbar set manhunt:main color yellow
bossbar set manhunt:main name [{"translate":"manhunt.prep.bar","fallback":"Head start — ","color":"gray"},{"score":{"name":"#prep.s","objective":"mh.tmp"},"color":"yellow","bold":true},{"text":"s","color":"gray"}]
execute store result score #prep.max mh.tmp run data get storage manhunt:config headstart_seconds
execute store result bossbar manhunt:main max run scoreboard players get #prep.max mh.tmp
execute store result bossbar manhunt:main value run scoreboard players get #prep.s mh.tmp
