# Coding Guidelines & Preferences

## General Preferences

- Write clean, readable, and maintainable code adhering to SOLID and KISS principles.
- Prefer "simple" over "clever" control flow.
- Prefer self-documenting code with clear, expressive naming; comment the "why", not the "what".
- Keep functions and methods small, focused, and adhering to single responsibility.
- Handle edge cases and errors explicitly; never silently ignore errors or failures.
- Practice defensive programming without overengineering.
- Maintain consistent code formatting and follow existing project conventions.
- Prioritize security: never commit secrets, API keys, or sensitive credentials.
- If the project has a `.editorconfig`, use it.

## Git Preferences

- Never create a git commit, push changes, create or merge a pull request, or post/edit GitHub comments or reviews unless I explicitly requested that specific action. Reading GitHub data and inspecting local files is allowed.

## C# preferences

- Enable and respect nullable reference types; avoid ignoring nullable warnings.
- No not use primary constructors
- Use `var` when the type is obvious from the right-hand side; use explicit types when clarity is needed.
- Prefer LINQ's method syntax over query syntax.
- Prefer dependency injection and interfaces for loose coupling and testability.

## GitHub Actions preferences

- Pin third-party actions to full commit SHAs or explicit version tags (avoid mutable branches like `@main`).
- Explicitly declare minimum required `permissions` at the workflow or job level.
- Use clear, descriptive names for workflows, jobs, and steps.
- Provde a description for inputs and outputs.
- Set timeouts (`timeout-minutes`) on jobs to prevent hung runner instances.
- Use GitHub Secrets for credentials and sensitive data; never log secrets or tokens.
- Keep workflows modular using reusable workflows and composite actions where possible.
- For shell-script heavy workflows, extract the shell script to a composite action where possible.
- Use dependency caching (e.g., `actions/setup-*`, `actions/cache`) to optimize CI run times.
- Prefer one top level entrypoint workflow for workflows that are triggered by the same event.
- Use zizmor and actionlint actively while developing.

## Go preferences

- Follow standard Go idioms and `effective_go` guidelines.
- Handle errors explicitly; do not ignore returned errors.
- Prefer returning errors over using `panic` / `recover`.
- Accept `context.Context` as the first argument in functions performing I/O or cancellation-aware tasks.
- Keep variable names short in localized scopes and descriptive for package-level / exported symbols.
- Prefer composition and small interfaces over large interfaces.
- Avoid package-level mutable state and global variables.
- Keep code formatted using `gofumpt` and `goimports`.

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
- Prefer `class` over a type with related functions if the object needs functionality.
- Avoid `any`; use `unknown` when the type is genuinely unknown.
- Prefer explicit return types for exported functions.
- Prefer `const` unless reassignment is necessary.

## Vue preferences

- Use the Composition API with `<script setup lang="ts">`.
- Strongly type props and emits using TypeScript type definitions (`defineProps<{ ... }>()` and `defineEmits<{ ... }>()`).
- Use tuple syntax for defineEmits.
- Prefer `ref()` for primitives and `ref()` / `reactive()` with explicit types for complex reactive state.
- Use `computed()` for derived state and extract complex component logic into composables.
- Use the project's preferred css library or component framework rather than using custom classes for styling.
- Prefer scoped styles (`<style scoped>`) to avoid CSS leakage.
- Avoid mutating props directly; emit events to notify parent components of changes.

