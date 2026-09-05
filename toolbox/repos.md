# Repos — repos de terceros estudiados o integrados

## rtk-ai/rtk — Rust Token Killer

- **Qué es**: proxy CLI de compresión de salida para agentes LLM. Proyecto muy activo (78K+ estrellas, Apache 2.0, releases semanales).
- **Relevancia para Elias**: referencia de agentic coding con plugin oficial para Hermes y otros agentes. Arquitectura: proxy pattern en 6 fases (parse → route → execute → filter → print → track), módulos por ecosistema en `src/cmds/`.
- **Por qué importa**: cualquier agente que trabaje en terminal puede reducír su consumo de tokens de salida entre 45-60% con una configuración mínima.
- **Licencia**: Apache 2.0.
- **Estado**: analizado, instalado y operativo (2026-09-05).