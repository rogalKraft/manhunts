# roles/waypoint_off — take @s off the vanilla locator bar.
#
# 26.2 ships a locator bar that shows every player the direction of every other player
# within waypoint_transmit_range. For Manhunt that is fatal: it hands hunters the
# runner's bearing for free and makes the entire tracker pointless. Reported in play
# and confirmed here — the gamerule `locator_bar` is on by default and the default
# transmit range is 6.0E7 blocks, i.e. the whole world.
#
# Suppressed with a per-player attribute rather than the gamerule, because the pack
# never touches gamerules (FR-7.9) and a global switch would also affect anyone on the
# server who is not in the match.
#
# remove-then-add makes this idempotent: it is called on every role change and at match
# start, and `modifier add` refuses a duplicate id.

attribute @s minecraft:waypoint_transmit_range modifier remove manhunt:match
attribute @s minecraft:waypoint_transmit_range modifier add manhunt:match -1.0 add_multiplied_total
