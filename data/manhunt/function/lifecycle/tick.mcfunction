# lifecycle/tick — phase dispatch. Called every tick from core/active.
#
# Only reached outside `idle` (core/tick gates on that), so there is no idle branch.

execute if data storage manhunt:state {phase:"lobby"} run function manhunt:lifecycle/lobby_tick
execute if data storage manhunt:state {phase:"prep"} run function manhunt:lifecycle/prep_tick
execute if data storage manhunt:state {phase:"running"} run function manhunt:lifecycle/running_tick
