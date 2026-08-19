# reset/clear/storage — match state back to its post-install shape.
#
# EVERY field added to manhunt:state or manhunt:track must be added here in the same
# commit (R-5). Nothing in the game will ever tell you that reset forgot a field; it
# shows up a match later as a value that should have been zero.
#
# manhunt:config is deliberately absent — config survives every reset tier and is only
# touched by admin/config/*.

data modify storage manhunt:state phase set value "idle"
data modify storage manhunt:state lobby_remaining set value 0
data modify storage manhunt:state prep_remaining set value 0
data modify storage manhunt:state match_started set value 0L
data modify storage manhunt:state outcome.winner set value "none"
data modify storage manhunt:state outcome.reason set value ""
data modify storage manhunt:state outcome.duration set value 0L

data modify storage manhunt:track runners set value []

execute store result storage manhunt:state phase_since long 1 run time query gametime
