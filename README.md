# Calculadores del Coeficiente de Gini

Curso: IC-8052 Lenguajes de Programación  
Tema: Programación Procedimental 
Estudiantes: Santiago Calderon y Fabricio Monge 

## Descripción general

Este repositorio contiene múltiples soluciones para calcular el **coeficiente de Gini** de un país a partir de los datos acumulados de distribución del ingreso por quintiles.

El coeficiente de Gini se calcula utilizando la fórmula:

```txt
g = 1 - 2 * área bajo la curva de Lorenz
```

El área bajo la curva de Lorenz se aproxima mediante la **regla del trapecio**.

## Estructura del repositorio

```txt
calculadores-coeficiente-Gini/
├── README.md (este archivo)
├── Docs/
│   └── Images/
├── Solutions/
│   ├── C/
│   │   ├── main.c
│   │   ├── entrada.c / entrada.h
│   │   ├── validacion_entrada.c / validacion_entrada.h
│   │   ├── gini.c / gini.h
│   │   ├── clasificacion.c / clasificacion.h
│   │   ├── constantes.h
│   │   └── README.md
│   └── Pascal/
│       ├── project1.lpr
│       ├── project1.lpi
│       ├── project1.lps
│       └── README.md
```

## Soluciones disponibles

### [Solución en C](Solutions/C/README.md)

Implementación en lenguaje C con enfoque procedimental estructurado. Incluye validación de entrada y manejo de datos con funciones dedicadas.

### [Solución en Pascal](Solutions/Pascal/README.md)

Implementación en lenguaje Pascal usando Free Pascal (FPC) compilado en el IDE Lazarus. Permite calcular múltiples países en una sola ejecución.

## Datos de entrada

El programa solicita:

1. Nombre del país
2. Porcentajes acumulados del ingreso para los quintiles:
   - 20% de la población
   - 40% de la población
   - 60% de la población
   - 80% de la población
   - 100% de la población

## Ejemplo rápido

Datos para Estados Unidos:
- 20%: 3.1
- 40%: 11.3
- 60%: 25.2
- 80%: 47.8
- 100%: 100

Resultado: Coeficiente de Gini = 0.4504

Para información detallada sobre compilación, ejecución y ejemplos completos, consulta el README específico de cada solución.
