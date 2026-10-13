---
name: execute-tasks
description: Execute an approved implementation plan, issue, or explicit task batch through bounded sequential work, visible worker routing, independent review, parent-owned verification, and documentation closure. Use for multi-step implementation or resuming a selected plan; trivial edits can use the direct repository workflow.
---

# Execute Tasks

Own execution and evidence from ready work through verified delivery. Consume
technical planning from `change` or an equivalent source; do not redesign the
product, perform intake, or invent work to fill a batch.

## Load inputs and repository guidance

Resolve the source in order:

1. An explicit plan path, issue, ordered task list, or previously selected source
   named in a continuation request.
2. The repository adapter's explicitly declared source.
3. Exactly one active plan, when the user requests continuation of active work.
4. A connected tracker item only when repository mapping and selection are
   unambiguous and the user requested its execution.
5. Otherwise ask which source to execute.

Read applicable `AGENTS.md`, the selected source/linked standards, and
`docs/README.md` and `docs/contributing.md` when present.
Read `.codex/execute-tasks.md` if present.
An adapter supplies project-specific inputs; it is optional and not a second
runner. Use required exploration tools before broad source reads.

Check accepted scope, dependencies, unresolved decisions, and existing execution
authority. Folder/status alone grants no approval. An explicit request to
execute the selected scope is sufficient; do not request the same permission
again. If new design decisions are needed, return that bounded question to
`change` or the user while continuing independent authorized work.

## Set scope, checks, and commit policy

Inspect Git status, relevant existing diffs, and untracked paths. Preserve
pre-existing changes. Map the source into coherent ordered units with outcome,
allowed paths, dependencies, acceptance, and verification. Do not create a
sub-issue or commit for every checkbox.

Derive a stable verification baseline from repository guidance, CI, and actual
toolchain scripts. Use it to choose proportional checks per unit and batch:
focused checks while iterating, required broader checks at their stated gate.
Do not require an unrelated application build for a documentation-only unit.
Missing categories are `Not applicable` or `Unavailable`, never `PASS`;
if a required check cannot be run, record the gap and do not claim full
verification. Honor stronger repository gates.

Resolve tracker mapping from repository guidance, the selected issue, and the
Linear operating skill when available. A connected workspace alone does not
configure this repository. Otherwise record `No tracker`.

Execution cadence and commit permission are separate:

- Default commit policy: propose only, and obtain explicit approval before
  staging/committing.
- A request to execute the whole batch or use autopilot does not by itself
  authorize commits. An explicit request for automatic batch commits does.
- A no-commit request allows all authorized implementation and validation to
  continue; it is not a blocker at every unit.
- Honor requested checkpoints, pauses, and reorderings. Otherwise continue
  ready units within the approved batch after recording each result.
- Push, PR publication, deploy, destructive actions, or broader external writes
  require their own authority.

When commits are authorized, use repository message/splitting conventions,
or an English Conventional Commit describing the change. Do not put ephemeral
phase numbers or private tracker metadata in the subject. Isolate task changes
from pre-existing changes; if a commit cannot be safely isolated, leave it
pending rather than staging unrelated work.

Announce the source, unit map, verification baseline, tracker, commit policy,
available delegation/review tooling, and next actual boundary.

## Activate and track

For the default layout, move `docs/plans/planned/<name>.md` to `active/`
immediately before the first implementation starts, after readiness checks.
Update navigation/index links in the same unit. Preparation or a blocked
dependency does not activate a plan. Resume an active plan in place.
Do not execute a completed historical plan without selecting new work.

At actual start, apply the executed issue's active-state transition only when
tracker synchronization is authorized. Read actual workflow states and gates;
do not start directly from raw Triage or update a container on behalf of a child.

Repository-specific paths override `planned/active/done/`. Do not migrate a
repository's `backlog/archive/` layout incidentally.

Parent-owned plan checkboxes and execution notes are persistent progress.
Use the harness plan tool as a view when available; do not require a second
persistent checklist. Track at most one active implementation unit.

Plan order governs combined sources; match tracker items by stable identity.
A container is not an implementation unit unless its scope is genuinely one
bounded deliverable. Do not create remote phase tasks automatically.

