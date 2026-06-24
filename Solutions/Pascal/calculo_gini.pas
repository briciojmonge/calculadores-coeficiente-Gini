unit calculo_gini;

{$mode objfpc}{$H+}

interface

// Calcula el coeficiente de Gini usando la regla del trapecio.
function CalcularGini(acum_pob: array of Real; acum_ing: array of Real; points: integer): Real;

implementation

// Integra la curva de Lorenz y transforma el area en el coeficiente de Gini.
function CalcularGini(acum_pob: array of Real; acum_ing: array of Real; points: integer): Real;
var
  // Acumula el area estimada bajo la curva de Lorenz.
  integral: Real;
  // Guarda el ancho de cada segmento de la discretizacion.
  h: Real;
  // Itera sobre cada tramo consecutivo de la curva.
  i: integer;
begin
  integral := 0.0;
  // Se suma el area de cada trapecio consecutivo de la curva.
  for i := 0 to (points - 2) do
    begin
      h := acum_pob[i + 1] - acum_pob[i];
      integral := integral + (h * (acum_ing[i] + acum_ing[i + 1]) / 2.0);
    end;

  // El Gini se obtiene como el complemento del area bajo la curva de Lorenz.
  CalcularGini := 1.0 - 2.0 * integral;
end;

end.