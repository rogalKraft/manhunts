# migrate v1 -> v2 — create the bossbar on worlds installed before it existed.
#
# Why this migration exists, because the lesson generalises: `bossbar add` was added
# to init/first_install AFTER this world had already installed the pack. first_install
# is guarded against re-running, so the new line never executed there and hud/* was
# quietly issuing commands against a bossbar that did not exist. Function-internal
# command errors do not surface anywhere obvious, so nothing complained.
#
# Rule: anything added to first_install after release needs a migration. first_install
# is only ever correct for worlds that have not yet seen the pack.

bossbar add manhunt:main {"text":"Manhunt"}
bossbar set manhunt:main visible false

data modify storage manhunt:meta schema_version set value 2
