# admin/config/menu — build the settings screen, then hand it to a one-line macro.
#
# The dialog is assembled in STORAGE and passed whole as a single macro argument. That
# indirection is not stylistic: a macro substitutes every $(name) on the command line
# in ONE pass, so writing the dialog inline would consume the Apply button's own
# $(lobby), $(head) and so on — the template would arrive with no variables left, the
# game would reject the dialog with "No variables in macro", and because the failure
# happens inside a function nothing would be printed. The screen simply never opened.
#
# Substituting the finished dialog as $(d) works because the pass is single: whatever
# $( ) survives inside the substituted text is left alone, which is exactly what the
# button template needs.
#
# Booleans inside this literal are fine: storage keeps them as 1b/0b and the dialog
# parser accepts that. What it does NOT accept is the string "true" — see below.
#
# Every control also has to open at the value actually in force — `initial` is what
# seeds it (verified against `default` and `value`, which are ignored and leave the
# handle at the midpoint). Without that, opening this screen and pressing Apply would
# quietly rewrite every setting to the middle of its range.
#
# `step:1` keeps the readout on whole numbers. A continuous slider reported values like
# "Grace on leave (s): 20.000002", which looks broken even though apply coerces it
# back to an integer.

data modify storage manhunt:tmp dlg set value {type:"minecraft:multi_action",title:{translate:"manhunt.cfg.title",fallback:"Manhunt settings",bold:true,color:"gold"},body:[{type:"minecraft:plain_message",contents:{translate:"manhunt.cfg.hint",fallback:"Drag or tick, then Apply.",color:"gray"}}],columns:1,button_width:230,inputs:[{type:"minecraft:number_range",key:"lobby",label:{translate:"manhunt.cfg.lobby",fallback:"Lobby (s)"},start:0,end:300,step:1,initial:0},{type:"minecraft:number_range",key:"pen",label:{translate:"manhunt.cfg.pen",fallback:"Pen size"},start:8,end:200,step:1,initial:8},{type:"minecraft:number_range",key:"head",label:{translate:"manhunt.cfg.head",fallback:"Head start (s)"},start:0,end:600,step:1,initial:0},{type:"minecraft:number_range",key:"rl",label:{translate:"manhunt.cfg.rl",fallback:"Runner lives"},start:1,end:10,step:1,initial:1},{type:"minecraft:number_range",key:"hl",label:{translate:"manhunt.cfg.hl",fallback:"Hunter lives"},start:0,end:10,step:1,initial:0},{type:"minecraft:number_range",key:"wd",label:{translate:"manhunt.cfg.wd",fallback:"Warning range"},start:16,end:256,step:1,initial:16},{type:"minecraft:number_range",key:"grace",label:{translate:"manhunt.cfg.grace",fallback:"Grace on leave (s)"},start:0,end:600,step:1,initial:0},{type:"minecraft:number_range",key:"expand",label:{translate:"manhunt.cfg.expand",fallback:"Border opens over (s)"},start:0,end:300,step:1,initial:0},{type:"minecraft:number_range",key:"to",label:{translate:"manhunt.cfg.to",fallback:"Border after opening"},start:0,end:5000,step:50,initial:0},{type:"minecraft:boolean",key:"end",label:{translate:"manhunt.cfg.end",fallback:"Track in the End"},initial:false,on_true:"true",on_false:"false"},{type:"minecraft:boolean",key:"nether",label:{translate:"manhunt.cfg.nether",fallback:"Track in the Nether"},initial:false,on_true:"true",on_false:"false"},{type:"minecraft:boolean",key:"warn",label:{translate:"manhunt.cfg.warn",fallback:"Runner warning"},initial:false,on_true:"true",on_false:"false"},{type:"minecraft:boolean",key:"resp",label:{translate:"manhunt.cfg.resp",fallback:"Instant respawn"},initial:false,on_true:"true",on_false:"false"},{type:"minecraft:boolean",key:"loc",label:{translate:"manhunt.cfg.loc",fallback:"Hide locator bar"},initial:false,on_true:"true",on_false:"false"},{type:"minecraft:boolean",key:"adv",label:{translate:"manhunt.cfg.adv",fallback:"Adventure in lobby"},initial:false,on_true:"true",on_false:"false"},{type:"minecraft:boolean",key:"inv",label:{translate:"manhunt.cfg.inv",fallback:"Invulnerable in lobby"},initial:false,on_true:"true",on_false:"false"}],actions:[{label:{translate:"manhunt.cfg.apply",fallback:"Apply",color:"green"},action:{type:"minecraft:dynamic/run_command",template:"function manhunt:admin/config/apply {lobby:$(lobby),pen:$(pen),head:$(head),rl:$(rl),hl:$(hl),wd:$(wd),grace:$(grace),expand:$(expand),to:$(to),end:$(end),nether:$(nether),warn:$(warn),resp:$(resp),loc:$(loc),adv:$(adv),inv:$(inv)}"}},{label:{translate:"manhunt.cfg.back",fallback:"Back",color:"gray"},action:{type:"minecraft:run_command",command:"function manhunt:admin/panel"}}]}

