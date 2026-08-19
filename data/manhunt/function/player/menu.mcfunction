# player/menu — the hunter's target picker. Runs as the player who used the trigger.
#
# Built in CHAT, not as a dialog, and that is a finding rather than a preference:
# a selector component is resolved by the SERVER when it renders chat, titles and the
# actionbar, but NOT in dialog button labels or item names. A dialog picker showed
# literally `@a[scores={mh.index=0}]` on its buttons.
#
# Chat is also the only place a player's real name can be shown at all without the pack
# ever putting that name into storage, a macro or an item component.
#
# Clicks run /trigger, not a function: chat click events execute at the CLICKING
# player's permission level, and hunters are not operators (TECH §9).

execute unless score @s mh.role matches 2 run return run tellraw @s [{"translate":"manhunt.prefix","fallback":"[Manhunt] ","color":"green"},{"translate":"manhunt.menu.only_hunters","fallback":"Only hunters have a target to choose.","color":"gray"}]
execute unless data storage manhunt:state {phase:"running"} run return run tellraw @s [{"translate":"manhunt.prefix","fallback":"[Manhunt] ","color":"green"},{"translate":"manhunt.menu.no_match","fallback":"No match is running.","color":"gray"}]

tellraw @s [{"text":""}]
tellraw @s [{"text":"  "},{"translate":"manhunt.menu.title","fallback":"Choose your target","color":"gold","bold":true}]
tellraw @s [{"text":"  ▶ ","color":"dark_gray"},{"translate":"manhunt.menu.auto","fallback":"Nearest runner (auto)","color":"aqua","click_event":{"action":"run_command","command":"/trigger mh.pick set 999"},"hover_event":{"action":"show_text","value":{"translate":"manhunt.menu.auto.tip","fallback":"Track whoever is closest, updated each cycle"}}}]

execute as @a[scores={mh.role=1}] run function manhunt:player/menu_button

tellraw @s [{"text":""}]
