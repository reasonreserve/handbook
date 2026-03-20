# Reason Reserve — service template

Use this as a **[GitHub template repository](https://docs.github.com/en/repositories/creating-and-managing-repositories/creating-a-repository-from-a-template)** when creating a new service or app repo under **`reasonreserve`**.

## What you get

- **`HANDBOOK_VERSION`** — pinned semver of the [handbook](https://github.com/reasonreserve/handbook) your repo was aligned with.
- **`.github/workflows/handbook-version-check.yml`** — runs **weekly** and on **manual dispatch**; if the [handbook](https://github.com/reasonreserve/handbook) has a **newer release** than your pin, it **opens an issue** so developers are notified to review changelog and update.

## One-time setup (after “Use this template”)

1. Replace any placeholder org/name in workflows if you forked outside **`reasonreserve`**.
2. If **`handbook`** is **private**, add a repository (or org) secret:
   - **`HANDBOOK_READ_TOKEN`** — fine-grained PAT with **Contents** and **Metadata** read on **`reasonreserve/handbook`** (and **Actions** read if needed). Without it, the workflow falls back to **`GITHUB_TOKEN`**, which may **not** see other private repos — the job will skip or fail quietly; see the workflow logs.

3. Enable **Issues** on the repo (required for notifications).

## Updating the handbook pin

After you merge upstream handbook practices into your service repo:

1. Set **`HANDBOOK_VERSION`** to match the handbook release you adopted (e.g. `1.2.0`).
2. Commit to `main`.

## Optional: submodule for live docs

For **live** tracking of handbook files inside a service repo:

```bash
git submodule add https://github.com/reasonreserve/handbook.git handbook
git submodule update --init --recursive
```

Pin submodule to a **tag** (`git checkout v1.2.0` inside `handbook/`) for reproducible builds; use **`HANDBOOK_VERSION`** to record the same version as the submodule tag.

## Create `reasonreserve/service-template` on GitHub (API / CLI)

Yes — use the **[Create an organization repository](https://docs.github.com/en/rest/repos/repos#create-an-organization-repository)** API (`POST /orgs/reasonreserve/repos`) or **`gh repo create`**.

Your token must be allowed to **create repositories in the org**. Fine-grained PATs often need an explicit org permission (e.g. **Administration** or whatever your org uses for “create repository”); if the API returns **403 Resource not accessible by personal access token**, the PAT is missing that permission or org policy blocks creation — an **org owner** must adjust [token access](https://docs.github.com/en/organizations/managing-programmatic-access-to-your-organization) or create the empty repo once.

**`gh`** (authenticated as someone who can create org repos):

```bash
gh repo create reasonreserve/service-template --private --description "Template for Reason Reserve service repos" --disable-wiki --disable-issues=false
```

Then push this folder’s contents to `main` and enable **Template repository** under **Settings → General**.

**`curl`** (classic PAT or fine-grained with org create scope):

```bash
curl -sS -X POST -H "Authorization: Bearer YOUR_TOKEN" -H "Accept: application/vnd.github+json" \
  https://api.github.com/orgs/reasonreserve/repos \
  -d '{"name":"service-template","private":true,"description":"Template for Reason Reserve service repos","auto_init":false}'
```

## Relationship to `handbook`

| Repository | Role |
|------------|------|
| **`reasonreserve/handbook`** | Canonical instructions, Cursor MCP docs, issue templates, release tags. |
| **`reasonreserve/service-template`** | Starting point for new code repos; carries the notify workflow + version pin. |

Push **`service-template`** as its own GitHub repo (same content as this folder), marked as **Template repository** in repo settings.
