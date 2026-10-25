---
trigger: always_on
description: Strict Graphify-first policy to minimize token usage and reading time.
---
# Token Optimization & Codebase Navigation

When `graphify-out/` exists in this repository:
1. **NEVER perform blind whole-file reads or wide text searches** to explore code architecture, understand relationships, or find definitions.
2. **First step for architecture & navigation:** Read `graphify-out/wiki/index.md` (~400 tokens) or run `graphify query "<query>" --budget 1200`.
3. **Tracing flows & connections:** Run `graphify path "<SymbolA>" "<SymbolB>"` to trace dependencies or data flow.
4. **Inspecting load-bearing components:** Run `graphify explain "<Symbol>"`.
5. **Surgical reading only:** When `graphify query` returns exact file paths and line numbers, use `read_file` strictly with `StartLine` and `EndLine` for the target function or block. Do NOT read the entire file.
6. **Keep graph in sync:** Run `graphify update . && graphify export wiki` after modifying code structure.
