---
name: change
description: Understand a requested change, investigate repository code and docs, resolve design ambiguity, and prepare an executable implementation approach. Use for feature and behavior changes, significant optimizations, migrations, or refactors; a small change may need only an inline plan.
---

# Change

Own intent and technical planning: what changes, why, current behavior, impact,
design choices, and executable work. Default to planning only. An explicit
implementation request already grants the execution handoff for its scope;
do not ask for the same approval again. Implementation belongs to
`execute-tasks` or the repository's direct workflow for small changes.

## Load context

Resolve the repository root, branch, working tree, and applicable `AGENTS.md`.
Read `docs/README.md` and `docs/contributing.md` when present, then the relevant
living docs, standards, code, tests, and linked design material. Honor
repository-required exploration tools such as graphify before broad code reads.
Do not assume that a harness has loaded project rules for you.

Use existing repository templates and routing. Read the skill adapter
`.codex/change.md` if it exists, or another one explicitly routed by repository
guidance. A skill adapter is optional; do not create one just to run this skill.
A capability registry is an optional living contract anchor, not a prerequisite.
Do not invent a capability stub, templates, or a documentation hierarchy as
incidental planning work.

## Resolve the work source

An explicit user request, shaped tracker item, or selected local backlog entry
supplies intent, scope, priority, dependencies, and acceptance.

Read the tracker adapter `docs/agents/tracker.md` when it exists. It names the
canonical tracker, maps the roles (`intake`, `ready`, `in-review`, …) and verbs
(`find`, `fetch`, `capture`, …) used here to this project's statuses and
operations, and sets the rules for every tracker write. A local Markdown
tracker is configured the same way; its backlog is then the tracker, not a
fallback.

- With an available tracker, keep intake and live work state there. `fetch`
  the item and refer to its acceptance criteria instead of maintaining a second
  live tracker. `find` before `capture`.
- A direct request need not first become a tracker item or backlog entry.
- Without a tracker adapter, use the existing `docs/backlog.md` format when
  persistent intake is needed. If the repository documents a remote tracker
  but has no tracker adapter, continue local planning and do not guess its
  statuses or operations; mention `/setup-tracker` only when a tracker write is
  due, and ask the user to run it.
- During an outage, follow the tracker adapter's fallback: continue authorized
  local planning, record pending synchronization locally, never fabricate
  remote state, and do not maintain two trackers after reconnection.

The tracker's own workflow, as mapped by the tracker adapter, owns intake,
readiness, placement, and acceptance. This skill consumes that contract; it
does not create containers, per-phase child items, or status transitions
automatically. Only write to a tracker when requested or already authorized.

## Investigate and frame

Establish the requested outcome, current behavior with evidence, relevant
invariants, affected call paths, integrations, data, tests, and living docs.
Distinguish desired behavior from behavior already verified.

For a bug, establish intended behavior and diagnosis before choosing a fix.
A behavior-preserving refactor must identify the contract it preserves.
Keep unresolved product choices explicit; ask only when a missing decision
materially changes the implementation. State harmless assumptions and proceed.

## Choose the smallest sufficient artifacts

Select each artifact independently:

- Small, local, well-understood change: give an inline approach and verification;
  no spec or plan file is required.
- A consequential behavior, architecture, or integration decision needing a
  durable design rationale: write a dated point-in-time design spec in
  `docs/specs/` under repository conventions.
- Multi-step, resumable work needing ordered units or dependencies: write a
  dated point-in-time implementation plan in `docs/plans/planned/`.

A significant design may still have a small implementation; a mechanical
migration may need a plan without a spec. Avoid a third proposal document when
a spec and/or plan already carries the necessary context.

Preserve repository layouts that differ from these defaults. Do not bulk
migrate existing plans or reinterpret a living capability registry as historical
design specs. Without a routing rule, use the defaults only for the artifacts
this change actually needs.

## Author an executable handoff

Use the existing template or include only the applicable parts:

- Outcome, behavior delta or preserved contract, scope, and non-goals.
- Evidence about current behavior and links to canonical context.
- Chosen design, material alternatives, and unresolved decisions.
- Ordered checkbox work units, dependencies, bounded paths, and unit acceptance.
- Commands/checks derived from the repository and any required manual,
  integration, deployment, or user acceptance.
- Living-document impact and canonical homes for durable knowledge.

Item acceptance remains canonical in the tracker. A plan can record a dated
acceptance snapshot or technical decomposition with its source; label it as
such rather than pretending it is independently maintained issue state.
Keep private tracker identifiers out of public artifacts.

Index a new plan in `docs/plans/README.md` under the repository's convention.
Folder is execution state, not approval: a planned plan is not implicitly
approved, and an unstarted plan must not sit in `active/`.

With a local backlog, reconcile its entry when a plan is created according to
the tracker adapter, or local rules without one: link the plan from the entry,
or retire the line in a queue-only backlog. Do not silently lose an unplanned
remainder of the request.

Do not update living contracts as though proposed behavior has shipped.
Record proposed deltas in the spec/plan; the executor reconciles current docs
after the implementation is verified. Historical specs remain historical.

## Handoff and response

Return the chosen artifacts or inline approach, affected behavior, risks,
unresolved decisions, and readiness for execution.

For a multi-unit implementation handoff, provide the selected source, approved
scope, ordered units, acceptance, verification, documentation impact, and
remaining gates to `execute-tasks`. When implementation was already requested,
continue into execution without a redundant approval stop. When only planning
was requested, stop after delivering the proposal.

`execute-tasks` owns activation, implementation, progress, review evidence,
and the decision to close; `project-docs` defines plan closure, including
living-document reconciliation and indexing. This skill does not perform a
second completion ritual.

## Constraints

- Planning authorization does not authorize code, commits, remote writes,
  dependency upgrades, or deletion of historical documents.
- Keep living knowledge separate from point-in-time design and execution records.
- No project, tracker, framework, model, or capability-registry defaults.
- Keep small changes small.
