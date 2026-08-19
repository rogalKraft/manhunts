# init/upgrade — add config keys and state fields introduced after this world was
# installed.
#
# init/config_defaults only runs on first install, so a key added to it later never
# appears on a world that already has the pack — the same trap that hid the bossbar
# and mh.index behind migrations. Config does not need a schema bump for this: every
# line here is guarded on the key being ABSENT, so it adds what is missing and never
# touches a value the host has set.
#
# Add new keys here AND in config_defaults, and to PRD §10.1 in the same commit.

execute unless data storage manhunt:config lobby_seconds run data modify storage manhunt:config lobby_seconds set value 0
execute unless data storage manhunt:config lobby_border_size run data modify storage manhunt:config lobby_border_size set value 20
execute unless data storage manhunt:config border_expand_to run data modify storage manhunt:config border_expand_to set value 0
execute unless data storage manhunt:config border_expand_seconds run data modify storage manhunt:config border_expand_seconds set value 30
execute unless data storage manhunt:config border_home_x run data modify storage manhunt:config border_home_x set value 0
execute unless data storage manhunt:config border_home_z run data modify storage manhunt:config border_home_z set value 0
execute unless data storage manhunt:config hide_locator_bar run data modify storage manhunt:config hide_locator_bar set value true
execute unless data storage manhunt:config force_immediate_respawn run data modify storage manhunt:config force_immediate_respawn set value true
execute unless data storage manhunt:config lobby_adventure run data modify storage manhunt:config lobby_adventure set value true
execute unless data storage manhunt:config lobby_invulnerable run data modify storage manhunt:config lobby_invulnerable set value true

# --- state fields added later ---------------------------------------------------
# Same reasoning: init/defaults guards the whole `manhunt:state` root on `phase`, so a
# field added to it later never appears on an existing world and every macro reading
# it would abort silently (R-2).

execute unless data storage manhunt:state lobby_remaining run data modify storage manhunt:state lobby_remaining set value 0
execute unless data storage manhunt:state respawn_rule run data merge storage manhunt:state {respawn_rule:{was:0,saved:false}}
execute unless data storage manhunt:state border run data merge storage manhunt:state {border:{size:0,saved:false}}

# --- repair -------------------------------------------------------------------
# Fix any boolean a previous build stored with the wrong NBT type.
function manhunt:init/repair_booleans
