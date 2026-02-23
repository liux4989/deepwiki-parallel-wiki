#!/usr/bin/env bash
set -euo pipefail

if [[ $# -lt 1 ]]; then
  echo "Usage: $0 <wiki-root>"
  exit 1
fi

wiki_root="$1"
mkdir -p "$wiki_root"

cat > "$wiki_root/README.md" <<'EOF'
# Wiki Index

## Pages

- [Overview](./Overview.md)
- [Architecture](./Architecture.md)
- [Protocol and Event Flow](./Protocol-and-Event-Flow.md)
- [Developer Workflow](./Developer-Workflow.md)
- [Testing and Quality](./Testing-and-Quality.md)
- [Troubleshooting](./Troubleshooting.md)
EOF

for page in \
  "Overview.md" \
  "Architecture.md" \
  "Protocol-and-Event-Flow.md" \
  "Developer-Workflow.md" \
  "Testing-and-Quality.md" \
  "Troubleshooting.md"; do
  if [[ ! -f "$wiki_root/$page" ]]; then
    cat > "$wiki_root/$page" <<'EOF'
# Title

## Summary

TODO

## Relevant Source Files

- `TODO`
EOF
  fi
done

echo "Wiki scaffold created at: $wiki_root"
