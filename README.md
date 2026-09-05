# Elias Agent

Tu agente profesional reencarnable. Un kit completo de identidad, metodología y
skills para trabajar con IA de forma rigurosa en cualquier herramienta: Claude Code,
Codex, Cursor, Hermes, OpenClaw o la que venga mañana.

Elias no es un prompt bonito: es una forma de trabajo. Trae consigo las reglas que
separan a un agente que improvisa de uno que entrega: estados de trabajo verificables,
publicación con read-back, salvaguardas que se respetan, autonomía con límites claros,
TDD como ADN, documentación con evidencia.

## Qué incluye

- `AGENTS.md` — la identidad y las reglas del agente (compatible con Claude Code, Codex, Cursor, Hermes y cualquier herramienta que lea AGENTS.md)
- `CLAUDE.md` — la misma identidad en el formato de Claude Code
- `skills/` — habilidades reutilizables instalables en cualquier agente:
  - `goal-engineering` — define QUÉ antes de CÓMO: contexto, objetivo, entregables, límites, definición de completado
  - `quality-directive` — los tres estados (IMPLEMENTADO / VERIFICADO / DESPLEGADO), publicación con read-back, bloqueos de salvaguarda
  - `tdd-kit` — disciplina de tests como forma de pensar, no como trámite
  - `engineering-standard` — filosofía de ingeniería: YAGNI, ADRs, auditorías, código limpio
  - `work-strategy` — flujo obligatorio por tarea: analizar, diseñar, implementar, verificar, documentar
  - `toolbox` — inventario vivo de herramientas aprendidas (por qué se usan y cómo instalarlas)
- `install.sh` — detecta tu herramienta y despliega Elias en segundos

## Instalación

```bash
git clone https://github.com/kavanasystemsinfo-ui/elias-agent.git
cd elias-agent
./install.sh
```

El instalador detecta la herramienta activa (Claude Code, Codex, Cursor, Hermes,
OpenClaw, Gemini CLI) y copia AGENTS.md, CLAUDE.md y las skills a sus rutas nativas.

## Cómo es trabajar con Elias

- **No improvisa el cierre**: cada entregable se reporta con su estado real. "Implementado" no es "completado".
- **No publica sin verificar**: después de subir algo, relee el destino real y comprueba que está íntegro.
- **No escurre controles**: si una salvaguarda bloquea, para y pide el OK con el comando exacto.
- **Ejecuta**: autonomía salvo en producto, cliente y operaciones irreversibles.
- **Aprende**: cada herramienta que conoce entra en el toolbox y se queda documentada.

## Proyecto

Elias Agent es un proyecto de KAVANA Systems (Jorge Adán). Construido desde la
experiencia real de operar agentes en producción: portfolio, SaaS y búsqueda de empleo.
El repo privado `kavana-agent` es el genoma original; este repo es su versión pública
y empaquetable.

## Licencia

Apache 2.0.