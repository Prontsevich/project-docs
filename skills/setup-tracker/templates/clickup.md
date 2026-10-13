# Tracker section: ClickUp

Verified against ClickUp documentation on 2026-10-13. Re-check operations that
fail; ClickUp changes its MCP tool set over time.

## Access

- **Official MCP server:** `https://mcp.clickup.com/mcp`, OAuth only (no API
  keys). Tool names differ by client; the documentation lists display names such
  as Search Workspace, Get Task, Create Task, Update Task, Create Task Comment,
  Add Dependency, Add Task Link, Add Tag to Task, and Set Custom Fields. Some
  connectors also expose an operator catalog (`get_operators` /
  `execute_operator`): list it before assuming an operation is missing, and
  prefer one bulk operation over a call per task.
- **REST API v2:** `https://api.clickup.com/api/v2`, header
  `Authorization: <personal token>` (`pk_…`, no `Bearer`) or
  `Authorization: Bearer <OAuth token>`. Keep the token in the environment or a
  secret manager, never in the repository.
- No official CLI exists. Use a third-party CLI only if the project already
  adopted one.

## Scope and statuses

Work lives in a Workspace → Space → Folder → List hierarchy. Record which List
(or Folder/Space) holds this repository's work. Statuses are defined on a Space,
Folder, or List and inherited downward; read the statuses of the List in use.

ClickUp groups statuses as **Not started** (optional), **Active**, **Done**, and
**Closed**. A Done status means the work is complete but the task stays open;
the single Closed status (default `Complete`) hides the task from most views and
from the API unless `include_closed=true`. ClickUp has no triage state.

Suggested mapping, confirmed against the List's real statuses:

| Role | Suggested status |
|---|---|
| `intake` | A Not started status such as `triage`, or the `intake` tag on the default open status |
| `backlog` | The default open status (`to do`) or `backlog` |
| `ready` | A dedicated Not started status such as `ready`, distinct from `backlog` |
| `in-progress` | An Active status such as `in progress` |
| `in-review` | An Active status such as `in review`; otherwise `in progress` plus an `in-review` tag. Not a Done status: Done releases tasks that wait on this one |
| `done` | The Closed status |
| `canceled` | A Done status such as `canceled`, or Closed with a comment giving the reason |

Work type, if the project classifies it, uses custom task types or a dropdown
custom field; record which one. Tags are Space-level.

## Verbs

| Verb | MCP | REST |
|---|---|---|
| `find` | Search Workspace; filter tasks | `GET /team/{team_id}/task` with `list_ids[]`, `statuses[]`, `tags[]`; add `include_closed=true` |
| `list` | Filter tasks by status, or by tag for a tag-mapped role | Same, with the role's `statuses[]` or `tags[]` |
| `fetch` | Get Task; Get Task Comments | `GET /task/{id}?include_markdown_description=true&include_subtasks=true`; `GET /task/{id}/comment` |
| `capture` | Create Task in the List, intake status or tag | `POST /list/{list_id}/task` with `name`, `markdown_content`, `status`, `tags` |
| `update` | Update Task; Set Custom Fields; Add/Remove Tag | `PUT /task/{id}`; `POST /task/{id}/field/{field_id}`; `POST /task/{id}/tag/{tag}` |
| `transition` | Update Task `status` | `PUT /task/{id}` with `status` |
| `comment` | Create Task Comment | `POST /task/{id}/comment` with `comment_text`, `notify_all` |
| `relate` | Add Dependency; Add Task Link | Blocked-by: `POST /task/{id}/dependency` with `depends_on: <blocker>`. Link: `POST /task/{id}/link/{other_id}`. Parent: `parent` on create or update; the parent must be in the same List |

## Notes

- Filtered task lists page from `page=0`, up to 100 tasks per page. Read every
  page, and pass `include_closed=true` and `subtasks=true` when searching for
  duplicates, or closed tasks and subtasks are missed.
- Custom task IDs need `custom_task_ids=true&team_id=<workspace_id>` on
  read and update calls.
- Dropdown custom fields take the option UUID, not its position.
- GitHub integration: mentioning a task ID in a branch, commit, or PR only links
  activity. A `#<id>[<status>]` suffix changes the status, so never write a done
  or closed status that way. Business-plan GitHub Automations (for example on
  PR merged) can change status; check whether any move tasks past `in-review`.