execute store result storage manhunt:tmp dlg.inputs[0].initial int 1 run data get storage manhunt:config lobby_seconds
execute store result storage manhunt:tmp dlg.inputs[1].initial int 1 run data get storage manhunt:config lobby_border_size
execute store result storage manhunt:tmp dlg.inputs[2].initial int 1 run data get storage manhunt:config headstart_seconds
execute store result storage manhunt:tmp dlg.inputs[3].initial int 1 run data get storage manhunt:config runner_lives
execute store result storage manhunt:tmp dlg.inputs[4].initial int 1 run data get storage manhunt:config hunter_lives
execute store result storage manhunt:tmp dlg.inputs[5].initial int 1 run data get storage manhunt:config runner_warning_distance
execute store result storage manhunt:tmp dlg.inputs[6].initial int 1 run data get storage manhunt:config disconnect_grace_seconds
execute store result storage manhunt:tmp dlg.inputs[7].initial int 1 run data get storage manhunt:config border_expand_seconds
execute store result storage manhunt:tmp dlg.inputs[8].initial int 1 run data get storage manhunt:config border_expand_to

# Booleans are seeded as REAL booleans, which storage keeps as the byte 1b/0b.
#
# Verified in-game, and the two paths want opposite things: a boolean input parsed
# from a byte is accepted, while the string "true" is rejected outright with
# "Not a number". The word form is only correct when the value is substituted straight
# into a command line by a macro — which is not what happens here, since the whole
# dialog travels through storage.
execute if data storage manhunt:config {track_end:true} run data modify storage manhunt:tmp dlg.inputs[9].initial set value true
execute unless data storage manhunt:config {track_end:true} run data modify storage manhunt:tmp dlg.inputs[9].initial set value false
execute if data storage manhunt:config {track_nether:true} run data modify storage manhunt:tmp dlg.inputs[10].initial set value true
execute unless data storage manhunt:config {track_nether:true} run data modify storage manhunt:tmp dlg.inputs[10].initial set value false
execute if data storage manhunt:config {runner_warning:true} run data modify storage manhunt:tmp dlg.inputs[11].initial set value true
execute unless data storage manhunt:config {runner_warning:true} run data modify storage manhunt:tmp dlg.inputs[11].initial set value false
execute if data storage manhunt:config {force_immediate_respawn:true} run data modify storage manhunt:tmp dlg.inputs[12].initial set value true
execute unless data storage manhunt:config {force_immediate_respawn:true} run data modify storage manhunt:tmp dlg.inputs[12].initial set value false
execute if data storage manhunt:config {hide_locator_bar:true} run data modify storage manhunt:tmp dlg.inputs[13].initial set value true
execute unless data storage manhunt:config {hide_locator_bar:true} run data modify storage manhunt:tmp dlg.inputs[13].initial set value false
execute if data storage manhunt:config {lobby_adventure:true} run data modify storage manhunt:tmp dlg.inputs[14].initial set value true
execute unless data storage manhunt:config {lobby_adventure:true} run data modify storage manhunt:tmp dlg.inputs[14].initial set value false
execute if data storage manhunt:config {lobby_invulnerable:true} run data modify storage manhunt:tmp dlg.inputs[15].initial set value true
execute unless data storage manhunt:config {lobby_invulnerable:true} run data modify storage manhunt:tmp dlg.inputs[15].initial set value false

data modify storage manhunt:tmp wrap.d set from storage manhunt:tmp dlg
function manhunt:admin/config/show with storage manhunt:tmp wrap
