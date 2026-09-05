# Lecciones — patrones, pitfalls y decisiones con tradeoffs

## Patrones

- **Herramientas con hook de agente**: evaluar SIEMPRE con medición real en el entorno antes de activar (rtk: 46-61% de ahorro medido > confiar en el claim del README).
- **Fail-open como requisito**: cualquier herramienta que se enchufe al agente (hooks, plugins) debe degradar a comportamiento original sin bloquear.

## Pitfalls

- **Nombres de proyectos colisionados**: "rtk" son dos proyectos distintos (Token Killer vs Type Kit). Verificar instalación con el comando de diagnóstico que distingue.
- **install.sh que apunta a rama equivocada**: el script de instalación de rtk usa `refs/heads/master` pero la rama por defecto del repo es `develop`. Descargar siempre el asset de GitHub Releases si el script falla.

## Decisiones con tradeoffs

- **Activar hooks en todos los perfiles**: rtk activo en los perfiles principales del operador; otros perfiles sin activar. Reversible con un comando. Si un perfil se comporta raro, `rtk proxy` como escape.