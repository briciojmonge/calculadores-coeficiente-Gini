program project1;

{$mode objfpc}{$H+}
uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  Classes
  { you can add units after this };
{-------------------------------------------------------------------------------}
{

}
Procedure leer_datos_pais(nomb:string; var ing:array of Real);
Var
  valores: array[1..5] of Real;
  val: Real;
  i: integer;
  { Variable declarations }
begin
   ing[0]:=0.0;
   writeln(' Ingrese los porcentajes acumulados de los ingresos: ');
   writeln(' 20% acumulado: ');
   readln(valores[1]);

   writeln(' 40% acumulado: ');
   readln(valores[2]);

   writeln(' 60% acumulado: ');
   readln(valores[3]);

   writeln(' 80% acumulado: ');
   readln(valores[4]);

   writeln(' 100% acumulado: ');
   readln(valores[5]);

   for i := 1 to 5 do
       begin
          ing[i]:= (valores[i]/100.0);
       end;
   ing[5]:=1.0;
end;
{-------------------------------------------------------------------------------}
{

}
Function CalcularGini(acum_pob: array of Real; acum_ing: array of Real; points:integer ): Real;
var
  integral: Real;
  h: Real;
  i: integer;
     {Variable declarations}
begin
   integral := 0.0;
   for i:=0 to (points-2) do
       begin
          h := acum_pob[i+1]-acum_pob[i];
          integral := integral + (h*(acum_ing[i]+acum_ing[i+1])/2.0);
       end;
   CalcularGini := 1.0-2.0*integral;
end;
{-------------------------------------------------------------------------------}
{

}
Function ClassificarGini(G: Real): String;
begin
  if G < 0.3 then
    ClassificarGini := 'Muy buena distribucion del ingreso'
  else if G < 0.35 then
    ClassificarGini := 'Buena distribucion del ingreso'
  else if G < 0.4 then
    ClassificarGini := 'Distribucion regular del ingreso'
  else if G < 0.45 then
    ClassificarGini := 'Distribucion desigual del ingreso'
  else if G < 0.5 then
    ClassificarGini := 'Mala distribucion del ingreso'
  else   // G >= 0.5
    ClassificarGini := 'Enorme desigualdad del ingreso';
end;

{-------------------------------------------------------------------------------}
{

}
Procedure Main();
Var
  CountryName: String;
  Pob_acum: array[0..5] of Real;
  ing_acum: array of Real;
  n: integer;
  Gini : Real;
  Puntos: integer;
  Calssification: string;
  { Variable declarations }

begin
   WriteLn ('==================================================');
   WriteLn ('   CALCULO DEL COEFICIENTE DE GINI');
   WriteLn ('   Basado en quintiles (regla del trapecio)');
   WriteLn ('==================================================');
   WriteLn ('Instrucciones:');
   WriteLn ('- Ingrese el nombre del pais (o "salir" para terminar).');
   WriteLn ('- Luego ingrese los porcentajes acumulados del ingreso');
   WriteLn ('  para los quintiles: 20%%, 40%%, 60%%, 80%% y 100%%.');
   WriteLn ('  Ejemplo para EE.UU. (2025): 3.1, 11.3, 25.2, 47.8, 100');
   WriteLn ('--------------------------------------------------');
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
            Write ('Introduzca el nombre del pais al cual calcular coeficiente de Gini:');
            readln (CountryName);
            if CountryName = 'salir' then
               begin
                 writeln ('Programa terminado ');
                 n := 0;
               end
            else
            begin
              leer_datos_pais(CountryName,ing_acum);

              Gini := CalcularGini(Pob_acum,ing_acum,Puntos);

              Calssification := ClassificarGini (Gini);

              writeln('Resultado para ', CountryName);
              Writeln('Coeficiente de Gini: ', Gini:0:4);
              Writeln('Clasificacion: ', Calssification);
            end;
         end;
end;
{-------------------------------------------------------------------------------}
begin
    Main();
end.

