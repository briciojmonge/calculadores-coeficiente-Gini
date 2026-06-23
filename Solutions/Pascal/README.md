# Proyecto 1 - Índice de Gini

Curso: IC-8052 Lenguajes de Programación  
Tema: Programación Procedimental  

## Descripción

Este programa calcula el coeficiente de Gini de un país a partir de los datos acumulados de distribución del ingreso por quintiles.

El cálculo se realiza utilizando la fórmula:

```txt
g = 1 - 2 * área bajo la curva de Lorenz
```

El área bajo la curva de Lorenz se aproxima mediante la regla del trapecio.

## Lenguaje utilizado

El proyecto fue desarrollado en lenguaje Pascal, siguiendo un enfoque de programación procedimental y estructurada. Se utiliza Free Pascal (FPC) compilado bajo el IDE Lazarus.

## Estructura del proyecto

```txt
Solutions/Pascal/
├── project1.lpr
├── project1.lpi
├── project1.lps
├── prueba.pas
├── backup/
│   ├── project1.lpi
│   ├── project1.lpr
│   └── project1.lps
├── lib/
│   └── i386-win32/
│       └── project1.compiled
├── README.md
├── Gini_nassi-principal-pascal.png
├── Gini_nassi-datos-pascal.png
├── Gini_nassi-calculo-pascal.png
└── Gini_nassi-clasificacion-pascal.png
```

## Descripción de archivos

- `project1.lpr`: archivo principal del programa que contiene toda la lógica.
- `project1.lpi`: archivo de configuración del proyecto Lazarus.
- `project1.lps`: archivo de sesión del proyecto Lazarus.
- `prueba.pas`: archivo de pruebas (opcional).

## Procedimientos y Funciones principales

- `leer_datos_pais()`: lee los datos de entrada (porcentajes acumulados del ingreso).
- `CalcularGini()`: calcula el índice de Gini utilizando la regla del trapecio.
- `ClassificarGini()`: clasifica el país según el valor del índice de Gini obtenido.
- `Main()`: controla el flujo principal del programa.

## Diagramas de flujo

El programa incluye diagramas Nassi-Schneiderman para visualizar el flujo de control:

- `Gini_nassi-principal-pascal.png`: diagrama del procedimiento principal.
- `Gini_nassi-datos-pascal.png`: diagrama de lectura de datos.
- `Gini_nassi-calculo-pascal.png`: diagrama del cálculo del coeficiente de Gini.
- `Gini_nassi-clasificacion-pascal.png`: diagrama de clasificación del país.

## Compilación

Para compilar el programa, ejecutar en Lazarus:

1. Abrir el archivo `project1.lpi` en Lazarus.
2. Presionar `Ctrl+F9` o ir a **Run > Build**.
3. El ejecutable se generará como `project1.exe`.

Alternativamente, desde la línea de comandos con Free Pascal:

```bash
fpc project1.lpr -o project1.exe
```

## Ejecución

Para ejecutar el programa en Windows PowerShell:

```powershell
.\project1.exe
```

## Datos solicitados al usuario

El programa solicita:

1. Nombre del país.
2. Porcentaje acumulado del ingreso para el 20% de la población.
3. Porcentaje acumulado del ingreso para el 40% de la población.
4. Porcentaje acumulado del ingreso para el 60% de la población.
5. Porcentaje acumulado del ingreso para el 80% de la población.
6. Porcentaje acumulado del ingreso para el 100% de la población.

Los valores deben ingresarse como porcentajes. Por ejemplo, para 3.1%, se debe digitar:

```txt
3.1
```

Internamente, el programa convierte ese valor a decimal dividiéndolo entre 100.

El programa permite calcular el coeficiente de Gini para múltiples países en una sola ejecución. Para finalizar, ingrese "salir" cuando se le pida el nombre del país.

## Ejemplo de prueba

Datos para Estados Unidos:

```txt
Nombre del país: Estados Unidos
20%: 3.1
40%: 11.3
60%: 25.2
80%: 47.8
100%: 100
```

Resultado esperado:

```txt
Coeficiente de Gini: 0.4504
Clasificación: Distribución desigual del ingreso
```

## Clasificación del Índice de Gini

El programa clasifica los países según el índice de Gini calculado:

- **Gini < 0.30**: Muy buena distribución del ingreso
- **0.30 ≤ Gini < 0.35**: Buena distribución del ingreso
- **0.35 ≤ Gini < 0.40**: Distribución regular del ingreso
- **0.40 ≤ Gini < 0.45**: Distribución desigual del ingreso
- **0.45 ≤ Gini < 0.50**: Mala distribución del ingreso
- **Gini ≥ 0.50**: Enorme desigualdad del ingreso
