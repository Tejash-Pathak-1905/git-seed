# git-seed

Automatically configure Git so **every repository you clone or create** automatically gets helpful safety checks and background tooling without needing to configure each repo individually.

Works seamlessly on **Windows**, **macOS**, and **Linux**.

---

## Installation & Setup

Choose your operating system below for complete, step-by-step instructions from cloning to execution:

### 🪟 Windows

> **Prerequisite:** Ensure [Git for Windows](https://git-scm.com/) is installed.

#### Option A: PowerShell (Recommended)
Open **PowerShell** and run:

```powershell
# 1. Clone the repository
git clone https://github.com/Tejash-Pathak-1905/git-seed.git

# 2. Navigate into the repository folder
cd git-seed

# 3. Run setup with your desired recipes (e.g., --graphify or --all)
.\setup.ps1 --graphify
```

> *Tip:* If your system restricts PowerShell script execution, run:
> ```powershell
> powershell -ExecutionPolicy Bypass -File .\setup.ps1 --graphify
> ```

#### Option B: Git Bash
If you prefer **Git Bash**, open it and run:

```bash
# 1. Clone the repository
git clone https://github.com/Tejash-Pathak-1905/git-seed.git

# 2. Navigate into the repository folder
cd git-seed

# 3. Run setup
./setup.sh --graphify
```

---

### 🍎 macOS

> **Prerequisite:** Ensure Git is installed (`git --version`). If not already installed, running `git` will prompt you to install Xcode Command Line Tools.

Open **Terminal** and run:

```bash
# 1. Clone the repository
git clone https://github.com/Tejash-Pathak-1905/git-seed.git

# 2. Navigate into the repository folder
cd git-seed

# 3. Grant execute permissions to the setup script
chmod +x setup.sh

# 4. Run setup with your desired recipes (e.g., --graphify or --all)
./setup.sh --graphify
```

---

### 🐧 Linux

> **Prerequisite:** Ensure Git and Bash are installed (e.g. `sudo apt install git` on Debian/Ubuntu or `sudo dnf install git` on Fedora/RHEL).

Open your **Terminal** and run:

```bash
# 1. Clone the repository
git clone https://github.com/Tejash-Pathak-1905/git-seed.git

# 2. Navigate into the repository folder
cd git-seed

# 3. Grant execute permissions to the setup script
chmod +x setup.sh

# 4. Run setup with your desired recipes (e.g., --graphify or --all)
./setup.sh --graphify
```

---

## What You Can Enable

Pick the flags you want:

- **`--graphify`**: Updates your codebase knowledge graph automatically in the background whenever you commit or switch branches.
  > **Important:** If a repository hasn't been graphified before, the hook will not work. Initial graphification is required—run `graphify .` once inside the repository to create `graphify-out/`. After that, subsequent commits and branch switches will automatically keep the graph updated.
- **`--secret-guard`**: Stops you from accidentally committing API keys, tokens, or private SSH keys.
- **`--branch-guard`**: Stops you from accidentally committing directly to `main` or `master`.
- **`--large-file-guard`**: Blocks files over 25MB before you commit (stops GitHub push rejections).
- **`--conflict-guard`**: Blocks committing unfinished merge conflict markers (`<<<<<<<`).
- **`--all`**: Enables all of the above.

---

## Applying to Existing Repositories

New repositories (`git clone` / `git init`) inherit these hooks automatically.

If you have an **already existing repository** on your computer and want to bring in the new hooks, simply open your terminal in that repository and run:

```bash
git init
```

> **Safe to run:** Running `git init` on an existing repository will **not** touch your code, commits, or branches. Git will simply re-apply your template hooks into `.git/hooks/`.

---

## Helpful Commands

- **Check what's currently active:**
  - Windows (PowerShell): `.\setup.ps1 --status`
  - macOS / Linux / Git Bash: `./setup.sh --status`

- **Need to bypass a check for one commit?**
  ```bash
  git commit -m "urgent fix" --no-verify
  ```

- **Want to turn it off?**
  - Windows (PowerShell): `.\setup.ps1 --uninstall`
  - macOS / Linux / Git Bash: `./setup.sh --uninstall`
