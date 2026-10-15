# Project Documentation

An agent skill for setting up and maintaining project documentation in new and
existing repositories. It establishes one authoritative home per fact, separates
living contracts from historical records, and keeps documentation useful as work
ships.

## What it does

- **Bootstrap:** establish the smallest useful documentation system for a new project.
- **Adapt:** reconcile an existing system while preserving useful conventions and history.
- **Audit:** inspect the system and propose a mapping without editing files.
- **Maintain:** route new knowledge, update current contracts, close documentation
  gaps, and activate or close implementation plans.

The model was developed across several real projects of different sizes. The
skill is self-contained; it does not depend on any particular project or tracker.

## Documentation model

Each maintained fact has one canonical home. Implementation-bound knowledge is
versioned with the code. Living documents describe current contracts; dated
designs, plans, and investigations preserve intent and evidence. Agent entrypoints
contain cross-session rules and pointers to narrower knowledge.

Plans use the repository's existing execution states. Technical closure includes
updating living docs, extracting reusable findings, recording verification, and
indexing the outcome. Technical completion remains separate from tracker acceptance.

Active tasks stay in the configured tracker. A repository backlog is authoritative
when no tracker is configured, or serves as a pending-synchronization fallback
during an outage. No particular tracker, documentation repository, or application
framework is required.

The skill preserves equivalent existing layouts, including living capability
registries named `specs/` and plan states named `archive` or `completed`. It creates
additional folders and templates only when actual content or recurring work needs
them. It talks to the user in the user's language; new repository artifacts
are English unless the repository has chosen otherwise.

## Install

Install the whole collection as described in the
[repository README](../../README.md#install).

## Use

```text
$project-docs Set up documentation for this new project.
$project-docs Adapt this repository's documentation to the model.
$project-docs Audit documentation and propose improvements without editing files.
$project-docs Reconcile documentation after this completed change.
```

## Files

- [SKILL.md](SKILL.md): workflow, routing, and verification.
- [Documentation model](references/documentation-model.md): ownership, placement,
  naming, tracker boundaries, and plan lifecycle.
- [Migration guidance](references/migration.md): adapting existing material without
  losing unique knowledge, history, or references.
- [Examples](references/examples/): minimal shapes for `contributing.md`, a plan
  index, and a closed plan.
- [Agent metadata](agents/openai.yaml): display and invocation metadata.

## Validation

The skill was checked for valid metadata and local references, then independently
exercised against a new project and an existing documentation fixture. The existing
fixture retained its living capability contract, archived evidence, tracker
ownership, and unreconciled legacy task. No real application or external tracker
was modified during that validation.
