# pi-setup

Installs Pi packages and configuration files into `~/.pi/agent`.

## Install

```sh
git clone git@github.com:Yeshwanthyk/pi-setup.git
cd pi-setup
./install.sh
```

## Packages

### GitHub

- [`pi-tasks`](https://github.com/Yeshwanthyk/pi-tasks)
- [`pi-web-access`](https://github.com/nicobailon/pi-web-access)
- [`pi-askuser`](https://github.com/Yeshwanthyk/pi-askuser)
- [`glimpse`](https://github.com/HazAT/glimpse)
- [`pi-design-deck`](https://github.com/nicobailon/pi-design-deck)
- [`telegram-handoff`](https://github.com/Yeshwanthyk/telegram-handoff)
- [`pi-subagents`](https://github.com/Yeshwanthyk/pi-subagents)
- [`pi-workflows`](https://github.com/Yeshwanthyk/pi-workflows)
- [`pi-background-terminals`](https://github.com/Yeshwanthyk/pi-background-terminals)
- [`pi-themes`](https://github.com/Yeshwanthyk/pi-themes)
- [`pi-amp-ui`](https://github.com/Yeshwanthyk/pi-amp-ui)
- [`pi-prompt-shelf`](https://github.com/Yeshwanthyk/pi-prompt-shelf)

### npm

- [`pi-peek`](https://www.npmjs.com/package/pi-peek)
- [`@injaneity/pi-computer-use`](https://www.npmjs.com/package/@injaneity/pi-computer-use)
- [`@plannotator/pi-extension`](https://www.npmjs.com/package/@plannotator/pi-extension)
- [`@ogulcancelik/pi-codex-compaction`](https://www.npmjs.com/package/@ogulcancelik/pi-codex-compaction)

## Configuration files

- `AGENTS.md`

Themes and the `/theme` command are managed by [`pi-themes`](https://github.com/Yeshwanthyk/pi-themes). The installer backs up and removes legacy top-level theme copies so they cannot shadow package themes during startup.

`/btw` is provided by [`pi-subagents`](https://github.com/Yeshwanthyk/pi-subagents). The installer removes the retired standalone `pi-btw` and `pi-handoff` packages.

The installer also backs up and removes legacy agent profiles and stale architecture documents that are no longer part of the active setup.

Existing files are backed up under `~/.pi/agent/backups/` before replacement or removal.

## Update

```sh
pi update --all
./install.sh
```
