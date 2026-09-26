---
description: My personal GitHub Actions conventions
applyTo: ".github/workflows/**/*.yml,.github/workflows/**/*.yaml,.github/actions/**/*.yml,.github/actions/**/*.yaml"
---

# GitHub Actions preferences

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