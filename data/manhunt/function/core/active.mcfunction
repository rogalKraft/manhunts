# core/active — runs only outside phase `idle`.
#
# Advances the 20-tick cycle counter and dispatches subsystems by offset, so no single
# tick carries the whole workload (NFR-2). Cycle allocation: docs/TECH.md §7.
#
# A counter, not `schedule`. Repeated /reload cannot stack a counter; `schedule ...
# append` accumulates pending calls and multiplies the loop, which is defect C-4 in
# the prototype (three reloads = three concurrent copies of every loop).

# --- dispatch (filled in per build step; see TECH.md §16) ----------------------
# every tick        : lifecycle/tick  [win/check is called from lifecycle/running_tick]
function manhunt:lifecycle/tick

# cycle % 20 == 0   : roles (first-seen defaults, team projection)
execute if score #cycle mh.cycle matches 0 run function manhunt:roles/cycle

# cycle % sample_interval_ticks : tracking, in `running` only (FR-3.12)
#
# The interval is a config value, so the modulus is read rather than hardcoded. It is
# clamped to >=1 first: the config range forbids 0, but a division by zero here would
# take down the whole tick, and a guard is cheaper than trusting a stored value.
execute if data storage manhunt:state {phase:"running"} run function manhunt:tracker/gate

# cycle % 5  == 0   : the HUD lines
execute if data storage manhunt:state {phase:"running"} if score #cycle mh.cycle matches 5 run function manhunt:hud/actionbar_hunter
execute if data storage manhunt:state {phase:"running"} if score #cycle mh.cycle matches 5 run function manhunt:hud/actionbar_runner
execute if data storage manhunt:state {phase:"running"} if score #cycle mh.cycle matches 15 run function manhunt:hud/actionbar_hunter
execute if data storage manhunt:state {phase:"running"} if score #cycle mh.cycle matches 15 run function manhunt:hud/actionbar_runner

# every 10 ticks   : the runner proximity warning (D-14)
execute if data storage manhunt:state {phase:"running"} if score #cycle mh.cycle matches 0 run function manhunt:hud/proximity_warn
execute if data storage manhunt:state {phase:"running"} if score #cycle mh.cycle matches 10 run function manhunt:hud/proximity_warn
# every tick        : death detection. Deliberately NOT on a cadence — the window in
#                     which a dead player reads zero health can be a single tick.
execute if data storage manhunt:state {phase:"running"} run function manhunt:respawn/detect_deaths

# cycle % 20 == 0   : roles/grace_tick (disconnect handling, not built yet)
