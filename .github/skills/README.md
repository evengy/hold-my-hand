# Skills

Skills are reusable, on-demand procedures for recurring work. They are not a general documentation store.

## When to add a skill

- Add a skill only when a useful workflow has recurred (for example, at least twice) and would benefit from step-by-step, reusable guidance.
- Prefer a project instruction for rules that apply broadly to most work. Prefer `docs/` for durable facts about the system. Keep skills focused on *how to perform a recurring task*.
- Before adding a skill, check whether an existing skill or doc already covers it. Improve the existing source rather than duplicating it.

## Structure and maintenance

- Put each skill at `.github/skills/<skill-name>/SKILL.md`; the folder name and frontmatter `name` must match.
- Use lowercase letters, digits, and hyphens in the skill name. Include valid YAML frontmatter with a concise, trigger-rich `description`.
- Keep procedures actionable and scoped. Link additional resources with relative paths and update this index when adding or removing a skill.
- Skills are text-only. Do not add scripts or other executable files unless the user explicitly asks; the user must review any such script, and its command must be listed in the project instructions.
- A skill must not loosen the command, hook, or protected-configuration rules in [copilot-instructions.md](../copilot-instructions.md). Skills are loaded as instructions in later sessions, so Cook flags every skill change in Cook notes for Inspector to review.
- The Cook owns skill maintenance. Do not add placeholder/example skills that are not useful project workflows.

## Current skills

No project skills have been established yet.
