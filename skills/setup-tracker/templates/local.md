# Tracker section: Local Markdown

Use when the repository has no external tracker. `docs/backlog.md` is the
tracker; plans and specs stay where the documentation conventions put them.
Preserve an existing backlog format: map roles onto it instead of rewriting it.
Omit the "When the tracker is unavailable" section from the adapter.

## Default layout

`docs/backlog.md` keeps project-docs' two parts, with the task queue split by
role. Create only sections that have entries.

```markdown
# Backlog

## Tasks

### Intake
- Short title: one line of context or a link.

### Backlog
### Ready
### In progress
### In review

## Technical debt
- `path/or/module`: verified problem and its consequence.
```

One entry is one line, with indented sub-bullets for detail, decisions, and
progress notes. Link the spec or plan instead of copying it.

## Roles

| Role | This project |
|---|---|
| `intake` | `### Intake` |
| `backlog` | `### Backlog` |
| `ready` | `### Ready` |
| `in-progress` | `### In progress`, with a link to the active plan when there is one |
| `in-review` | `### In review`, with what acceptance remains |
| `done` | Entry removed by default; the completed plan and Git history are the record. Keep the repository's convention if it retains finished task links |
| `canceled` | Entry removed, or merged into the surviving entry; a linked plan records the reason |

## Verbs

| Verb | Operation |
|---|---|
| `find` | Search `docs/backlog.md`, `docs/plans/`, and `docs/specs/` for distinctive terms; `git log -S '<term>' -- docs/backlog.md` finds recently removed entries |
| `list` | Read the role's section |
| `fetch` | Read the entry and the spec or plan it links |
| `capture` | Add a line under `### Intake` |
| `update` | Edit the entry in place |
| `transition` | Move the line to the role's section; remove it for `done` or `canceled` |
| `comment` | Add a dated sub-bullet to the entry |
| `relate` | Add a `Blocked by:`, `Part of:`, or `Duplicate of:` sub-bullet, or a link to the plan or PR |

## Tracker notes

The backlog changes through ordinary commits. Edits follow the same review as
other documentation; do not commit them separately unless the user asks.
