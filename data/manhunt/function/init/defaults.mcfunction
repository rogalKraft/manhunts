# init/defaults — guarantee the full storage tree exists.
#
# THIS IS THE COUNTERMEASURE TO R-2. A macro invoked against an absent path aborts
# the entire function silently at runtime, while /reload reports nothing at all. The
# defence is structural: every path any macro will ever read is created here, on load,
# before any macro can run.
#
# Every line is guarded on a key that only exists once that root is initialised, so
# repeated loads never overwrite live state. Note the guard keys are chosen to be
# fields that are ALWAYS present once written — never optional ones.

# --- match state ---------------------------------------------------------------
execute unless data storage manhunt:state phase run data merge storage manhunt:state {phase:"idle",phase_since:0L,match_started:0L,prep_remaining:0,outcome:{winner:"none",reason:"",duration:0L}}

# --- tracking ------------------------------------------------------------------
# runners[] is empty until a match starts; the list itself must exist so that
# `data get storage manhunt:track runners[0]` fails cleanly instead of on a missing root.
execute unless data storage manhunt:track runners run data merge storage manhunt:track {runners:[]}

# --- config --------------------------------------------------------------------
# Guarded on `version`. init/load must NEVER reach past this guard: config surviving
# /reload and server restart is FR-9.4, and overwriting it here is exactly the defect
# (A-2) that makes every setting in the 1.21.1 prototype revert on every load.
execute unless data storage manhunt:config version run function manhunt:init/config_defaults

# Keys added after this world was installed. Never overwrites an existing value.
function manhunt:init/upgrade
