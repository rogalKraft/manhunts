# init/teams — presentation only.
#
# Teams are DERIVED from mh.role every cycle by roles/project_teams and are never read
# as the source of truth (FR-2.3). If an admin or another pack moves someone, the next
# cycle puts them back.
#
# 26.2: the `color` argument type was renamed minecraft:color -> minecraft:team_color.
# The command text is unchanged; a copied 1.21.1 command still validates here.

team add mh.runners {"translate":"manhunt.team.runners","fallback":"Runners"}
team modify mh.runners color green
team modify mh.runners friendlyFire false
team modify mh.runners nametagVisibility never

team add mh.hunters {"translate":"manhunt.team.hunters","fallback":"Hunters"}
team modify mh.hunters color red
team modify mh.hunters friendlyFire true
team modify mh.hunters nametagVisibility never

team add mh.spectators {"translate":"manhunt.team.spectators","fallback":"Spectators"}
team modify mh.spectators color gray
team modify mh.spectators friendlyFire false
team modify mh.spectators nametagVisibility never
