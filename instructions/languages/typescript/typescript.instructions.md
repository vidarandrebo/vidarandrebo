---
description: My personal TypeScript conventions
applyTo: "**/*.ts,**/*.vue"
---

# TypeScript preferences

- Prefer `interface` for object contracts.
- Prefer `class` over a type with related functions if the object needs functionality.
- Avoid `any`; use `unknown` when the type is genuinely unknown.
- Prefer explicit return types for exported functions.
- Prefer `const` unless reassignment is necessary.
