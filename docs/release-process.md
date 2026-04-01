# Handbook release process

This repository is **`reasonreserve/handbook`** — the canonical DX / Cursor / GitHub guidance for Reason Reserve.

**Commit messages:** follow **[Conventional Commits](conventional-commits.md)** (imperative subject, `type(scope): description`).

## Versioning

- **`VERSION`** at the repo root is the **single source of truth** for the semver string (e.g. `1.2.0`, no `v` prefix).
- Git tags use a **`v` prefix**: `v1.2.0`.

**Published vs `VERSION` on `main`:** a number in `VERSION` is **not** a GitHub Release until the matching **`v*` tag** exists on the remote. Until you tag and push, treat `VERSION` as the **intended** next release. Consumers (and [setup-tracking.md](setup-tracking.md)) should look at [Releases](https://github.com/reasonreserve/handbook/releases) for what is actually published.

## Cutting a release

1. Update **`VERSION`** and merge to `main`.
2. Tag and push:

   ```bash
   git tag -a "v$(tr -d '[:space:]' < VERSION)" -m "Handbook v$(tr -d '[:space:]' < VERSION)"
   git push origin "v$(tr -d '[:space:]' < VERSION)"
   ```

3. The **Publish handbook release** workflow creates a **GitHub Release** from the tag (release notes + link to compare).

4. **Service repos** that use [service-template](../service-template/README.md) compare their pinned **`HANDBOOK_VERSION`** file to this release via a scheduled workflow; when a newer version exists, they get a **notification issue** (if the workflow is enabled and secrets are set).

## Private org repos

If **`handbook`** is private, each **service** repository needs a secret **`HANDBOOK_READ_TOKEN`** (fine-grained PAT: read access to `handbook` contents/releases) so the notify workflow can call the GitHub API. See [service-template README](../service-template/README.md).
