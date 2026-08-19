scoreboard players set #dim.known mh.tmp 1
data modify storage manhunt:tmp rargs.dim set value "the_nether"
data modify storage manhunt:tmp wargs.dim set value "the_nether"
# track_nether = false means this dimension is deliberately blind (D-4).
execute if data storage manhunt:config {track_nether:false} run scoreboard players set #dim.known mh.tmp 0
