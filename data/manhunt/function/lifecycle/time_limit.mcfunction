# lifecycle/time_limit — win condition 4 (PRD §7.4 priority 5).
#
# Only reached when match_time_limit_seconds != 0. Elapsed is derived from gametime
# rather than counted, so it stays correct across a /reload or a server restart.

execute store result score #now mh.tmp run time query gametime
execute store result score #started mh.tmp run data get storage manhunt:state match_started
scoreboard players operation #now mh.tmp -= #started mh.tmp

execute store result score #limit mh.tmp run data get storage manhunt:config match_time_limit_seconds 20

execute if score #now mh.tmp >= #limit mh.tmp run function manhunt:win/api/declare {winner:"hunters",reason:"timeout"}
