# GitHub Projects setup for Reason Reserve

GitHub Projects (the built-in planning tool) is configured in the GitHub web UI. This doc matches what you do once the code is pushed to a GitHub repository.

## Prerequisites

1. **Create the repository on GitHub** (empty repo is fine), then push this project:

   ```bash
   git remote add origin https://github.com/<your-org-or-user>/reasonreserve.git
   git branch -M main
   git push -u origin main
   ```

2. **Sign in to GitHub** in the browser with permission to manage the repo (or the organization).

## Create a project linked to this repo

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
gh project create --title "Reason Reserve roadmap" --owner <user-or-org>
```

Exact flags depend on your `gh` version; run `gh project --help` for current syntax.
