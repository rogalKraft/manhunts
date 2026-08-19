# migrate v6 -> v7 — mh.role0, the role a player started the match with.
#
# Elimination overwrites mh.role with spectator, so "reset keeps the teams" quietly
# meant "everyone who died stays a spectator" and the rematch had no runners at all.
# Snapshotting the role at match start is what makes the rematch promise true.

scoreboard objectives add mh.role0 dummy

data modify storage manhunt:meta schema_version set value 7