On continuation, reconstruct state from the selected source, persistent
progress, Git diff, evidence, and tracker. Do not rediscover the source from
recent commits or infer completion from a worker's report.

## Implement, review, and verify each unit

Delegate when it adds value and is supported and authorized in this runtime.
Before delegated execution, read
[delegation.md](references/delegation.md) and
[task-worker.md](references/task-worker.md). Read
[task-reviewer.md](references/task-reviewer.md) before reviewer dispatch.
These contracts preserve visible routing and structured evidence.

Run one write-capable worker at a time in a shared checkout. While it runs,
the parent may read and report but must not edit, run mutating commands, or
start another worker. Wait for completion before review or further writes.

For a small unit or unavailable delegation, the parent may implement directly.
State that substitution and use the same scope/evidence boundaries. Do not
invent an agent/model or call parent self-review an independent agent review.
A repository-required independent review remains an outstanding gate if no
authorized replacement exists.

After implementation:

1. Inspect the complete unit diff, affected callers, tests, and docs. Confirm
   that pre-existing changes survived and no unrelated scope was introduced.
2. Review acceptance and concrete introduced defects. For non-trivial code,
   use an independent read-only acceptance reviewer and a defect-first pass
   through available review tooling. A single review may cover both lenses;
   do not require an unavailable branded review skill. Docs-only or truly
   mechanical changes may use parent-only review with its reason recorded.
3. Publish `PASS`, `CHANGES_REQUIRED`, or `BLOCKED`, findings/coverage, and
   outstanding acceptance. Review PASS does not mean all manual checks ran.
4. Resolve findings inside the same unit, then review the changed surface.
   Reproduce failures before fixing; leave unrelated failures explicit.
5. Independently run the applicable baseline/unit checks. Separate worker
   checks, reviewer evidence, parent verification, and manual checks.
6. Tick a task only when its own acceptance and required checks are satisfied.
   Separate implementation and manual acceptance checkboxes when necessary.
   Keep a unit with an unmet required criterion incomplete.
7. Record result and remaining work; handle commits under the selected policy.
   Stage only explicit task-owned paths when authorized, never `git add .`.

Update affected living docs alongside implementation. Do not wait for the
last unit to repair a known contradiction. Append execution evidence/deviations
to the plan without rewriting historical design as current architecture.

## Close the plan and hand off acceptance

Before moving an active plan to `done/`:

1. Confirm its implementation tasks and required technical checks are complete.
2. Reconcile affected living docs: architecture/contracts, operating instructions,
   vendor knowledge, and current product/status docs at their canonical homes.
3. Extract durable knowledge to those homes. Route independent unfinished work
   through Linear intake when available or `docs/backlog.md` in fallback mode;
   do not quietly drop unfinished in-scope criteria.
4. Leave measurements, rejected hypotheses, alternatives, deviations, and
   execution history in the historical plan. Preserve predecessor documents
   with a superseded reference when needed rather than deleting them.
5. Move the plan and update `docs/plans/README.md` with a working link, outcome,
   and affected area. Reconcile navigation links affected by the move.

Plan closure and issue acceptance are separate facts. A technically verified
implementation plan can be in `done/` while the issue is `In Review` for
separate delivery/user acceptance. Record that boundary explicitly. If the plan
itself includes a required unperformed manual criterion, keep it active.

Use the configured tracker workflow for the executed issue and actual evidence;
the Linear skill owns state semantics. Do not mark an issue Done before its
required acceptance, or update an epic/Project because one unit finished.
An outage does not block independent local work: record pending sync without
claiming remote transitions or building a permanent parallel tracker.

## Reporting

For delegated batches, keep a compact ledger with one row per unit:
outcome, requested/actual worker model and reasoning, agent id, review launch
and verdict, parent checks/results, commit proposal/hash or `Not requested`,
and tracker state or `No tracker`. Use `Not exposed` for unavailable routing
metadata. Separate worker checks from parent verification.

Add detail only for findings, deviations, repeat implementation rounds, manual
checks, or residual risk. For direct work, omit agent-only fields rather than
manufacturing launches. Always state remaining work (or `None`), documentation
updates, plan folder/index, acceptance boundary, and pending synchronization.

The final response must stand alone; collapsed commentary is not a substitute
for the result and its verification evidence.
