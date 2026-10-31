# Hold My Hand

A human-guided development workflow for GitHub Copilot. It separates planning,
implementation, and review into three specialized agents, while keeping the
user in control of decisions and handoffs.

## The agents

| Agent | Responsibility |
| --- | --- |
| **Chef** | Understands your request and writes a recipe: a plan for the work. Chef does not implement changes. |
| **Cook** | Implements an approved recipe, verifies the work, and updates relevant documentation. |
| **Inspector** | Reviews completed work or audits the setup when asked. Inspector is read-only. |

You choose when to hand work from one agent to another. Agents do not invoke
one another or approve their own work.

## Least-privilege safeguards

Agents receive only the access needed for their role. In supported Copilot
sessions, hooks ask for your approval before shell commands and edits to
protected configuration, such as agent definitions and workflows. These
safeguards keep you in control; they are not a sandbox.

## What the templates are for

- **[Project instructions](.github/instructions/project.instructions.md):**
  describe your project's stack, conventions, and permitted commands. Fill in
  the placeholders with verified project details before agents run commands.
- **[Architecture](docs/architecture.md):** explains what your project does
  and how its parts fit together.
- **[Recipes](.github/recipes/README.md):** give Chef and Cook a shared format
  for documenting scope, steps, decisions, and verification.
- **[Skills](.github/skills/README.md):** hold reusable procedures for
  workflows that recur.

The templates provide structure, not assumptions: adapt them to your project.
