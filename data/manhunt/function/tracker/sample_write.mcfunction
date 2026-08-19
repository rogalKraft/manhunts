# tracker/sample_write — commit one dimension record.
#
# Macro. Required keys: idx, dim, x, y, z, at   (all from manhunt:tmp args)
# Call sites: tracker/sample/{overworld,the_nether,the_end}
#
# `at` is an int, not a long, deliberately: macro substitution of a long can carry its
# type suffix and produce malformed SNBT. Gametime as an int is good for ~3.4 years of
# world time, far past any match.

$data modify storage manhunt:track runners[$(idx)].dims.$(dim) set value {x:$(x),y:$(y),z:$(z),at:$(at),valid:true}
