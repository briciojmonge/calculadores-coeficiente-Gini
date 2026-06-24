unit pais_gini;

{$mode objfpc}{$H+}

interface

procedure LeerNombrePais(var nombrePais: string);

implementation

uses
  SysUtils;

const
  MAX_LONGITUD_NOMBRE = 60;

function EsNombreValido(const nombre: string): boolean;
var
  i: integer;
begin
  EsNombreValido := (Length(nombre) > 0) and (Length(nombre) <= MAX_LONGITUD_NOMBRE);

  if not EsNombreValido then
    Exit;

  for i := 1 to Length(nombre) do
    if not (nombre[i] in ['A'..'Z', 'a'..'z', ' ']) then
      begin
        EsNombreValido := False;
        Exit;
      end;
end;

procedure LeerNombrePais(var nombrePais: string);
var
  entrada: string;
begin
  repeat
    Write('Ingrese el nombre del pais (o "salir" para terminar): ');
    ReadLn(entrada);
    nombrePais := Trim(entrada);

    if LowerCase(nombrePais) = 'salir' then
      begin
        nombrePais := 'salir';
        Exit;
      end;

    if nombrePais = '' then
      Writeln('El nombre no puede estar vacio.')
    else if Length(nombrePais) > MAX_LONGITUD_NOMBRE then
      Writeln('El nombre debe tener como maximo ', MAX_LONGITUD_NOMBRE, ' caracteres.')
    else if not EsNombreValido(nombrePais) then
      Writeln('El nombre solo puede contener letras y espacios.')
    else
      Exit;
  until False;
end;

end.