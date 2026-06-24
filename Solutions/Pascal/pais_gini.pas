unit pais_gini;

{$mode objfpc}{$H+}

interface

// Lee y valida el nombre del pais o la orden de salida.
procedure LeerNombrePais(var nombrePais: string);

implementation

uses
  SysUtils;

const
  MAX_LONGITUD_NOMBRE = 60;

// Verifica que el nombre tenga longitud valida y solo contenga letras o espacios.
function EsNombreValido(const nombre: string): boolean;
var
  // Recorre cada caracter del nombre para validarlo uno por uno.
  i: integer;
begin
  // La validacion parte de la longitud para evitar cadenas vacias o demasiado largas.
  EsNombreValido := (Length(nombre) > 0) and (Length(nombre) <= MAX_LONGITUD_NOMBRE);

  if not EsNombreValido then
    Exit;

  // Se revisa caracter por caracter para evitar simbolos no deseados.
  for i := 1 to Length(nombre) do
    if not (nombre[i] in ['A'..'Z', 'a'..'z', ' ']) then
      begin
        EsNombreValido := False;
        Exit;
      end;
end;

// Solicita el nombre del pais hasta que el usuario ingrese un valor valido.
procedure LeerNombrePais(var nombrePais: string);
var
  // Almacena la cadena capturada desde la entrada estandar.
  entrada: string;
begin
  repeat
    // Se usa ReadLn para capturar la entrada completa del usuario.
    Write('Ingrese el nombre del pais (o "salir" para terminar): ');
    ReadLn(entrada);
    nombrePais := Trim(entrada);

    // "salir" detiene el programa sin pasar por las validaciones del nombre.
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