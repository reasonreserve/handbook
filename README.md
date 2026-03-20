# Reason Reserve Handbook

Canonical **developer experience** content for the **[reasonreserve](https://github.com/reasonreserve)** org: GitHub Projects usage, Cursor + **GitHub MCP** setup, and shared issue templates.

**Current version:** see [`VERSION`](VERSION) (also published as Git [tags](https://github.com/reasonreserve/handbook/releases) `v*.*.*`).

**Setup backlog:** [issues on handbook](https://github.com/reasonreserve/handbook/issues) — [docs/setup-tracking.md](docs/setup-tracking.md).

**Programme (epics):** [`reasonreserve/portfolio`](https://github.com/reasonreserve/portfolio) — org project **[Portfolio](https://github.com/orgs/reasonreserve/projects/1)**.

## Who this is for

- **Everyone** — how we track work on GitHub ([Projects](https://docs.github.com/en/issues/planning-and-tracking-with-projects/learning-about-projects/about-projects)).
- **Developers using Cursor** — connect the GitHub MCP ([docs/github-mcp-cursor.md](docs/github-mcp-cursor.md)).
- **Maintainers** — [Conventional Commits](docs/conventional-commits.md) for commit messages; [cut a handbook release](docs/release-process.md).

## New service / app repositories

Do **not** fork this repo for product code. Use **[service-template](service-template/README.md)** as the GitHub **template** for new repos: it includes a **weekly check** that **opens an issue** when a newer handbook release exists (live tracking + notification).

After you publish **`reasonreserve/handbook`**, create **`reasonreserve/service-template`** from the [`service-template/`](service-template/) folder (see template README).

## Docs in this repo

| Doc | Purpose |
|-----|---------|
| [docs/conventional-commits.md](docs/conventional-commits.md) | **Git:** Conventional Commits + **imperative** subjects ([cheatsheet](https://gist.github.com/qoomon/5dfcdf8eec66a051ecd85625518cfd13)) |
| [docs/github-projects-guide.md](docs/github-projects-guide.md) | **PM:** new org project checklist + alignment with GitHub’s official Projects docs |
| [docs/github-projects-setup.md](docs/github-projects-setup.md) | Org Projects URLs, CLI, suggested columns |
| [docs/github-mcp-cursor.md](docs/github-mcp-cursor.md) | GitHub MCP in Cursor (PAT in `.cursor/mcp.json`) |
| [docs/release-process.md](docs/release-process.md) | Tagging and releasing the handbook |

## Quick links

- **Issue templates** — `.github/ISSUE_TEMPLATE/`
- **MCP config template** — [`.cursor/mcp.json.example`](.cursor/mcp.json.example) → copy to `.cursor/mcp.json` (gitignored)
