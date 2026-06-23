# Revision Comparativa de las Soluciones para el Calculo del Coeficiente de Gini

Curso: IC-8052 Lenguajes de Programacion  
Tema: Programacion Procedimental  
Repositorio: calculadores-coeficiente-Gini

## Objetivo del documento

Este documento presenta una revision tecnica y academica de las dos soluciones implementadas en el repositorio para calcular el coeficiente de Gini a partir de porcentajes acumulados de ingreso por quintiles. La revision se organiza por solucion y concluye con una comparacion directa entre ambas propuestas.

## Criterios de revision considerados

1. Estructura general del programa.
2. Separacion de responsabilidades.
3. Validacion de la entrada.
4. Correctitud del calculo del coeficiente de Gini.
5. Facilidad de compilacion y ejecucion.
6. Legibilidad y mantenibilidad.
7. Calidad de la documentacion y apoyo grafico.

## Revision de la solucion en C

### 1. Descripcion general

La solucion en C sigue un enfoque procedimental modular. La logica principal se distribuye entre varios archivos fuente y encabezados: `main.c` coordina la ejecucion, `entrada.c` se encarga de la captura de datos, `validacion_entrada.c` concentra apoyo a la validacion de texto y numeros, `gini.c` realiza el calculo matematico y `clasificacion.c` produce la salida interpretativa del resultado.

### 2. Estructura y organizacion

La estructura es uno de los puntos mas fuertes de esta solucion. El uso combinado de archivos `.c` y `.h` define con claridad la interfaz de cada modulo y reduce el acoplamiento conceptual entre componentes. Tambien es positivo que las constantes globales se ubiquen en `constantes.h`, lo que evita valores magicos repetidos y hace mas sencillo modificar parametros como el numero de puntos o la longitud maxima del nombre del pais.

Desde el punto de vista de mantenibilidad, esta organizacion facilita localizar errores y extender el programa. Si en el futuro se quisiera reemplazar la forma de entrada, modificar la clasificacion o cambiar el algoritmo numerico, el impacto estaria relativamente aislado.

### 3. Logica de entrada y validacion

La solucion en C implementa validaciones consistentes antes de efectuar el calculo. Entre ellas destacan las siguientes:

- El nombre del pais debe contener al menos una letra.
- Cada porcentaje debe ser un numero valido.
- Los valores deben mantenerse en el rango de 0 a 100.
- La secuencia de ingresos acumulados no puede decrecer.
- El ultimo valor debe ser exactamente 100%.
- El punto inicial `(0, 0)` se agrega automaticamente en la estructura de datos.

Esta estrategia reduce la probabilidad de resultados matematicamente invalidos. Ademas, el programa no avanza al calculo mientras la entrada no cumpla las reglas. Eso mejora la robustez del flujo y hace que la solucion sea mas segura para uso interactivo.

### 4. Logica de calculo y clasificacion

El calculo del area bajo la curva de Lorenz se implementa por medio de la regla del trapecio, usando un ancho uniforme de $\frac{1}{5}$ entre los seis puntos acumulados. Luego el indice de Gini se obtiene con la formula:

```txt
G = 1 - 2 * areaLorenz
```

La implementacion es clara y coherente con la definicion documentada en el repositorio. La clasificacion posterior tambien se encuentra separada en un modulo especifico, lo que mejora la legibilidad del flujo principal. Los rangos empleados son comprensibles y producen mensajes directos para el usuario final.

### 5. Compilacion y ejecucion

La compilacion es directa y accesible porque solo requiere `gcc` y una unica linea de comando:

```bash
gcc main.c entrada.c validacion_entrada.c gini.c clasificacion.c -o gini.exe
```

Esto hace que la solucion sea relativamente portable y facil de reproducir en entornos donde exista un compilador de C. La ejecucion tambien es simple y no depende de un IDE especifico.

### 6. Fortalezas de la solucion en C

- Presenta una modularidad clara y consistente.
- Aplica validaciones previas al calculo, lo cual fortalece la confiabilidad.
- Separa calculo, entrada, clasificacion y utilidades de validacion.
- Ofrece una compilacion sencilla desde linea de comandos.
- La relacion entre documentacion y estructura real del proyecto es, en terminos generales, clara.

### 7. Aspectos de mejora de la solucion en C

- La validacion final del vector de ingresos aparece declarada en `gini.h`, aunque conceptualmente corresponde mas al dominio de entrada o validacion, por lo que podria revisarse su ubicacion para reforzar cohesion.
- La comparacion exacta contra `100.0` y `1.0` funciona para este contexto, pero si se ampliara el programa a otras fuentes de datos podria convenir una estrategia con tolerancia numerica.
- La solucion muestra un unico diagrama principal en la documentacion; seria util incluir tambien un diagrama de modulos o un esquema del flujo de validacion.

### 8. Apartado para diagramas de la solucion en C

Diagramas disponibles en el repositorio:

- `Docs/Images/Diagrama_Nassi_Gini_C.png`

