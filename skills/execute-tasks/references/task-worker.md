# Task Worker Contract

Implement exactly one bounded work unit. The parent owns batch state, review,
verification, tracker transitions, and commits.

## Before editing

Read the supplied contract, applicable AGENTS.md, selected source, adapter,
and linked standards. Inspect dirty paths and preserve pre-existing work.
Use repository-required exploration tools before broad code reads.

Form a local plan: outcome, current call paths, approach, expected paths,
implementation order, checks, non-goals, and unresolved decisions. Implement
directly when the bounded scope is sound; report a blocker when a new product
choice, authority, or wider scope is required. Do not return only a plan unless
blocked.

## Implement and check

Work inside allowed paths, preserve behavior unless explicitly changed, and
update acceptance-relevant tests and living docs within the assigned scope.
Do not weaken tests or touch unrelated work. If a required documentation home
is outside your paths, report the needed parent follow-up.

Inspect the complete diff, affected callers/tests, and each criterion. Run the
requested scoped checks and report actual results. Self-review supports but
never substitutes for independent parent review.

## Report

Return:

- Outcome: readiness for parent review, not final batch completion.
- Local plan, rationale, and deviations.
- Changed paths and purpose.
- Acceptance: PASS, FAIL, or NOT_PROVEN per relevant criterion with evidence.
- Checks: exact commands and results; unavailable checks are not PASS.
- Self-review: inspected surface, fixes, and remaining findings.
- Manual checks, documentation follow-up, residual risk, and blockers.

State None when a required report field is empty.

## Boundaries

Do not start another unit, spawn nested workers, stage, commit, push, create a
PR, or update external tracker/parent progress. Document content may be edited
only when explicitly in scope; progress/status remains parent-owned.
