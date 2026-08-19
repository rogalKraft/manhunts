# core/cycle — the 20-tick counter every cadence in the pack is derived from.
#
# A counter, not `schedule`. Repeated /reload cannot stack a counter; `schedule ...
# append` accumulates pending calls and multiplies the loop, which is defect C-4 in
# the 1.21.1 prototype (three reloads = three concurrent copies of every loop).

scoreboard players add #cycle mh.cycle 1
execute if score #cycle mh.cycle matches 20.. run scoreboard players set #cycle mh.cycle 0
