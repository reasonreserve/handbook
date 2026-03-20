# Commit messages — Conventional Commits (Reason Reserve)

Across **`reasonreserve/*` repos**, commit **subjects** should follow **[Conventional Commits](https://www.conventionalcommits.org/)** so history and automated release notes stay readable. This matches the spirit of the community cheatsheet and discussion in **[Conventional Commits Cheatsheet](https://gist.github.com/qoomon/5dfcdf8eec66a051ecd85625518cfd13)** (qoomon) — use that gist as a **quick reference**; the **normative spec** is always [conventionalcommits.org](https://www.conventionalcommits.org/).

## Subject line (required shape)

```text
<type>(<optional scope>): <description>
```

- **Type** — what kind of change it is (`feat`, `fix`, `docs`, `chore`, …). See the gist’s **Types** list and examples.
- **Scope** — optional context (`handbook`, `mcp`, `ci`, …). Keep it short; **do not** use issue numbers as the scope (gist guidance).
- **Description** — **imperative mood**, **present tense**, as if completing: *“If applied, this commit will…”*

### Imperative (main rule)

Write the description as a **command**:

| Avoid | Prefer |
|--------|--------|
| `docs: updated README for MCP` | `docs: update MCP README` |
| `fix: typo in release process` | `fix: correct typo in release process` |
| `chore: bumping VERSION to 1.1.0` | `chore: bump VERSION to 1.1.0` |

Also (aligned with the gist):

- **Do not** capitalize the first letter of the description.
- **Do not** end the subject with a period.

## Breaking changes

If the change is **breaking** for consumers of this repo’s contract:

- Add `!` before the colon: `feat(api)!: remove legacy status field`, **and/or**
- Add a **`BREAKING CHANGE:`** footer in the body when the subject line is not enough.

See [Conventional Commits — breaking changes](https://www.conventionalcommits.org/en/v1.0.0/#commit-message-with-description-and-breaking-change-footer).

## Body and footer (optional)

- **Body** — why the change, imperative tense.
- **Footer** — `Closes #123`, `Fixes …`, or `BREAKING CHANGE:` as needed.

## Types we use most

Common types from the [cheatsheet](https://gist.github.com/qoomon/5dfcdf8eec66a051ecd85625518cfd13): **`feat`**, **`fix`**, **`docs`**, **`refactor`**, **`perf`**, **`test`**, **`style`**, **`build`**, **`ops`**, **`chore`**.

The gist is **opinionated** (e.g. extra types like `ops`); comments there discuss when to use `chore` vs `build` vs `ops` and when `perf` is worth its own type. **Pick types that help your team and changelogs**; staying consistent matters more than debating every edge case.

## Versioning (reminder)

For libraries and tools that derive versions from commits: **breaking** → major; **`feat` / `fix`** (user-visible API) → minor; otherwise often patch — see the gist’s **Versioning** section and your release tooling.

## Further reading

- [Conventional Commits specification](https://www.conventionalcommits.org/)
- [Conventional Commits Cheatsheet](https://gist.github.com/qoomon/5dfcdf8eec66a051ecd85625518cfd13) (examples + hooks; read **comments** for team trade-offs)
