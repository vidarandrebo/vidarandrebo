---
description: My personal Shell script conventions
applyTo: "**/*.sh,**/*.bash"
---

# Shell script preferences

- Always start Bash scripts with `set -euo pipefail` for strict error handling.
- Use `#!/usr/bin/env bash` (or `#!/bin/sh` for POSIX compliance) as the shebang.
- Always quote variables (e.g., `"$var"`) to prevent word splitting and globbing issues.
- Prefer `[[ ... ]]` over `[ ... ]` for conditional tests in Bash.
- Prefer `$(...)` over backticks `` `...` `` for command substitution.
- Use meaningful variable names; use uppercase for environment/exported variables and lowercase with `local` for function-scoped variables.
- Direct error messages to `stderr` (`>&2 echo "error"`) and return non-zero exit codes on failure.
