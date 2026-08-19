# Runs as @s over EVERY player, not just role-holders: someone whose role changed while
# the pen was up would otherwise keep the modifiers forever. Removing an absent
# modifier is harmless, which is what makes this safe to run unconditionally.
attribute @s minecraft:attack_damage modifier remove manhunt:lobby
attribute @s minecraft:fall_damage_multiplier modifier remove manhunt:lobby
attribute @s minecraft:burning_time modifier remove manhunt:lobby
