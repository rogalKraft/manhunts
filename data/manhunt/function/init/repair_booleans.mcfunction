# init/repair_booleans — put back any config boolean that was stored as the wrong type.
#
# A build of the settings screen wrote booleans as the integer 1/0 instead of the byte
# a boolean actually is. NBT matching is type-sensitive, so `{track_end:true}` stopped
# matching and every boolean feature silently switched off while the config dump still
# looked plausible. Worlds saved by that build carry the damage, and neither /reload
# nor the fixed screen would notice it — hence a repair rather than only a fix.
#
# Detection is "matches neither true nor false": a correctly typed key satisfies one of
# them, so anything that satisfies neither is the wrong type, whatever it is. The value
# is then read through a score, which accepts 1/0 or true/false alike, and written back
# as a real boolean.

execute unless data storage manhunt:config {track_end:true} unless data storage manhunt:config {track_end:false} run function manhunt:init/repair_one {key:"track_end"}
execute unless data storage manhunt:config {track_nether:true} unless data storage manhunt:config {track_nether:false} run function manhunt:init/repair_one {key:"track_nether"}
execute unless data storage manhunt:config {runner_warning:true} unless data storage manhunt:config {runner_warning:false} run function manhunt:init/repair_one {key:"runner_warning"}
execute unless data storage manhunt:config {force_immediate_respawn:true} unless data storage manhunt:config {force_immediate_respawn:false} run function manhunt:init/repair_one {key:"force_immediate_respawn"}
execute unless data storage manhunt:config {hide_locator_bar:true} unless data storage manhunt:config {hide_locator_bar:false} run function manhunt:init/repair_one {key:"hide_locator_bar"}
execute unless data storage manhunt:config {lobby_adventure:true} unless data storage manhunt:config {lobby_adventure:false} run function manhunt:init/repair_one {key:"lobby_adventure"}
execute unless data storage manhunt:config {lobby_invulnerable:true} unless data storage manhunt:config {lobby_invulnerable:false} run function manhunt:init/repair_one {key:"lobby_invulnerable"}
execute unless data storage manhunt:config {compass_show_dimension:true} unless data storage manhunt:config {compass_show_dimension:false} run function manhunt:init/repair_one {key:"compass_show_dimension"}
execute unless data storage manhunt:config {compass_show_hp:true} unless data storage manhunt:config {compass_show_hp:false} run function manhunt:init/repair_one {key:"compass_show_hp"}
execute unless data storage manhunt:config {freeze_hunters_during_prep:true} unless data storage manhunt:config {freeze_hunters_during_prep:false} run function manhunt:init/repair_one {key:"freeze_hunters_during_prep"}
execute unless data storage manhunt:config {pvp_during_prep:true} unless data storage manhunt:config {pvp_during_prep:false} run function manhunt:init/repair_one {key:"pvp_during_prep"}
execute unless data storage manhunt:config {show_nametags:true} unless data storage manhunt:config {show_nametags:false} run function manhunt:init/repair_one {key:"show_nametags"}
execute unless data storage manhunt:config {allow_dragon_pre_slain:true} unless data storage manhunt:config {allow_dragon_pre_slain:false} run function manhunt:init/repair_one {key:"allow_dragon_pre_slain"}
execute unless data storage manhunt:config {debug:true} unless data storage manhunt:config {debug:false} run function manhunt:init/repair_one {key:"debug"}
