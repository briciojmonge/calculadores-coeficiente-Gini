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

// Controla el flujo principal del programa de principio a fin.
procedure Main;
var
  // Guarda el nombre del pais ingresado por el usuario.
  CountryName: String;
  // Contiene los puntos acumulados de poblacion usados en la curva de Lorenz.
  Pob_acum: array[0..5] of Real;
  // Almacena los porcentajes acumulados de ingreso en formato decimal.
  ing_acum: array of Real;
  // Bandera simple para mantener el ciclo principal activo.
  n: integer;
  // Guarda el valor calculado del coeficiente de Gini.
  Gini: Real;
  // Indica la cantidad de puntos usados en el calculo numerico.
  Puntos: integer;

  Clasificacion: string;
=======
  // Guarda la clasificacion textual asociada al indice de Gini.
  Calssification: string;
  
begin
  // Mensajes iniciales para explicar al usuario el flujo esperado.
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

  // Puntos fijos de la curva de Lorenz: poblacion acumulada por quintiles.
  Pob_acum[0] := 0.0;
  Pob_acum[1] := 0.2;
  Pob_acum[2] := 0.4;
  Pob_acum[3] := 0.6;
  Pob_acum[4] := 0.8;
  Pob_acum[5] := 1.0;

  // Se reserva espacio para cinco valores mas el punto final normalizado.
  SetLength(ing_acum, 6);
  // Se usa el numero total de puntos para la integracion trapezoidal.
  Puntos := 6;

  // Bucle principal: repite el proceso hasta que el usuario escriba "salir".
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
          // Los ingresos se leen aparte para mantener separada la responsabilidad.
          LeerDatosIngresos(ing_acum);
          // Con la curva cargada, se calcula el area y luego el Gini.
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

