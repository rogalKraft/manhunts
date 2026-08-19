# migrate v2 -> v3 — add mh.index, introduced with the tracker.
#
# Same trap as the bossbar in v1_to_v2: init/objectives only runs from first_install,
# which is guarded, so an objective added later never appears on a world that already
# has the pack. Every selector using scores={mh.index=N} would silently match nobody.

scoreboard objectives add mh.index dummy

data modify storage manhunt:meta schema_version set value 3
