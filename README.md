# d2lab]

Small, focused repo for authoring D2 diagrams. Sources live in `diagram/` and exports (PNG/SVG) are written to `output/` via a small script and a `mise` watch task.

## Quick start (Dev Container)

Prereqs: Docker + VS Code.

1) Open this repo in VS Code and run: "Dev Containers: Reopen in Container".
2) The container will run `scripts/setup.sh` to install D2, Playwright (for PNG export), `watchexec`, etc.
3) Start watching a diagram and auto-regenerate on save:

```bash
mise run watch ./path/to/diagram
```

Exports land in `./output/homelab.png` and `./output/homelab.svg`.

## Local setup (without Dev Container)

- Install mise: https://mise.jdx.dev
- Trust and install tools for this repo:

```bash
mise trust
mise install
```

- Install D2 CLI if not present: https://d2lang.com/tour/install
- Install Playwright Chromium (required for PNG export):

```bash
npm -g install playwright
npx playwright install --with-deps chromium
```

Now you can use the same watch task:

```bash
mise run watch ./path/to/diagram
```

## One-off render (no watch)

Use the helper script directly:

```bash
./scripts/d2_to_output.zsh ./diagram/homelab.d2
```

This writes `./output/homelab.png` and `./output/homelab.svg`.

## Sponsor

If this project helps you, consider supporting it:

- GitHub Sponsors: https://github.com/sponsors/HYP3R00T
