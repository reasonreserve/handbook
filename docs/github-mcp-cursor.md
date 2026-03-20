# GitHub MCP in Cursor

Official references:

- [Setting up the GitHub MCP Server (VS Code)](https://docs.github.com/en/copilot/how-tos/provide-context/use-mcp/set-up-the-github-mcp-server?tool=vscode)
- [Install GitHub MCP Server in Cursor](https://github.com/github/github-mcp-server/blob/main/docs/installation-guides/install-cursor.md)

## Spotlight / Dock: the simple setup (no Terminal, no Docker)

**You do not need Docker** for the setup we use. Docker is only if you run the MCP server **locally** via a container; the config points at GitHub’s **hosted** URL `https://api.githubcopilot.com/mcp/`.

macOS does **not** give apps launched from **Spotlight** or the **Dock** your shell profile or `.env`. Cursor’s remote MCP only sees a header in config or `${env:…}` from the **real** process environment, so “just open Cursor” fails unless the token is in a place Cursor reads **without** a shell.

**Do this once (pick one file — don’t duplicate the same `github` server in both):**

1. **Project (this repo)** — Copy [`.cursor/mcp.json.example`](../.cursor/mcp.json.example) to **`.cursor/mcp.json`**, then replace `PASTE_YOUR_GITHUB_PAT_HERE` with your real PAT (fine-grained or classic). **`.cursor/mcp.json` is gitignored** so the token is not committed.

2. **Or global** — Same JSON in **`~/.cursor/mcp.json`** if you want the same GitHub MCP in every workspace.

3. **Quit Cursor fully** and open it again from **Spotlight**. No Terminal, no export script.

Optionally run `chmod 600 .cursor/mcp.json` or `chmod 600 ~/.cursor/mcp.json`.

## Why we mentioned `.env` and `${env:GITHUB_MCP_PAT}`

`Authorization: Bearer ${env:GITHUB_MCP_PAT}` avoids storing the token in a file on disk (only in your environment). That’s good for some workflows, but on macOS a normal Spotlight launch **does not** load `.env`. So either:

- put the token in **`~/.cursor/mcp.json`** as above (simplest for Spotlight), or  
- keep `${env:…}` and **export** the variable before starting Cursor (Terminal / script / direnv).

## Optional: launcher script or direnv

If you prefer **not** to keep the PAT in `~/.cursor/mcp.json`, use [`.env`](../.env) (gitignored) plus:

- **`./scripts/open-cursor.sh`** — sources `.env`, then starts Cursor; or  
- **[direnv](https://direnv.net/)** + [`.envrc`](../.envrc) — then run **`cursor .`** from a terminal in this repo.

See [Cursor MCP interpolation](https://cursor.com/docs/context/mcp).

## Cursor version

Use **Cursor v0.48.0+** (Streamable HTTP). See [GitHub’s Cursor install guide](https://github.com/github/github-mcp-server/blob/main/docs/installation-guides/install-cursor.md).

## Token permissions

Fine-grained PAT: repo + org **Projects** as needed for [reasonreserve](https://github.com/reasonreserve). See [fine-grained PAT permissions](https://docs.github.com/en/rest/authentication/permissions-required-for-fine-grained-personal-access-tokens).

## Org / Copilot policy

If you use **Copilot Business / Enterprise**, an admin may need **“MCP servers in Copilot”** enabled. See [GitHub’s prerequisites](https://docs.github.com/en/copilot/how-tos/provide-context/use-mcp/set-up-the-github-mcp-server?tool=vscode).

## Verify

After a restart, check **Settings → MCP** for **github**, then try Agent with a GitHub-related question. If something 403s, confirm token scopes.
