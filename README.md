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
- `toolbox/` — el inventario inicial: herramientas, repos y lecciones aprendidas hasta hoy (rtk incluido)
- `install.sh` — detecta tu herramienta y despliega Elias en segundos

## 💰 Cómo está construido y cómo lo construiría con presupuesto

Elias Agent es una pieza de portafolio mantenida para un solo usuario real y con coste
objetivo de 0 €/mes. Cada decisión de esta versión pública está tomada con ese presupuesto
encima de la mesa: se elige lo que resuelve el problema sin cuota, y lo que se descarta por
precio se dice aquí en lugar de disimularlo. Lo que sigue separa lo que hay hoy de lo que
cambiaría si el proyecto tuviera presupuesto real.

- **Modelos de IA:** ninguna regla del repo depende de un modelo concreto. `AGENTS.md`, `CLAUDE.md`, `skills/` y `toolbox/` son ficheros Markdown, y `install.sh` solo detecta la herramienta que ya está en la máquina (Claude Code, Codex, Cursor, Hermes, OpenClaw, Gemini CLI, Opencode, Antigravity, DeepSeek Harness). No hay claves de API, cuotas ni contratos de ningún proveedor dentro del repo. Con usuarios reales o con presupuesto: la herramienta dejaría de elegirse por lo que sale gratis y se fijaría por capacidad; los tres estados y el read-back se quedan como están.
- **Ejecución en una sola máquina:** `install.sh` copia `AGENTS.md`, `CLAUDE.md` y `skills/` a las rutas locales de la herramienta detectada y ahí se queda. No hay servicio propio, ni contenedores, ni configuración de CI en el repo. Con usuarios reales o con presupuesto: distribución publicada (paquete o CDN), despliegue automatizado y verificación en cada push, en lugar de copia manual máquina por máquina.
- **Memoria y almacenamiento en ficheros:** el conocimiento del agente son ficheros Markdown versionados en git (`skills/`, `toolbox/`), con la regla de que el histórico no se borra y lo obsoleto se marca. Eso le permite sobrevivir a la máquina, a la sesión y a la herramienta. Con usuarios reales o con presupuesto: memoria en un servicio con base de datos e indexado, a cambio de perder lo que da git (se revisa, se revierte, se lee sin depender de nada corriendo).
- **Secretos en ficheros con permisos:** hoy no hay ningún secreto en el repo. `.gitignore` excluye `.env` y sus variantes, anotado como "Secretos (auditoria de seguridad)", y la skill `toolbox` prohíbe guardar claves y tokens aunque el fichero esté en un repo privado. Los secretos quedan fuera de git, en el entorno local. Con usuarios reales o con presupuesto: gestor de secretos con rotación y auditoría, en lugar de ficheros de entorno.
- **Observabilidad por scripts:** la única instrumentación es la salida de los propios comandos y `rtk gain`, que da las métricas acumuladas de ahorro de tokens (el repo cita 46-61% medido en comandos típicos). No hay panel, ni métricas que salgan de la máquina, ni alertas. Con usuarios reales o con presupuesto: panel y alertas, para saber qué pasa sin estar delante del terminal.
- **Verificación por ejecución:** nada se declara terminado sin salida real. Los tres estados (IMPLEMENTADO / VERIFICADO / DESPLEGADO), la publicación con read-back y la evidencia citada por nombre ("verificado con 27 tests", "GET /health → 200") son la forma de comprobar que algo funciona. Con usuarios reales o con presupuesto: la regla no cambia; cambiaría el volumen (CI, entornos de preproducción), no el criterio.
- **Mantenimiento para un usuario real:** el repo nace de operar agentes en producción para una sola persona, con portafolio, SaaS y búsqueda de empleo como casos reales, y `AGENTS.md` define al agente como la capa de ingeniería de su propietario. Con usuarios reales o con presupuesto: multiusuario, documentación de adopción y soporte, que hoy no existen porque no hay nadie más a quien atender.

Lo que no cambia entre los dos escenarios es la metodología: los tres estados con evidencia
citada por nombre, la publicación con read-back, las salvaguardas que se respetan en vez de
esquivarse, el TDD como ADN y el flujo ANALIZAR → DISEÑAR → IMPLEMENTAR (TDD) → VERIFICAR →
DOCUMENTAR → COMMIT. El presupuesto compra infraestructura, no criterio: un agente con dinero
y sin evidencia sigue reportando implementado como si fuera desplegado. Todo lo que hay en
`AGENTS.md`, `CLAUDE.md` y `skills/` es independiente del modelo y de la máquina, y por eso
sobrevive a cualquier cambio de presupuesto.

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