# init/first_install — runs once, on the first load after installation.
#
# Guarded by `unless data storage manhunt:meta schema_version` in init/load, so
# `scoreboard objectives add` and `team add` never fire twice and never spam the
# console with "objective already exists" on every reload.

function manhunt:init/objectives
function manhunt:init/teams

# The bossbar lives in level.dat and survives /reload on its own, so it is created
# once here rather than rebuilt in init/restore. Created hidden and with no players:
# a pack sitting idle on a survival world must be invisible (FR-8.3, NFR-12).
bossbar add manhunt:main {"text":"Manhunt"}
bossbar set manhunt:main visible false

data modify storage manhunt:meta schema_version set value 7
execute store result storage manhunt:meta installed_at long 1 run time query gametime

tellraw @a [{"translate":"manhunt.prefix","fallback":"[Manhunt] ","color":"green"},{"translate":"manhunt.msg.installed","fallback":"Installed.","color":"gray"},{"text":" /function manhunt:admin/panel","color":"white"}]
