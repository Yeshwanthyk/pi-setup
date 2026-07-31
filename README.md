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
- [`pi-nightcity`](https://github.com/Yeshwanthyk/pi-nightcity)
- [`telegram-handoff`](https://github.com/Yeshwanthyk/telegram-handoff)
- [`pi-subagents`](https://github.com/Yeshwanthyk/pi-subagents)
- [`pi-workflows`](https://github.com/Yeshwanthyk/pi-workflows)
- [`pi-background-terminals`](https://github.com/Yeshwanthyk/pi-background-terminals)
- [`pi-btw`](https://github.com/Yeshwanthyk/pi-btw)
- [`pi-handoff`](https://github.com/Yeshwanthyk/pi-handoff)
- [`pi-amp-ui`](https://github.com/Yeshwanthyk/pi-amp-ui)

### npm

- [`pi-peek`](https://www.npmjs.com/package/pi-peek)
- [`@injaneity/pi-computer-use`](https://www.npmjs.com/package/@injaneity/pi-computer-use)
- [`@plannotator/pi-extension`](https://www.npmjs.com/package/@plannotator/pi-extension)
- [`@ogulcancelik/pi-codex-compaction`](https://www.npmjs.com/package/@ogulcancelik/pi-codex-compaction)

## Configuration files

- `AGENTS.md`
- Agents: `code-simplifier`, `librarian`, `oracle`, `review-deep`, `review-explain`, `review-verify`, `reviewer`, `scout`, `visual-tester`, `worker`
- Themes: `ayu-light`, `flexoki-light`, `github-dark-default`, `kanagawa-lotus`, `rose-pine-dawn`, `vesper`, `yesh-rose-pine-dark`, `yesh-rose-pine-light`

Existing files are backed up under `~/.pi/agent/backups/` before replacement.

## Update

```sh
pi update --all
./install.sh
```
