
# Proyecto de Automatización QA - Backend con Karate DSL

Este repositorio contiene una suite de pruebas automatizadas para la API REST de usuarios de [ServeRest](https://serverest.dev/), desarrollada con **Karate DSL**. El objetivo es validar operaciones CRUD cubriendo escenarios positivos y negativos de manera eficiente.

---

##  Estructura del Proyecto

```
src
├── test
│   ├── java
│   │   ├── runners/
│   │   │   └── UserRunner.java
│   │   
│   └── resources
│       ├── features/
│       │   ├── getUsers.feature
│       │   ├── postUsers.feature
│       │   ├── getUserById.feature
│       │   ├── putUserId.feature
│       │   └── deleteUserId.feature
│       └── data/
│       |    └── usuarioEmailExistente.json
|       └── karate-config.js
└── README.md
```

---

##  Tecnologías utilizadas

-  Karate DSL
-  Java 8+
-  Maven 3.x
-  Markdown para documentación
-  ServeRest API 

---

##  Ejecución de pruebas

###  Usando userRunner

Cuenta con test configurados para probar cada feature.



###  Ver reportes

Una vez ejecutadas las pruebas, abre el siguiente archivo en tu navegador:

```
target/karate-reports/karate-summary.html
```

---

##  Endpoints cubiertos

| Feature                | Descripción                                |
|------------------------|---------------------------------------------|
| `getUsers.feature`     | Listar todos los usuarios                   |
| `postUsers.feature`    | Registrar usuarios (válido y con errores)   |
| `getUserById.feature`  | Buscar usuario existente o inexistente      |
| `putUserId.feature`    | Actualizar usuario por ID                   |
| `deleteUserId.feature` | Eliminar usuario existente o no existente   |

---

##  Configuración

El archivo [`karate-config.js`](./src/test/resources/karate-config.js) contiene la configuración global:

```js
function fn() {
  var config = {};
  config.baseUrl = 'https://serverest.dev';
  config.headers = { 'Content-Type': 'application/json' };
  return config;
}
```

---

##  Estrategia de Automatización

-  Escenarios positivos y negativos para cada endpoint
-  Generación de datos dinámicos con UUID
-  Manejo de datos externos en archivos `.json`
-  Estructura modular y reutilizable
-  Reportes automáticos en HTML

---

##  Licencia

Propia.

---

##  Autor

**David Angel Lopez Saavedra**  
 david22android@gmail.com  

---
