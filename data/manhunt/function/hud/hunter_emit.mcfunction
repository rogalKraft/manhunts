# hud/hunter_emit — one actionbar line.
#
# Macro. Required keys: tgt, col, txt, fb   (from manhunt:tmp hline)
# Call sites: hud/hunter_line
#
# The target's NAME is rendered by selector on mh.index, never interpolated as text.
# $(txt) is a translate KEY and $(fb) its English fallback: the distance band has to be
# localizable, and a macro cannot build a nested component, so both halves are passed.

$title @s actionbar [{"selector":"@a[scores={mh.index=$(tgt)}]","color":"$(col)"},{"text":" — ","color":"$(col)"},{"translate":"$(txt)","fallback":"$(fb)","color":"$(col)"}]
