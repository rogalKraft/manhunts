# init/migrate/run — dispatch to each migration step in order.
#
# Each step is guarded by the version that was FOUND and ends by writing its own new
# value into manhunt:meta schema_version. Steps run oldest-first and fall through, so
# a world several versions behind walks the whole chain in one load.

execute if score #schema.found mh.tmp matches 1 run function manhunt:init/migrate/v1_to_v2
execute store result score #schema.found mh.tmp run data get storage manhunt:meta schema_version

execute if score #schema.found mh.tmp matches 2 run function manhunt:init/migrate/v2_to_v3
execute store result score #schema.found mh.tmp run data get storage manhunt:meta schema_version

execute if score #schema.found mh.tmp matches 3 run function manhunt:init/migrate/v3_to_v4
execute store result score #schema.found mh.tmp run data get storage manhunt:meta schema_version

execute if score #schema.found mh.tmp matches 4 run function manhunt:init/migrate/v4_to_v5
execute store result score #schema.found mh.tmp run data get storage manhunt:meta schema_version

execute if score #schema.found mh.tmp matches 5 run function manhunt:init/migrate/v5_to_v6
execute store result score #schema.found mh.tmp run data get storage manhunt:meta schema_version

execute if score #schema.found mh.tmp matches 6 run function manhunt:init/migrate/v6_to_v7
