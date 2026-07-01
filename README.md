# d2lab

Small, focused repo for authoring D2 diagrams. Sources live in `diagram/` and exports are written to `output/` via small helper scripts and `mise` tasks.

## Icon Set

- [Kubernetes Icons](https://github.com/kubernetes/community/tree/master/icons)
- [AWS Icons](https://aws-icons.com/)
- [Azure Icons](https://az-icons.com/)
- [GCP Icons](https://gcpicons.com/)
- [IBM Icons](https://github.com/IBM-Cloud/architecture-icons)
- [Dashboard Icons (dashboardicons)](https://dashboardicons.com/)
- [Dashboard Icons (selfh.st)](https://selfh.st/icons/)
- [Software Architecture Diagram Icons](https://icons.terrastruct.com/)
- [CNCF Logos](https://github.com/cncf/artwork)

## Quick start (Dev Container)

Prereqs: Docker + VS Code.

1) Open this repo in VS Code and run: "Dev Containers: Reopen in Container".
2) The container will run `scripts/setup.sh` to install D2 and Playwright (for PNG export).
3) Start watching a diagram and auto-regenerate SVG on save:

```bash
mise run watch ./path/to/diagram
```

4) Build all outputs on demand:

```bash
mise run build ./path/to/diagram
```

Watch mode writes `./output/diagram.svg`.
Build mode writes `./output/diagram.svg`, `./output/diagram.png`, and `./output/diagram.gif`.

## Local setup (without Dev Container)

- Install mise: <https://mise.jdx.dev>
- Trust and install tools for this repo:

```bash
mise trust
mise install
```

- Install D2 CLI if not present: <https://d2lang.com/tour/install>
- Install Playwright Chromium (required for PNG and GIF export):

```bash
npm -g install playwright
npx playwright install --with-deps chromium
```

Now you can use the same tasks:

```bash
mise run watch ./path/to/diagram
mise run build ./path/to/diagram
```

## Helper scripts

PowerShell:

```bash
powershell -NoProfile -ExecutionPolicy Bypass -File .\scripts\d2_watch.ps1 ./diagram/homelab.d2
powershell -NoProfile -ExecutionPolicy Bypass -File .\scripts\d2_build.ps1 ./diagram/homelab.d2
```

Bash:

```bash
./scripts/d2_watch.sh ./diagram/homelab.d2
./scripts/d2_build.sh ./diagram/homelab.d2
```

## Sponsor

If this project helps you, consider supporting it:

- GitHub Sponsors: <https://github.com/sponsors/HYP3R00T>
