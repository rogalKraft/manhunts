# Attribute half of the pen. Runs as @s — `attribute` accepts a single target only in
# 26.2, so a group selector here would silently do nothing.
#
# `add_multiplied_total -1.0` drives each value to zero whatever the base and whatever
# other modifiers exist. Deliberately NOT `base set`:
#
#   - a base value has to be remembered and put back, and if the pack reloads or the
#     match is aborted at the wrong moment the player is left permanently altered;
#   - a namespaced modifier is removed exactly, by id, and can never touch another
#     pack's work;
#   - `base set -100` would be clamped to the attribute's minimum anyway, so the
#     negative number buys nothing.
#
#   attack_damage           -> 0   outgoing melee: nobody can hit anyone in the pen
#   fall_damage_multiplier  -> 0   fall damage is applied ahead of resistance in some
#                                  paths, so this makes it structurally impossible
#   burning_time            -> 0   fire goes out instantly instead of ticking away
#
# Note attack_damage covers MELEE only — projectiles carry their own damage and are
# unaffected. In a fifteen-second pen where everyone also has Resistance V that is
# harmless, but it is a real hole if the lobby is ever made long.

attribute @s minecraft:attack_damage modifier add manhunt:lobby -1.0 add_multiplied_total
attribute @s minecraft:fall_damage_multiplier modifier add manhunt:lobby -1.0 add_multiplied_total
attribute @s minecraft:burning_time modifier add manhunt:lobby -1.0 add_multiplied_total
