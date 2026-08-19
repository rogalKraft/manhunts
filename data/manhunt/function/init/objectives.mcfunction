# init/objectives — every scoreboard objective the pack owns.
# Registry and ownership: docs/TECH.md §3. Adding one here means adding it there
# and to reset/clear/* in the same commit (R-5).

# --- role and match state (dummy, written by the pack) ---
scoreboard objectives add mh.role dummy
scoreboard objectives add mh.lives dummy
scoreboard objectives add mh.target dummy

# --- vanilla-driven counters (cumulative, consumed as edges) ---
scoreboard objectives add mh.deaths deathCount
scoreboard objectives add mh.dragon minecraft.killed:minecraft.ender_dragon

# --- player entry points (the only level-0 way in — TECH.md §9.1) ---
scoreboard objectives add mh.menu trigger
scoreboard objectives add mh.pick trigger

# --- internal (fake players only, never a real name) ---
scoreboard objectives add mh.cycle dummy
scoreboard objectives add mh.tmp dummy

scoreboard players set #cycle mh.cycle 0

# --- tracker ---
scoreboard objectives add mh.index dummy
scoreboard objectives add mh.slot dummy
scoreboard objectives add mh.st dummy
scoreboard objectives add mh.px dummy
scoreboard objectives add mh.pz dummy
scoreboard objectives add mh.miss dummy
scoreboard objectives add mh.dead dummy
scoreboard objectives add mh.role0 dummy
