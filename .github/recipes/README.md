# Recipes

Recipes capture the user's intent and an agreed implementation strategy before work is handed to Cook. This file is the single source for recipe structure and status rules.

## Structure

- Create one folder per feature, bug, or change: `.github/recipes/<kebab-case-name>/recipe.md`.
- Use a unique, descriptive folder name with lowercase letters, digits, and hyphens.
- Keep each recipe focused on one task. Do not overwrite another task's recipe.
- Ignore `done` recipes unless they are directly relevant to the current task.

## Status lifecycle

| Status | Set by | Meaning |
|---|---|---|
| `draft` | Chef | Questions or decisions are still open. Cook must not implement it. |
| `ready` | Chef | The user confirmed the plan. Cook may start. |
| `in progress` | Cook | Implementation started, or required manual checks are still pending. |
| `blocked` | Cook | Work cannot continue; the reason is recorded in `## Cook notes`. |
| `done` | Cook | All steps are complete, permitted checks pass, and required manual checks are confirmed. |

## Ownership

- Chef owns every section except the `Status` changes Cook makes, completed step checkboxes, and `## Cook notes`.
- Cook records changed files, deviations, follow-ups, and docs/skills changes in `## Cook notes`.
- Inspector is read-only and never changes recipes.
