# Calculadores del Coeficiente de Gini

Este repositorio contiene dos implementaciones del cálculo del coeficiente de Gini a partir de datos de distribución acumulada del ingreso por quintiles.
=======
Curso: IC-8052 Lenguajes de Programación  
Tema: Programación Procedimental 
Estudiantes: Santiago Calderon y Fabricio Monge 

Las soluciones fueron desarrolladas como parte del Proyecto 1 del curso de Lenguajes de Programación, con el objetivo de aplicar el paradigma de programación procedimental mediante lenguajes imperativos.

## Soluciones incluidas

El proyecto incluye dos versiones del programa:

* **Solución en C**
* **Solución en Pascal**

Ambas soluciones implementan el mismo algoritmo general:

1. Solicitar el nombre del país.
2. Solicitar los porcentajes acumulados del ingreso para el 20%, 40%, 60%, 80% y 100% de la población.
3. Validar que los datos ingresados sean correctos.
4. Calcular el área bajo la curva de Lorenz mediante la regla del trapecio.
5. Calcular el coeficiente de Gini.
6. Clasificar el resultado según el valor obtenido.
7. Permitir calcular el coeficiente para más de un país.

## Estructura del proyecto

```txt
calculadores-coeficiente-Gini/
├── README.md
├── Docs/
│   ├── Comparacion_Soluciones_Gini.docx
│   └── Images/
│       ├── Diagrama_Nassi_Gini_C.png
│       ├── Gini_nassi-principal-pascal.png
│       ├── Gini_nassi-datos-pascal.png
│       ├── Gini_nassi-calculo-pascal.png
│       └── Gini_nassi-clasificacion-pascal.png
└── Solutions/
    ├── C/
    │   ├── main.c
    │   ├── entrada.c
    │   ├── entrada.h
    │   ├── validacion_entrada.c
    │   ├── validacion_entrada.h
    │   ├── gini.c
    │   ├── gini.h
    │   ├── clasificacion.c
    │   ├── clasificacion.h
    │   ├── constantes.h
    │   └── README.md
    └── Pascal/
        ├── project1.lpr
        ├── project1.lpi
        ├── pais_gini.pas
        ├── entrada_gini.pas
        ├── calculo_gini.pas
        ├── clasificacion_gini.pas
        └── README.md
```

## Solución en C

La solución en C está ubicada en:

```txt
Solutions/C/
```

Esta versión está organizada en varios módulos para separar responsabilidades:

* `main.c`: controla el flujo principal del programa.
* `entrada.c`: solicita datos al usuario.
* `validacion_entrada.c`: valida el formato de entrada y evita errores por datos no numéricos.
* `gini.c`: valida los datos acumulados y calcula el área de Lorenz y el índice de Gini.
* `clasificacion.c`: clasifica el resultado obtenido.
* `constantes.h`: centraliza constantes generales del programa.

Para compilar desde la carpeta `Solutions/C`:

```bash
gcc main.c entrada.c validacion_entrada.c gini.c clasificacion.c -o gini
```

En Windows:

```powershell
gcc main.c entrada.c validacion_entrada.c gini.c clasificacion.c -o gini.exe
```

Para ejecutar en Windows:

```powershell
.\gini.exe
```

Para ejecutar en Linux, macOS o terminales tipo Unix:

```bash
./gini
```

## Solución en Pascal

La solución en Pascal está ubicada en:

```txt
Solutions/Pascal/
```

Esta versión también está organizada mediante unidades para separar responsabilidades:

* `project1.lpr`: archivo principal del programa.
* `pais_gini.pas`: lectura y validación del nombre del país.
* `entrada_gini.pas`: lectura y validación de los porcentajes acumulados.
* `calculo_gini.pas`: cálculo del coeficiente de Gini mediante la regla del trapecio.
* `clasificacion_gini.pas`: clasificación del resultado obtenido.

Para compilar desde la carpeta `Solutions/Pascal`:

```bash
fpc project1.lpr
```

En Windows, esto genera el archivo:

```txt
project1.exe
```

Para ejecutar:

```powershell
.\project1.exe
```

## Fórmula utilizada

El cálculo se basa en la curva de Lorenz y en la regla del trapecio.

Primero se calcula el área bajo la curva de Lorenz:

```txt
Área = suma de las áreas de los trapecios
```

Luego se calcula el coeficiente de Gini:

```txt
Gini = 1 - 2 * Área
```

## Clasificación del índice de Gini

La clasificación utilizada en ambas soluciones es la siguiente:

```txt
Gini < 0.30        Muy buena distribución del ingreso
0.30 ≤ Gini < 0.35 Buena distribución del ingreso
0.35 ≤ Gini < 0.40 Distribución regular del ingreso
0.40 ≤ Gini < 0.45 Distribución desigual del ingreso
0.45 ≤ Gini ≤ 0.50 Mala distribución del ingreso
Gini > 0.50        Enorme desigualdad del ingreso
```

## Ejemplo de prueba

Con los siguientes datos para Estados Unidos:

```txt
20%  -> 3.1
40%  -> 11.3
60%  -> 25.2
80%  -> 47.8
100% -> 100
```

El resultado esperado es:

```txt
Área bajo la curva de Lorenz: 0.2748
Coeficiente de Gini: 0.4504
Clasificación: Mala distribución del ingreso
```

## Documentación comparativa

El documento comparativo entre ambas soluciones se encuentra en:

```txt
Docs/Comparacion_Soluciones_Gini.docx
```

Este documento describe las diferencias entre las implementaciones en C y Pascal, considerando aspectos como modularidad, validación de datos, cohesión, acoplamiento, legibilidad y mantenimiento.

## Archivos generados

Durante la compilación pueden generarse archivos ejecutables o intermedios, como:

```txt
*.exe
*.o
*.ppu
```

Estos archivos no forman parte del código fuente principal y no son necesarios para revisar la solución. Por lo tanto, no deben incluirse en la entrega final, salvo que el profesor lo solicite explícitamente.