# Session storage

<!-- Example skeleton of a closed plan in docs/plans/done/. The plan stays a
point-in-time record; current rules live in the living documents it links. -->

Date: 2026-02-12. Source: tracker item for session persistence; the tracker
remains canonical for acceptance.

## Outcome

Sessions survive restarts by moving from memory to the database.

Acceptance snapshot (2026-02-12): a user stays signed in across a server
restart; expired sessions are rejected.

## Units

- [x] 1. Add the sessions table and migration.
- [x] 2. Switch the session store and keep the old store behind a flag.
- [x] 3. Remove the flag after the verification run.

## Execution notes

- Unit 2: the first approach serialized whole requests; replaced with an ID
  plus payload after a size measurement (4 KB average versus 180 KB).

## Verification

- Unit and integration tests pass on the closing commit.
- Manual restart check performed on staging on 2026-02-20.
- Not checked: load above 500 concurrent sessions.

## Closure

- Living docs updated: `docs/architecture.md#sessions`.
- Reusable finding extracted: session size limit, now in the architecture doc.
- Follow-up routed to the tracker: purge of expired sessions.
- Acceptance: remains in the tracker; not part of technical closure.
