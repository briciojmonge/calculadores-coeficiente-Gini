#include <stdio.h>
#include <string.h>
#include "validacion_entrada.h"

void prepararLinea(char texto[]) {
    size_t longitud = strlen(texto);

    if (longitud > 0 && texto[longitud - 1] == '\n') {
        texto[longitud - 1] = '\0';
    } else {
        int caracter;

        while ((caracter = getchar()) != '\n' && caracter != EOF) {
        }
    }
}

int contieneLetra(const char texto[]) {
    int i = 0;

    while (texto[i] != '\0') {
        if ((texto[i] >= 'A' && texto[i] <= 'Z') ||
            (texto[i] >= 'a' && texto[i] <= 'z')) {
            return 1;
        }

        i++;
    }

    return 0;
}

int leerNumeroDouble(double *valor) {
    char linea[100];
    char extra;

    if (fgets(linea, sizeof(linea), stdin) == NULL) {
        return 0;
    }

    prepararLinea(linea);

    return sscanf(linea, " %lf %c", valor, &extra) == 1;
}