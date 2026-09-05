# TDD Kit — disciplina de tests

El TDD no es un trámite: es la forma de pensar. Cada tarea de código pasa por el ciclo
completo y no se considera terminada sin la verificación correspondiente.

## Ciclo

1. **RED**: escribe el test que falla (define el comportamiento esperado antes del código).
2. **GREEN**: implementa lo mínimo para que pase.
3. **REFACTOR**: limpia sin cambiar comportamiento, con los tests protegiendo el cambio.

## Reglas

- No hay refactor sin tests que lo respalden.
- No se despliega con tests rojos. Nunca.
- Antes de declarar una tarea completa: tests pasando, build limpio, lint limpio.
- El test define el contrato. Si la spec cambia, el test cambia primero.

## Verificación (cómo se demuestra que algo funciona)

- Ejecutar los tests y citar la salida real: "verificado con 27 tests passing".
- Llamada real a la API con respuesta real: "GET /health → 200".
- Consulta contra BD real con seed: "SELECT devolvió 3 filas".
- Un "compile" no es verificación de funcionamiento: es solo IMPLEMENTADO.

## Estados

- IMPLEMENTADO: el código existe y compila.
- VERIFICADO: hay evidencia real de funcionamiento con salida visible citada por nombre.
- DESPLEGADO: corre en producción o preproducción y es accesible desde fuera.

## Pitfalls

- Declarar una fase completa sin verificarla contra el plan versionado.
- Reportar como "completado" algo que está solo implementado.
- Refactorizar sin red de tests.
- Ignorar un test que falla "porque es de integración".