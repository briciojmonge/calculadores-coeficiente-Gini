#include <stdio.h>
#include "constantes.h"
#include "entrada.h"
#include "validacion_entrada.h"

void leerNombrePais(char pais[]) {
    int nombreValido;

    do {
        printf("\nIngrese el nombre del pais: ");

        if (fgets(pais, LONGITUD_NOMBRE_PAIS, stdin) == NULL) {
            pais[0] = '\0';
        }

        prepararLinea(pais);

        nombreValido = contieneLetra(pais);

        if (!nombreValido) {
            printf("Error: el nombre del pais debe contener al menos una letra.\n");
        }

    } while (!nombreValido);
}

void leerIngresosAcumulados(double ingresosAcumulados[]) {
    int i;
    int lecturaValida;
    double valorIngresado;
    double valorAnterior;
    int porcentajesPoblacion[CANTIDAD_PUNTOS] = {0, 20, 40, 60, 80, 100};

    ingresosAcumulados[0] = 0.0;

    printf("\nIngrese los porcentajes acumulados del ingreso.\n");
    printf("Digite los valores en porcentaje. Ejemplo: 3.1, 11.3, 25.2...\n");

    for (i = 1; i < CANTIDAD_PUNTOS; i++) {
        do {
            printf("Ingreso acumulado para el %d%% de la poblacion: ", porcentajesPoblacion[i]);

            lecturaValida = leerNumeroDouble(&valorIngresado);

            if (!lecturaValida) {
                printf("Error: debe ingresar un numero valido. Use punto decimal si es necesario.\n");
            } else if (valorIngresado < 0.0 || valorIngresado > 100.0) {
                printf("Error: el porcentaje debe estar entre 0 y 100.\n");
                lecturaValida = 0;
            } else {
                valorAnterior = ingresosAcumulados[i - 1] * 100.0;

                if (valorIngresado < valorAnterior) {
                    printf("Error: el porcentaje acumulado no puede ser menor que el anterior.\n");
                    lecturaValida = 0;
                } else if (i == CANTIDAD_PUNTOS - 1 && valorIngresado != 100.0) {
                    printf("Error: el porcentaje acumulado para el 100%% de la poblacion debe ser 100.\n");
                    lecturaValida = 0;
                }
            }

        } while (!lecturaValida);

        ingresosAcumulados[i] = valorIngresado / 100.0;
    }
}

char leerRespuestaContinuar() {
    char linea[20];

    printf("\nDesea calcular otro pais? (s/n): ");

    if (fgets(linea, sizeof(linea), stdin) == NULL) {
        return 'n';
    }

    prepararLinea(linea);

    return linea[0];
}