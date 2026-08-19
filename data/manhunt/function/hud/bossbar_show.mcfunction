# Show the bossbar to everyone holding a role. Role 0 (none) never sees it (FR-8.3).
bossbar set manhunt:main players @a[scores={mh.role=1..3}]
bossbar set manhunt:main visible true
