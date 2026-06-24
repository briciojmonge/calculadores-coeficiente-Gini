program project1;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  Classes,
  pais_gini,
  entrada_gini,
  calculo_gini,
  clasificacion_gini;

procedure Main;
var
  CountryName: String;
  Pob_acum: array[0..5] of Real;
  ing_acum: array of Real;
  n: integer;
  Gini: Real;
  Puntos: integer;
  Clasificacion: string;
begin
  WriteLn('==================================================');
  WriteLn('   CALCULO DEL COEFICIENTE DE GINI');
  WriteLn('   Basado en quintiles (regla del trapecio)');
  WriteLn('==================================================');
  WriteLn('Instrucciones:');
  WriteLn('- Ingrese el nombre del pais (o "salir" para terminar).');
  WriteLn('- Luego ingrese los porcentajes acumulados del ingreso');
  WriteLn('  para los quintiles: 20%, 40%, 60%, 80% y 100%.');
  WriteLn('  Ejemplo para EE.UU. (2025): 3.1, 11.3, 25.2, 47.8, 100');
  WriteLn('--------------------------------------------------');

  Pob_acum[0] := 0.0;
  Pob_acum[1] := 0.2;
  Pob_acum[2] := 0.4;
  Pob_acum[3] := 0.6;
  Pob_acum[4] := 0.8;
  Pob_acum[5] := 1.0;

  SetLength(ing_acum, 6);
  Puntos := 6;

  n := 1;
  while n = 1 do
    begin
      LeerNombrePais(CountryName);

      if CountryName = 'salir' then
        begin
          writeln('Programa terminado ');
          n := 0;
        end
      else
        begin
          LeerDatosIngresos(ing_acum);
          Gini := CalcularGini(Pob_acum, ing_acum, Puntos);
          Clasificacion := ClasificarGini(Gini);

          writeln('Resultado para ', CountryName);
          Writeln('Coeficiente de Gini: ', Gini:0:4);
          Writeln('Clasificacion: ', Clasificacion);
        end;
    end;
end;

begin
  Main();
end.

