# Remember the world's own border so the pack can put it back (NFR-12: installing this
# pack must not permanently alter a survival world).
#
# Only the SIZE is readable — there is no command to query the border centre. The
# centre is restored to border_home_x/z, which default to the vanilla 0,0; a host whose
# world uses a different centre sets those two keys once.

execute store result storage manhunt:state border.size int 1 run worldborder get
data modify storage manhunt:state border.saved set value true
