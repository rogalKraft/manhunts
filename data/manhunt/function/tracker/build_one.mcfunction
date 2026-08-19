# Runs as each runner. valid:false on every dimension means "never been there" — a
# record that must never be served as a compass target (FR-3.3). Without this flag an
# unvisited dimension reads as {0,0,0} and the compass points confidently at world
# origin, which is what the 1.21.1 prototype does.

scoreboard players operation @s mh.index = #idx mh.tmp

data modify storage manhunt:track runners append value {alive:true,dims:{overworld:{x:0,y:0,z:0,at:0,valid:false},the_nether:{x:0,y:0,z:0,at:0,valid:false},the_end:{x:0,y:0,z:0,at:0,valid:false}}}

scoreboard players add #idx mh.tmp 1