#### Diagrama 1. Flujo principal o Nassi-Schneiderman

Archivo sugerido: `Docs/Images/Diagrama_Nassi_Gini_C.png`

[Espacio para insertar imagen en Word]

Analisis sugerido: este diagrama puede emplearse para explicar el ciclo principal del programa, la lectura iterativa de datos, la validacion antes del calculo y la decision final de continuar o terminar la ejecucion.

#### Diagrama 2. Modulos o funciones relevantes

No existe una imagen separada para este punto en el repositorio, pero conviene agregar un diagrama manual que represente la relacion entre `main.c`, `entrada.c`, `validacion_entrada.c`, `gini.c` y `clasificacion.c`.

[Espacio para insertar imagen en Word]

Analisis sugerido: este diagrama debe destacar la principal ventaja de la solucion en C, que es la separacion funcional por modulos.

## Revision de la solucion en Pascal

### 1. Descripcion general

La solucion en Pascal fue desarrollada para Free Pascal y Lazarus. Su comportamiento general cumple el objetivo de leer porcentajes acumulados, calcular el coeficiente de Gini y clasificar el resultado. Sin embargo, la mayor parte de la logica se concentra en un unico archivo principal, `project1.lpr`, lo que produce una organizacion menos modular que la observada en la solucion en C.

### 2. Estructura y organizacion

La solucion posee una estructura de proyecto propia de Lazarus, con archivos `.lpr`, `.lpi` y `.lps`, ademas de carpetas auxiliares. Desde la perspectiva de desarrollo en IDE, esto es util. No obstante, desde la perspectiva de organizacion interna del algoritmo, la concentracion de la logica en un solo archivo dificulta la separacion de responsabilidades.

Aunque el programa define procedimientos y funciones diferenciadas para lectura, calculo y clasificacion, no se aprovecha una division en unidades de Pascal independientes. Esto hace mas rapido un desarrollo pequeno, pero complica la escalabilidad y la localizacion de fallos cuando el programa crece.

### 3. Logica de entrada y validacion

La solucion en Pascal permite calcular varios paises dentro de una misma ejecucion y ofrece una condicion de salida clara mediante el texto `salir`. Ese punto es positivo para la experiencia de uso. Sin embargo, la validacion de los datos es considerablemente mas limitada que en C.

En particular, el procedimiento de lectura no verifica explicitamente:

- Que los valores esten entre 0 y 100.
- Que la secuencia acumulada no decrezca.
- Que el ultimo valor realmente introducido por el usuario sea 100%.

Ademas, despues de leer el ultimo valor, el programa fuerza `ing[5] := 1.0`, por lo que el dato final ingresado por el usuario no se valida sino que se reemplaza. Eso evita un fallo numerico inmediato, pero tambien oculta posibles errores de captura y reduce la transparencia del proceso.

### 4. Logica de calculo y clasificacion

La funcion `CalcularGini` aplica correctamente la regla del trapecio sobre los puntos acumulados de poblacion e ingreso. Desde el punto de vista matematico, la implementacion es adecuada y refleja bien la formula del coeficiente de Gini.

La clasificacion del resultado tambien esta separada en una funcion. Sin embargo, existe un detalle que conviene documentar: en Pascal la condicion para "Mala distribucion del ingreso" se define como `G < 0.5`, mientras que en la solucion en C se utiliza `gini <= 0.50`. Como consecuencia, el valor exacto `0.5000` cae en categorias distintas segun la implementacion. Esta diferencia es pequena, pero importante desde el punto de vista de consistencia entre soluciones.

### 5. Compilacion y ejecucion

La solucion en Pascal puede compilarse desde Lazarus o mediante `fpc`, lo cual ofrece flexibilidad. Aun asi, depende de herramientas menos comunes que un compilador de C basico en algunos entornos academicos. En consecuencia, la reproducibilidad puede ser ligeramente menor si el evaluador no dispone ya del entorno Lazarus o Free Pascal configurado.

### 6. Fortalezas de la solucion en Pascal

- Integra adecuadamente el proyecto con Lazarus.
- Permite procesar varios paises en una sola ejecucion.
- Tiene una implementacion matematica directa y legible.
- Incluye varios diagramas en la documentacion, lo que favorece la explicacion del flujo.

### 7. Aspectos de mejora de la solucion en Pascal

- Conviene separar la logica en varias unidades de Pascal para mejorar mantenibilidad.
- Es necesario fortalecer la validacion de entrada para evitar datos fuera de rango o inconsistentes.
- El parametro `nomb` del procedimiento `leer_datos_pais` no participa en la logica observada, por lo que podria eliminarse o aprovecharse mejor.
- Debe unificarse el criterio de clasificacion del valor limite `0.50` para evitar discrepancias con la solucion en C.

### 8. Apartado para diagramas de la solucion en Pascal

Diagramas disponibles en el repositorio:

