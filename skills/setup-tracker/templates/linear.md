# Tracker section: Linear

Verified against Linear documentation and changelog on 2026-10-13. Re-check
operations that fail.

## Access

- **Official MCP server:** `https://mcp.linear.app/mcp` (Streamable HTTP; OAuth,
  or `Authorization: Bearer <OAuth token or API key>`). A read-only endpoint is
  `https://mcp.linear.app/mcp/readonly`; the SSE endpoint is deprecated. Clients
  without remote MCP support can bridge with
  `npx -y mcp-remote https://mcp.linear.app/mcp`.
  - Linear documents capabilities, not a stable tool list. Confirmed names:
    `save_issue` (create and update), `list_comments`, `list_projects`,
    `get_project`, `list_teams`, `get_team`, `list_users`, `get_user`. Pick
    other tools (search, get issue, create comment, statuses, labels, relations)
    from the live tool list by purpose.
- **GraphQL API:** `https://api.linear.app/graphql`; header
  `Authorization: <personal API key>` (no `Bearer`) or
  `Authorization: Bearer <OAuth token>`. Keep keys in the environment or a
  secret manager.
- No official CLI manages issues (`linear-release` only syncs releases from CI).
  Use a third-party CLI only if the project already adopted one.

## Scope and statuses

Issues belong to a Team, which owns the workflow; Projects group a finite
outcome. Record the team (and project, if work is scoped to one) by name; keep
issue keys like `ENG-123` out of public artifacts.

Each status has a fixed type: `triage`, `backlog`, `unstarted`, `started`,
`completed`, `canceled`, or the system-managed `duplicate`. Custom statuses sit
inside these types; a team's defaults are Backlog, Todo, In Progress, Done, and
Canceled. **Triage** is a per-team inbox (Team settings → Triage): accepting
moves an issue to the team's default status, declining cancels it.

Suggested mapping, confirmed against the team's real statuses:

| Role | Suggested status |
|---|---|
| `intake` | `Triage` when enabled; otherwise `Backlog` plus an `intake` label |
| `backlog` | `Backlog` |
| `ready` | `Todo` (unstarted) |
| `in-progress` | `In Progress` (started) |
| `in-review` | A started-type status such as `In Review`, added with approval; otherwise `In Progress` plus an `in-review` label |
| `done` | `Done` (completed) |
| `canceled` | `Canceled`; duplicates go to the system `Duplicate` status |

Linear has no issue types. If the project classifies work, use one label group
(an issue can carry one label per group) and record it here.

## Verbs

| Verb | MCP | GraphQL |
|---|---|---|
| `find` | Search or list issues with a text query, team filter, and closed issues included | `issues(filter: …)` or `searchIssues(term: …)` |
| `list` | List issues filtered by team and status | `issues(filter: { team: …, state: { name: … } })` |
| `fetch` | Get issue by key; `list_comments`; relations | `issue(id: "ENG-123") { … relations inverseRelations comments }` |
| `capture` | `save_issue` with team, title, description, and the intake status | `issueCreate(input: { teamId, title, description, stateId })` |
| `update` | `save_issue` with the issue ID and changed fields | `issueUpdate(id, input: { … addedLabelIds removedLabelIds })` |
| `transition` | `save_issue` with the status | `issueUpdate(id, input: { stateId })` |
| `comment` | Create comment on the issue | `commentCreate(input: { issueId, body })` (Markdown) |
| `relate` | Relation tools (blocks, related, duplicate); `save_issue` with the parent | `issueRelationCreate(input: { issueId, relatedIssueId, type })` with `blocks`, `duplicate`, `related`; `parentId` on create or update |

Linear has no `blocked-by` relation type: "A is blocked by B" is created as
`B blocks A`. Blockers of an issue appear in its `inverseRelations`.

## Notes

- Lists and comments are paginated; follow the cursor to the end before
  concluding an issue does not exist.
- `labelIds` on update replaces every label; use `addedLabelIds` and
  `removedLabelIds` to change one.
- **GitHub integration defaults move a linked issue to In Progress when a PR
  opens and to Done when it merges.** Linking happens when the issue key is in
  the branch name or PR title. Set the merged trigger to the `in-review` status,
  or to no action, under Team settings → Workflows & automations, so that merge
  does not bypass acceptance. Closing magic words (`fixes`, `closes`, …) in
  commits can also move issues; prefer `refs` or `part of`.
