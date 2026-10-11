# Adapting Existing Documentation

## Inventory and mapping

Before moving or merging documents, make a concise mapping in conversation or a
working table. Include existing path, role and audience, canonical destination,
action (keep/link/move/split/reconcile), and affected callers. A large resumable
migration can have its own dated execution plan; a small cleanup does not need
another permanent report.

Inspect current files before trusting older layout designs. A completed
migration plan can contain claims refuted by its own implementation. Use observed
evidence and current rules rather than automatically treating its proposed map
as authoritative. Document unresolved uncertainty.

Inspect unique facts and contradictions before deleting duplication. In one
project, an apparent duplicate contained corrections to three claims in the
proposed canonical integration skill. Keeping the skill and deleting the other
copy without reconciliation would have preserved the wrong facts. Resolve using
evidence, update the canonical living home, and link from other entrypoints.

## Preserve meaning and history

- Preserve useful layouts and names unless there is a concrete navigational or
  semantic reason to change them. Do not normalize `completed` to `done` or a
  living capability registry into historical specs just for uniformity.
- Move unique material instead of leaving full authoritative copies behind.
  A compatibility pointer may temporarily occupy an old path when callers need it.
- Preserve historical source language, observations, names, dates, and commercial
  terms. Add a clearly labeled correction or successor link where needed.
- When splitting a mixed file, move maintained contracts to their living home,
  retain dated evidence as history, and connect them. Do not rewrite proposals
  as implementation or turn historical checkboxes into a live tracker.
- Preserve unrelated user changes. Do not create commits or rewrite Git history
  as part of documentation setup unless the user authorized those actions.

## Links and loading contracts

Search Markdown links, literal paths, template references, rules, scripts, skills,
and agent imports for the documents being moved. Rebase outbound relative links
from the new location and update current inbound references in scope. Check
anchors after heading changes. Use existing documentation validation if available.

Historical prose that names a former location can stay when that location is
part of its evidence. Label old paths or provide a current pointer if readers
would otherwise mistake them for working navigation. Do not mechanically rewrite
every historical mention.

External or cross-repository callers may be outside the authorized write scope.
Keep a compatibility pointer when useful, or report those callers as unresolved.
Do not claim end-to-end portability for sibling-relative paths without stating
the sibling layout requirement. Never copy confidential content into a public
repository to make a link work.

## Resolve actual state

Compare a plan's folder, record, checkpoints, verification, and current branch.
Report ambiguity rather than inferring start/completion from checkbox count.
Setup should not resurrect finished scope, conceal outstanding work, or perform
another worktree's lifecycle transitions.

If tracker ownership was adopted after a local plan/backlog was written,
preserve completed history and settle the current source-of-truth boundary.
Mark legacy remaining scope as needing reconciliation where evidence is missing;
do not invent tracker IDs, silently delete it, or synchronize externally just
because documentation is being reorganized.

## Finish with proportionate verification

Verify that unique content survived, canonical roles are explicit, indexes reach
the real files, affected current links and loading paths resolve, and unsupported
claims remain clearly labeled. Check only material implementation claims that
the change introduces or updates. A structural documentation change needs
documentation checks; it does not automatically need an application build.

Rerunning the skill against a consistent result should leave its structure intact.
Repair new drift or add actual missing content rather than regenerating the tree.
