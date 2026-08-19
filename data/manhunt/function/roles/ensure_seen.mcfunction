# roles/ensure_seen — give every player a concrete mh.role value.
#
# There is no join event in a data pack. A player who has never been seen simply has
# no score for mh.role, which is what this detects. Anyone already known keeps their
# role — that is why reconnecting needs no special handling at all: role, lives and
# target all live in scoreboards, which persist across a disconnect.

execute as @a unless score @s mh.role matches -2147483648..2147483647 run function manhunt:roles/on_first_seen
