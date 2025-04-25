# QA Automation Junior Plawyright - Yrvin Pachas- Inetum 🤖
Repositorio del proyecto de automatización de QA del **Frontend** de SauceDemo 🤖 utilizando el framework de Playwright con Cucumber utilizando patron de diseño Page Object Model (POM).

## Estructura del proyecto

El proyecto cuenta con la siguiente estructura de carpetas:

```
PRUEBAFRONT/
├── node_modules/                  # Dependencias del proyecto
├── screenshots/                   # Capturas generadas automáticamente tras fallos o evidencias
├── src/
│   └── test/
│       ├── features/              # Archivos Gherkin (.feature) con los escenarios de prueba 
│       │   ├── login.feature
│       │   └── shoppingCart.feature
│       ├── pageObjects/          # Implementación del Page Object Model (POM)
│       │   ├── appPage.ts        # Clase genérica o principal para navegación o funciones comunes
│       │   └── loginPage.ts      # Clase específica para manejar interacciones con la página de login
│       ├── steps/                # Definición de pasos de Cucumber enlazados con los features
│       │   ├── login_step.ts
│       │   └── shoppingCart_step.ts
│       └── utiles/               # Código de soporte como hooks, fixtures, etc.
│           ├── hooks.ts          # Hooks globales de Cucumber (before, after, etc.)
│           └── pageFixture.ts    # Inicialización y uso compartido del contexto de Playwright
├── .env                           # Variables de entorno del proyecto
├── .gitignore                     # Archivos y carpetas excluidos del control de versiones
├── cucumber-report.html           # Reporte de pruebas generado por Cucumber
├── cucumber.json                  # Configuración y resultados de pruebas en formato JSON
├── package.json                   # Dependencias, scripts y metadata del proyecto
├── package-lock.json              # Versiones exactas de las dependencias instaladas
├── playwright.config.ts           # Configuración personalizada de Playwright
├── README.md                      # Documentación del proyecto
└── tsconfig.json                  # Configuración de TypeScript
```

+ El archivo `.env`: Es donde va las variables globales a utilizar en el proyecto, si en todo caso se desea ejecutar en un ambiente de `qa` o `dev`, estas variables se pueden ajustar de acuerdo a la necesidad, sin embargo para este proyecto se utiliza el brindado para la resolución de la prueba técnica.

+ La carpeta `screenshots`: Es una carpeta que contiene captura de pantalla de los test ejecutados

+ La carpeta `src/test/features`: Es una carpeta que contiene los features con escenarios de prueba redactados en Gherkin para que sean definidos en los steps.

+ La carpeta `src/test/pagesObjects`: Es una carpeta que contiene las clases con la inicialización de los elementos de FrontEnd ademas de metodos para que se pueda reutilizar en los steps.

+ La carpeta `src/test/steps`: Es una carpeta que contiene los archivos de pasos con acciones de los escenarios de prueba con extension `.steps.ts` segun los features declarados previamente.

+ El archivo `hooks.ts`: Es un archivo de hooks de Cucumber, estos permiten definir acciones que se realizan antes o despues de la ejecución de cada escenario.

+ El archivo `pagefixture.ts`: Es un archivo que define un objeto `fixture` que se utiliza para compartir instancias comunes entre diferentes partes del proyecto.

## Inicialización del proyecto

Para ejecutar en tu ordenador el siguiente proyecto, sigue los siguientes pasos:

1. **Clonar el Repositorio**

Clona este repositorio en tu máquina local usando el siguiente comando:

```bash
   git clone https://github.com/MonoSama/InetumFrontQA.git
```

2. **Instalar Dependencias**

Una vez clonado, abrir el proyecto en Visual Studio Code (VS Code) y abrir una terminal de comandos nueva dentro del proyecto, donde escribiremos:

```bash
    npm install
```

3. **Configuración del navegador**
En el archivo `hooks.ts` se define el navegador que se va a utilizar, este navegador se va a configurar de acuerdo a sus necesidades:

    ```ts
    Before(async function(){
        browser = await chromium.launch({
            headless: false, 
            //channel: 'msedge' <==DESCOMENTAR ESTA LÍNEA DE CÓDIGO SI SE DESEA USAR EDGE O CAMBIAR OTRO CHANEEL
        });
        context = await browser.newContext()
        page = await context.newPage()
        pageFixture.page = await page;
        page.setViewportSize({
            width: 1500, 
            height: 700,
        });
    })
    ```
En el archivo `playwright.config.ts` se definen los navegadores que podemos utilizar

4. **Ejecutar Proyecto**

En la terminal de comandos para correr todos los escenarios ingresar: 

```bash
    npm run test   
```
Si se desea ejecutar un escenario en específico se debe poner en la terminal lo siguiente 

```bash
    npx cucumber-js --tags="@Scenario03"   
```

6. **Reporte HTML**

Para la generación del reporte de ha usado un After en el archivo `hooks.ts` el cual hará que al final de una ejecución se ctualizará el archivo `cucumber-report.html` con respecto a la última ejecución realizada, este traerá consigo capturas de pantalla que evidencian que los test se llevaron de manera corrrecta.
