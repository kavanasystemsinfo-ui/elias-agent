#!/usr/bin/env bash
# Elias Agent — instalador multi-herramienta
# Detecta la herramienta activa y despliega AGENTS.md, CLAUDE.md y las skills a sus rutas nativas.
# Soporta: claude, codex, hermes, cursor, opencode, openclaw, antigravity, deepseek-harness (dsh).
# Uso: ./install.sh [--tool <nombre>] [--project <ruta>]
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(pwd)"

# --- Help ---
if [ "${1:-}" = "--help" ] || [ "${1:-}" = "-h" ]; then
  echo "Elias Agent installer — uso:"
  echo "  ./install.sh                          # detecta herramienta automáticamente"
  echo "  ./install.sh --tool <nombre>          # fuerza herramienta (claude|codex|hermes|cursor|opencode|openclaw|antigravity|dsh)"
  echo "  ./install.sh --project <ruta>         # instala en un proyecto concreto"
  echo "  ./install.sh --list                   # herramientas soportadas"
  exit 0
fi

if [ "${1:-}" = "--list" ]; then
  echo "herramientas soportadas: claude, codex, hermes, cursor, opencode, openclaw, antigravity, dsh"
  exit 0
fi

FORCE_TOOL=""
while [ $# -gt 0 ]; do
  case "$1" in
    --tool) FORCE_TOOL="$2"; shift 2;;
    --project) PROJECT_DIR="$2"; shift 2;;
    *) echo "Argumento desconocido: $1 (usa --help)"; exit 1;;
  esac
done

detect_tool() {
  if [ -n "${CLAUDE_CODE_ENTRYPOINT:-}" ] || [ -f "$PROJECT_DIR/.claude" ]; then echo "claude"; return; fi
  if [ -n "${OPENAI_CODE_FORMAT_VERSION:-}" ] || [ -d "$PROJECT_DIR/.codex" ]; then echo "codex"; return; fi
  if [ -n "${HERMES_HOME:-}" ] || [ -f "$HOME/.hermes/config.yaml" ]; then echo "hermes"; return; fi
  if [ -d "$HOME/.cursor" ]; then echo "cursor"; return; fi
  if [ -f "$HOME/.config/opencode" ]; then echo "opencode"; return; fi
  if [ -f "$HOME/.openclaw" ]; then echo "openclaw"; return; fi
  if [ -d "$PROJECT_DIR/.agents/rules" ]; then echo "antigravity"; return; fi
  if command -v dsh >/dev/null 2>&1 || [ -f "$PROJECT_DIR/.dsh" ]; then echo "dsh"; return; fi
  echo "unknown"
}

TOOL="${FORCE_TOOL:-$(detect_tool)}"
echo "=== Elias Agent installer ==="
echo "Herramienta detectada/forzada: ${TOOL}"
echo "Directorio: ${PROJECT_DIR}"

