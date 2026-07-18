# pi-setup

A small, reproducible installer for my Pi packages and authored resources. It deliberately does not mirror `~/.pi` or manage Pi runtime state.

## Install

```sh
git clone git@github.com:Yeshwanthyk/pi-setup.git
cd pi-setup
./install.sh
```

The installer:

- installs the packages listed in [`packages.txt`](packages.txt) using `pi install`;
- copies `AGENTS.md`, `agents/`, and `themes/` into `~/.pi/agent`;
- backs up a changed destination before replacing it;
- leaves unrelated settings, credentials, sessions, workflows, caches, and histories untouched.

Set `PI_AGENT_DIR` to test against another destination:

```sh
PI_AGENT_DIR="$(mktemp -d)/agent" ./install.sh
```

## Updating

Update Pi and all unpinned packages:

```sh
pi update --all
```

Rerun `./install.sh` after changing authored resources.

## Intentionally excluded

- skills symlinked from `~/.gitgud`
- the filtered `pi-interview-tool` package
- secrets and runtime/generated state
