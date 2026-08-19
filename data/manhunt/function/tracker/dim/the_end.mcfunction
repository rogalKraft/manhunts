scoreboard players set #dim.known mh.tmp 1
data modify storage manhunt:tmp rargs.dim set value "the_end"
data modify storage manhunt:tmp wargs.dim set value "the_end"
execute if data storage manhunt:config {track_end:false} run scoreboard players set #dim.known mh.tmp 0
