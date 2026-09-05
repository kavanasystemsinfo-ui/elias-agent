#!/usr/bin/env bash
# Elias Agent — instalador
# Detecta la herramienta activa y despliega AGENTS.md, CLAUDE.md y las skills a sus rutas nativas.
# Uso: ./install.sh
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
echo "=== Elias Agent installer ==="

detect_tool() {
  if [ -n "${CLAUDE_CODE_ENTRYPOINT:-}" ] || [ -f ".claude" ]; then echo "claude"; return; fi
  if [ -n "${OPENAI_CODE_FORMAT_VERSION:-}" ] || [ -d ".codex" ]; then echo "codex"; return; fi
  if [ -n "${HERMES_HOME:-}" ] || [ -f "$HOME/.hermes/config.yaml" ]; then echo "hermes"; return; fi
  if [ -d "$HOME/.cursor" ]; then echo "cursor"; return; fi
  if [ -f "$HOME/.config/opencode" ]; then echo "opencode"; return; fi
  if [ -f "$HOME/.openclaw" ]; then echo "openclaw"; return; fi
  echo "unknown"
}

TOOL="$(detect_tool)"
echo "Herramienta detectada: ${TOOL}"

install_common() {
  local dest="$1"
  mkdir -p "${dest}/skills"
  cp "$REPO_DIR/AGENTS.md" "${dest}/AGENTS.md" 2>/dev/null || true
  cp "$REPO_DIR/CLAUDE.md" "${dest}/CLAUDE.md" 2>/dev/null || true
  for skill in "$REPO_DIR"/skills/*.md; do
    cp "$skill" "${dest}/skills/"
  done
  echo "  → skills instaladas en ${dest}/skills/"
}

case "${TOOL}" in
  claude)
    install_common "$REPO_DIR"
    # Claude Code lee CLAUDE.md de la raíz
    echo "  Claude Code: usa CLAUDE.md de la raíz del proyecto."
    ;;
  codex)
    cp "$REPO_DIR/AGENTS.md" "$REPO_DIR/AGENTS.md"
    echo "  Codex: usa AGENTS.md de la raíz del proyecto."
    ;;
  hermes)
    local hermes_skills="${HERMES_HOME:-$HOME/.hermes}/profiles/$(basename "$REPO_DIR")/skills"
    # Fallback: instala en el perfil activo si HERMES_HOME apunta a un perfil
    if [ -d "${HERMES_HOME:-$HOME/.hermes}/skills" ]; then
      hermes_skills="${HERMES_HOME}/skills"
    fi
    mkdir -p "$hermes_skills"
    for skill in "$REPO_DIR"/skills/*.md; do
      cp "$skill" "$hermes_skills/"
    done
    echo "  Hermes: skills instaladas en $hermes_skills (reinicia para cargar)."
    ;;
  cursor)
    local cursor_rules="$HOME/.cursor/rules"
    mkdir -p "$cursor_rules"
    cp "$REPO_DIR/AGENTS.md" "$cursor_rules/elias.mdc"
    echo "  Cursor: regla elias.mdc en $cursor_rules"
    ;;
  opencode)
    cp "$REPO_DIR/AGENTS.md" "$REPO_DIR/AGENTS.md"
    echo "  Opencode: usa AGENTS.md de la raíz."
    ;;
  openclaw)
    install_common "$HOME/.openclaw"
    ;;
  *)
    echo "  No se detectó una herramienta conocida. Instala las skills manualmente desde ./skills/"
    echo "  y copia AGENTS.md / CLAUDE.md a la raíz de tu proyecto."
    ;;
esac

echo ""
echo "=== Listo. Elias Agent instalado. ==="
echo "Reinicia tu herramienta para cargar las skills."
