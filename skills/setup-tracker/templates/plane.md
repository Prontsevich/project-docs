# Tracker section: Plane

Verified against Plane documentation on 2026-10-13 (MCP server v0.3.x, Public
API v2). Re-check operations that fail.

## Access

- **Official MCP server** (`makeplane/plane-mcp-server`):
  - Plane Cloud, interactive: `https://mcp.plane.so/http/mcp` with OAuth.
  - Plane Cloud, headless: `https://mcp.plane.so/http/api-key/mcp` with headers
    `Authorization: Bearer <PAT>` and `X-Workspace-slug: <slug>`.
  - Self-hosted: run it locally with `uvx plane-mcp-server stdio` and set
    `PLANE_API_KEY`, `PLANE_WORKSPACE_SLUG`, and `PLANE_BASE_URL`. The hosted
    server cannot reach a private instance; Community Edition has no OAuth.
  - Tools are grouped by resource, each with an `action` parameter: `workitem`,
    `workitem_comment`, `workitem_relation`, `workitem_link`, `state`, `label`,
    `intake`, `project`, `member`. Read parameter shapes from the tool schemas.
- **Public API:** `https://api.plane.so` or the self-hosted origin; header
  `X-API-Key: <PAT>` (Profile Settings → Personal Access Tokens). Paths end with
  a trailing slash. Use v2 (`/api/v2/…`); v1 remains for relations and full-text
  search. Keep the token in the environment or a secret manager.
- No official per-item CLI exists (Plane Compose is a bulk YAML sync tool). If
  the project ships its own Plane skill or CLI wrapper, name it here and follow
  it for access mechanics.

## Scope and statuses

Work lives in a Workspace → Project. Record the project by name; resolve its
UUID and identifier prefix (for example `PROJ`) at run time or from ignored
local config.

Every state belongs to one group: `backlog`, `unstarted`, `started`,
`completed`, or `cancelled`. Only `completed` counts as done. Defaults are
Backlog, Todo, In Progress, Done, and Cancelled; add or rename states only with
approval. With workspace-level state governance, project state writes fail.

**Intake** is an optional per-project triage queue (Project settings → Features
→ Intake, off by default). An intake item is not yet a project work item; its
own `status` is Pending, Snoozed, Accepted, Declined, or Duplicate. Accepting it
moves it into the project.

Suggested mapping, confirmed against the project's real states:

| Role | Suggested status |
|---|---|
| `intake` | Intake, Pending, when Intake is enabled; otherwise `Backlog` plus an `intake` label |
| `backlog` | `Backlog` (backlog group) |
| `ready` | `Todo` (unstarted group) |
| `in-progress` | `In Progress` (started group) |
| `in-review` | A started-group state such as `In Review`, added with approval; otherwise `In Progress` plus an `in-review` label |
| `done` | `Done` (completed group) |
| `canceled` | `Cancelled` (cancelled group); Intake Declined or Duplicate before acceptance |

Work type, if the project classifies it, uses labels or Work Item Types (Pro;
cannot be disabled once enabled). Labels are project-level and can be grouped
under a parent label.

## Verbs

| Verb | MCP | REST |
|---|---|---|
| `find` | `workitem` search, or list with a PQL filter (`get_pql_reference` gives the syntax) | v1 `GET …/work-items/search/` matches name, description, and ID; v2 `?search=` matches the name only |
| `list` | `workitem` list with a PQL filter on state; `intake` list | `GET /api/v2/workspaces/{slug}/projects/{project_id}/work-items/` with filters |
| `fetch` | `workitem` retrieve_by_identifier (`PROJ-123`); `workitem_comment` list; `workitem_relation` list | `GET /api/v2/workspaces/{slug}/work-items/PROJ-123/` |
| `capture` | `intake` create, or `workitem` create in the intake-mapped state | `POST …/projects/{project_id}/intake-issues/`, or `POST …/work-items/` |
| `update` | `workitem` update, or its `manage_label` action | `PATCH …/work-items/{id}/` (PUT is rejected); labels by name or ID |
| `transition` | `workitem` update with the state; `intake` update to accept, decline, or mark duplicate | `PATCH …/work-items/{id}/` with `state` (name) or `state_id` |
| `comment` | `workitem_comment` create | `POST …/work-items/{id}/comments/` (HTML body) |
| `relate` | `workitem_relation` create (`blocked_by`, `duplicate`, `relates_to`); `workitem_link` for PR or doc URLs; `workitem` update for the parent | v1 `POST …/work-items/{id}/relations/` with `relation_type` and `issues`; `parent` on PATCH |

## Notes

- The API allows 60 requests per minute per key; on 429 wait for `Retry-After`.
- Read every page of a list before concluding an item does not exist.
- Write bodies to a protected temporary file outside the checkout when they hold
  multi-line text or private IDs; do not build them through shell interpolation.
- Description retrieval through v2 has been observed to omit
  `description_html`; use the MCP server when the description matters.
- GitHub and GitLab integrations (Pro) can move a work item when a PR or MR is
  opened, approved, merged, or closed, per the project's state mapping, if the
  PR references the item in brackets (`[PROJ-123]`). A bare `PROJ-123` only
  links. Keep `merged` mapped to the `in-review` state, not `Done`.
