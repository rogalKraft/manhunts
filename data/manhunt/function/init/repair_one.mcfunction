# init/repair_one — re-type one config boolean.
#
# Macro. Required key: key   (the config field name)
# Call sites: init/repair_booleans

$execute store result score #rep mh.tmp run data get storage manhunt:config $(key)
$execute if score #rep mh.tmp matches 1.. run data modify storage manhunt:config $(key) set value true
$execute if score #rep mh.tmp matches ..0 run data modify storage manhunt:config $(key) set value false
