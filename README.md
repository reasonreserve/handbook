# Reason Reserve

GitHub org: **[reasonreserve](https://github.com/reasonreserve)**.

Project planning and tracking use [GitHub Projects](https://docs.github.com/en/issues/planning-and-tracking-with-projects/learning-about-projects/about-projects). After this repository exists under the org, open **Projects** on the repo or at the org level and create a project linked to this work.

See [docs/github-projects-setup.md](docs/github-projects-setup.md) for a one-time setup checklist and suggested board layout.

To connect Cursor Agent to GitHub APIs (issues, repos, and more), configure the **GitHub MCP server** — [docs/github-mcp-cursor.md](docs/github-mcp-cursor.md). Copy **`.cursor/mcp.json.example`** → **`.cursor/mcp.json`** and paste your PAT there (gitignored). Use a **global** `~/.cursor/mcp.json` instead if you want the same MCP in every workspace (pick one place for the `github` server so it isn’t defined twice).

## Quick links (after the repo is on GitHub)

- **New issue** — use the templates under `.github/ISSUE_TEMPLATE/` so work items have consistent titles and labels for the board.
- **Project board** — **Repository → Projects** (or your organization’s **Projects** tab) → **New project**.
