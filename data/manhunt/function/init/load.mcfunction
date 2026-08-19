# init/load — the #minecraft:load entry point.
#
# This is INITIALISATION and STATE RESTORATION. It is never a reset (FR-10.11).
# Nothing here may clear manhunt:config, or config would not survive /reload —
# which is defect A-2 in the 1.21.1 prototype.

# 1. First install only: create objectives and teams, stamp the schema version.
execute unless data storage manhunt:meta schema_version run function manhunt:init/first_install

# 2. Compare the stored schema version against what this build expects.
function manhunt:init/schema_check

# 3. Fill in any missing default state. Guarded per-root: never overwrites.
function manhunt:init/defaults

# 4. Rebuild whatever does not survive a reload (bossbar, trigger arming).
function manhunt:init/restore
