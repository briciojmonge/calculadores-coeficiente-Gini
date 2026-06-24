unit entrada_gini;

{$mode objfpc}{$H+}

interface

// Lee y valida los porcentajes acumulados de ingreso por quintil.
procedure LeerDatosIngresos(var ing: array of Real);

implementation

uses
  SysUtils;

const
  MAX_PORCENTAJE = 100.0;

// Lee un porcentaje acumulado, valida su formato y respeta el orden creciente.
function LeerPorcentajeAcumulado(const etiqueta: string; const minimoPermitido: Real; const requiereCien: boolean): Real;
var
  // Cadena ingresada por el usuario para convertirla a valor numerico.
  texto: string;
  // Valor numerico convertido desde el texto ingresado.
  valor: Real;
  // Define el formato para aceptar punto decimal de forma estable.
  formato: TFormatSettings;
begin
  // Se fija el separador decimal para aceptar valores como 3.1 de forma consistente.
  formato := DefaultFormatSettings;
  formato.DecimalSeparator := '.';
  formato.ThousandSeparator := #0;

  repeat
    // Cada valor se solicita por separado para poder dar un mensaje de error puntual.
    Write(etiqueta);
    ReadLn(texto);
    texto := Trim(texto);

    if not TryStrToFloat(texto, valor, formato) then
      Writeln('Debe ingresar un valor numerico valido.')
    else if valor < minimoPermitido then
      Writeln('El valor no puede ser menor que ', minimoPermitido:0:2, '.')
    else if valor > MAX_PORCENTAJE then
      Writeln('El valor no puede ser mayor que 100.00.')
    else if requiereCien and (valor <> MAX_PORCENTAJE) then
      Writeln('El ultimo valor debe ser 100.')
    else
      begin
        LeerPorcentajeAcumulado := valor;
        Exit;
      end;
  until False;
end;

// Lee los cinco quintiles de ingreso y los transforma a escala decimal.
procedure LeerDatosIngresos(var ing: array of Real);
var
  // Guarda los valores acumulados temporales antes de normalizarlos.
  valores: array[1..5] of Real;
begin
  // El primer punto de la curva corresponde a cero ingreso acumulado.
  if Length(ing) > 0 then
    ing[0] := 0.0;

  writeln(' Ingrese los porcentajes acumulados de los ingresos: ');
  // Cada lectura usa como minimo el valor anterior para mantener el orden no decreciente.
  valores[1] := LeerPorcentajeAcumulado(' 20% acumulado: ', 0.0, False);
  valores[2] := LeerPorcentajeAcumulado(' 40% acumulado: ', valores[1], False);
  valores[3] := LeerPorcentajeAcumulado(' 60% acumulado: ', valores[2], False);
  valores[4] := LeerPorcentajeAcumulado(' 80% acumulado: ', valores[3], False);
  valores[5] := LeerPorcentajeAcumulado(' 100% acumulado: ', valores[4], True);

  // Los porcentajes se convierten a razon decimal para el calculo numerico.
  ing[1] := valores[1] / 100.0;
  ing[2] := valores[2] / 100.0;
  ing[3] := valores[3] / 100.0;
  ing[4] := valores[4] / 100.0;
  // El ultimo punto de la curva siempre es 1.0 porque representa el 100% acumulado.
  ing[5] := 1.0;
end;

end.