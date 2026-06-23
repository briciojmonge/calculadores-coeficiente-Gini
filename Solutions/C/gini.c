#include "gini.h"

int validarIngresosAcumulados(double ingresosAcumulados[]) {
    int i;

    if (ingresosAcumulados[0] != 0.0) {
        return 0;
    }

    for (i = 1; i < CANTIDAD_PUNTOS; i++) {
        if (ingresosAcumulados[i] < 0.0 || ingresosAcumulados[i] > 1.0) {
            return 0;
        }

        if (ingresosAcumulados[i] < ingresosAcumulados[i - 1]) {
            return 0;
        }
    }

    if (ingresosAcumulados[CANTIDAD_PUNTOS - 1] != 1.0) {
        return 0;
    }

    return 1;
}

double calcularAreaLorenz(double ingresosAcumulados[]) {
    int i;
    double area = 0.0;
    double anchoTrapecio = 1.0 / (CANTIDAD_PUNTOS - 1);

    for (i = 0; i < CANTIDAD_PUNTOS - 1; i++) {
        area = area + ((ingresosAcumulados[i] + ingresosAcumulados[i + 1]) * anchoTrapecio) / 2.0;
    }

    return area;
}

double calcularIndiceGini(double areaLorenz) {
    return 1.0 - (2.0 * areaLorenz);
}