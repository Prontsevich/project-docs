# Work tracker

<!-- Written by setup-tracker. Edit freely; re-run setup-tracker to switch trackers. -->

**Tracker:** <Linear | Plane | ClickUp | Local Markdown | other>.
**Scope:** <team, project, or list that holds this repository's work, by name>.
**Access:** <MCP server, API, CLI, or project tooling, in order of preference>.

<!-- For a public repository, name places but keep private IDs and URLs out.
     Resolve them at run time or from ignored local config. -->

Agent skills speak in the roles and verbs below. This file maps them to this
project. Keep the role and verb names; change the mapping and operations.

## Rules

- The tracker owns active work: scope, priority, dependencies, acceptance, and
  lifecycle. Specs, plans, and durable knowledge live in the repository.
- Read before writing. Write to the tracker only when the user asked for it or
  the current task already authorizes tracker updates.
- `find` before `capture`; reuse, update, or merge an existing item instead of
  creating a duplicate. A single page of results does not prove absence.
- A status grants no authority to execute. Work starts from `ready`, never from
  `intake`, and only within the user's request and cleared gates.
- Technically complete and verified work goes to `in-review`. Only the user's
  acceptance moves it to `done`. Never accept work on the user's behalf, and
  never use `done` as a stand-in for an unavailable `in-review`.
- After a failed or timed-out write, read the item before retrying: the write
  may have succeeded. Confirm each write by reading the item back.
- Keep private tracker IDs and URLs out of public commits, branches, PRs, and
  repository files.

## Roles

| Role | Meaning | This project |
|---|---|---|
| `intake` | Raw input not yet interpreted: idea, report, request, finding | <status or label> |
| `backlog` | Understood and worth keeping; not ready or not selected | <status> |
| `ready` | Shaped, selected, gates cleared; may start when authorized | <status> |
| `in-progress` | Actively being worked on | <status> |
| `in-review` | Implemented and technically verified; review, QA, deployment, or user acceptance remains | <status> |
| `done` | Acceptance complete | <status> |
| `canceled` | Intentionally dropped or merged as a duplicate | <status> |

A blocker is a relation (`relate` with `blocked-by`), not a role. Roles that
share a status are told apart by the label named in the table. An unmapped role
says so here, with what to do instead.

## Verbs

| Verb | Meaning | Operation |
|---|---|---|
| `find` | Search open and recently closed items by distinctive terms before creating one | <operation> |
| `list` | List items in a role, such as everything `ready` | <operation> |
| `fetch` | Read one item: description, acceptance, role, relations, comments | <operation> |
| `capture` | Create an item in `intake` with minimal context | <operation> |
| `update` | Change title, description, acceptance, or labels | <operation> |
| `transition` | Move an item to a role's status | <operation> |
| `comment` | Record progress, evidence, or a decision on an item | <operation> |
| `relate` | Set parent, `blocked-by`, duplicate, or a link to a PR, spec, or plan | <operation> |

## Tracker notes

<Identity resolution, pagination, write confirmation, rate limits, and
automations that change status. Point to project tracker tooling if it exists.>

## When the tracker is unavailable

Continue authorized local work. Record new intake and pending tracker updates in
`docs/backlog.md` under `## Pending sync`, with enough context to reconcile them.
Never claim a remote change that did not happen. After access returns, `find`
before creating or updating, apply the pending records, and remove them. Do not
run two live queues.
