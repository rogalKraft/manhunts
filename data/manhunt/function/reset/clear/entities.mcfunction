# reset/clear/entities — remove only what this pack created.
#
# Targeted by TAG, never by entity type. The 1.21.1 prototype runs
#   kill @e[type=minecraft:marker]
# which deletes every marker in the world, including other packs'. The pack currently
# creates no entities at all, so this is empty in practice — it exists so that the
# correct pattern is already in place the day something does get summoned.

kill @e[tag=mh.owned,limit=256]
