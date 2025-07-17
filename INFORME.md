
#  Estrategia de Automatización y Patrones

##  Objetivo

Validar todos los endpoints de la API de usuarios de [ServeRest](https://serverest.dev/) utilizando Karate DSL, aplicando buenas prácticas en automatización backend: cobertura completa de operaciones CRUD, uso de datos dinámicos, y separación de lógica y datos.

---

##  Estructura del Proyecto

El proyecto está organizado en carpetas que separan claramente los siguientes componentes:

- `features/`: archivos `.feature` por cada endpoint REST
- `runners/`: clases Java para ejecutar los features
- `data/`: archivos `.json` con datos externos
- `karate-config.js`: configuración global (baseUrl, headers)

---

##  Estrategia de pruebas

- **Cobertura completa** de los endpoints:
  - `GET /usuarios`
  - `POST /usuarios`
  - `GET /usuarios/{_id}`
  - `PUT /usuarios/{_id}`
  - `DELETE /usuarios/{_id}`
- **Casos positivos y negativos** por cada operación
- Validaciones de:
  - Estructura y tipos con `match`
  - Mensajes de éxito y error
  - Status codes esperados (`200`, `201`, `400`, etc.)

---

##  Generación dinámica de datos

- Se utiliza `UUID` para evitar duplicados en correos electrónicos (`email`)
- Correos únicos por ejecución → test independientes

---

##  Patrones aplicados

- **Reutilización de código:** configuración común en `karate-config.js`
- **Separación de datos y lógica:** uso de `data/*.json` para mantener los features limpios
- **Helper features (opcional):** se puede extender con archivos auxiliares para login, setup y teardown
- **Uso de `Background` en features:** para DRY (Don’t Repeat Yourself)

---

##  Reportes

Karate genera automáticamente un resumen en:

```
target/karate-reports/karate-summary.html
```

Que incluye resultados por escenario y pasos ejecutados.

---

##  Conclusión

Se logra una automatización robusta, legible, y fácil de mantener, con buena cobertura y alineada a prácticas modernas de testing backend en REST APIs.
