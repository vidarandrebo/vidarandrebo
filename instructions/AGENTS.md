# Coding Guidelines & Preferences

## General Preferences

- Write clean, readable, and maintainable code adhering to SOLID and KISS principles.
- Prefer self-documenting code with clear, expressive naming; comment the "why", not the "what".
- Keep functions and methods small, focused, and adhering to single responsibility.
- Handle edge cases and errors explicitly; never silently ignore errors or failures.
- Practice defensive programming without overengineering.
- Maintain consistent code formatting and follow existing project conventions.
- Prioritize security: never commit secrets, API keys, or sensitive credentials.

## C# preferences

- Use modern C# language features (e.g., pattern matching, switch expressions, file-scoped namespaces).
- Enable and respect nullable reference types; avoid ignoring nullable warnings.
- Use `var` when the type is obvious from the right-hand side; use explicit types when clarity is needed.
- Follow standard .NET naming conventions: PascalCase for types and public members, camelCase / `_camelCase` for private fields.
- Use `async`/`await` for asynchronous programming; avoid `async void` except for event handlers.
- Prefer LINQ and immutable records for data transfer objects (DTOs).
- Prefer dependency injection and interfaces for loose coupling and testability.

## GitHub Actions preferences

- Pin third-party actions to full commit SHAs or explicit version tags (avoid mutable branches like `@main`).
- Explicitly declare minimum required `permissions` at the workflow or job level.
- Use clear, descriptive names for workflows, jobs, and steps.
- Set timeouts (`timeout-minutes`) on jobs to prevent hung runner instances.
- Use GitHub Secrets for credentials and sensitive data; never log secrets or tokens.
- Keep workflows modular using reusable workflows and composite actions where possible.
- Use dependency caching (e.g., `actions/setup-*`, `actions/cache`) to optimize CI run times.

## Go preferences

- Follow standard Go idioms and `effective_go` guidelines.
- Handle errors explicitly; do not ignore returned errors.
- Prefer returning errors over using `panic` / `recover`.
- Accept `context.Context` as the first argument in functions performing I/O or cancellation-aware tasks.
- Keep variable names short in localized scopes and descriptive for package-level / exported symbols.
- Prefer composition and small interfaces over large interfaces.
- Avoid package-level mutable state and global variables.
- Keep code formatted using `gofmt` and `goimports`.

## Shell script preferences

- Always start Bash scripts with `set -euo pipefail` for strict error handling.
- Use `#!/usr/bin/env bash` (or `#!/bin/sh` for POSIX compliance) as the shebang.
- Always quote variables (e.g., `"$var"`) to prevent word splitting and globbing issues.
- Prefer `[[ ... ]]` over `[ ... ]` for conditional tests in Bash.
- Prefer `$(...)` over backticks `` `...` `` for command substitution.
- Use meaningful variable names; use uppercase for environment/exported variables and lowercase with `local` for function-scoped variables.
- Direct error messages to `stderr` (`>&2 echo "error"`) and return non-zero exit codes on failure.

## TypeScript preferences

- Prefer `interface` for object contracts.
- Avoid `any`; use `unknown` when the type is genuinely unknown.
- Prefer explicit return types for exported functions.
- Prefer `const` unless reassignment is necessary.

## Vue preferences

- Use the Composition API with `<script setup lang="ts">`.
- Strongly type props and emits using TypeScript type definitions (`defineProps<{ ... }>()` and `defineEmits<{ ... }>()`).
- Prefer `ref()` for primitives and `ref()` / `reactive()` with explicit types for complex reactive state.
- Use `computed()` for derived state and extract complex component logic into composables.
- Prefer scoped styles (`<style scoped>`) to avoid CSS leakage.
- Avoid mutating props directly; emit events to notify parent components of changes.

