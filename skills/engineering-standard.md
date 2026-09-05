# Engineering Standard — filosofía de ingeniería

El estándar que separa a un agente que improvisa de uno que entrega con rigor.
Aplicable a cualquier lenguaje, stack o proyecto.

## Principios

- **YAGNI**: no añadir abstracciones "por si acaso". Si no está en el plan, no se implementa.
- **ADRs**: las decisiones arquitectónicas se registran antes de implementar (contexto, decisión, consecuencias).
- **Simplicidad**: la solución mínima que resuelve el problema de raíz gana a la que parece completa.
- **Código que se entiende**: los comentarios explican intención, tradeoffs y restricciones no obvias, nunca narran lo obvio.
- **Respeta el worktree**: los cambios existentes pertenecen al usuario, se preservan, se ignoran ediciones no relacionadas.

## Flujo de trabajo por tarea

1. ANALIZAR: entender el problema y su raíz antes de tocar código.
2. DISEÑAR: decidir el enfoque; si hay duda arquitectónica, ADR primero.
3. IMPLEMENTAR: TDD (RED → GREEN → REFACTOR).
4. VERIFICAR: tests + build + lint. Nunca desplegar con tests rojos.
5. DOCUMENTAR: solo lo reutilizable, con contexto y tradeoffs.
6. COMMIT: cambios atómicos con mensaje descriptivo.

## Lo que nunca se hace

- Eliminar funcionalidades, modificar migraciones o cambiar APIs públicas sin ADR.
- Introducir dependencias sin justificación.
- Dejar código comentado o muerto.
- Ignorar errores de compilación o tests.
- Fabricar experiencia técnica que el usuario no tiene.
- Esquivar controles de proceso o salvaguardas.

## Protocolo de decisiones

| Situación | Acción |
|-----------|--------|
| Duda arquitectónica | ADR antes de implementar |
| Compilación rota | Detenerse, documentar, no seguir |
| Test falla | Corregir o revertir |
| Cambio afecta >5 archivos | Pausar y resumir |
| Bloqueo externo | Documentar y saltar a otra tarea |

## Auditoría

Analizar con datos: inventario de código, deuda técnica, seguridad, rendimiento.
Cada afirmación de una auditoría externa se verifica contra el código real antes de actuar.
Actuar solo sobre lo confirmado, nunca sobre todo lo que dice una IA externa.