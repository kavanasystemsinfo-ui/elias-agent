# Repos — repos de terceros estudiados o integrados

## rtk-ai/rtk — Rust Token Killer

- **Qué es**: proxy CLI de compresión de salida para agentes LLM. Proyecto muy activo (78K+ estrellas, Apache 2.0, releases semanales).
- **Relevancia para Elias**: referencia de agentic coding con plugin oficial para Hermes y otros agentes. Arquitectura: proxy pattern en 6 fases (parse → route → execute → filter → print → track), módulos por ecosistema en `src/cmds/`.
- **Por qué importa**: cualquier agente que trabaje en terminal puede reducír su consumo de tokens de salida entre 45-60% con una configuración mínima.
- **Licencia**: Apache 2.0.
- **Estado**: analizado, instalado y operativo (2026-09-05).
## deepseek-harness (dsh)

- **Qué es**: harness de agentes open source de DeepSeek AI ("everything-is-a-plugin"). 213K+ estrellas, MIT, developer preview.
- **URL**: https://github.com/deepseek-ai/deepseek-harness
- **Instalación**: `npx @deepseek-ai/dsh web` (Web UI en :3080).
- **Por qué se usa**: superficie adicional para desplegar Elias; soportado por `install.sh --tool dsh`.
- **Pitfalls**: developer preview con breaking changes.
