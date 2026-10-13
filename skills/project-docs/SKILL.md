---
name: project-docs
description: Set up, audit, migrate, or maintain project documentation using one authoritative home per fact, living versus historical documents, concise agent routing, and plan closure. Use for new repositories or existing documentation systems; ordinary single-document edits need not activate this skill.
---

# Project Documentation

Make project knowledge easy to find, accurate, and cheap to maintain. Apply the
documentation model while adapting its layout to the project at hand.

Communicate with the user in Russian. Write repository artifacts, filenames,
commands, and agent instructions in English. Preserve historical source material;
do not translate existing documents merely to normalize the layout.

## Choose the requested scope

- **Bootstrap:** establish documentation for a new or sparsely documented project.
- **Adapt:** bring an existing documentation system into the model, preserving
  useful conventions and history.
- **Audit:** report gaps and a concrete proposed mapping without changing files.
- **Maintain:** route new knowledge, reconcile current docs, or close a specific
  documentation gap after a change.

An explicit request to set up or adapt documentation authorizes scoped local
documentation changes. A request to inspect or discuss a possible approach is an
audit. Ask only about consequential choices not resolved by the project or user.

Read [the documentation model](references/documentation-model.md) for bootstrap
or adaptation, and the relevant sections for maintenance. For existing documents
that will move, merge, or change role, also read
[migration guidance](references/migration.md).

## Discover before prescribing

Inspect repository instructions, Git status, root README, documentation indexes,
placement rules, plan indexes, and relevant agent entrypoints. Inventory actual
documents, including feature-local notes and references outside `docs/`. Determine:

- What knowledge each document owns, its audience, and whether it is living or
  point-in-time. Filenames alone do not establish its role.
- Which repository, product document surface, and tracker are already canonical.
  Inspect relevant connected context only when needed; do not provision services.
- Which current docs contradict each other or completed evidence; which apparent
  duplicates are historical snapshots rather than competing current copies.
- What reads the paths: links, agent rules, templates, scripts, skills, or other
  repositories. Preserve those contracts during a migration.

Documentation inspection does not require a full application audit. If a current
implementation claim needs verification, inspect the relevant code and checks;
follow the repository's code exploration rules, including graphify when required.
Do not turn an unverified old claim into a verified current statement.

Show a compact finding and the intended mapping before a substantial restructure.
Proceed within the authorized scope. Keep unresolved factual conflicts visible;
do not delete one version merely because the other is easier to keep.

## Establish the smallest useful system

Use the model's defaults only where no useful convention exists. A typical
bootstrap establishes a root quickstart, `docs/README.md` navigation,
`docs/contributing.md` placement and maintenance rules, and concise documentation
routing in `AGENTS.md` or the existing agent entrypoint.

Create topic folders, templates, registers, and plan indexes only when actual
content or a recurring workflow needs them. A small project can keep living
contracts as a few flat files. Do not generate empty architecture, capability,
decision, standards, or product documents to fill a tree.

For each fact, choose one authoritative home and link from other surfaces:

- Version implementation-bound knowledge with its code.
- Keep current contracts separate from dated designs, plans, and evidence.
- Keep active work in the configured tracker; local backlog is canonical only
  without an available configured tracker, or temporary pending synchronization.
- Keep agent entrypoints short by applicability, using pointers for narrow detail.
- Preserve the chosen home for product/client material. Do not require a separate
  documentation repository or a particular tracker for every project.

Record the project's actual choices in `docs/contributing.md`: placement table,
living/historical distinction, language, naming, tracker/fallback contract, plan
states, indexing, and closure. Link it from documentation and agent entrypoints.
This repository rule is the ongoing operating contract; this skill establishes
and maintains it.

## Handle existing conventions deliberately

`docs/specs/` can be a living capability registry or a set of dated design
records. Preserve the semantic role and choose another explicit home
if both are needed. Similarly, `docs/plan.md` can be a living architecture
document, and `docs/tasks.md` can be completed history. Do not classify by name.

Preserve equivalent plan state names: `backlog/planned`, `active`, and
`archive/done/completed`. New systems default to `planned/active/done`.
Folder state describes technical execution in the current branch/worktree,
not approval or tracker acceptance. Do not move a plan based only on checkbox
counts, a tracker status, or work occurring in another worktree.

## Maintain and close

Update affected living documents alongside verified changes. Keep proposed
behavior in its design/plan until implementation is established. On technical
plan closure:

1. Reconcile living contracts made stale by the work.
2. Extract durable reusable knowledge to its canonical home; route outstanding
   work to the tracker or local fallback without losing scope.
3. Preserve measurements, rejected alternatives, and investigation evidence in
   the historical work record, clearly distinguishing observations and proposals.
4. Record actual verification and limitations, move the plan to the existing
   completed state, and update its index with scope and outcome.

Technical plan completion can coexist with pending QA, deployment, or user
acceptance in the tracker. Never manufacture completion or accept the work on
the user's behalf.

If available and relevant, `change` authors design and execution artifacts and
`execute-tasks` delivers them; this skill owns documentation organization and
reconciliation, not their entire workflows. It remains usable without those skills.

## Verify and deliver

Check changed indexes and local links, including anchors where applicable;
affected inbound references; preservation of unique content and history;
current-versus-proposed statements; and plan state consistency against actual
evidence. For external homes, report access or portability limits rather than
claiming they were checked. Do not require an unrelated application build for
documentation-only changes.

Review the diff for accidental loss, duplicate authority, private tracker details
in public material, and unrelated edits. A repeated run should repair real drift,
not create duplicate indexes or rename a working layout again. Do not commit,
push, publish, create remotes, or mutate an external tracker merely to finish setup.

Report the chosen structure and authoritative homes, changed files, checks
performed, and any unresolved decisions. Provide a short example of where the
next architecture fact, design proposal, task, and completed plan belong.
