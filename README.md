# git-seed

Automatically configure Git so **every repository you clone or create** automatically gets helpful safety checks and background tooling without needing to configure each repo individually.

Works seamlessly on **Windows**, **macOS**, and **Linux**.

---

## Quick Start

Clone this repository, open your terminal inside the folder, and run:

### Windows (PowerShell)
```powershell
.\setup.ps1 --graphify
```

### macOS, Linux, and Git Bash
```bash
./setup.sh --graphify
```

*(You can also use `--all` to enable all developer guard checks at once)*

---

## Applying to Existing Repositories

New repositories (`git clone` / `git init`) inherit these hooks automatically.

If you have an **already existing repository** on your computer and want to bring in the new hooks, simply open your terminal in that repository and run:

```bash
git init
```

> **Safe to run:** Running `git init` on an existing repository will **not** touch your code, commits, or branches. Git will simply re-apply your template hooks into `.git/hooks/`.

---

## What You Can Enable

Pick the flags you want:

- **`--graphify`**: Updates your codebase knowledge graph automatically in the background whenever you commit or switch branches.
- **`--secret-guard`**: Stops you from accidentally committing API keys, tokens, or private SSH keys.
- **`--branch-guard`**: Stops you from accidentally committing directly to `main` or `master`.
- **`--large-file-guard`**: Blocks files over 25MB before you commit (stops GitHub push rejections).
- **`--conflict-guard`**: Blocks committing unfinished merge conflict markers (`<<<<<<<`).
- **`--all`**: Enables all of the above.

---

## Helpful Commands

- **Check what's currently active:**
  - Windows: `.\setup.ps1 --status`
  - macOS / Linux: `./setup.sh --status`

- **Need to bypass a check for one commit?**
  ```bash
  git commit -m "urgent fix" --no-verify
  ```

- **Want to turn it off?**
  - Windows: `.\setup.ps1 --uninstall`
  - macOS / Linux: `./setup.sh --uninstall`
