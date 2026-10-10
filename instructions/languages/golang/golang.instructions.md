---
description: My personal Go conventions
applyTo: "**/*.go"
---

# Go preferences

- Follow standard Go idioms and `effective_go` guidelines.
- Handle errors explicitly; do not ignore returned errors.
- Always document the error types returned from a function.
- Prefer returning errors over using `panic` / `recover`.
- Accept `context.Context` as the first argument in functions performing I/O or cancellation-aware tasks.
- Keep variable names short in localized scopes and descriptive for package-level / exported symbols.
- Prefer composition and small interfaces over large interfaces.
- Avoid package-level mutable state and global variables.
- Keep code formatted using `gofumpt` and `goimports`.
