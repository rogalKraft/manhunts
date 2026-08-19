# lifecycle/api/set_phase — THE ONLY writer of manhunt:state phase.
#
# Macro. Required key: `phase`  (one of "idle" | "prep" | "running" | "ended")
# Call sites are listed in docs/TECH.md §12. Adding one means updating that table.
#
# Stamping phase_since here rather than at each call site is the point of funnelling
# every transition through one function: the two can never disagree.

$data modify storage manhunt:state phase set value "$(phase)"
execute store result storage manhunt:state phase_since long 1 run time query gametime
