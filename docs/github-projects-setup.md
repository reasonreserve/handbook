# GitHub Projects setup for Reason Reserve

Organization on GitHub: **[reasonreserve](https://github.com/reasonreserve)**.

GitHub Projects (the built-in planning tool) is configured in the GitHub web UI or via the [GitHub CLI](https://cli.github.com/) / API. This doc covers both manual setup and what can be automated from your machine.

## Can Cursor create or manage boards “from this interface”?

**Not without your GitHub credentials.** This workspace does not include a GitHub MCP integration (only other tools like Linear may be available elsewhere). The assistant has no standing login to [github.com/reasonreserve](https://github.com/reasonreserve).

What *does* work:

| Approach | What you get |
|----------|----------------|
| **Browser** | Full control: [Org → Projects](https://github.com/orgs/reasonreserve/projects), create boards, fields, workflows ([About Projects](https://docs.github.com/en/issues/planning-and-tracking-with-projects/learning-about-projects/about-projects)). |
| **`gh` on your machine** | After `gh auth login` with access to the org, the assistant can run **`gh project`** commands in the terminal to create/link projects—if you’ve authenticated and network is allowed. |
| **`GITHUB_TOKEN` / fine-grained PAT** | Scripts or API calls can create Projects v2 items; the token must live in your environment or CI secrets—**do not paste tokens into chat**. |

So: **day-to-day board management** stays in GitHub’s UI (or `gh`). **This repo** can still hold the plan, issue templates, and later automation; I can help draft issues/labels and terminal commands once `gh` is installed and logged in.

**Cursor + GitHub MCP:** After you configure [GitHub MCP in Cursor](github-mcp-cursor.md) (remote server + PAT in `GITHUB_MCP_PAT`), Agent can use GitHub tools subject to your token’s scopes—closer to “manage from the IDE,” still not a full replacement for the Projects UI for every drag-and-drop action.

## Prerequisites

1. **Create the repository** under the org (when ready), then push this project:

   ```bash
   git remote add origin https://github.com/reasonreserve/reasonreserve.git
   git branch -M main
   git push -u origin main
   ```

   (Adjust the repo name if yours differs.)

2. **Sign in to GitHub** in the browser with permission to manage the org or repositories.

3. **Optional (for CLI from Cursor):** install GitHub CLI (`brew install gh` on macOS), then `gh auth login` and ensure your account can administer **[github.com/reasonreserve](https://github.com/reasonreserve)** projects.

## Create a project (org-level or linked to a repo)

**Org-level:** open **[Projects for @reasonreserve](https://github.com/orgs/reasonreserve/projects)** → **New project**.

**Repo-linked:** open the repository on GitHub → **Projects** (top bar of the repo).

### Repo-linked steps

1. Open the repository on GitHub.
2. Click **Projects** (top bar of the repo).
3. Click **New project**.
4. Choose a template:
   - **Team planning** or **Kanban** works well for a single-repo workflow.
   - Or start **Blank** and add columns yourself.
5. Name the project (e.g. **Reason Reserve roadmap**).
6. Under **Settings** for the project (gear or **⋯ → Settings**), ensure the project is **linked to this repository** so new issues and PRs from this repo can be added easily.

## Suggested board layout

If you use a simple Kanban:

| Column        | Purpose                                      |
|---------------|----------------------------------------------|
| **Backlog**   | Triaged ideas, not started                   |
| **Ready**     | Defined and ready to pick up                 |
| **In progress** | Actively being worked on                   |
| **Done**      | Shipped or completed                         |

You can add GitHub’s **Status** field (or custom fields) for finer states without extra columns.

## Connect issues to the board

- **Manually:** Open an issue → **Projects** → add it to this project and set status.
- **Automation:** In the project, use **Workflows** (or **Automation** in classic projects) to move items when issues are opened, closed, or merged—optional but saves time.

## What this repo provides

- **Issue templates** (`.github/ISSUE_TEMPLATE/`) so new issues are structured and easy to filter on the board.
- Labels suggested in templates can be created under **Issues → Labels** to match your columns or filters.

## Optional: GitHub CLI

If you install [GitHub CLI](https://cli.github.com/) (`gh`), you can create and manage projects from the terminal after `gh auth login`. Example:

```bash
gh project create --title "Reason Reserve roadmap" --owner reasonreserve
```

Exact flags depend on your `gh` version; run `gh project --help` for current syntax.
