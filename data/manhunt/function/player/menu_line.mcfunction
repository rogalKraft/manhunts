# player/menu_line — one clickable runner.
#
# Macro. Required key: pick   (index + 1, from manhunt:tmp b)
# Call sites: player/menu_button
#
# Only an integer is interpolated. The runner's NAME comes from a selector that the
# server resolves as it renders the line, so nothing a player can put in their
# nickname ever reaches a command string.

$tellraw @a[scores={mh.role=2}] [{"text":"  \u25b6 ","color":"dark_gray"},{"selector":"@s","color":"green","click_event":{"action":"run_command","command":"/trigger mh.pick set $(pick)"}}]
