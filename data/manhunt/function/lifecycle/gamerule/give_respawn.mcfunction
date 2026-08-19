# Put the host's setting back exactly as it was, whatever it was.

execute unless data storage manhunt:state {respawn_rule:{saved:true}} run return 0

execute if data storage manhunt:state {respawn_rule:{was:1}} run gamerule immediate_respawn true
execute if data storage manhunt:state {respawn_rule:{was:0}} run gamerule immediate_respawn false

data modify storage manhunt:state respawn_rule.saved set value false
