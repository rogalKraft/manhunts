# Countdown titles at the thresholds a player actually reacts to (FR-8.4).
# Called once per second from lifecycle/prep_tick.
execute if score #prep.s mh.tmp matches 30 run function manhunt:hud/countdown_say
execute if score #prep.s mh.tmp matches 1..10 run function manhunt:hud/countdown_say
