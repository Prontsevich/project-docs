# Delegated Execution

Read this before the first worker launch. Read the worker/reviewer contracts
yourself before assigning their work; send each agent its absolute contract
path and all necessary source context.

## Runtime and routing

Use the actual tools and schema exposed by this runtime. Do not assume Claude,
Codex, or another harness has identical roles, model names, or fork parameters.

Choose a narrow implementation role when available, otherwise a fresh worker.
Use the parent's model by default. If explicit routing is authorized and the
runtime permits overrides, choose by ambiguity and risk:

- Fast: mechanical, bounded transformations.
- Balanced: routine multi-file work with moderate judgment.
- Strongest suitable reasoning: contracts, concurrency, migrations, security,
  or costly silent regressions.

Do not infer context capacity or reasoning support from a model nickname.
When uncertain, prefer the stronger suitable tier or re-bound the unit.
Honor runtime restrictions on model overrides.

Use a fresh, minimal agent context with explicit inputs. For the current
multi_agent_v1 API, use `fork_context: false`, with `agent_type: "task_worker"`
or `"task_reviewer"` when those roles exist. Other runtimes may use different
parameters; inspect them rather than copying this example blindly.

## Dispatch and evidence

Before launch, show a short dispatch card:

- Unit index/name and role.
- Requested model/reasoning, or inherited configuration.
- Routing rationale and allowed paths.
- Expected worker checks and next boundary.

After launch, record the returned agent id and actual configuration when
exposed. Record any fallback explicitly. Never infer actual model from intent.

The worker starts with:

- Absolute worker-contract path, repository root, and branch.
- Selected source and full unit scope/acceptance.
- Allowed paths, dependencies, non-goals, and unresolved decisions.
- Applicable guidance/adapter paths and pre-existing dirty paths.
- Worker-scoped checks and parent verification baseline.
- Explicit prohibition on commits, staging, pushes, plan-state/tracker changes,
  or starting the next unit.

The worker's local implementation plan refines steps within this boundary;
it does not reopen product decisions or substitute for the parent plan.

In a shared checkout, after launch wait for the worker. No parent writes,
mutating commands, or second worker until it finishes. Read-only inspection
and progress updates are allowed. This serial-write rule overrides generic
encouragement to fill concurrency slots.

## Review and bounded fixes

Surface the worker report's outcome, file purposes, checks/results, deviations,
and manual risks before review. Do not collapse it to "worker finished."

For an independent reviewer, supply the reviewer contract, acceptance, complete
unit diff/scope, worker report, applicable guidance, and existing dirty paths.
Remain read-only. Publish the launch card and record its id/verdict.

A criteria-based reviewer and a defect-first pass are complementary lenses.
Use an available review skill when useful; do not claim an absent skill ran.
The parent still owns the combined verdict and independent command results.

If changes are required, prefer a follow-up to the same worker when its context
is intact. Pass the bounded findings and wait again. Re-review after changes.
A very small parent fix is acceptable only while no worker is active.

## Ledger

Keep one row per unit with worker launch, reviewer launch/verdict, parent
verification, commit status, and tracker state. Preserve routing at launch
instead of reconstructing it from conversation after compaction.

When a launch field is unavailable, write `Not exposed`. When an agent was
not used, write `Parent-only` with the reason. Command failures and unmet
manual criteria remain visible. Add detailed evidence for units with findings,
deviations, repeat rounds, or residual risk.
