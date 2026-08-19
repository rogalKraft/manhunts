# lifecycle/lobby_apply — hold everyone with a role in the pen.
#
# Adventure mode rather than a gamerule: the pack never touches gamerules (FR-7.9), and
# adventure blocks breaking without preventing movement, chat or inventory use.
#
# On why damage is stopped this way — checked against the real 26.2 attribute registry,
# not assumed. THERE IS NO ATTRIBUTE THAT ZEROES INCOMING DAMAGE. The closest, `armor`,
# hits the vanilla cap of 20 points = 80% reduction and never reaches 100%, with or
# without `armor_toughness`. Resistance V (amplifier 4) is the only mechanism that
# gives full absorption, so it stays.
#
# Amplifier 4, NOT 255: the amplifier is a BYTE, so 255 overflows to -1 and the effect
# silently becomes useless while the command still reports success. Caught in-game by
# reading active_effects back and seeing `amplifier: -1b`.
#
# The attributes below cover what Resistance does not, and are removed in
# lobby_release. Each is namespaced so removal is exact and can never touch another
# pack's modifier.
#
#   fall_damage_multiplier  -> 0   fall damage is applied before resistance in some
#                                  paths, and this makes it structurally impossible
#   burning_time            -> 0   fire goes out instantly instead of ticking away
#   saturation effect             starvation bypasses resistance entirely

execute if data storage manhunt:config {lobby_adventure:true} run gamemode adventure @a[scores={mh.role=1..2}]

execute if data storage manhunt:config {lobby_invulnerable:true} run effect give @a[scores={mh.role=1..2}] minecraft:resistance 3 4 true
execute if data storage manhunt:config {lobby_invulnerable:true} run effect give @a[scores={mh.role=1..2}] minecraft:saturation 3 0 true
execute if data storage manhunt:config {lobby_invulnerable:true} run effect give @a[scores={mh.role=1..2}] minecraft:fire_resistance 3 0 true

execute if data storage manhunt:config {lobby_invulnerable:true} as @a[scores={mh.role=1..2}] run function manhunt:lifecycle/lobby_attrs
