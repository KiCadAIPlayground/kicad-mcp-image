# kicad-mcp-pro on top of the same KiCad image the browser desktop uses, so its tools have kicad-cli
# (DRC/ERC/exports) and the node shares the large base layers with the GUI pod.
ARG KICAD_IMAGE=lscr.io/linuxserver/kicad:10.0.3-r0-ls158
FROM ${KICAD_IMAGE}
ARG KICAD_MCP_PRO_VERSION=4.22.4
RUN python3 -m venv /opt/kicad-mcp \
 && /opt/kicad-mcp/bin/pip install --no-cache-dir "kicad-mcp-pro==${KICAD_MCP_PRO_VERSION}" \
 && /opt/kicad-mcp/bin/kicad-mcp-pro --help >/dev/null
ENV KICAD_MCP_KICAD_CLI=/usr/bin/kicad-cli \
    KICAD_MCP_TRANSPORT=streamable-http \
    KICAD_MCP_HOST=0.0.0.0 \
    KICAD_MCP_PORT=3334
EXPOSE 3334
# the base image's s6 /init would start a desktop; run only the MCP server
ENTRYPOINT ["/opt/kicad-mcp/bin/kicad-mcp-pro"]
CMD ["--transport", "streamable-http"]
