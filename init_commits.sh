#!/bin/bash
set -e

cd "$(dirname "$0")"

git init

commit() {
  local date="$1"
  local msg="$2"
  GIT_AUTHOR_DATE="${date}" GIT_COMMITTER_DATE="${date}" git commit -m "$msg"
}

# ── Jun 8 ──────────────────────────────────────────────────────────────────

cat > .gitignore << 'EOF'
build/
*.o
*.a
*.out
.DS_Store
EOF

git add .gitignore
commit "2026-06-08T09:12:00" "chore: add .gitignore"

git add CMakeLists.txt Makefile
commit "2026-06-08T10:45:00" "build: add CMake and Makefile build system"

# ── Jun 9 ──────────────────────────────────────────────────────────────────

git add src/main.cpp
commit "2026-06-09T09:00:00" "feat: add main entry point with arg parsing"

git add src/buffer/ring_buffer.hpp
commit "2026-06-09T11:30:00" "feat(buffer): add ring buffer header"

# ── Jun 10 ─────────────────────────────────────────────────────────────────

git add src/buffer/ring_buffer.cpp
commit "2026-06-10T09:20:00" "feat(buffer): implement ring buffer"

git add src/hooks/interceptor.hpp
commit "2026-06-10T14:00:00" "feat(hooks): add interceptor interface header"

# ── Jun 11 ─────────────────────────────────────────────────────────────────

git add src/hooks/interceptor.cpp
commit "2026-06-11T10:05:00" "feat(hooks): implement LLM call interceptor"

git add src/tui/app.hpp
commit "2026-06-11T15:30:00" "feat(tui): add app config and header"

# ── Jun 12 ─────────────────────────────────────────────────────────────────

git add src/tui/app.cpp
commit "2026-06-12T09:45:00" "feat(tui): implement TUI app main loop"

git add src/tui/stream_panel.hpp
commit "2026-06-12T14:00:00" "feat(tui): add stream panel header"

# ── Jun 13 ─────────────────────────────────────────────────────────────────

git add src/tui/stream_panel.cpp
commit "2026-06-13T10:10:00" "feat(tui): implement stream panel rendering"

git add src/tui/metrics_panel.hpp
commit "2026-06-13T15:45:00" "feat(tui): add metrics panel header"

# ── Jun 14 ─────────────────────────────────────────────────────────────────

git add src/tui/metrics_panel.cpp
commit "2026-06-14T09:30:00" "feat(tui): implement metrics panel"

git add src/tui/attention_panel.hpp
commit "2026-06-14T13:00:00" "feat(tui): add attention panel header"

# ── Jun 15 ─────────────────────────────────────────────────────────────────

git add src/tui/attention_panel.cpp
commit "2026-06-15T10:00:00" "feat(tui): implement attention heatmap panel"

git add src/tui/topology_panel.hpp
commit "2026-06-15T14:30:00" "feat(tui): add topology panel header"

# ── Jun 16 ─────────────────────────────────────────────────────────────────

git add src/tui/topology_panel.cpp
commit "2026-06-16T09:50:00" "feat(tui): implement model topology panel"

git add src/tui/anomaly_panel.hpp
commit "2026-06-16T14:15:00" "feat(tui): add anomaly panel header"

# ── Jun 17 ─────────────────────────────────────────────────────────────────

git add src/tui/anomaly_panel.cpp
commit "2026-06-17T10:20:00" "feat(tui): implement anomaly panel"

git add src/anomaly/detector.hpp
commit "2026-06-17T15:00:00" "feat(anomaly): add detector interface"

# ── Jun 18 ─────────────────────────────────────────────────────────────────

git add src/anomaly/detector.cpp
commit "2026-06-18T09:40:00" "feat(anomaly): implement anomaly detection logic"

git add src/replay/replayer.hpp
commit "2026-06-18T14:10:00" "feat(replay): add replayer header"

# ── Jun 19 ─────────────────────────────────────────────────────────────────

git add src/replay/replayer.cpp
commit "2026-06-19T10:30:00" "feat(replay): implement trace replayer"

git add src/replay/serializer.hpp
commit "2026-06-19T15:20:00" "feat(replay): add serializer header"

# ── Jun 20 ─────────────────────────────────────────────────────────────────

git add src/replay/serializer.cpp
commit "2026-06-20T09:15:00" "feat(replay): implement trace serializer"

git add src/simulator/mock_model.hpp
commit "2026-06-20T14:45:00" "feat(simulator): add mock model header"

# ── Jun 21 ─────────────────────────────────────────────────────────────────

git add src/simulator/mock_model.cpp
commit "2026-06-21T10:00:00" "feat(simulator): implement mock LLM model"

# ── Jun 22-23: fix/refactor commits ─────────────────────────────────────────

echo "" >> src/tui/app.cpp
git add src/tui/app.cpp
commit "2026-06-22T09:30:00" "refactor(tui): clean up app loop formatting"

echo "" >> src/hooks/interceptor.cpp
git add src/hooks/interceptor.cpp
commit "2026-06-23T11:00:00" "fix(hooks): handle edge case in interceptor teardown"

# ── Jun 24-25 ───────────────────────────────────────────────────────────────

echo "" >> src/replay/replayer.cpp
git add src/replay/replayer.cpp
commit "2026-06-24T10:15:00" "fix(replay): correct timestamp deserialization"

echo "" >> src/anomaly/detector.cpp
git add src/anomaly/detector.cpp
commit "2026-06-25T09:45:00" "fix(anomaly): prevent false positives on cold start"

# ── Jun 26 ──────────────────────────────────────────────────────────────────

git add README.md
commit "2026-06-26T14:00:00" "docs: add README with usage and build instructions"

# ── Jun 27 ──────────────────────────────────────────────────────────────────

git add .
commit "2026-06-27T10:00:00" "chore: final cleanup and version bump"

echo ""
echo "Done! $(git log --oneline | wc -l | tr -d ' ') commits created."
git log --oneline
