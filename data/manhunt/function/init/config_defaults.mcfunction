# init/config_defaults — the shipped defaults, written ONCE on first install.
#
# Called only from init/defaults, behind `unless data storage manhunt:config version`.
# Also called directly by admin/config/defaults ("restore defaults"), which is the
# ONLY other legitimate caller. No reset tier may call this.
#
# Keys, ranges and apply-times: docs/PRD.md §10.1. Keep the two in sync — a key that
# exists here but is read by nothing is dead config (defect A-10 in the prototype,
# where `show_names` had a whole advancement branch and did nothing).
#
# 26.2: JSON/NBT typing is strict since 26.1.2. Booleans must be real booleans and
# numbers real numbers — never quoted strings.

data merge storage manhunt:config {\
version:1,\
headstart_seconds:0,\
hunter_lives:1,\
runner_lives:3,\
match_time_limit_seconds:0,\
freeze_hunters_during_prep:true,\
pvp_during_prep:false,\
sample_interval_ticks:10,\
compass_delay_seconds:0,\
compass_move_threshold:1,\
compass_show_dimension:true,\
compass_show_hp:false,\
compass_slot_fallback:8,\
track_nether:true,\
track_end:true,\
stale_warning_seconds:15,\
stale_hard_limit_seconds:600,\
respawn_grace_seconds:3,\
disconnect_grace_seconds:25,\
runner_warning:true,\
runner_warning_distance:144,\
runner_warning_sound:"heartbeat",\
autojoin_as:"none",\
show_nametags:false,\
allow_dragon_pre_slain:false,\
debug:false,\
lobby_seconds:0,\
lobby_border_size:20,\
border_expand_to:0,\
border_expand_seconds:30,\
border_home_x:0,\
border_home_z:0,\
hide_locator_bar:true,\
force_immediate_respawn:true,\
lobby_adventure:true,\
lobby_invulnerable:true\
}
