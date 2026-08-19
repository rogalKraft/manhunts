# lifecycle/running_tick — the steady state. Runs every tick while phase == running.
#
# Win conditions 1-3 are evaluated by win/check (step 7). This function owns only
# the match clock and condition 4, the optional time limit.

function manhunt:win/check

execute unless data storage manhunt:config {match_time_limit_seconds:0} run function manhunt:lifecycle/time_limit
