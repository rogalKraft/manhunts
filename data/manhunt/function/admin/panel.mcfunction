# admin/panel — the operator control surface.
#
# `/dialog` is permission-gated at `gamemasters`, and so is this panel: every button
# calls a function directly, which only works because the clicking player is an
# operator. The PLAYER-facing menu cannot do that and goes through /trigger instead
# (TECH §9) — the two surfaces are deliberately built differently for that reason.

dialog show @s manhunt:panel
