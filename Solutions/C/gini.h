#ifndef GINI_H
#define GINI_H

#include "constantes.h"

int validarIngresosAcumulados(double ingresosAcumulados[]);
double calcularAreaLorenz(double ingresosAcumulados[]);
double calcularIndiceGini(double areaLorenz);

#endif