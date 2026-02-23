---
name: deepwiki-parallel-wiki
description: Generate DeepWiki-style project documentation with source-grounded architecture and workflow pages. Use when asked to create onboarding docs, internal technical wiki pages, or repository knowledge bases from code. Use especially when the user asks for DeepWiki-like output, structured wiki sections, architecture diagrams, or rapid documentation generation using parallel agent workflows.
---

# DeepWiki Parallel Wiki

## Overview

Generate concise, cross-linked wiki pages directly from repository sources. Split discovery and drafting into parallel workstreams, then merge into a coherent, DeepWiki-style documentation set.

## Workflow

1. Confirm scope and output path.
Set the wiki root (for example `docs/wiki/`) and confirm whether to overwrite existing pages.

2. Build a repository map first.
Inspect top-level directories, entrypoints, config files, and test directories before writing content.

3. Run parallel workstreams.
Decompose documentation work into independent tracks and run them in parallel:
- Track A: Architecture and component boundaries
- Track B: Runtime/API/protocol flow
- Track C: Developer workflow (setup, test, release)
- Track D: Troubleshooting and FAQ

4. Merge into a single navigation tree.
Create a top-level index page and ensure every page links back to the index.

5. Validate claims against sources.
Each page must include a `Relevant source files` section listing exact paths used.

6. Final quality gate.
Remove speculation, de-duplicate overlapping sections, and verify command snippets.

## Parallel Decomposition Rules

- Partition by topic, not by file, to reduce overlap.
- Keep each workstream's draft independent and source-cited.
- Prefer parallel reads for unrelated folders (backend/frontend/docs/tests).
- Merge only after all tracks have completed first drafts.
- Resolve conflicts in one pass: architecture terms, naming, and lifecycle sequence.

## Required Output Structure

Create or update these pages unless the user requests a smaller set:

1. `Overview.md`
2. `Architecture.md`
3. `Protocol-and-Event-Flow.md`
4. `Developer-Workflow.md`
5. `Testing-and-Quality.md`
6. `Troubleshooting.md`
7. `README.md` (wiki index)

For page format, use [`references/page-template.md`](references/page-template.md).

## DeepWiki Style Requirements

- Start each page with a short summary.
- Use explicit section headers and concise paragraphs.
- Include Mermaid diagrams for architecture or lifecycle-heavy pages.
- Add a `Relevant source files` section with concrete paths.
- Prefer direct, verifiable statements over generalized advice.
- Keep onboarding pages operational: include runnable commands where needed.

## Source-Grounded Citation Pattern

Use repository paths inline, for example:
- `claude-code-wrapper/src/claude_code_wrapper/runtime/kernel.py`
- `web/src/lib/wrapper-client.ts`
- `knowledges/USER_FLOWS.md`

When unsure, mark as assumption and keep it out of authoritative sections.

## Merge Checklist

- Navigation is complete and not circular.
- Terminology is consistent across pages.
- Commands are copy-paste ready.
- Runtime flow aligns with actual code paths.
- Every major claim maps to at least one source file.

## Example User Prompts

- "Create a DeepWiki-style onboarding wiki for this monorepo."
- "Document architecture, runtime flow, and tests with source file references."
- "Generate a maintainer wiki from code, not assumptions."

## Constraints

- Do not invent APIs, commands, or component names.
- Do not copy large external documentation blocks.
- Do not add extra docs outside requested wiki scope.
- Do not skip validation of commands when execution is available.

## Resources

- `references/page-template.md`: Standard page scaffold for DeepWiki-like docs.