install_common_skills() {
  local dest="$1"
  mkdir -p "${dest}/skills"
  for skill in "$REPO_DIR"/skills/*.md; do
    [ -f "$skill" ] && cp "$skill" "${dest}/skills/"
  done
  echo "  → skills instaladas en ${dest}/skills/"
}

case "${TOOL}" in
  claude)
    cp "$REPO_DIR/CLAUDE.md" "$PROJECT_DIR/CLAUDE.md"
    install_common_skills "$PROJECT_DIR/.claude"
    echo "  Claude Code: CLAUDE.md + skills en .claude/skills/"
    ;;
  codex)
    # Codex usa AGENTS.md y skills en .codex/skills/ o AGENTS.md + skills/ global
    cp "$REPO_DIR/AGENTS.md" "$PROJECT_DIR/AGENTS.md"
    if [ ! -d "$PROJECT_DIR/.codex" ]; then mkdir -p "$PROJECT_DIR/.codex"; fi
    install_common_skills "$PROJECT_DIR/.codex"
    echo "  Codex: AGENTS.md + skills en .codex/skills/"
    ;;
  hermes)
    hermes_skills="${HERMES_HOME:-$HOME/.hermes}/profiles/$(basename "$PROJECT_DIR")/skills"
    if [ -d "${HERMES_HOME:-$HOME/.hermes}/skills" ]; then
      hermes_skills="${HERMES_HOME}/skills"
    fi
    mkdir -p "$hermes_skills"
    for skill in "$REPO_DIR"/skills/*.md; do
      [ -f "$skill" ] && cp "$skill" "$hermes_skills/"
    done
    echo "  Hermes: skills instaladas en $hermes_skills (reinicia para cargar)."
    ;;
  cursor)
    cursor_rules="$HOME/.cursor/rules"
    mkdir -p "$cursor_rules"
    cp "$REPO_DIR/AGENTS.md" "$cursor_rules/elias.mdc"
    echo "  Cursor: regla elias.mdc en $cursor_rules"
    ;;
  opencode)
    cp "$REPO_DIR/AGENTS.md" "$PROJECT_DIR/AGENTS.md"
    install_common_skills "$PROJECT_DIR/.opencode"
    echo "  Opencode: AGENTS.md + skills en .opencode/skills/"
    ;;
  openclaw)
    install_common_skills "$HOME/.openclaw"
    ;;
  antigravity)
    # Antigravity no ejecuta hooks programáticos: lee custom instructions y reglas en .agents/rules/
    rules_dir="$PROJECT_DIR/.agents/rules"
    mkdir -p "$rules_dir"
    cat > "$rules_dir/elias-agent.md" <<'EOF'
# Elias Agent — reglas (Google Antigravity)

Eres Elias, un agente de ingeniería profesional. Reglas de trabajo:

1. Entregables con tres estados: IMPLEMENTADO (existe y compila), VERIFICADO (evidencia real citada), DESPLEGADO (corriendo en producción). No reportes "completado" si es solo IMPLEMENTADO.
2. Publicación con read-back: tras subir algo, relee el destino real y comprueba que está íntegro.
3. Salvaguardas: un bloqueo ES la instrucción. Para, identifica qué salvaguarda saltó y pide el OK explícito con el comando exacto. No se esquiva un control.
4. Autonomía: ejecuta salvo en producto/cliente con impacto y operaciones irreversibles.
5. TDD como ADN: RED → GREEN → REFACTOR. Sin tests no hay refactor.
6. Flujo por tarea: ANALIZAR → DISEÑAR → IMPLEMENTAR (TDD) → VERIFICAR (tests+build+lint) → DOCUMENTAR → COMMIT.
7. Documentación: solo aprendizaje reutilizable, versionado con git.
EOF
    echo "  Antigravity: reglas en .agents/rules/elias-agent.md"
    ;;
  dsh|deepseek-harness)
    # DeepSeek Harness: todo es un plugin; skills se cablean como plugin o se inyectan vía AGENTS.md
    cp "$REPO_DIR/AGENTS.md" "$PROJECT_DIR/AGENTS.md"
    if [ -d "$PROJECT_DIR/plugins" ]; then
      mkdir -p "$PROJECT_DIR/plugins/elias-agent"
      for skill in "$REPO_DIR"/skills/*.md; do
        [ -f "$skill" ] && cp "$skill" "$PROJECT_DIR/plugins/elias-agent/"
      done
      echo "  dsh: AGENTS.md + skills como plugin en plugins/elias-agent/"
    else
      echo "  dsh: AGENTS.md copiado. Para skills como plugin, crea plugins/elias-agent/ (ver https://deepseek-harness.github.io)."
    fi
    ;;
  *)
    echo "  No se detectó herramienta conocida. Usa --tool <nombre>."
    echo "  Soportadas: claude, codex, hermes, cursor, opencode, openclaw, antigravity, dsh"
    echo "  Mínimo portable: copia AGENTS.md y CLAUDE.md a la raíz del proyecto y skills/ donde tu herramienta las lea."
    ;;
esac

echo ""
echo "=== Listo. Elias Agent instalado en ${PROJECT_DIR}. ==="
echo "Reinicia tu herramienta para cargar las skills."