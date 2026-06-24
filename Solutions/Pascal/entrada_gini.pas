unit entrada_gini;

{$mode objfpc}{$H+}

interface

procedure LeerDatosIngresos(var ing: array of Real);

implementation

uses
  SysUtils;

const
  MAX_PORCENTAJE = 100.0;

function LeerPorcentajeAcumulado(const etiqueta: string; const minimoPermitido: Real; const requiereCien: boolean): Real;
var
  texto: string;
  valor: Real;
  formato: TFormatSettings;
begin
  formato := DefaultFormatSettings;
  formato.DecimalSeparator := '.';
  formato.ThousandSeparator := #0;

  repeat
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

procedure LeerDatosIngresos(var ing: array of Real);
var
  valores: array[1..5] of Real;
begin
  if Length(ing) > 0 then
    ing[0] := 0.0;

  writeln(' Ingrese los porcentajes acumulados de los ingresos: ');
  valores[1] := LeerPorcentajeAcumulado(' 20% acumulado: ', 0.0, False);
  valores[2] := LeerPorcentajeAcumulado(' 40% acumulado: ', valores[1], False);
  valores[3] := LeerPorcentajeAcumulado(' 60% acumulado: ', valores[2], False);
  valores[4] := LeerPorcentajeAcumulado(' 80% acumulado: ', valores[3], False);
  valores[5] := LeerPorcentajeAcumulado(' 100% acumulado: ', valores[4], True);

  ing[1] := valores[1] / 100.0;
  ing[2] := valores[2] / 100.0;
  ing[3] := valores[3] / 100.0;
  ing[4] := valores[4] / 100.0;
  ing[5] := 1.0;
end;

end.