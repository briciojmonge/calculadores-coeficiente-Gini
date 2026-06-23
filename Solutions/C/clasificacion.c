#include <stdio.h>
#include "clasificacion.h"

void mostrarClasificacionGini(double gini) {
    printf("Clasificacion: ");

    if (gini < 0.30) {
        printf("Muy buena distribucion del ingreso.\n");
    } else if (gini < 0.35) {
        printf("Buena distribucion del ingreso.\n");
    } else if (gini < 0.40) {
        printf("Distribucion regular del ingreso.\n");
    } else if (gini < 0.45) {
        printf("Distribucion desigual del ingreso.\n");
    } else if (gini <= 0.50) {
        printf("Mala distribucion del ingreso.\n");
    } else {
        printf("Enorme desigualdad del ingreso.\n");
    }
}