# GitHub MCP in Cursor

This repo mirrors the recommended **remote** [GitHub MCP server](https://github.com/github/github-mcp-server) in [`.cursor/mcp.json`](../.cursor/mcp.json). Official references:

- [Setting up the GitHub MCP Server (VS Code)](https://docs.github.com/en/copilot/how-tos/provide-context/use-mcp/set-up-the-github-mcp-server?tool=vscode) — GitHub docs (marketplace vs manual config).
- [Install GitHub MCP Server in Cursor](https://github.com/github/github-mcp-server/blob/main/docs/installation-guides/install-cursor.md) — host-specific steps (PAT, verify, troubleshoot).

## Why a PAT?

GitHub’s Cursor guide states that **the remote GitHub MCP server currently requires a [Personal Access Token](https://github.com/settings/personal-access-tokens)** while Cursor’s Streamable HTTP support is used. Configure the token via an environment variable so it never lands in git.

## One-time setup

1. **Cursor version** — Use **Cursor v0.48.0+** (Streamable HTTP). See [GitHub’s Cursor install guide](https://github.com/github/github-mcp-server/blob/main/docs/installation-guides/install-cursor.md).

2. **Create a token** — [Fine-grained](https://github.com/settings/personal-access-tokens) or classic PAT, with only the permissions you want the agent to have (e.g. repository contents, issues, pull requests; add **Projects** permissions if you want board automation). Reason Reserve org: [reasonreserve](https://github.com/reasonreserve).

3. **Set the environment variable** (pick one approach):

   - **Shell profile** (applies after you open a new terminal and launch Cursor from that environment):

     ```bash
     export GITHUB_MCP_PAT="ghp_..."   # or fine-grained token value
     ```

   - **macOS GUI apps** (if Cursor doesn’t see your shell env): use a small launcher script, or set the variable in your OS/session so Cursor inherits it.

   - **`.env` in this repo** — Storing `GITHUB_MCP_PAT=…` here is fine (`.env` is gitignored). Remote MCP entries **do not auto-load** `.env`; the variable must still exist in **Cursor’s** environment. From a terminal in the project you can run `set -a && source .env && set +a` then **launch Cursor from that same terminal**, or export the variable in your shell profile / OS so the GUI app inherits it.

   The config uses **`${env:GITHUB_MCP_PAT}`** — Cursor resolves this when loading MCP ([config interpolation](https://cursor.com/docs/context/mcp)).

4. **Config location** — Either:

   - **Project:** `.cursor/mcp.json` in this repo (committed, no secrets), or  
   - **Global:** `~/.cursor/mcp.json` for all workspaces.

   If both define `github`, follow Cursor’s merge/precedence behavior in **Settings → Tools & Integrations → MCP**.

5. **Restart Cursor** completely, then check **Settings → MCP** for a healthy **github** server and **Available Tools** in Agent.

## Optional: GitHub’s one-click install

If you prefer the guided flow, use the **Install MCP Server** button in [GitHub’s Cursor install doc](https://github.com/github/github-mcp-server/blob/main/docs/installation-guides/install-cursor.md) — it still expects you to substitute your PAT in the generated config.

## Org / Copilot policy

If you use **Copilot Business / Enterprise**, an admin may need to enable **“MCP servers in Copilot”** for your org. See [GitHub’s prerequisites](https://docs.github.com/en/copilot/how-tos/provide-context/use-mcp/set-up-the-github-mcp-server?tool=vscode).

## Verify

After a restart, ask Agent something like: “List repositories I can access under the reasonreserve org” (or use a specific MCP tool if listed). Check **Output → MCP** if tools fail to load.
