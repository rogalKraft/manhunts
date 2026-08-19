# Put the world's border back exactly as it was. Called from every reset tier — a pack
# that leaves a shrunken border behind has broken the host's world.

execute unless data storage manhunt:state {border:{saved:true}} run return 0

data modify storage manhunt:tmp bargs.size set from storage manhunt:state border.size
execute store result storage manhunt:tmp bargs.x int 1 run data get storage manhunt:config border_home_x
execute store result storage manhunt:tmp bargs.z int 1 run data get storage manhunt:config border_home_z

worldborder damage amount 0.2
worldborder warning distance 5
worldborder warning time 15
function manhunt:lifecycle/border/apply_lobby with storage manhunt:tmp bargs

data modify storage manhunt:state border.saved set value false
