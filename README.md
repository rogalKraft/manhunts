# Manhunt

One or more Speedrunners race to kill the Ender Dragon. One or more Hunters, armed with a tracking compass, try to kill them first.

Data pack only — no mod, no plugin, no server software. **Minecraft Java Edition 26.2.** Works in singleplayer, on LAN and on a dedicated server.

## Install

1. Drop the `manhunt` folder into your world's `datapacks/` directory.
2. **Exit the world and load it again.** Not `/reload` — the settings and role screens are dialogs, and Minecraft only builds those when a world loads. Using `/reload` instead makes every screen look broken while the rest of the pack works fine.

Nothing in your world changes until a match is started.

Optional: the companion `manhunt-lang` resource pack translates the mode into 12 languages. It is never required — without it everything reads in English.

## Running a match

Everything an operator does lives behind one command:

```
/function manhunt:admin/panel
```

| Button | What it does |
|---|---|
| **Roles** | Assign sides. Start here — see below |
| **Start match** | Refuses, with the reason, unless at least one runner and one hunter are online |
| **Settings** | Every option, in game. Survives `/reload` and a restart |
| **Status** | Prints phase, timers and outcome to chat |
| **Force end** | Ends with no winner and puts everything back |
| **Rematch reset** | Clears the match, keeps the teams. One click to play again |
| **Full reset** | Clears the match and every role. Settings are kept |

Each button is also a plain function under `manhunt:admin/action/`, so a command block or another pack can drive the same thing.

### Picking who runs

The usual flow is two clicks in **Roles**:

1. **Everyone unassigned to hunter** — sweeps every player without a side into the hunter team.
2. **Pick a random runner** — takes one hunter at random and makes them the runner.

Because step 2 draws from the hunters, the previous runner stays a runner across a rematch. For a clean redraw press **Clear all roles** first, then repeat both steps.

To set one specific player instead, skip the panel:

```
execute as <player> run function manhunt:roles/api/set_role {role:1}
```

`0` unassigned · `1` runner · `2` hunter · `3` spectator. Any number of runners and hunters is supported; the runner side loses only when **all** of its players are out.

**Spectators are a real side**, not a courtesy: they are put in spectator mode, never appear as a compass target, and count toward neither win condition. That is the role for a camera account.

### What a match looks like

**Lobby** — everyone with a role is penned inside a small world border, in adventure mode and immune to damage, while the room sorts itself out. Set the duration to `0` to skip it.

**Head start** — the border opens and the runner leaves. Hunters are frozen in place and their compasses hold the position from the starting whistle, so nobody can watch the runner move away and pre-aim.

**The hunt** — tracking goes live. The match ends when the dragon dies (runners win) or the last runner is eliminated (hunters win). A dragon kill and a runner death on the same tick always resolve as a runner win.

## What players do

Nobody but the operator needs a command, with one exception.

**Hunters** get a compass automatically and never lose it — drop it, die with it, or fill your inventory and it comes back within a second. To choose whom to chase:

```
/trigger mh.menu
```

That prints a list of living runners in chat; click a name to lock onto them, or click **Nearest runner (auto)** to track whoever is closest and let it re-target itself. A locked target holds until you change it or they are eliminated.

Read the compass by its **name**, not just its needle:

- **live** — the needle is pointing at the runner's real position right now.
- **last seen** — the runner is in another dimension. The needle is showing where they were last seen in *your* dimension, which is normally the portal they used. Follow it and you will find the crossing.
- **no data** — the runner has never been in this dimension. The compass is not pointing anywhere and says so.

The compass needle spins in the Nether and the End in vanilla no matter what it is targeting. That is why the distance and direction are also written on your action bar — in those dimensions the text is the reliable channel, not the needle.

**Runners** are told how many hunters are tracking them, and get a sound cue when one gets close.

## Settings

Everything is in **Settings** on the panel, and it persists. The ones that change the game most:

| | |
|---|---|
| Lobby seconds, pen size | The holding phase, or `0` to skip it |
| Head start seconds | How long the runner gets alone |
| Runner lives / hunter lives | `0` hunter lives means infinite |
| Track in the Nether / the End | Turn End tracking off if you want the dragon fight to be a fair duel |
| Warning range | How close a hunter gets before the runner hears it |
| Border after opening | What the pen opens out to; `0` restores the world's own border |

## What it does not do

- Change any gamerule without being asked. `keepInventory` is yours; only *instant respawn* is touched, and only if you turn it on — it is saved and restored.
- Touch your items. The only item it manages is the hunters' tracking compass, matched by its own tag, so a compass you crafted is never destroyed.
- Force-load a single chunk, or create a single entity. There is nothing to leave behind if the server dies mid-match.
- Regenerate the world between matches. Reset restores *pack* state, not *world* state — blocks you broke stay broken.
- Prevent anyone from reading coordinates off F3. Manhunt has always been trust-based.

## Rough edges

Known, and worth hearing before you run this for other people:

- **The panel needs operator permission.** Players reach their own controls fine, but match control cannot yet be handed to a trusted non-op. Every panel button also asks for confirmation on a second screen, which is the same cause.
- The settings screen is taller than the window at some GUI scales; scroll to reach **Apply**.
- Custom dimensions are ignored — the pack knows the Overworld, the Nether and the End.
- One match per server.
- There is no uninstall function yet. Deleting the folder is safe and leaves nothing running, but the scoreboard objectives and teams it created stay until you remove them by hand.

## Credits

Created by **Rogal**.

The original 1.21.1 `manhunts` prototype informed two techniques carried into this build: per-dimension last-known-position tracking, and writing dynamic compass targets through a macro and the `lodestone_tracker` component. This is a new implementation, not a port.