- `Docs/Images/Gini_nassi-principal-pascal.png`
- `Docs/Images/Gini_nassi-datos-pascal.png`
- `Docs/Images/Gini_nassi-calculo-pascal.png`
- `Docs/Images/Gini_nassi-clasificacion-pascal.png`

#### Diagrama 1. Flujo principal

Archivo sugerido: `Docs/Images/Gini_nassi-principal-pascal.png`

[Espacio para insertar imagen en Word]

Analisis sugerido: permite explicar el ciclo de ejecucion general, la lectura del nombre del pais y la condicion de salida mediante `salir`.

#### Diagrama 2. Lectura de datos

Archivo sugerido: `Docs/Images/Gini_nassi-datos-pascal.png`

[Espacio para insertar imagen en Word]

Analisis sugerido: resulta util para comentar la secuencia de captura de quintiles y para senalar la ausencia de validaciones fuertes durante la entrada.

#### Diagrama 3. Calculo del coeficiente de Gini

Archivo sugerido: `Docs/Images/Gini_nassi-calculo-pascal.png`

[Espacio para insertar imagen en Word]

Analisis sugerido: ayuda a justificar que el nucleo matematico del programa esta bien planteado aunque la validacion previa sea mejorable.

#### Diagrama 4. Clasificacion

Archivo sugerido: `Docs/Images/Gini_nassi-clasificacion-pascal.png`

[Espacio para insertar imagen en Word]

Analisis sugerido: permite revisar visualmente la logica condicional usada para clasificar el valor obtenido y compararla con la version en C.

## Comparacion entre ambas soluciones

### 1. Comparacion de estructura

La solucion en C destaca por una arquitectura mas modular y mas cercana a buenas practicas de organizacion procedimental. La solucion en Pascal, en cambio, privilegia una implementacion compacta dentro del archivo principal del proyecto. Para un ejercicio pequeno ambas decisiones pueden funcionar, pero a medida que el programa evolucione la propuesta en C ofrece una base mas sostenible.

### 2. Comparacion de mantenibilidad

En mantenibilidad, la solucion en C resulta superior. La separacion por modulos facilita identificar responsabilidades y aplicar cambios locales. En Pascal, aunque las funciones estan diferenciadas, la concentracion en `project1.lpr` aumenta el costo de lectura y hace menos evidente la frontera entre entrada, calculo y presentacion.

### 3. Comparacion de validaciones y control de flujo

La diferencia mas importante entre ambas soluciones aparece en la validacion. La version en C protege mejor el programa frente a entradas incorrectas y exige consistencia antes de calcular. La version en Pascal tiene una experiencia de uso continua para multiples paises, pero sacrifica robustez al no validar rango, orden acumulado ni la ultima entrada de manera explicita.

### 4. Comparacion de compilacion y portabilidad

La solucion en C tiene ventaja por su sencillez de compilacion con `gcc` y su menor dependencia de herramientas especificas. La solucion en Pascal sigue siendo viable, pero depende con mayor frecuencia de Lazarus o de una instalacion de Free Pascal, lo que puede introducir pasos adicionales en algunos equipos.

### 5. Comparacion de documentacion y diagramas

La solucion en Pascal presenta una ventaja documental en cantidad de diagramas, ya que incluye representaciones separadas para flujo principal, lectura, calculo y clasificacion. La solucion en C, por su parte, tiene una estructura mejor organizada en codigo, pero se apoya en menos material grafico. Si se combinara la modularidad del proyecto en C con el nivel de apoyo visual del proyecto en Pascal, el resultado documental seria mas completo.

### 6. Valoracion comparativa final

En una valoracion integral, la solucion en C es la opcion mas fuerte desde el punto de vista de ingenieria de software, debido a su modularidad, validaciones y claridad de responsabilidades. La solucion en Pascal cumple el objetivo funcional y dispone de mejor apoyo grafico, pero requiere mejoras en validacion, consistencia y organizacion interna para alcanzar el mismo nivel de solidez tecnica.

## Conclusion general

Ambas soluciones logran calcular el coeficiente de Gini utilizando la regla del trapecio y reflejan adecuadamente el enfoque procedimental del curso. Sin embargo, muestran prioridades distintas. La version en C prioriza estructura y control de calidad de la entrada, mientras que la version en Pascal prioriza simplicidad de implementacion e integracion con el entorno Lazarus.

Si el criterio principal de evaluacion es la calidad de la organizacion interna del programa y la robustez de la ejecucion, la solucion en C resulta mejor fundamentada. Si el criterio valora especialmente el apoyo visual y la facilidad de presentar el flujo mediante diagramas, la solucion en Pascal aporta una documentacion grafica mas amplia.

## Recomendaciones finales

1. Mantener la modularidad de la solucion en C y complementar su documentacion con mas diagramas.
2. Reforzar en Pascal la validacion de entrada antes del calculo del indice.
3. Unificar en ambas soluciones los rangos exactos de clasificacion para evitar diferencias en el valor limite de `0.50`.
4. Verificar periodicamente que los README coincidan con el comportamiento real del codigo.