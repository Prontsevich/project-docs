# Documentation Model

## The invariants

One piece of maintained knowledge has one authoritative home. Short summaries
are useful when they link to that home and do not become competing contracts.
Code and observed checks establish implementation evidence; documents explain
current contracts and rationale. A tracker description or approved proposal is
not proof that behavior shipped.

A **living document** must be true today: a contract, standard, operational guide,
capability registry, placement rule, or index. A **point-in-time document** is
dated evidence or intent: a design proposal, investigation, vendor snapshot, or
execution record. Historical artifacts may acquire execution notes and errata;
they must not silently be rewritten as today's architecture.

Keep these roles separate. When a legacy file mixes them, identify the boundaries
and preserve the historical record while extracting the current contract.
Do not indiscriminately split every small document.

## Homes by purpose

| Knowledge | Default authoritative home | Maintenance |
|---|---|---|
| Start, build, run, and basic verification | Root `README.md` or linked runbook | Living |
| Find documentation by intent | `docs/README.md` | Living navigation |
| Placement, naming, language, lifecycle | `docs/contributing.md` | Living |
| Rules every coding session needs; routing | `AGENTS.md` or existing agent entrypoint | Living, concise |
| Current architecture and technical behavior | `docs/architecture.md`, topic contracts, or an established capability registry | Living |
| Development standards | `docs/standards/`, when multiple guides warrant it | Living |
| Operational procedures | `docs/how-to/` or existing runbooks | Living |
| Verified vendor behavior | Existing integration skill or provider/integration notes | Living, one home |
| Vendor manual captured at a date/version | Integration snapshots with capture conditions | Point-in-time |
| Consequential design proposal | `docs/specs/YYYY-MM-DD-topic-design.md`, unless `specs/` already has another role | Point-in-time |
| Ordered resumable implementation work | `docs/plans/{planned,active,done}/YYYY-MM-DD-topic.md` | Point-in-time with execution evidence |
| Find plans in every execution state | `docs/plans/README.md` | Living navigation |
| Active work, priorities, dependencies, acceptance | Existing available tracker, otherwise repository fallback | Living work tracking |
| Product purpose, scenarios, scope, decisions | Existing product pages, product docs repository, or an explicitly chosen local home | Usually living; date decision records |
| Client requirements, commercial proposals, discovery evidence | Existing private client/product surface | Preserve source or dated agreement |
| Measurements, refuted hypotheses, rejected alternatives | The investigation or execution record that produced them | Point-in-time |

Adapt locations to how readers use the project. Keep a feature-local contract
next to code if that placement works; index it from the relevant entrypoint.
Provider findings do not require a new integration skill. Architecture does not
require a separate document for every module. No folder exists merely because
it appears in this table.

## Agent routing and progressive reading

`AGENTS.md` contains rules needed across sessions and pointers to narrower
knowledge. It is not a status dashboard, backlog, vendor manual, or complete
architecture encyclopedia. Use applicability to decide what stays inline:

- Cross-cutting invariants and a recurring build trap may belong inline.
- A provider-specific limit or long diagnosis belongs behind a link.
- A shared umbrella folder needs a map of repositories and session entrypoints,
  not another copy of each repository's rules and status.

Agent-specific files should route to the same canonical rules where the host's
loading semantics permit it. Preserve required host-specific directives and
existing imports. Avoid copying the entire contract into every agent file.
No universal line budget is necessary; a project may set its own cleanup targets.

## Language and audience

New code-repository artifacts are English, including long-term specs and plans.
Russian is used for conversation with the user. Human-facing product pages,
working guides, and client material may be Russian in the chosen external or
separate product home; honor explicit local conventions and audience needs.
Keep technical identifiers and commands in their exact form. Do not create
parallel translations by default or translate historical client/source material
as a migration side effect.

Product and technical audiences can use different surfaces without requiring
two repositories. A separate documentation repository, product pages in the
tracker, or private tracker product context are all valid implementations of
the ownership rule, not mandatory dependencies.

## Naming and navigation

- New topic filenames use `kebab-case.md`; established names such as `README.md`
  and `AGENTS.md` retain their conventional casing.
- New historical designs, plans, and reports default to `YYYY-MM-DD-topic.md`.
  Record relevant environment, source version, and observed date in the body.
- Living files use stable topic names without creation dates or moving version
  numbers. A periodically measured living register uses `Measured on` in its body.
- A historical bundle can carry its date in one index/container instead of every
  attachment. Preserve useful legacy names and tooling references.
- Use relative Markdown links within a repository. Cross-repository local links
  must state the expected sibling layout; published documentation must not imply
  that a private sibling repository is publicly accessible.

