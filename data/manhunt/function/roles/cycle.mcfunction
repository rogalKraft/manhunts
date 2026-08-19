# roles/cycle — once per second, from core/active.

function manhunt:roles/project_teams
function manhunt:roles/waypoints_enforce

# Disconnect handling only means anything while a match is being played.
execute if data storage manhunt:state {phase:"running"} run function manhunt:roles/grace_tick
