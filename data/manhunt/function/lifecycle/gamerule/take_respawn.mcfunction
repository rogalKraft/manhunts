# lifecycle/gamerule/take_respawn — opt-in only.
#
# The pack's standing rule is that it NEVER modifies a gamerule: whatever the host has
# set is respected (FR-7.9). This is the one deliberate exception, and it is built to
# stay honest about it:
#
#   - off by default (`force_immediate_respawn: false`), so an unmodified install
#     still touches nothing;
#   - the previous value is READ AND SAVED before anything changes;
#   - it is put back on every way a match can end, via reset/soft.
#
# It exists because the death screen genuinely affects the mode: a runner sitting on
# it delays nothing now that detection is health-based, but they also cannot be seen,
# tracked or fought while there, which is a real advantage for a losing runner.

execute unless data storage manhunt:config {force_immediate_respawn:true} run return 0

execute store result storage manhunt:state respawn_rule.was int 1 run gamerule immediate_respawn
data modify storage manhunt:state respawn_rule.saved set value true

gamerule immediate_respawn true
