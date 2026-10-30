---
description: "Project-specific stack, architecture, code organization, naming and style conventions, permitted validation commands, and protected paths. Replace every placeholder before relying on these instructions."
---
# Project instructions

> Template: replace the bracketed prompts with verified project facts. Remove guidance that does not apply. Do not leave an example or placeholder command that has not been checked. Once filled in, you may add `applyTo: "**"` to the frontmatter so it loads automatically; agents already reach it through links.

## Project and stack

- Languages, frameworks, runtime, and relevant versions: [document the verified stack].
- Important project entry points: [list files or folders and their purpose].

## Code organization and architecture

- [Describe the established directory structure and responsibility of each major area.]
- [Describe important boundaries, data flow, or architectural invariants.]
- Prefer extending the existing architecture over introducing a parallel pattern.

## Naming, style, and conventions

- [Specify verified naming, formatting, typing, error-handling, and documentation conventions.]
- [Link representative files or project style/configuration files.]
- Follow automated formatting and lint configuration where present; do not duplicate every enforced rule here.

## Validation and permitted commands

List exact commands only, with no wildcards and no "any script under …". Test and build commands run project code, so list only ones you trust.

- Allowed test commands: [list exact, verified commands and any relevant scope].
- Allowed build, lint, or format commands: [list exact, verified commands; state whether formatters may write files].
- Other permitted commands: [list any additional commands and their purpose].

Unlisted commands, installs, deploys, migrations, and pushes follow the command rules in [copilot-instructions.md](../copilot-instructions.md).

## Protected and generated paths

- Do not hand-edit generated, vendored, cache, or tool-managed files: [list verified paths and exceptions].
- [Document any additional project-specific safety constraints.]

## Documentation

- Keep [docs/README.md](../../docs/README.md) and relevant project docs accurate when durable behavior or architecture changes.
- Add project-specific guidance here only when it applies broadly; use narrower instruction files for language- or directory-specific rules.
