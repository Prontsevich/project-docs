# Contributing to the documentation

<!-- Example shape for docs/contributing.md. Keep only the rows and rules this
project actually uses. -->

## Where things go

| Knowledge | Home | Kind |
|---|---|---|
| Build, run, verify | `README.md` | Living |
| Current architecture | `docs/architecture.md` | Living |
| Design proposals | `docs/specs/YYYY-MM-DD-topic-design.md` | Point-in-time |
| Implementation plans | `docs/plans/{planned,active,done}/` | Point-in-time |
| Active work and acceptance | Tracker, see `docs/agents/tracker.md` | Living work tracking |

Living documents must be true today. Point-in-time documents keep their date
and record what was intended or observed then; they gain execution notes, not
rewrites.

## Language and naming

Repository documents are in English. Topic files use `kebab-case.md`; dated
records use `YYYY-MM-DD-topic.md`.

## Plans

A plan moves from `planned/` to `active/` when implementation starts in this
branch, and to `done/` when it is closed. Every plan is listed in
`docs/plans/README.md`. Closing a plan reconciles the living documents above,
records verification, and leaves acceptance in the tracker.
