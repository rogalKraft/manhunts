# tracker/write_compass — aim the tracker at a moving player, IN PLACE.
#
# Macro. Required keys: x, y, z, dim, slot, st, col   (from manhunt:tmp wargs)
# Call sites: tracker/decide_target
#
# `item modify` with an INLINE loot modifier, verified in-game on 26.2: the modifier
# argument uses a resource-or-inline parser, so a macro can build one with live
# coordinates. Editing in place is what stopped the compass flickering in the hand.
#
# The item name carries the STATE only, never the target's name. A selector component
# is resolved by the server for chat, titles and the actionbar, but an item name is
# shipped to the client verbatim — the compass showed a literal selector until this was
# caught in-game. Who is being tracked lives on the actionbar, which does resolve it.
#
# $(st) is a translate KEY, not text: the state word has to be localizable too, and a
# macro cannot build a nested component, so the key is passed whole.

$item modify entity @s $(slot) {function:"minecraft:set_components",components:{"minecraft:lodestone_tracker":{tracked:false,target:{pos:[I;$(x),$(y),$(z)],dimension:"minecraft:$(dim)"}},"minecraft:item_name":[{"translate":"manhunt.tracker.name","fallback":"Tracker ","color":"gray"},{"translate":"$(st)","fallback":"$(fb)","color":"$(col)"}]}}
