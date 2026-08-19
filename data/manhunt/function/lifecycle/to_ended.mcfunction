# lifecycle/to_ended — the match is over. Called only by win/api/declare, which has
# already recorded the outcome.
#
# Ends the match without touching anyone's gamemode, position or inventory beyond the
# pack's own tracker (FR-6.10). Phase stays `ended` until an explicit reset (FR-1.9).

function manhunt:lifecycle/api/set_phase {phase:"ended"}

function manhunt:hud/end_screen

# Undo everything the pack projected onto the world and onto players. A match that
# ends must not leave a shrunken border, an adventure-mode player, a leaked attribute
# modifier or a dead tracker behind.
function manhunt:lifecycle/border/restore
function manhunt:reset/soft
