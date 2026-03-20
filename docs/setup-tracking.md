# Handbook / service-template — where to track work

## Important

**Do not** track handbook or service-template setup in **`internal-poc`**. That repo is for the product monorepo. DX/handbook work belongs in **`reasonreserve/handbook`** (this content once pushed).

Issues **#1–#6** that were briefly opened on `internal-poc` were **closed as not planned** and explained in a comment — they were created in the wrong repository by mistake.

## After `reasonreserve/handbook` exists

1. **Create the epic and tasks again** in **`reasonreserve/handbook`** (same titles/bodies as in git history or `docs/setup-tracking.md` in an older commit if you need the text).
2. **Org Project** ([`github.com/orgs/reasonreserve/projects`](https://github.com/orgs/reasonreserve/projects)): create a project and **add** those issues — issues only appear on a board after you attach them.

## Quick checklist (copy into new issues when handbook repo is live)

- [ ] Push `main` to `reasonreserve/handbook`
- [ ] Create `reasonreserve/service-template` + enable **Template repository**
- [ ] PAT / bootstrap docs for org repo creation
- [ ] First handbook release tag + GitHub Release
- [ ] `HANDBOOK_READ_TOKEN` on first consumer if handbook is private

## Creating `handbook` on GitHub

The API cannot create the org repo with the current MCP token (403). Create **`reasonreserve/handbook`** in the UI or with `gh` / a PAT that has org repo creation, then push this local repo.
