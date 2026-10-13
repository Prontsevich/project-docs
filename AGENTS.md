# Maintaining this repository

- Each skill lives in `skills/<name>/` with `SKILL.md` and `agents/openai.yaml`.
  The folder name equals the `name` in the skill's frontmatter.
- Each skill is listed in `.claude-plugin/plugin.json` (`skills`) and in the
  root `README.md`. Add, rename, or remove a skill in all three places at once.
- Keep real files under `skills/`: Codex drops symlinks when it installs a plugin.
- Skills reach each other by skill name through the Skill tool, and each shared
  reference lives inside the skill that owns it.
- Bump `version` in `.claude-plugin/plugin.json` for every release; installed
  plugins update only when the version changes.
- Run `claude plugin validate . --strict` after editing `.claude-plugin/`.
- Repository artifacts are written in English.