`docs/README.md` answers reader intentions: understand a contract, run the system,
write a document, inspect a design, or find completed evidence. Link to relevant
section indexes rather than duplicating large plan inventories in several files.
Use one title per newly authored document and only useful sections; no mandatory
empty boilerplate. Templates are optional and justified by recurring work.

## Tracker and local fallback

Determine the current authoritative tracker without replacing it. Linear,
Plane, ClickUp, and repository-only tracking all fit the model. Configuring or
changing a tracker is a separate task. When `docs/agents/tracker.md` exists, it
is the one home for tracker operations and the role-to-status mapping;
`docs/contributing.md` keeps the policy and links to it.

With an available configured tracker, active scope, priority, dependencies,
acceptance, and lifecycle stay there. Repository documents hold durable technical
knowledge, plans, and evidence. A plan may include an explicitly dated acceptance
snapshot or technical decomposition, not independently maintained Issue state.
Keep private tracker IDs and URLs out of public repository artifacts.

`docs/backlog.md` remains a fallback for unconfigured tracking or outages. During
an outage mark records pending synchronization, capture enough context to
reconcile them, then search the tracker before creating or updating work and
retire synchronized temporary entries. Documentation setup does not authorize
external synchronization. Never operate two live queues while the tracker is
available.

Without a configured tracker, use a small local backlog:

- **Tasks:** intentional work, one concise entry with context or a link.
- **Technical debt:** verified problems keyed by file/module so they can be found
  before touching that area. Split a large register only when navigation needs it.

A task is something to do; a durable fact is something to know and belongs
elsewhere. Important `TODO` comments can link to tracked debt, but are not the
only discoverable register. A living technical debt register may coexist with a
tracker when it describes current debt and links to work rather than duplicating
its statuses and priorities.

In a queue-only local backlog, retire covered scope when its plan becomes the
execution record. In a repository retaining task links, preserve that convention.
Do not silently remove uncovered scope or do this to remote Issues.

## Plan lifecycle and closure

```text
shaped work -> design if needed -> planned -> active -> done
```

Small changes can omit both spec and plan. A consequential decision may need a
spec without a multi-step plan; a mechanical migration may need a plan without
a design spec.

Folder state is technical execution, not permission. An unstarted plan must not
be in `active/`. Transition it when work actually starts in this branch/worktree.
Do not promote another worktree's plan locally; preserve state with its branch.
Completed checkboxes alone do not prove closure, and all-empty checkboxes alone
do not prove no investigation has started. Verify the record and actual evidence.

Index every plan in its real state with a working link and a short scope/outcome.

### Closing a plan

This checklist is the one definition of plan closure. Whoever closes a plan,
`execute-tasks` or a person, applies it; the repository's `docs/contributing.md`
rules take precedence where they differ.

1. Confirm the implementation tasks and required technical checks are complete,
   with actual evidence. Keep outstanding technical scope visible rather than
   checking it off. A plan with a required manual criterion not yet performed
   stays active.
2. Reconcile living documents made stale by the work: architecture and
   contracts, operating instructions, vendor knowledge, and current product or
   status documents, each at its canonical home.
3. Extract newly reusable findings to living homes and leave a pointer from the
   plan. A completed plan should not be the only place the next implementer can
   learn a current rule.
4. Route independent unfinished work to the tracker, or to the local fallback
   during an outage. Do not quietly drop unfinished in-scope criteria.
5. Keep measurements, rejected hypotheses and alternatives, deviations, and
   execution history in the plan, distinguishing observations from proposals.
   Preserve a superseded predecessor document with a reference to its successor
   rather than deleting it.
6. Record actual verification and limitations, move the plan to the completed
   state, and update the plan index with a working link, outcome, and affected
   area. Repair navigation links affected by the move.

Technical closure is not acceptance. Remaining user acceptance, deployment, or
functional QA is named explicitly and stays in the tracker; closing a plan
never marks its tracker item done.

## Established variations

- **Capability registry:** living capability registry in `docs/specs/`,
  standards/how-to/templates, and `backlog/active/archive` plans with stable
  legacy names.
- **Split audiences:** English technical repository and a separate product
  documentation repository; dated specs and `planned/active/done`; integration
  knowledge routed through an existing project integration skill. A local
  backlog is appropriate while no external tracker is active.
- **Small flat project:** small flat technical contracts, dated design/execution
  records, product and work surfaces in the tracker, fallback backlog.
- **Living plan file:** `docs/plan.md` is a living architecture/contract home;
  `docs/tasks.md` preserves milestone history; provider notes are living technical
  references; a private tracker owns active work; plans use `completed`.

These variations explain role detection. They do not prescribe exact directory
names, tools, or trackers.
