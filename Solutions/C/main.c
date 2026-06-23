#include <stdio.h>
#include "constantes.h"
#include "entrada.h"
#include "gini.h"
#include "clasificacion.h"

int main() {
    char pais[LONGITUD_NOMBRE_PAIS];
    char continuar;
    double ingresosAcumulados[CANTIDAD_PUNTOS];
    double areaLorenz;
    double indiceGini;
    int datosValidos;

    printf("=============================================\n");
    printf(" CALCULO DEL INDICE DE GINI\n");
    printf("=============================================\n");

    do {
        leerNombrePais(pais);

        do {
            leerIngresosAcumulados(ingresosAcumulados);
            datosValidos = validarIngresosAcumulados(ingresosAcumulados);

            if (!datosValidos) {
                printf("\nError: los datos ingresados no son validos.\n");
                printf("Los porcentajes deben estar entre 0 y 100, ser acumulados y terminar en 100.\n");
            }

        } while (!datosValidos);

        areaLorenz = calcularAreaLorenz(ingresosAcumulados);
        indiceGini = calcularIndiceGini(areaLorenz);

        printf("\n---------------------------------------------\n");
        printf("Pais: %s\n", pais);
        printf("Area bajo la curva de Lorenz: %.4f\n", areaLorenz);
        printf("Indice de Gini: %.4f\n", indiceGini);
        mostrarClasificacionGini(indiceGini);
        printf("---------------------------------------------\n");

        continuar = leerRespuestaContinuar();

    } while (continuar == 's' || continuar == 'S');

    printf("\nPrograma finalizado.\n");

    return 0;
}