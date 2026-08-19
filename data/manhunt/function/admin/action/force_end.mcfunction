# admin/action/force_end — end a stuck match with no winner (FR-6.11).
execute if data storage manhunt:state {phase:"idle"} run return run tellraw @s [{"translate":"manhunt.prefix","fallback":"[Manhunt] ","color":"green"},{"translate":"manhunt.msg.no_match","fallback":"No match is running.","color":"red"}]
execute if data storage manhunt:state {phase:"ended"} run return run tellraw @s [{"translate":"manhunt.prefix","fallback":"[Manhunt] ","color":"green"},{"translate":"manhunt.msg.already_ended","fallback":"The match has already ended.","color":"red"}]
function manhunt:win/api/declare {winner:"none",reason:"aborted"}
