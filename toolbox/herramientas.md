# Herramientas — inventario de Elias

Inventario vivo de herramientas que Elias ha aprendido. Cada entrada documenta qué es,
para qué sirve, cómo se instala y por qué se usa. Cuando el agente aprende algo nuevo,
añade aquí su entrada con commit.

## rtk (Rust Token Killer)

- **Qué es**: proxy CLI que filtra y comprime la salida de comandos dev (git, ls, find, grep, cat, builds) antes de que un agente LLM la lea, reduciendo tokens de entrada.
- **URL**: https://github.com/rtk-ai/rtk (Apache 2.0). Web: https://www.rtk-ai.app
- **Instalación**: binario estático de GitHub Releases a `/usr/local/bin` (cero dependencias) o `cargo install --git https://github.com/rtk-ai/rtk`. macOS: `brew install rtk`.
- **Integración con agentes**: `rtk init --agent <hermes|claude|codex|cursor|...>` instala el hook que reescribe comandos antes de ejecutarlos. Fail-open: si rtk falla, se ejecuta el comando original sin bloquear.
- **Por qué se usa**: ahorro token real medido del 46-61% en comandos típicos; `rtk gain` da las métricas acumuladas.
- **Pitfalls**: hay otro proyecto con el mismo nombre (Rust Type Kit, reachingforthejack/rtk) — verificar la instalación con `rtk gain`. El install.sh del repo apunta a master; para releases usar el asset directo.
- **Para salida cruda**: `rtk proxy <cmd>` ejecuta sin filtrar.