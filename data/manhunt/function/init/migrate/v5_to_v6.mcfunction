# migrate v5 -> v6 — mh.dead, the death-edge flag.
#
# Replaces deathCount as the death detector. deathCount does not increment while a
# player sits on the death screen: the statistic syncs only once they respawn, so a
# player who never presses the button silently stalls the match outcome. Found in-game
# by killing a runner and watching nothing happen for as long as the death screen was
# open.

scoreboard objectives add mh.dead dummy

data modify storage manhunt:meta schema_version set value 6
