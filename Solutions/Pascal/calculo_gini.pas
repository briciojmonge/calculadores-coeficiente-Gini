unit calculo_gini;

{$mode objfpc}{$H+}

interface

function CalcularGini(acum_pob: array of Real; acum_ing: array of Real; points: integer): Real;

implementation

function CalcularGini(acum_pob: array of Real; acum_ing: array of Real; points: integer): Real;
var
  integral: Real;
  h: Real;
  i: integer;
begin
  integral := 0.0;
  for i := 0 to (points - 2) do
    begin
      h := acum_pob[i + 1] - acum_pob[i];
      integral := integral + (h * (acum_ing[i] + acum_ing[i + 1]) / 2.0);
    end;

  CalcularGini := 1.0 - 2.0 * integral;
end;

end.