# init/schema_future — the stored state is NEWER than this build understands.
#
# Deliberately NOT translated. This fires only when the world has been opened with a
# newer build than the one now installed — a state nobody should reach, and one where
# the translation table itself may be from the wrong version. English is the safe
# choice for a message whose whole job is to be understood by whoever has to fix it.
#
# Downgrades cannot be migrated: this build does not know what the newer one added,
# so any attempt to "fix" the state would discard it. Refuse loudly instead and let
# the host decide (FR-12.3).

tellraw @a [{"text":"[Manhunt] ","color":"red"},{"text":"This world was last used with a NEWER version of the pack. Refusing to run to avoid corrupting match state. Install the newer version, or reset the pack with ","color":"white"},{"text":"/function manhunt:admin/uninstall","color":"yellow"},{"text":".","color":"white"}]
