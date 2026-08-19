# tracker/gate — fire tracker/cycle every sample_interval_ticks ticks.

execute store result score #s.int mh.tmp run data get storage manhunt:config sample_interval_ticks
execute if score #s.int mh.tmp matches ..0 run scoreboard players set #s.int mh.tmp 10

scoreboard players operation #s.mod mh.tmp = #cycle mh.cycle
scoreboard players operation #s.mod mh.tmp %= #s.int mh.tmp

execute if score #s.mod mh.tmp matches 0 run function manhunt:tracker/cycle
