---
description: My personal Vue (with TypeScript) conventions
applyTo: "**/*.vue"
---

# Vue preferences

- Use the Composition API with `<script setup lang="ts">`.
- Strongly type props and emits using TypeScript type definitions (`defineProps<{ ... }>()` and `defineEmits<{ ... }>()`).
- Prefer `ref()` for primitives and `ref()` / `reactive()` with explicit types for complex reactive state.
- Use `computed()` for derived state and extract complex component logic into composables.
- Prefer scoped styles (`<style scoped>`) to avoid CSS leakage.
- Avoid mutating props directly; emit events to notify parent components of changes.
