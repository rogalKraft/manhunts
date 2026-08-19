# tracker/read_record — copy one dimension record into a fixed scratch path.
#
# Macro. Required keys: idx, dim   (from manhunt:tmp rargs)
# Call sites: tracker/resolve_one
#
# Exists purely so that everything downstream reads a STATIC path (manhunt:tmp rec)
# instead of every consumer needing its own macro to address runners[i].dims[d].

$data modify storage manhunt:tmp rec set from storage manhunt:track runners[$(idx)].dims.$(dim)
