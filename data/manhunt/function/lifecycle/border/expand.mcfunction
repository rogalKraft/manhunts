# Open the pen. border_expand_to = 0 means "back to whatever this world had", which is
# the safe default for a pack installed into someone's survival world; any other value
# is an absolute diameter.

execute store result storage manhunt:tmp bargs.secs int 1 run data get storage manhunt:config border_expand_seconds
execute store result storage manhunt:tmp bargs.size int 1 run data get storage manhunt:config border_expand_to
execute if data storage manhunt:config {border_expand_to:0} run data modify storage manhunt:tmp bargs.size set from storage manhunt:state border.size

worldborder damage amount 0.2
worldborder warning distance 5
worldborder warning time 15
function manhunt:lifecycle/border/apply_expand with storage manhunt:tmp bargs
