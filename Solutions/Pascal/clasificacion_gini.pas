unit clasificacion_gini;

{$mode objfpc}{$H+}

interface

function ClasificarGini(G: Real): String;

implementation

function ClasificarGini(G: Real): String;
begin
  if G < 0.3 then
    ClasificarGini := 'Muy buena distribucion del ingreso'
  else if G < 0.35 then
    ClasificarGini := 'Buena distribucion del ingreso'
  else if G < 0.4 then
    ClasificarGini := 'Distribucion regular del ingreso'
  else if G < 0.45 then
    ClasificarGini := 'Distribucion desigual del ingreso'
  else if G <= 0.5 then
    ClasificarGini := 'Mala distribucion del ingreso'
  else
    ClasificarGini := 'Enorme desigualdad del ingreso';
end;

end.