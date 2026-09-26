---
description: My personal C# conventions
applyTo: "**/*.cs"
---

# C# preferences

- Use modern C# language features (e.g., pattern matching, switch expressions, file-scoped namespaces).
- Enable and respect nullable reference types; avoid ignoring nullable warnings.
- Use `var` when the type is obvious from the right-hand side; use explicit types when clarity is needed.
- Follow standard .NET naming conventions: PascalCase for types and public members, camelCase / `_camelCase` for private fields.
- Use `async`/`await` for asynchronous programming; avoid `async void` except for event handlers.
- Prefer LINQ and immutable records for data transfer objects (DTOs).
- Prefer dependency injection and interfaces for loose coupling and testability.
