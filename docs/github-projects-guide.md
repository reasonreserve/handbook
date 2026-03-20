# GitHub Projects — Reason Reserve guide

This handbook aligns with GitHub’s official documentation. Use it when **creating a new org project** and when **evolving** how we plan work at **[reasonreserve](https://github.com/reasonreserve)**.

## Canonical references (read these on GitHub Docs)

| Topic | Doc |
|-------|-----|
| What Projects are, views, fields, automation | [About Projects](https://docs.github.com/en/issues/planning-and-tracking-with-projects/learning-about-projects/about-projects) |
| Step-by-step: create project, views, fields, automation | [Quickstart for Projects](https://docs.github.com/en/issues/planning-and-tracking-with-projects/learning-about-projects/quickstart-for-projects) |
| Operating habits: communication, fields, automation, single source of truth | [Best practices for Projects](https://docs.github.com/en/issues/planning-and-tracking-with-projects/learning-about-projects/best-practices-for-projects) |

Projects are **tables, boards, and roadmaps** built from **issues and pull requests** you add; metadata stays in sync with the underlying issues/PRs ([About Projects](https://docs.github.com/en/issues/planning-and-tracking-with-projects/learning-about-projects/about-projects)).

## Creating a new **organization** project (checklist)

Follow the [Quickstart — Creating an organization project](https://docs.github.com/en/issues/planning-and-tracking-with-projects/learning-about-projects/quickstart-for-projects#creating-an-organization-project):

1. Open **[Projects for the org](https://github.com/orgs/reasonreserve/projects)** → **New project**.
2. Start from **Table**, **Roadmap**, or **Board**, or pick an **org template** if you have one ([Quickstart](https://docs.github.com/en/issues/planning-and-tracking-with-projects/learning-about-projects/quickstart-for-projects)).
3. Name the project; optionally **Import items from repository** to seed from a repo (e.g. `handbook` or a product repo).
4. Set **description** and **README** on the project so purpose and views are obvious ([Best practices — description & README](https://docs.github.com/en/issues/planning-and-tracking-with-projects/learning-about-projects/best-practices-for-projects#make-use-of-the-description-readme-and-status-updates-to-share-information-about-a-project)).
5. **Add items:** paste issue/PR URLs in the bottom row, or link repos and use [automation](https://docs.github.com/en/issues/planning-and-tracking-with-projects/automating-your-project/using-the-built-in-automations) to pull items in.
6. Add **custom fields** as needed: **Priority**, **Iteration**, dates, estimates ([Understanding fields](https://docs.github.com/en/issues/planning-and-tracking-with-projects/understanding-fields)).
7. Create **saved views** (backlog table, board by status, roadmap by date) ([Best practices — customized views](https://docs.github.com/en/issues/planning-and-tracking-with-projects/learning-about-projects/best-practices-for-projects#create-customized-views-of-your-project-items)).
8. Turn on **built-in workflows** (e.g. set **Status** when items are added or closed) ([Using the built-in automations](https://docs.github.com/en/issues/planning-and-tracking-with-projects/automating-your-project/using-the-built-in-automations)).
9. Optionally add **Insights** charts and **status updates** for stakeholders ([About insights](https://docs.github.com/en/issues/planning-and-tracking-with-projects/viewing-insights-from-your-project/about-insights-for-projects), [Sharing project updates](https://docs.github.com/en/issues/planning-and-tracking-with-projects/learning-about-projects/sharing-project-updates)).

**Note:** Creating a project is done in the **GitHub UI** (or API / `gh`); this repo documents the process only.

## Practices we follow (from official best practices)

Summarized from [Best practices for Projects](https://docs.github.com/en/issues/planning-and-tracking-with-projects/learning-about-projects/best-practices-for-projects):

- **Communicate** in issues/PRs: @mentions, assignees, links between related work.
- **Break down** large issues; use **sub-issues**, **labels**, **milestones**, and **issue types** where the org uses them.
- **Single source of truth:** avoid duplicating the same fact in multiple fields; prefer fields that sync with GitHub ([Best practices](https://docs.github.com/en/issues/planning-and-tracking-with-projects/learning-about-projects/best-practices-for-projects#have-a-single-source-of-truth)).
- **Use fields** (priority, iteration, dates, estimates) so views and filters stay useful.
- **Automate** with project workflows and, when needed, Actions / API ([Automating your project](https://docs.github.com/en/issues/planning-and-tracking-with-projects/automating-your-project/automating-projects-using-actions)).
- **Project templates** at org level can standardize new boards ([Managing project templates](https://docs.github.com/en/issues/planning-and-tracking-with-projects/managing-your-project/managing-project-templates-in-your-organization)).
- **Link** projects to **teams** and **repositories** so access and discovery are clear ([Adding your project to a team](https://docs.github.com/en/issues/planning-and-tracking-with-projects/managing-your-project/adding-your-project-to-a-team), [Adding your project to a repository](https://docs.github.com/en/issues/planning-and-tracking-with-projects/managing-your-project/adding-your-project-to-a-repository)).

## Relation to other handbook docs

- [github-projects-setup.md](github-projects-setup.md) — org URL, CLI snippets, suggested columns.
- [setup-tracking.md](setup-tracking.md) — handbook rollout issues.

When content work arrives, prefer **issues in the relevant repo** + **add to project** so the board stays the planning surface.
