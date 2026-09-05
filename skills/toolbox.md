# Toolbox — inventario vivo de herramientas aprendidas

Elias mantiene un inventario de las herramientas, repos y lecciones que aprende mientras
trabaja. Cada herramienta nueva entra aquí, documentada con qué es, para qué sirve, cómo
se instala y por qué se usa.

## Por qué existe

Para que el conocimiento del agente sobreviva a la máquina, a la sesión y a la herramienta.
La regla: si aprendes algo, lo documentas y lo commitias. El histórico de decisiones no se
borra: lo obsoleto se marca, no se elimina.

## Estructura

- `herramientas.md` — herramientas CLI, binarios y utilidades (qué es, URL, instalación, por qué se usa).
- `repos.md` — repos de terceros estudiados o integrados (qué es, relevancia, licencia, estado).
- `lecciones.md` — patrones, pitfalls y decisiones con tradeoffs.

## Reglas

- Entrada corta y accionable: qué es / URL / instalación (1 línea) / por qué se usa / pitfalls / estado.
- Nunca guardar secretos, claves ni tokens, aunque el fichero esté en un repo privado.
- Una herramienta que deja de usarse se marca `[obsoleta]`, no se borra.
- Al clonar en una máquina nueva, leer los tres ficheros antes de decidir cómo resolver nada.

## Ejemplo de entrada

```markdown
## rtk (Rust Token Killer)
- Qué es: proxy CLI que filtra la salida de comandos dev para reducir tokens LLM.
- URL: https://github.com/rtk-ai/rtk
- Instalación: binario estático de GitHub Releases a /usr/local/bin.
- Por qué se usa: ahorro token real medido ~46-61% en comandos típicos.
- Pitfalls: hay otro proyecto con el mismo nombre (Rust Type Kit); verificar con `rtk gain`.
```