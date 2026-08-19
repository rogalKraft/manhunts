execute store result score #wp mh.tmp run attribute @s minecraft:waypoint_transmit_range get
execute if score #wp mh.tmp matches 1.. run function manhunt:roles/waypoint_off
