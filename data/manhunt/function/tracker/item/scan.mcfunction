# tracker/item/scan — full sweep, run only when the tracker left its remembered slot.
#
# Later matches win, but a tracker can only be in one place, so order is irrelevant.

scoreboard players set @s mh.slot -1

execute if items entity @s hotbar.0 minecraft:compass[minecraft:custom_data~{mh:1b}] run scoreboard players set @s mh.slot 0
execute if items entity @s hotbar.1 minecraft:compass[minecraft:custom_data~{mh:1b}] run scoreboard players set @s mh.slot 1
execute if items entity @s hotbar.2 minecraft:compass[minecraft:custom_data~{mh:1b}] run scoreboard players set @s mh.slot 2
execute if items entity @s hotbar.3 minecraft:compass[minecraft:custom_data~{mh:1b}] run scoreboard players set @s mh.slot 3
execute if items entity @s hotbar.4 minecraft:compass[minecraft:custom_data~{mh:1b}] run scoreboard players set @s mh.slot 4
execute if items entity @s hotbar.5 minecraft:compass[minecraft:custom_data~{mh:1b}] run scoreboard players set @s mh.slot 5
execute if items entity @s hotbar.6 minecraft:compass[minecraft:custom_data~{mh:1b}] run scoreboard players set @s mh.slot 6
execute if items entity @s hotbar.7 minecraft:compass[minecraft:custom_data~{mh:1b}] run scoreboard players set @s mh.slot 7
execute if items entity @s hotbar.8 minecraft:compass[minecraft:custom_data~{mh:1b}] run scoreboard players set @s mh.slot 8
execute if items entity @s weapon.offhand minecraft:compass[minecraft:custom_data~{mh:1b}] run scoreboard players set @s mh.slot 9
execute if items entity @s inventory.0 minecraft:compass[minecraft:custom_data~{mh:1b}] run scoreboard players set @s mh.slot 10
execute if items entity @s inventory.1 minecraft:compass[minecraft:custom_data~{mh:1b}] run scoreboard players set @s mh.slot 11
execute if items entity @s inventory.2 minecraft:compass[minecraft:custom_data~{mh:1b}] run scoreboard players set @s mh.slot 12
execute if items entity @s inventory.3 minecraft:compass[minecraft:custom_data~{mh:1b}] run scoreboard players set @s mh.slot 13
execute if items entity @s inventory.4 minecraft:compass[minecraft:custom_data~{mh:1b}] run scoreboard players set @s mh.slot 14
execute if items entity @s inventory.5 minecraft:compass[minecraft:custom_data~{mh:1b}] run scoreboard players set @s mh.slot 15
execute if items entity @s inventory.6 minecraft:compass[minecraft:custom_data~{mh:1b}] run scoreboard players set @s mh.slot 16
execute if items entity @s inventory.7 minecraft:compass[minecraft:custom_data~{mh:1b}] run scoreboard players set @s mh.slot 17
execute if items entity @s inventory.8 minecraft:compass[minecraft:custom_data~{mh:1b}] run scoreboard players set @s mh.slot 18
execute if items entity @s inventory.9 minecraft:compass[minecraft:custom_data~{mh:1b}] run scoreboard players set @s mh.slot 19
execute if items entity @s inventory.10 minecraft:compass[minecraft:custom_data~{mh:1b}] run scoreboard players set @s mh.slot 20
execute if items entity @s inventory.11 minecraft:compass[minecraft:custom_data~{mh:1b}] run scoreboard players set @s mh.slot 21
execute if items entity @s inventory.12 minecraft:compass[minecraft:custom_data~{mh:1b}] run scoreboard players set @s mh.slot 22
execute if items entity @s inventory.13 minecraft:compass[minecraft:custom_data~{mh:1b}] run scoreboard players set @s mh.slot 23
execute if items entity @s inventory.14 minecraft:compass[minecraft:custom_data~{mh:1b}] run scoreboard players set @s mh.slot 24
execute if items entity @s inventory.15 minecraft:compass[minecraft:custom_data~{mh:1b}] run scoreboard players set @s mh.slot 25
execute if items entity @s inventory.16 minecraft:compass[minecraft:custom_data~{mh:1b}] run scoreboard players set @s mh.slot 26
execute if items entity @s inventory.17 minecraft:compass[minecraft:custom_data~{mh:1b}] run scoreboard players set @s mh.slot 27
execute if items entity @s inventory.18 minecraft:compass[minecraft:custom_data~{mh:1b}] run scoreboard players set @s mh.slot 28
execute if items entity @s inventory.19 minecraft:compass[minecraft:custom_data~{mh:1b}] run scoreboard players set @s mh.slot 29
execute if items entity @s inventory.20 minecraft:compass[minecraft:custom_data~{mh:1b}] run scoreboard players set @s mh.slot 30
execute if items entity @s inventory.21 minecraft:compass[minecraft:custom_data~{mh:1b}] run scoreboard players set @s mh.slot 31
execute if items entity @s inventory.22 minecraft:compass[minecraft:custom_data~{mh:1b}] run scoreboard players set @s mh.slot 32
execute if items entity @s inventory.23 minecraft:compass[minecraft:custom_data~{mh:1b}] run scoreboard players set @s mh.slot 33
execute if items entity @s inventory.24 minecraft:compass[minecraft:custom_data~{mh:1b}] run scoreboard players set @s mh.slot 34
execute if items entity @s inventory.25 minecraft:compass[minecraft:custom_data~{mh:1b}] run scoreboard players set @s mh.slot 35
execute if items entity @s inventory.26 minecraft:compass[minecraft:custom_data~{mh:1b}] run scoreboard players set @s mh.slot 36
