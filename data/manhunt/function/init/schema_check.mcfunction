# init/schema_check — compare the stored schema version against this build.
#
# Lower  -> run migrations.
# Higher -> the world was last opened with a newer build. Refuse loudly rather
#           than corrupting state by half-understanding it (FR-12.3).

scoreboard players set #schema.expected mh.tmp 7
execute store result score #schema.found mh.tmp run data get storage manhunt:meta schema_version

execute if score #schema.found mh.tmp < #schema.expected mh.tmp run function manhunt:init/migrate/run
execute if score #schema.found mh.tmp > #schema.expected mh.tmp run function manhunt:init/schema_future
