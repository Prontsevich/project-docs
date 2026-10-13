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

Use existing repository templates and routing. Read `.codex/change.md` if it
exists or another adapter is explicitly routed by repository guidance.
An adapter is optional; do not create one just to run this skill. A capability
registry is an optional living contract anchor, not a prerequisite. Do not
invent a capability stub, templates, or a documentation hierarchy as incidental
planning work.

## Resolve the work source

An explicit user request, shaped issue, or selected fallback backlog item
supplies intent, scope, priority, dependencies, and acceptance.

- With configured, available Linear, keep intake and live work state there.
  Refer to issue criteria instead of maintaining a second live tracker.
- Without configured Linear, use the existing `docs/backlog.md` format when
  persistent intake is needed. A direct request need not first become a
  backlog item.
- During a configured Linear outage, continue authorized local planning from
  available context. Record pending synchronization locally using the Linear
  skill/repository convention; do not silently switch the canonical tracker,
  fabricate remote state, or maintain two trackers after reconnection.

The Linear operating skill owns intake, shaping, readiness gates, placement,
and acceptance semantics. This skill consumes that contract; it does not
create projects, issue-per-phase subtasks, or status transitions automatically.
Only synchronize a tracker when requested or already authorized.

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

Issue acceptance remains canonical in the tracker. A plan can record a dated
acceptance snapshot or technical decomposition with its source; label it as
such rather than pretending it is independently maintained issue state.
Keep private tracker identifiers out of public artifacts.

Index a new plan in `docs/plans/README.md` under the repository's convention.
Folder is execution state, not approval: a planned plan is not implicitly
approved, and an unstarted plan must not sit in `active/`.

In fallback mode, reconcile an existing backlog line when a plan is created
according to local rules: a queue-only backlog retires the line at that boundary;
other repositories may retain a link. Do not silently lose an unplanned
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
living-document reconciliation, closure, and indexing. This skill does not
perform a second completion ritual.

## Constraints

- Planning authorization does not authorize code, commits, remote writes,
  dependency upgrades, or deletion of historical documents.
- Keep living knowledge separate from point-in-time design and execution records.
- No project, tracker, framework, model, or capability-registry defaults.
- Keep small changes small.
