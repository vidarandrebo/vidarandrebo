---
description: My personal C# conventions
applyTo: "**/*.cs"
---

# C# preferences

- Enable and respect nullable reference types; avoid ignoring nullable warnings.
- No not use primary constructors
- Use `var` when the type is obvious from the right-hand side; use explicit types when clarity is needed.
- Prefer LINQ's method syntax over query syntax.
- Prefer dependency injection and interfaces for loose coupling and testability.
