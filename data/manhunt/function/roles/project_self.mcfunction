# roles/project_self — teams follow mh.role, never the other way round (FR-2.3).
team leave @s
execute if score @s mh.role matches 1 run team join mh.runners @s
execute if score @s mh.role matches 2 run team join mh.hunters @s
execute if score @s mh.role matches 3 run team join mh.spectators @s
