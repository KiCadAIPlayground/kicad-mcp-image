# kicad-mcp-image

[kicad-mcp-pro](https://github.com/oaslananka/kicad-mcp-pro) (AGPL-3.0, unmodified) on top of `lscr.io/linuxserver/kicad`, so the MCP server has `kicad-cli` (DRC, ERC, exports). Used as the `kicad-mcp` sidecar next to the browser KiCad in [k3s-cluster](https://github.com/KiCadAIPlayground/k3s-cluster) (`apps/kicad`).

Bump: change `KICAD_IMAGE` and/or `KICAD_MCP_PRO_VERSION` in the Dockerfile (latest stable, pinned) and merge. The workflow pushes `ghcr.io/kicadaiplayground/kicad-mcp:<kicad tag>-mcp<version>`. Then update the tag in `k3s-cluster/apps/kicad/kicad.yaml`.
